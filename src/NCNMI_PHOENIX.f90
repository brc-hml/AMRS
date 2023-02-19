      SUBROUTINE NCNMI_PHOENIX(Z5,CS,RTOE)
!     APEX1501
!     THIS SUBPROGRAM SIMULATES MINERALIZATION AND IMMOBILIZATION OF N
!     AND C USING POOLS FOLLOWING CENTURY (IZAURRALDE ET AL. 2006) 
!     & C/N OF MICROBIAL BIOMASS FOLLOWING PHOENIX (MCGILL ET AL. 1981)
      USE PARM
      DATA SDF/0./
      ! WNO2 (ISL,ISA) added by WBM 2012-11-05
      LD1=LID(1,ISA)
      !XZ=WNO3(ISL,ISA)+WNO2(ISL,ISA)+WNH3(ISL,ISA)
      RLR=WLSL(ISL,ISA)/(WLS(ISL,ISA)+1.E-5)
      IF(RLR>.8)THEN
          RLR=.8
      ELSE
          IF(RLR<.1)RLR=.1
      END IF    
	  AD1=WBMC(ISL,ISA)+WHPC(ISL,ISA)+WHSC(ISL,ISA)+WLMC(ISL,ISA)+WLSC(ISL,ISA)
      XHN=WHSN(ISL,ISA)+WHPN(ISL,ISA)
	  IF(BD(ISL,ISA)>BDP(ISL,ISA))THEN
	      X1=MIN(20.,EXP(PRMT(52)*(BD(ISL,ISA)-BDP(ISL,ISA))))
	  ELSE
	      X1=1.
	  END IF
      SMS(4,ISL,ISA)=SMS(4,ISL,ISA)+X1
      SELECT CASE(IOX)
          CASE(0)
              X2=Z5
              IF(SCLM(20)>0.)X2=MIN(X2,SCLM(20))
              OX=1.-PRMT(53)*X2/(X2+EXP(SCRP(20,1)-SCRP(20,2)*X2))
          CASE(1)
	          Y1=.1*WOC(ISL,ISA)/WT(ISL,ISA)
	          Y2=2.11+.0375*CLA(ISL,ISA)
	          Y3=100.*Y1/Y2
              IF(SCLM(25)>0.)Y3=MIN(Y3,SCLM(25))
	          OX=Y3/(Y3+EXP(SCRP(25,1)-SCRP(25,2)*Y3))
          CASE(2)
              IF(CGO2(LD1,ISA)>0.)OX=CGO2(ISL,ISA)/CGO2(LD1,ISA)
      END SELECT
      IF(IDNT>2)OX=OX*RTOE   
      CS=MIN(10.,SQRT(CDG(ISL,ISA)*SUT(ISL,ISA))*PRMT(70)*OX*X1) !calculation of CS !cdj comment
      SMS(11,ISL,ISA)=SMS(11,ISL,ISA)+1.
      SMS(1,ISL,ISA)=SMS(1,ISL,ISA)+SUT(ISL,ISA)
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
      XLMNC=WLMN(ISL,ISA)/WLMC(ISL,ISA)
      XLSNC=WLSN(ISL,ISA)/WLSC(ISL,ISA)
      ABP=.003+.00032*CLA(ISL,ISA)
      SMS(3,ISL,ISA)=SMS(3,ISL,ISA)+CS
      ASP=MAX(.001,.05-.00009*CLA(ISL,ISA))
      A1=1.-A1CO2
      ASX=1.-ASCO2-ASP
      APX=1.-APCO2
      ! TRANSFORMATION OF STRUCTURAL LITTER WBM 2012-11-14
      ! CR = scaling factor for decomposition (0 - 1) based BMNC and &
      ! ratio of NC-substrate/Yield.
      CRX=1.-(CRUNC-BMNC)/(CRUNC-CRLNC)
      CR=0.
      IF(BMNC>CRLNC.AND.BMNC<CRUNC)CR=CRX
      X2=1.-RLR
      IF((WLSN(ISL,ISA)/(WLSC(ISL,ISA)*X2))/A1>BMNC.OR.BMNC>CRUNC)CR=1.
      TLSCA=RLS*CS*CR*EXP(-3.*RLR)*WLSC(ISL,ISA)
      TLSLNCA=TLSCA*X2
      TLSLCA=TLSCA*RLR
      TLSNA=TLSCA*XLSNC
      ! TRANSFORMATIONS METABOLIC LITTER; SIX LINES BELOW ADDED WBM 2012-11-14
      CR=0.
      IF(BMNC>CRLNC.AND.BMNC<CRUNC)CR=CRX
      IF(XLMNC/A1>BMNC.OR.BMNC>CRUNC)CR=1.
      TLMCA=WLMC(ISL,ISA)*RLM*CS*CR
      TLMNA=TLMCA*XLMNC
      ! TRANSFORMATIONS MICROBIAL BIOMASS; NEXT SIX LINES ADDED WBM 2012-11-14
      CR=0.
      IF(BMNC>CRLNC.AND.BMNC<CRUNC)CR=CRX
      IF(BMNC/(1.-ABCO2)>BMNC.OR.BMNC>CRUNC)CR=1.
      TBMCA=WBMC(ISL,ISA)*RBM*CS*CR*XBM
      TBMNA=TBMCA*BMNC
      ! TRANSFORMATION OF SLOW HUMUS; NEXT SIX LINES ADDED WBM 2012-11-14
      CR=0.
      IF(BMNC>CRLNC.AND.BMNC<CRUNC)CR=CRX
      IF(HSNC/(1.-ASCO2)>BMNC.OR.BMNC>CRUNC)CR=1.
      THSCA=WHSC(ISL,ISA)*RHS*CS*CR
      THSNA=THSCA*HSNC
      ! TRANSFORMATIONS OF PASSIVE HUMUS; NEXT SIX LINES ADDED WBM 2012-11-14
      IF(ISL/=LD1)THEN
          CR=0.
          IF(BMNC>CRLNC.AND.BMNC<CRUNC)CR=CRX
          IF(HPNC/APX>BMNC.OR.BMNC>CRUNC)CR=1.
          THPCA=WHPC(ISL,ISA)*CS*CR*RHP
          THPNA=THPCA*HPNC
          ! MINERALIZATION AND IMMOBILIZATION (32 LINES) ADDED WBM 2012-11-14
          ! CA = AMMONIFICATION RATE SCALING FACTOR BASED ON BMNC (0 - 1)
          ! CU = IMMOPBILIZATION (UPTAKE) RATE SCALING FACTOR BASED ON BMNC (0 - 1)
          ! WKA = SPECIFIC BASE RATE FOR AMMONIFICATION (d-1)
          ! WNCMIN = BMNC AT WHICH IMMOBILIZATION IS A MAXIMUM; BMNC AT WHICH AMMONIFICATION CEASES
          ! WNCMAX = BMNC AT WHICH IMMOBILIZATION CEASES; BMNC AT WHICH AMMONIFICATION IS A MAXIMUM
          ! VMU = MAXIMUM RATE OF UPTAKE OF N DURING IMMOBILIZATION (gN (gC-1) d-1)
          ! WKMNH3 = HALF SATURATION CONSTANT FOR AMMONIA IMMOBILIZATION (mg N L-1)
          ! WKMNO2 = HALF SATURATION CONSTANT FOR NITRITE IMMOBILIZATION (mg N L-1)
          ! WKMNO3 = HALF SATURATION CONSTANT FOR NITRATE IMMOBILIZATION (mg N L-1)
      END IF
      XSF=(BMNC-WNCMIN)/(WNCMAX-WNCMIN)
      CA=0.
      IF(BMNC>WNCMIN.AND.BMNC<WNCMAX)CA=XSF
      IF(BMNC>WNCMAX)CA=1.
      CU=.001
      IF(BMNC>WNCMIN.AND.BMNC<WNCMAX)CU=1.-XSF
      IF(BMNC<WNCMIN)CU=1.
      ! AMMONIFICATION (N MINERLIZATION) PRODUCRT OF CA*CS*WKA*BMN
      SUP=MAX(0.,CA*CS*WKA*WBMN(ISL,ISA))
      ! MICROBIAL UPTAKE OF N (N IMMOBILIZATION) MICHAELIS-MENTEN EXPRESION &
      ! DRIVEN BY MICROBIAL CARBON AND REGUALTED BY CU
      XU=CS*CU*VMU
      XDENOM=.01*SWST(ISL,ISA)
      DMDNMAX=XU*WBMC(ISL,ISA)
      XWNH3=WNH3(ISL,ISA)/XDENOM
      XWNO2=WNO2(ISL,ISA)/XDENOM
      XWNO3=WNO3(ISL,ISA)/XDENOM
      DMDNH3MX=MIN(WNH3(ISL,ISA),XWNH3*DMDNMAX/(WKMNH3+XWNH3))
      DMDNO2MX=MIN(WNO2(ISL,ISA),XWNO2*DMDNMAX/(WKMNO2+XWNO2))
      DMDNO3MX=MIN(WNO3(ISL,ISA),XWNO3*DMDNMAX/(WKMNO3+XWNO3))
      DMDN=DMDNH3MX+DMDNO2MX+DMDNO3MX
      XX=1.
      IF(DMDN>DMDNMAX)XX=DMDNMAX/DMDN
      TUPH3=DMDNH3MX*XX
      TUPO2=DMDNO2MX*XX
      TUPO3=DMDNO3MX*XX
      SGMN=SGMN+SUP
      XNIMO=-TUPH3-TUPO2-TUPO3
      RNMN(ISL,ISA)=SUP+XNIMO
      WNO3(ISL,ISA)=MAX(1.E-10,WNO3(ISL,ISA)-TUPO3)
      WNO2(ISL,ISA)=MAX(1.E-10,WNO2(ISL,ISA)-TUPO2)
      WNH3(ISL,ISA)=MAX(1.E-10,WNH3(ISL,ISA)-TUPH3+SUP)
      SNMN=SNMN+RNMN(ISL,ISA)
      SMS(9,ISL,ISA)=SMS(9,ISL,ISA)+RNMN(ISL,ISA)
	  TLSCA=MIN(WLSC(ISL,ISA),TLSCA)
	  WLSC(ISL,ISA)=MAX(.01,WLSC(ISL,ISA)-TLSCA)
	  TLSLCA=MIN(WLSLC(ISL,ISA),TLSLCA)
      WLSLC(ISL,ISA)=WLSLC(ISL,ISA)-TLSLCA
      WLSLNC(ISL,ISA)=WLSC(ISL,ISA)-WLSLC(ISL,ISA)
      TLMCA=MIN(WLMC(ISL,ISA),TLMCA)
      IF(WLM(ISL,ISA)>0.)THEN
          RTO=MAX(.42,WLMC(ISL,ISA)/WLM(ISL,ISA))
          WLM(ISL,ISA)=WLM(ISL,ISA)-TLMCA/RTO
          WLMC(ISL,ISA)=MAX(.01,WLMC(ISL,ISA)-TLMCA)
      END IF
      WLSL(ISL,ISA)=WLSL(ISL,ISA)-TLSLCA/.42
      WLS(ISL,ISA)=WLSC(ISL,ISA)/.42
      IF(ISL==LD1)THEN 
          X3=ASX*THSCA+A1*(TLMCA+TLSLNCA)
          X1=.7*TLSLCA+TBMCA*(1.-ABCO2)
          WBMN(ISL,ISA)=WBMN(ISL,ISA)-TBMNA+THSNA*(1.-ASP)+TLMNA+TLSNA-RNMN(ISL,ISA)
          !RSPC(ISL,ISA)=.3*TLSLCA+A1CO2*(TLSLNCA+TLMCA)+ABCO2*TBMCA+ASCO2*THSCA
      ELSE
          X3=APX*THPCA+ASX*THSCA+A1*(TLMCA+TLSLNCA)
          X1=.7*TLSLCA+TBMCA*(1.-ABP-ABCO2)
          X2=THSCA*ASP+TBMCA*ABP
          WHPC(ISL,ISA)=WHPC(ISL,ISA)-THPCA+X2
          WBMN(ISL,ISA)=WBMN(ISL,ISA)-TBMNA+THPNA+THSNA*(1.-ASP)+TLMNA+TLSNA-RNMN(ISL,ISA)
          WHPN(ISL,ISA)=WHPN(ISL,ISA)-THPNA+TBMNA*ABP+THSNA*ASP
          !RSPC(ISL,ISA)=.3*TLSLCA+A1CO2*(TLSLNCA+TLMCA)+ABCO2*TBMCA+ASCO2*THSCA+&
          !APCO2*THPCA
      END IF        
      WBMC(ISL,ISA)=WBMC(ISL,ISA)-TBMCA+X3
      WHSC(ISL,ISA)=WHSC(ISL,ISA)-THSCA+X1
      AD2=WBMC(ISL,ISA)+WHPC(ISL,ISA)+WHSC(ISL,ISA)+WLMC(ISL,ISA)+WLSC(ISL,ISA)
      RSPC(ISL,ISA)=MAX(0.,AD1-AD2)
      WHSN(ISL,ISA)=WHSN(ISL,ISA)-THSNA+TBMNA*(1.-ABP)
      WLSN(ISL,ISA)=WLSN(ISL,ISA)-TLSNA
      WLMN(ISL,ISA)=WLMN(ISL,ISA)-TLMNA
      X2=RSPC(ISL,ISA)*WSA(ISA)
      SMM(74,MO,ISA)=SMM(74,MO,ISA)+X2
      VAR(74,ISA)=VAR(74,ISA)+X2
      SMS(8,ISL,ISA)=SMS(8,ISL,ISA)+RSPC(ISL,ISA)
      TRSP=TRSP+RSPC(ISL,ISA)      
      RSD(ISL,ISA)=.001*(WLS(ISL,ISA)+WLM(ISL,ISA))
      DHN(ISL,ISA)=XHN-WHSN(ISL,ISA)-WHPN(ISL,ISA)
      DF=AD1-AD2-RSPC(ISL,ISA)
      SDF=SDF+DF
      IF(ABS(DF)>.1)WRITE(KW(1),3)IY,MO,KDA,ISL,AD1,AD2,RSPC(ISL,ISA),DF,SDF
      !XZ=WNO3(ISL,ISA)+WNO2(ISL,ISA)+WNH3(ISL,ISA)
      !AD2=WLSN(ISL,ISA)+WLMN(ISL,ISA)+WBMN(ISL,ISA)+WHSN(ISL,ISA)+WHPN(ISL,ISA)+XZ
      !DF=AD2-AD1
      !SDF=SDF+DF
      !IF(ABS(DF)>.01)WRITE(KW(1),3)IY,MO,KDA,ISL,AD1,AD2,DF,SDF
    3 FORMAT(1X,'NCNMI',4I4,10E16.6)      
      RETURN
      END