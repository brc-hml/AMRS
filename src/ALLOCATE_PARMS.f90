      SUBROUTINE ALLOCATE_PARMS                                                      
!     THIS SUBROUTINE ALLOCATES ARRAY SIZES                                          
      USE PARM                                                                       
      MSL=12                                                                              
      MSO=50                                                                         
	  NSM=158 
	  MSC=31                                                                                                                                                          
	  NSH=37
      NRNG=14
      NRN0=NRNG-1
	  ML1=MSL+1                                                                           
      MHY=MSA*4                                                                      
      MHY5=MHY*5                                                                     
      MLA=MSL*MSA                                                                    
      MLA1=ML1*MSA                                                                   
      MLA17=MSL*MSA*17                                                               
	  MPA=MPS*MSA                                                                         
      MPA90=MPA*90                                                                   
      MPLA=MPA*MSL                                                                   
	  MCA=MNC*MSA                                                                         
      MCA5=MCA*5                                                                     
      MCA12=MCA*12                                                                   
      MCCA=MNC*MNC*MSA                                                               
      MRA=MRO*MSA                                                                    
      MRCA=MRA*MNC                                                                   
      MRTA=MNT*MRA                                                                   
	  MLCA=MNC*MLA
	  NBMX=MAX(NBMX,MHY)                                                                        
      ALLOCATE (CPNM(MNC),FPSO(NBMX),FTNM(MFT),PSTN(MPS),TITOP(MSA),&
      TITSO(MSA),HEDH(NSH),HED(NSM))                                                            
	  ALLOCATE (KW(2*MSA+MSO),ICDT(MHY),IDN1T(MHY),IDN2T(MHY),IDNB(MHY),&                 
      IDOT(MHY),IDRO(MHY),NHY(MHY),NQRB(MHY),NTX(MHY),NISA(NBMX),ICUS&
      (MNT),IHC(MNT),MASA(NSM),NBE(MNT),NBT(MNT),IDC(MNC),KDC(MNC),&
      NTP(MNC),KDF(MFT),KFL(MSO+1))                                                     
	  ALLOCATE (ISAL(MOW),ISAS(MOW),NFED(MOW),NHRD(MOW),NSAL(MSA),NSAO&                   
      (MOW),NSAS(MOW))                                                               
	  ALLOCATE (IIR(MIR),KIR(MIR),NIR(MIR))                                               
	  ALLOCATE (IAC(MSA),IAMF(MSA),IAPL(MSA),IAUF(MSA),IAUI(MSA),IAUL&                    
      (MSA),IBSA(MSA),IDFH(MSA),IDNF(MSA),IDOA(MSA),IDON(MSA),IDOR(MSA),&
      IDR(MSA),IDRL(MSA),IDS(MSA),IEXT(MSA),IFA(MSA),IFD(MSA),IFLS(MSA),&
      IGO(MSA),IGZ(MSA),IHDM(MSA),ILQF(MSA),IMW(MSA),IPMP(MSA),IPSO(MSA),&
      IPST(MSA),IPTS(MSA),IRF(MSA),IRI(MSA),IRO(MSA),IRP(MSA),IRR(MSA),&
      IRRS(MSA),IRRW(MSA),ISAO(MSA),ISCP(MSA))
      ALLOCATE (ISG(MSA),ISPF(MSA),IWTH(MSA),JBG(MSA),JCN(MSA),&
      JCN0(MSA),JCN1(MSA),JD(MSA),JSA(MSA),KC(MSA),KP1(MSA),KT(MSA),&
      KTF(MSA),KTMX(MSA),KTT(MSA),LM(MSA),LRD(MSA),LUN(MSA),LUNS(MSA),&
      MXSR(MSA),NBCF(MSA),NBCT(MSA),NBFF(MSA),NBFT(MSA),NBSA(MSA),&
      NBSL(MSA),NBW(MSA),NDFA(MSA),NII(MSA),NMW(MSA),NPSF(MSA),NRO(MSA),&
      NVCN(MSA),NWDA(MSA))
      ALLOCATE (IPSF(MPO),IDG(NRN0),IX(NRNG),IX0(NRN0),KPSN(MPO),&
      JPC(MPS),KPC(MPS),NPC(MPS),IHX(MHX)) 
	  ALLOCATE (IHU(MNC,MSA),IYH(MNC,MSA),JE(MNC,MSA),JP(MNC,MSA),&                       
      JPL(MNC,MSA),KGO(MNC,MSA),NCR(MNC,MSA),NGD(MNC,MSA),NHU(MNC,MSA),&
      NYLN(MNC,MSA))             
	  ALLOCATE (NCP(MRO,MSA),NFRT(MRO,MSA),NPST(MRO,MSA),NTL(MRO,MSA))                    
	  ALLOCATE (IDFA(MHD,MOW),IDFD(MHD,MOW),IDMU(MHD,MOW),IGZO(MHD,MOW),&                 
      IGZX(MHD,MOW),IHBS(MHD,MOW),IYHO(MHD,MOW),LGIR(MHD,MOW),&             
      NCOW(MHD,MOW),NGZA(MHD,MOW),NHBS(MHD,MOW),NYHO(MHD,MOW))                  
	  ALLOCATE (IDSL(MSA,MSA),IDSS(MSA,MSA),IDOW(MSA,MOW),&                 
      IHT(MNT,MSA),KOMP(MNT,MSA),IFED(MHD,MSA),NGZ(MHD,MSA),LID(ML1,MSA)&            
      ,LORG(MSL,MSA),IFLO(MSL,MSA),IHRL(12,MSA),IDFT(6,MSA),IDF0(6,MSA))                          
	  ALLOCATE (ITL(MRO,MNT,MSA),JH(MRO,MNT,MSA),KDT(12,MNC,MSA),LFT(MRO&                 
      ,MNT,MSA),LT(MRO,MNT,MSA),LYR(MRO,MNT,MSA),LPC(MRO,MPS,MSA),LY(MRO&            
      ,MNC,MSA),IHDT(MBS,MHD,MOW),NGIX(MSA,MHD,MOW),NBSX(MBS,MHD,MOW))
      ALLOCATE (OSAA(MOW),OWSA(MOW),PKRZ(MSL),UK(MSL),&
      UN(MSL),UP(MSL),UW(MSL))
      ALLOCATE (FCST(MFT),FK(MFT),FN(MFT),FNMA(MFT),FNMN(MFT),FNO(MFT),&
      FOC(MFT),FP(MFT),FPO(MFT),FSLT(MFT))                                                 
	  ALLOCATE (PCST(MPS),PHLF(MPS),PHLS(MPS),PKOC(MPS),PLCH(MPS),&                       
      PSOL(MPS),PWOF(MPS),SSPS(MPS))                                                 
      ALLOCATE (COOP(MNT),COTL(MNT),DKH(MNT),DKI(MNT),EFM(MNT),EMX&                  
      (MNT),FPOP(MNT),FRCP(MNT),FULU(MNT),HE(MNT),HMO(MNT),ORHI(MNT),RHT&            
      (MNT),RIN(MNT),RR(MNT),STIR(MNT),TIL(MNT),TLD(MNT))
      ALLOCATE (AEP(MNC),ALT(MNC),CAF(MNC),CKY(MNC),CNLV(MNC),&
      CNY(MNC),CSTS(MNC),CPY(MNC),DDM(MNC),DLAI(MNC),DMLA(MNC),&
      DMLX(MNC),EP(MNC),EXTC(MNC),FLT(MNC),FTO(MNC),GMHU(MNC),GRDD(MNC),&
      GRLV(MNC),GSI(MNC),HI(MNC),HMX(MNC),PHUX(MNC),PLAX(MNC),POPX(MNC),&
      PRYF(MNC),PRYG(MNC),PST(MNC),RBMD(MNC),RDMX(MNC),RLAD(MNC),&
      SDW(MNC),TBSC(MNC),TCPA(MNC),TCPY(MNC),TOPC(MNC),VPD2(MNC),&
      VPTH(MNC),WA(MNC),WAI(MNC),WAVP(MNC),WAX(MNC),WCY(MNC),WSYF(MNC),&
      WXYF(MNC),XDLAI(MNC),XMTU(MNC),YLD(MNC),YLX(MNC))
      ALLOCATE (ABD(MSA),AFLG(MSA),AGPM(MSA),ALGI(MSA),ALQ(MSA),ARMN&                     
      (MSA),ARMX(MSA),ARSD(MSA),BA1(MSA),BA2(MSA),BCOF(MSA),BCV(MSA),&
      BFFL(MSA),BFSN(MSA),BFT(MSA),BGWS(MSA),BIG(MSA),BIR(MSA),&
      BR1(MSA),BR2(MSA),BRSV(MSA),BSALA(MSA),BSNO(MSA),BSW(MSA),BTC(MSA),&
      BTCX(MSA),BTCZ(MSA),BTK(MSA),BTN(MSA),BTNX(MSA),BTNZ(MSA),&
      BTP(MSA),BTPX(MSA),BTPZ(MSA),BV1(MSA),BV2(MSA),BVIR(MSA),&
      CFNP(MSA),CHL(MSA),CHMX(MSA),CHN(MSA),CHS(MSA),CHXA(MSA),CHXP(MSA),&
      CLG(MSA),CN0(MSA),CN2(MSA),CNSX(MSA))
      ALLOCATE (COST(MSA),COWW(MSA),CPMX(MSA),CST1(MSA),CV(MSA),CVF(MSA),&
      CVP(MSA),CVRS(MSA),CYAV(MSA),CYMX(MSA),CYSD(MSA),DALG(MSA),DDLG&
      (MSA),DEPC(MSA),DHT(MSA),DKIN(MSA),DKHL(MSA),DRT(MSA),DST0(MSA),&
      DWOC(MSA),EFI(MSA),EK(MSA),EM10(MSA),EVRS(MSA),EVRT(MSA),FBAR(MSA),&
      FBM(MSA),FCMN(MSA),FCMP(MSA),FDSF(MSA),FFC(MSA),FFPQ(MSA),FGC(MSA),&
      FGSL(MSA),FHP(MSA),FIRG(MSA),FPF(MSA),FPSC(MSA),FSFN(MSA),&
      FSFP(MSA),GMA(MSA),GRDL(MSA),GWE0(MSA),GWEL(MSA),GWSN(MSA),&
      GWST(MSA),GWMX(MSA),GZRF(MSA),HCLD(MSA),HCLN(MSA),HLMN(MSA),&
      HR0(MSA),HSM(MSA),OCPD(MSA))
      ALLOCATE (OMAP(MSA),ORSD(MSA),PAW(MSA),PCOF(MSA),PDAW(MSA),PDPL&
      (MSA),PDPL0(MSA),PDPLC(MSA),PDPLX(MSA),PDSKC(MSA),PDSW(MSA),&
      PEC(MSA),PMX(MSA),PM10(MSA),PRSD(MSA),PSTF(MSA),PSTM(MSA),PSTS(MSA),&
      QCAP(MSA),QRBQ(MSA),QRQB(MSA),RCBW(MSA),RCF(MSA),RCHC(MSA),&
      RCHD(MSA),RCHK(MSA),RCHL(MSA),RCHN(MSA),RCHS(MSA),RCHX(MSA),&
      RCSS(MSA),RCTW(MSA),REPI(MSA),RFPK(MSA),RFPL(MSA),RFPS(MSA),&
      RFPW(MSA),RFPX(MSA),RFQN(MSA),RFTT(MSA),RFV(MSA),RFV0(MSA),&
      RHD(MSA),RHTT(MSA))
      ALLOCATE (RINT(MSA),RLF(MSA),RMXS(MSA),ROSP(MSA),RRUF(MSA),RSAE&
      (MSA),RSAP(MSA),RSBD(MSA),RSDP(MSA),RSEE(MSA),RSEP(MSA),RSF(MSA),&
      RSHC(MSA),RSK(MSA),RSLK(MSA),RSOC(MSA),RSON(MSA),RSOP(MSA),RSO3&
      (MSA),RSRR(MSA),RSSA(MSA),RSSP(MSA),RST0(MSA),RSV(MSA),RSVB(MSA),&
      RSVE(MSA),RSVF(MSA),RSVP(MSA),RSPK(MSA),RSYB(MSA),RSYF(MSA),&
      RSYN(MSA),RSYS(MSA),RVE0(MSA),RVP0(MSA),RZ(MSA),RZSW(MSA),&
      SALA(MSA),SALB(MSA),SAMA(MSA),SATK(MSA),SCI(MSA),&
      SCNX(MSA),SDVR(MSA),SLF(MSA),SLT0(MSA),SLTX(MSA),SMAS(MSA),&
      SMEO(MSA),SMFN(MSA),SMFU(MSA),SMKS(MSA),SMLA(MSA),SMMU(MSA),&
      SMNS(MSA),SMNU(MSA),SMPL(MSA),SMPQ(MSA),SMPS(MSA),SMPY(MSA),&
      SMRF(MSA),SMSS(MSA),SMST(MSA),SMTS(MSA),SMWS(MSA),SMX(MSA),&
      SMY1(MSA),SMY2(MSA),SNO(MSA),SOLQ(MSA),SPFD(MSA),SPLG(MSA),&
      SRAD(MSA),SRSD(MSA),SSFI(MSA),SSIN(MSA),SSW(MSA))
      ALLOCATE (ST0(MSA),STDO(MSA),STDOK(MSA),STDON(MSA),STDOP(MSA),&
      STKR(MSA),STLT(MSA),STP(MSA),SW(MSA),&
      SWLT(MSA),S3(MSA),TAGP(MSA),TCC(MSA),TCS(MSA),TFLG(MSA),THK(MSA),&
      TILG(MSA),TKR(MSA),TLMF(MSA),TMN(MSA),TMX(MSA),TNOR(MSA),TOC(MSA),&
      TPSF(MSA),TRSD(MSA),TSLA(MSA),TSMY(MSA),TSNO(MSA),TVGF(MSA),&
      TYK(MSA),TYN(MSA))
      ALLOCATE (TYP(MSA),U10(MSA),UB1(MSA),UOB(MSA),UPSX(MSA),URBF(MSA),&
      USL(MSA),VAC(MSA),VALF1(MSA),VAP(MSA),VCHA(MSA),VCHB(MSA),VFPA(MSA),&
      VFPB(MSA),VIMX(MSA),VIRT(MSA),VLG(MSA),VLGB(MSA),VLGI(MSA),&
      VLGM(MSA),VLGN(MSA),VPU(MSA),VRSE(MSA),VSK(MSA),VSLT(MSA),WDRM(MSA))
      ALLOCATE (WK(MSA),WS(MSA),WSA(MSA),WSX(MSA),WTMB(MSA),WTBL(MSA),&                   
      WTMN(MSA),WTMU(MSA),WTMX(MSA),XCT(MSA),XHSM(MSA),XIDK(MSA),XIDS&               
      (MSA),XMAP(MSA),XNS(MSA),XRFI(MSA),YCT(MSA),YLC(MSA),YLS(MSA),&
      YTN(MSA),YTX(MSA),ZBMC(MSA),ZBMN(MSA),ZCO(MSA),ZCOB(MSA),ZEK(MSA),&
      ZFK(MSA),ZFOP(MSA),ZHPC(MSA),ZHPN(MSA),ZHSC(MSA),ZHSN(MSA),ZLM(MSA),&
      ZLMC(MSA),ZLMN(MSA),ZLS(MSA),ZLSC(MSA),ZLSL(MSA),ZLSLC(MSA),&
      ZLSLNC(MSA),ZLSN(MSA),ZNH3(MSA),ZNO3(MSA),ZNMU(MSA),ZNOA(MSA),&
      ZNOS(MSA),ZNOU(MSA),ZOC(MSA),ZON(MSA),ZPMA(MSA),ZPML(MSA),ZPMS(MSA),&
      ZPMU(MSA),ZPO(MSA),ZPOU(MSA),ZSK(MSA),ZSLT(MSA),ZTP(MSA))                                             
	  ALLOCATE (CPVH(MHY),DPMT(MHY),DRAV(MHY),ERAV(MHY),HYDV(MHY),RCTC&                   
      (MHY),PRAV(MHY),PRB(MHY),PSZM(MHY),QC(MHY),QDR(MHY),QDRN(MHY),&             
      QDRP(MHY),QN(MHY),QP(MHY),QPR(MHY),QPU(MHY),QRF(MHY),QRFN(MHY),&
      QRFP(MHY),QRP(MHY),QURB(MHY),QVOL(MHY),RQRB(MHY),RSFN(MHY),RSSF&
      (MHY),RWSA(MHY),SHYD(MHY),SMIO(MHY),SMQN(MHY),SMYN(MHY),SQC(MHY),&
      SQN(MHY),SQP(MHY),SQVL(MHY),SSN(MHY),SST(MHY),STY(MHY),SYC(MHY),&
      SYN(MHY),SYP(MHY),TC(MHY),TCAV(MHY),TCMN(MHY),TCMX(MHY),TSFK(MHY),&
      TSFN(MHY),VAQN(MHY),VAQP(MHY),VAYN(MHY),VAYP(MHY),VQC(MHY),&
      VSSN(MHY),VYC(MHY),WYLD(MHY),YC(MHY),YCOU(MHY),YCWN(MHY),&
      YMNU(MHY),YN(MHY),YNOU(MHY),YNWN(MHY),YP(MHY),YPM(MHY),YPOU(MHY),&
      YPWN(MHY),YW(MHY))
      ALLOCATE (PSO3(MPO),PSON(MPO),PSOP(MPO),PSOQ(MPO),PSOY(MPO),PQPS&
      (MPO),PSSP(MPO),PYPS(MPO))
      ALLOCATE (QGA(MHP),RFDT(MHP),VARW(NSM))
      ALLOCATE (EO5(30,MSA),RF5(30,MSA),SCFS(30,MSA),XMS(30,MSA),ASW(12,&
      MSA),CX(12,MSA),QIN(12,MSA),SET(12,MSA),SRD(12,MSA),SRMX(12,MSA),&
      TAMX(12,MSA),TCN(12,MSA),TCVF(12,MSA),TEI(12,MSA),TET(12,MSA),THRL&
      (12,MSA),TQ(12,MSA),TR(12,MSA),TRHT(12,MSA),TSN(12,MSA),TSR(12,MSA),&
      TSY(12,MSA),TXMX(12,MSA),TXMN(12,MSA),TQN(12,MSA),TQP(12,MSA),TQPU&
      (12,MSA),TYON(12,MSA),TYTP(12,MSA),TYW(12,MSA),CNSC(2,MSA))
      ALLOCATE (ALS(MSL,MSA),BD(MSL,MSA),BDD(MSL,MSA),BDM(MSL,MSA),BDP&              
      (MSL,MSA),BPT(MSL,MSA),CAC(MSL,MSA),CBN(MSL,MSA),&
      CDG(MSL,MSA),CEC(MSL,MSA),CLA(MSL,MSA),CNDS(MSL,MSA),CNRT(MSL,MSA),&
      CPRH(MSL,MSA),CPRV(MSL,MSA),DHN(MSL,MSA),ECND(MSL,MSA),&
      EQKE(MSL,MSA),EQKS(MSL,MSA),EXCK(MSL,MSA),FE26(MSL,MSA),&
      FIXK(MSL,MSA),FOP(MSL,MSA),HCL(MSL,MSA),PH(MSL,MSA),PO(MSL,MSA),&
      PSP(MSL,MSA),RNMN(MSL,MSA),ROK(MSL,MSA),RSD(MSL,MSA),RSDM(MSL,MSA),&
      SAN(MSL,MSA),SATC(MSL,MSA),SEV(MSL,MSA),SIL(MSL,MSA),SMB(MSL,MSA),&
      SULF(MSL,MSA),SUT(MSL,MSA))
      ALLOCATE (SWST(MSL,MSA),STFR(MSL,MSA),STMP(MSL,MSA),VNO3(MSL,MSA),&
      WBMN(MSL,MSA),WCMU(MSL,MSA),WCOU(MSL,MSA),WHPC(MSL,MSA),&
      WHPN(MSL,MSA),WHSC(MSL,MSA),WHSN(MSL,MSA),WKMU(MSL,MSA),&
      WLM(MSL,MSA),WLMC(MSL,MSA),WLMN(MSL,MSA),WLS(MSL,MSA),WLSC(MSL,MSA),&
      WLSL(MSL,MSA),WLSLC(MSL,MSA),WLSLNC(MSL,MSA),WLSN(MSL,MSA),&
      WNMU(MSL,MSA),WNOU(MSL,MSA),WOC(MSL,MSA),WON(MSL,MSA),WPMA(MSL,MSA),&
      WPMS(MSL,MSA),WPMU(MSL,MSA),WPO(MSL,MSA),WPOU(MSL,MSA),&
      WSLT(MSL,MSA),WT(MSL,MSA),Z(MSL,MSA),fc(msl,msa),s15(msl,msa),&    ! FC, S15 moved from MSC to MSL to avoid problem with different array size in AINTRI - Luca Doro 20190819
      xgo2(msl,msa),xgco2(msl,msa),xgn2o(msl,msa))    ! xgo2, xgco2, and xgn2o moved from MAIN - Luca Doro 20190827                                                   
      ALLOCATE (ACET(MNC,MSA),AJH1(MNC,MSA),AJHI(MNC,MSA),AWC(MNC,MSA),&
      CAW(MNC,MSA),CNT(MNC,MSA),CPHT(MNC,MSA),CSTF(MNC,MSA),DM(MNC,MSA),&
      DMF(MNC,MSA),DM1(MNC,MSA),ETG(MNC,MSA),FRTK(MNC,MSA),FRTN(MNC,MSA),&
      FRTP(MNC,MSA),HU(MNC,MSA),HUF(MNC,MSA),HUI(MNC,MSA),PPL0(MNC,MSA),&
      RD(MNC,MSA),RDF(MNC,MSA),REG(MNC,MSA),RW(MNC,MSA),SLAI(MNC,MSA),&
      SLA0(MNC,MSA),SRA(MNC,MSA),STD(MNC,MSA),STDK(MNC,MSA),&
      STDL(MNC,MSA),STDN(MNC,MSA))
      ALLOCATE (STDP(MNC,MSA),STL(MNC,MSA),SWH(MNC,MSA),SWP(MNC,MSA),TCAW&
      (MNC,MSA),TDM(MNC,MSA),TETG(MNC,MSA),TFTK(MNC,MSA),TFTN(MNC,MSA),&
      TFTP(MNC,MSA),THU(MNC,MSA),TRA(MNC,MSA),TRD(MNC,MSA),TVIR(MNC,MSA),&
      TYL1(MNC,MSA),TYL2(MNC,MSA),TYLK(MNC,MSA),TYLN(MNC,MSA),&
      TYLP(MNC,MSA),UK1(MNC,MSA),UNA(MNC,MSA),UN1(MNC,MSA),UP1(MNC,MSA),&
      VIR(MNC,MSA),WCHT(MNC,MSA),WLV(MNC,MSA),XLAI(MNC,MSA),&
      XDLA0(MNC,MSA),YLD1(MNC,MSA),YLD2(MNC,MSA),YLKF(MNC,MSA),&
      YLNF(MNC,MSA),YLPF(MNC,MSA))
      ALLOCATE(ACO2C(MSC,MSA),AFP(MSC,MSA),AN2OC(MSC,MSA),AO2C(MSC,MSA),&
      CGCO2(MSC,MSA),CGN2O(MSC,MSA),CGO2(MSC,MSA),CLCO2(MSC,MSA),CLN2O&
      (MSC,MSA),CLO2(MSC,MSA),DCO2GEN(MSC,MSA),DN2G(MSC,MSA),&
      DN2OG(MSC,MSA),DO2CONS(MSC,MSA),DPRC(MSC,MSA),DPRN(MSC,MSA),&
      DPRO(MSC,MSA),DRWX(MSC,MSA),EAR(MSC,MSA),&!FC(MSC,MSA),&    ! FC moved to MSL - Luca Doro
      HKPC(MSC,MSA),HKPN(MSC,MSA),HKPO(MSC,MSA))
      ALLOCATE(RSPC(MSC,MSA),RWTZ(MSC,MSA),SADST(MSA,MSA),&!S15(MSC,MSA),&    S15 moved to MSL - Luca Doro
      SMEA(MSC,MSA),SMES(MSC,MSA),SOLK(MSC,MSA),SOT(MSC,MSA),&
      SSFCO2(MSC,MSA),SSFN2O(MSC,MSA),SSFO2(MSC,MSA),TPOR(MSC,MSA),&
      VCO2(MSC,MSA),VGA(MSC,MSA),VGN(MSC,MSA),VN2O(MSC,MSA),&
      VO2(MSC,MSA),VFC(MSC,MSA),VWC(MSC,MSA),VWP(MSC,MSA),WBMC(MSC,MSA),&
      WCO2G(MSC,MSA),WCO2L(MSC,MSA),WN2O(MSC,MSA),WN2OG(MSC,MSA),&
      WN2OL(MSC,MSA),WNO2(MSC,MSA),WNH3(MSC,MSA),WNO3(MSC,MSA),&
      WO2G(MSC,MSA),WO2L(MSC,MSA),WPML(MSC,MSA),XN2O(MSC,MSA),&
      ZC(MSC,MSA))    
      ALLOCATE (YHY(MHP,MHY),SMH(NSH,MHY),SMYH(NSH,MHY),VARH(NSH,MHY),&
      QPST(MPS,MHY),RSPS(MPS,MHY),TSPS(MPS,MHY),YPST(MPS,MHY),&
      SRCH(27,MHY),CPFH(MSL,MHY),QSF(MSL,MHY),SSF(MSL,MHY),SM(NSM,MSA),&
      SMUA(NSM,MSA),SMY(NSM,MSA),SMYUA(NSM,MSA),VAR(NSM,MSA),&
      VARUA(NSM,MSA),CTSA(100,MSA),VQ(90,MHY),VY(90,MHY),GWPS(MPS,MSA),&
      PFOL(MPS,MSA),ANA(MRO,MSA),FNMX(MRO,MSA),GCOW(MHD,MSA),&
      GZLM(MHD,MSA),DUMP(MHD,MOW),FFED(MHD,MOW),GZRT(MHD,MOW),&
      VURN(MHD,MOW),PPX(13,MSA),YSD(6,MHY),PCT(5,MHY),PCTH(5,MHY),&
      SQB(5,MHY),SYB(5,MHY),FNP(5,MSA),SMYRP(5,MPS),BK(4,MNC),BN(4,MNC),&
      BP(4,MNC),BLG(3,MNC),BWN(3,MNC),DLAP(2,MNC),FRST(2,MNC),&
      PPCF(2,MNC),PPLP(2,MNC),RWPC(2,MNC),STX(2,MNC),WAC2(2,MNC))    
      ALLOCATE (CND(MRO,MNT,MSA),FIRX(MRO,MNT,MSA),PHU(MNC,MRO,MSA),&
      POP(MNC,MRO,MSA),PPLA(MNC,MRO,MSA),PSTE(MRO,MPS,MSA),&
      PSSF(MPS,MSL,MSA),PSTR(MRO,MPS,MSA),PSTZ(MPS,MSL,MSA),&
      PVQ(MPS,90,MHY),PVY(MPS,90,MHY),QIR(MRO,MNT,MSA),&
      RSTK(MRO,MNT,MSA),SMAP(13,MPS,MHY),SMM(NSM,12,MSA),&
      SMMUA(NSM,12,MSA),SMMH(NSH,12,MHY),SMMRP(5,MPS,12),SMRP(5,MPS,12),&
      SMS(11,ML1,MSA),SMYP(13,MPS,MHY),SOL(23,MSL,MSA),STV(20,12,MSA),&
      TIR(MRO,MNT,MSA),VARC(17,MNC,MSA),VARP(12,MPS,MHY),&
      VIRR(MRO,MNT,MSA),WFA(MRO,MNT,MSA),WMUCH(MRO,MNT,MSA))
      !SPQ(5,20,MHY),SPQC(5,20,MHY),SPY(5,20,MHY)
      ALLOCATE (TSFC(7,MNC,MSA),SOIL(17,MSL,MSA),HUSC(MRO,MNT,MSA),RWT(MSL,&
      MNC,MSA),STDA(4,MNC,MSA),SFCP(7,MNC,MSA),SFMO(7,MNC,MSA),&
      XZP(13,ML1,MSA),QHY(NPD,MHY,MHX))
      ALLOCATE (SMMP(20,MPS,13,MHY),SMMC(17,MNC,12,MSA))
      !PADDY MODELING JAEHAK JEONG 2016
      ALLOCATE(SUB_D50(MSA),PADDY_STO(10,MSA),PADDY_OUT(10,MSA),PADDY_HWEIR(MSA),PADDY_HMIN(MSA))
      ALLOCATE(HWEIR(MRO,MNT,MSA),LWEIR(MRO,MNT,MSA),PADDY_LWEIR(MSA),HMIN_IRR(MRO,MNT,MSA))
      ALLOCATE(KRST(MSA))
      RETURN                                                                         
      END                                                                            
                                                                                     
