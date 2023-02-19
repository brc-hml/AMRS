      SUBROUTINE NRSPC(CS)
      ! APEX1501
      ! THIS SUBPROGRAM SIMULATES C RESPIRATION USING EQUATIONS TAKEN 
      ! FROM CENTURY.
      USE PARM
      LD1=LID(1,ISA)
      XZ=WNO3(ISL,ISA)+WNO2(ISL,ISA)+WNH3(ISL,ISA)
!     AD1=WLSN(ISL,ISA)+WLMN(ISL,ISA)+WBMN(ISL,ISA)+WHSN(ISL,ISA)+WHPN(ISL,ISA)+XZ
      RLR=WLSL(ISL,ISA)/(WLS(ISL,ISA)+1.E-5)
      IF(RLR>.8)THEN
          RLR=.8
      ELSE
          IF(RLR<.1)RLR=.1
      END IF    
	  APCO2=.55
      ASCO2=.60
      IF(ISL==LD1)THEN
          CS=CS*PRMT(69)
          ABCO2=.55
          A1CO2=.55
          RBM=.0164
          RLM=.0405
          RLS=.0107
          HPNC=.1
          XBM=1.
      ELSE
          ABCO2=.17+.0068*SAN(ISL,ISA)
          A1CO2=.55
          RBM=.02
          RLM=.0507
          RLS=.0132
          XBM=.25+.0075*SAN(ISL,ISA)
          HPNC=WHPN(ISL,ISA)/WHPC(ISL,ISA) 
      END IF
      BMNC=WBMN(ISL,ISA)/WBMC(ISL,ISA)
      HSNC=WHSN(ISL,ISA)/WHSC(ISL,ISA)
      WLMC(ISL,ISA)=MAX(.01,WLMC(ISL,ISA))
      XLMNC=WLMN(ISL,ISA)/WLMC(ISL,ISA)
      WLSC(ISL,ISA)=MAX(.01,WLSC(ISL,ISA))
      XLSNC=WLSN(ISL,ISA)/WLSC(ISL,ISA)
      ABP=.003+.00032*CLA(ISL,ISA)
      ASP=MAX(.001,.05-.00009*CLA(ISL,ISA))
      A1=1.-A1CO2
      ASX=1.-ASCO2-ASP
      APX=1.-APCO2
      ! TRANSFORMATION STRUCTURAL LITTER WBM 2012-11-22
      ! CR = scaling factor for decomposition (0 - 1) basewd BMNC and &
      ! ratio of NC-substrate/Yield. 
      CRX=1.-(CRUNC-BMNC)/(CRUNC-CRLNC)
      CR=0.
      IF(BMNC>CRLNC.AND.BMNC<CRUNC)CR=CRX
      IF(WLSN(ISL,ISA)/(WLSC(ISL,ISA)*(1-RLR))/A1>BMNC.OR.BMNC>CRUNC)CR=1.
      X1=RLS*CS*CR*EXP(-3.*RLR)
      X2=1.-RLR
      TLSLNCA=X1*WLSC(ISL,ISA)*X2
      TLSLCA=TLSLNCA*RLR/X2
      TLSCA=TLSLNCA/X2
      TLSNA=TLSCA*XLSNC
      ! TRANSFORMATIONS METABOLIC LITTER; SIX LINES BELOW ADDED WBM 2012-11-14
      CR=0.
      IF(BMNC>CRLNC.AND.BMNC<CRUNC)CR=CRX
      IF(XLMNC/A1>BMNC.OR.BMNC>CRUNC)CR=1.
      X1=RLM*CS*CR
      TLMCA=WLMC(ISL,ISA)*X1
      TLMNA=TLMCA*XLMNC
      ! TRANSFORMATIONS MICROBIAL BIOMASS; NEXT SIX LINES ADDED WBM 2012-11-22
      CR=0.
      IF(BMNC>CRLNC.AND.BMNC<CRUNC)CR=CRX
      IF(BMNC/(1.-ABCO2)>BMNC.OR.BMNC>CRUNC)CR=1.
      TBMCA=WBMC(ISL,ISA)*RBM*CS*CR*XBM
      TBMNA=TBMCA*BMNC
      ! TRANSFORMATION OF SLOW HUMUS; NEXT SIX LINES ADDED WBM 2012-11-22
      CR=0.
      IF(BMNC>CRLNC.AND.BMNC<CRUNC)CR=CRX
      IF(HSNC/(1.-ASCO2)>BMNC.OR.BMNC>CRUNC)CR=1.
      THSCA=WHSC(ISL,ISA)*RHS*CS*CR
      THSNA=THSCA*HSNC
      ! TRANSFORMATIONS OF PASSIVE HUMUS; NEXT SIX LINES ADDED WBM 2012-11-22
      CR=0.
      IF(BMNC>CRLNC.AND.BMNC<CRUNC)CR=CRX
      IF(HPNC/APX>BMNC.OR.BMNC>CRUNC)CR=1.
      THPCA=WHPC(ISL,ISA)*CS*CR*RHP
      THPNA=THPCA*HPNC
      IF(ISL==LD1) THEN
          RSPC(ISL,ISA)=MAX(0.,.3*TLSLCA+A1CO2*(TLSLNCA+TLMCA)+ABCO2*TBMCA+ASCO2*THSCA)
      ELSE
          RSPC(ISL,ISA)=MAX(0.,.3*TLSLCA+A1CO2*(TLSLNCA+TLMCA)+ABCO2*TBMCA+ASCO2*THSCA+&
          APCO2*THPCA)
      END IF    
      RETURN
      END