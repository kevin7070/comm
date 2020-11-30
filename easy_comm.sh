Y5$7Kc@u#$tr&LhF
Y5$7Kc@u#$tr&LAA

SET FTPSCLT: ENCRYMODE=Auto;

SET PWDPOLICY: PWDMINLEN=6, COMPLICACY=LOWERCASE-0&UPPERCASE-0&DIGIT-0&SPECHAR-0, MAXMISSTIMES=1, AUTOUNLOCKTIME=1, RESETINTERVAL=1, PASSREPLMT=1, MAXPERIOD=0, MINPERIOD=1, PWDEXPRT=1, FirstLoginMustModPWD=OFF, MAXREPEATCHARTIMES=2, DICTCHKPWD=OFF, MAXCCUN=0;

# change password
hwbs@com

SET LOCALETHPORT: SWITCH=ENABLE, GRATUITOUSARPSW=ENABLE, IP6SW=ENABLE;

# Download R15SP170
DLD SOFTWARE: MODE=IPV4, IP="192.168.0.50", USR="admin", PWD="admin", DIR="C:\Comm\BTS3900_5900 V100R015C10SPC170", SWT=SOFTWARE, SV="BTS3900_5900 V100R015C10SPC170", DL=NO;
ACT SOFTWARE: OT=NE, SWT=SOFTWARE, SV="BTS3900_5900 V100R015C10SPC170";

# Download R16SP112
DLD SOFTWARE: MODE=IPV4, IP="192.168.0.50", USR="admin", PWD="admin", DIR="C:\Comm\BTS3900_5900 V100R016C10SPC112", SWT=SOFTWARE, SV="BTS3900_5900 V100R016C10SPC112", DL=NO;
ACT SOFTWARE: OT=NE, SWT=SOFTWARE, SV="BTS3900_5900 V100R016C10SPC112";

# Add XML + after reset
DLD CFGFILE: MODE=IPV4, IP="192.168.0.50", USR="admin", PWD="admin", DIR="C:\Users\MH\Downloads\123", FN="file.xml", ENCRYPTMODE=UNENCRYPTED;
ACT CFGFILE: EFT=AFTER_RESET;

#after bbu reboot
# add 4G license
INS LICENSE: DIR="C:\Comm\License", FN="4g.xml", FLG=YES, MODE=IPV4, IP="192.168.0.50", USR="admin", PWD="admin";
ACT LICENSE: LBL=NO, FLG=YES, FN="l.xml";

# DownloadR17SP010
DLD SOFTWARE: MODE=IPV4, IP="192.168.0.50", USR="admin", PWD="admin", DIR="C:\Comm\BTS3900_5900 V100R017C00SPC010", SWT=SOFTWARE, SV="BTS3900_5900 V100R017C00SPC010", DL=NO, ATL=GBTS&NodeB&eNodeB&RFA&gNodeB;
ACT SOFTWARE: OT=NE, SWT=SOFTWARE, SV="BTS3900_5900 V100R017C00SPC010";

# add 5G license
INS LICENSE: DIR="C:\Comm\License", FN="5g.xml", FLG=YES, MODE=IPV4, IP="192.168.0.50", USR="admin", PWD="admin", FUNCTIONTYPE="gNodeB";
ACT LICENSE: LBL=NO, FLG=YES, FN="5g.xml", FUNCTIONTYPE="gNodeB";

#----------------------------------------------------------------------------
LST OMCH
PING: SN=7, SRCIP="10.46.146.54", DSTIP="10.5.242.4", CONTPING=DISABLE, APPTIF=NO;

#----------------------------------------------------------------------------
LST EUCELLSECTOREQM
MOD EUCELLSECTOREQM

#----------------------------------------------------------------------------
LST VLANMAP
# SAMPLE
RMV VLANMAP:NEXTHOPIP="10.45.61.177",MASK="255.255.255.255",FORCEEXECUTE=YES;

ADD VLANMAP

# IPRoute
LST IPRT

# useful command?

ADD ETHPORT: SN=7, SBT=BASE_BOARD, PN=1, PORTID=1, PA=FIBER, SPEED=10G, DUPLEX=FULL;

ADD DEVIP: SN=7, SBT=BASE_BOARD, PT=ETH, PN=1, IP="10.46.132.162", MASK="255.255.255.252", USERLABEL="2G/3G/4G/5G ETH IP";

ADD OMCH: BEAR=IPV4, IP="10.46.132.162", MASK="255.255.255.252", PEERIP="10.5.242.4", PEERMASK="255.255.255.128", BRT=NO, CHECKTYPE=NONE;

ADD VLANMAP: NEXTHOPIP="10.46.132.161", MASK="255.255.255.255", VLANMODE=SINGLEVLAN, VLANID=110, SETPRIO=DISABLE;

ADD IPRT:RTIDX=144,SN=7,SBT=BASE_BOARD,DSTIP="10.5.242.0",DSTMASK="255.255.255.128",RTTYPE=NEXTHOP,NEXTHOP="10.46.132.161",MTUSWITCH=OFF,DESCRI="TO TAISHAN U2020";

DSP SOFTSTATUS
LST RRU
DSP CELL
DSP OMCH
DSP CELLUECNT
DSP NRCELLUENUMBER