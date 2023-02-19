      SUBROUTINE CCONI
      ! APEX1501
      ! THIS SUBPROGRAM DOES AN INITIAL PARTITION EACH GAS CONC. IN AIR 
      ! INTO GAS CONCENTRATION IN AIR AND LIQUID PHASE AND THEN
      ! CALCULATES THE TOTAL GAS CONCENTRATION (G/M3 SOIL)
      ! IT IS AN APPROXIMATION AND SHOULD BE CALCULATED ONLY ONCE AT THE
      ! BEGINNING OF EACH SIMULATION - RCI - 7/19/09
      USE PARM                                                                       
      DO J=1,NBCL
	      CLO2(J,ISA)=CGO2(J,ISA)/HKPO(J,ISA)	
	      CLCO2(J,ISA)=CGCO2(J,ISA)/HKPC(J,ISA)
	      CLN2O(J,ISA)=CGN2O(J,ISA)/HKPN(J,ISA)	
	      AO2C(J,ISA)=CGO2(J,ISA)*AFP(J,ISA)+CLO2(J,ISA)*VWC(J,ISA)
	      ACO2C(J,ISA)=CGCO2(J,ISA)*AFP(J,ISA)+CLCO2(J,ISA)*VWC(J,ISA)
	      AN2OC(J,ISA)=CGN2O(J,ISA)*AFP(J,ISA)+CLN2O(J,ISA)*VWC(J,ISA)
	  END DO
	  RETURN
      END