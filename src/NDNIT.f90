      SUBROUTINE NDNIT
!     APEX1501
!     THIS SUBPROGRAM ESTIMATES DAILY LOSS OF SOL N BY DENITRIFICATION.
      USE PARM
      X2=SWST(ISL,ISA)-FC(ISL,ISA)
      IF(X2>0.)THEN
          RTO=100.*(SWST(ISL,ISA)-FC(ISL,ISA))/(PO(ISL,ISA)-FC(ISL,ISA))
          !F=RTO/(RTO+EXP(SCRP(27,1)-SCRP(27,2)*RTO))
	      X1=MIN(PRMT(36),1.-EXP(-CDG(ISL,ISA)*WOC(ISL,ISA)/WT(ISL,ISA)))
          WDN=WNO3(ISL,ISA)*X1
	      IF(WDN>WNO3(ISL,ISA))WDN=WNO3(ISL,ISA)
          WNO3(ISL,ISA)=MAX(1.E-5,WNO3(ISL,ISA)-WDN)
      ELSE
          WDN=0.
      END IF    
      RETURN
      END