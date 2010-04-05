{******************************************************************************
                                Autor: Daniel Jurado
                                 jurado@gmail.com
******************************************************************************}
unit uATTpriv_h;

interface

uses
  uATTpdefs_h, uCSTADefs_h, uACS_h, Windows;

const
  ATT_MAX_PRIVATE_DATA = 1024;
  PRIVATE_VENDOR_SIZE  = 32;
  ATTPRIV_MAX_HEAP     = 64;
  ATT_MAX_UUI_SIZE     = 96;
  ATT_DLL_NAME         = 'ATTPRV32.DLL';
  ATT_VENDOR_STRING    = 'AT&T Definity G3';

type
  ATTPrivateData_t = record
    vendor : array [0..PRIVATE_VENDOR_SIZE - 1] of Char;
    length : WORD;
    data   : array [0..ATT_MAX_PRIVATE_DATA - 1] of Char;
    end;

  pATTPrivateData_t = ^ATTPrivateData_t;

  ATTEventType_t = SmallInt;

  TATTEventType = record
    case ATTEventType_t of
    //* private version 6 */
    //    0 : (ssconference              : ATTSingleStepConferenceCallConfEvent_t);
    //    1 : (slhold                    : ATTSelectiveListeningHoldConfEvent_t);
    //    2 : (slretrieve                : ATTSelectiveListeningRetrieveConfEvent_t);
    //    3 : (sendDTMFTone              : ATTSendDTMFToneConfEvent_t); }
        4 : (queryAcdSplit             : ATTQueryAcdSplitConfEvent_t);
        5 : (queryAgentLogin           : ATTQueryAgentLoginConfEvent_t);
        6 : (queryAgentLoginResp       : ATTQueryAgentLoginResp_t);
        7 : (queryAgentState           : ATTQueryAgentStateConfEvent_t);
        8 : (queryCallClassifier       : ATTQueryCallClassifierConfEvent_t);
        9 : (queryDeviceInfo           : ATTQueryDeviceInfoConfEvent_t);
       10 : (queryDeviceName           : ATTQueryDeviceNameConfEvent_t);
     //  11 : (queryMwi                  : ATTQueryMwiConfEvent_t);
     //  12 : (queryStationStatus        : ATTQueryStationStatusConfEvent_t);
     //  13 : (queryTod                  : ATTQueryTodConfEvent_t);
       14 : (queryTg                   : ATTQueryTgConfEvent_t);
     //  15 : (queryAgentMeas            : ATTQueryAgentMeasurementsConfEvent_t);
     //  16 : (querySplitSkillMeas       : ATTQuerySplitSkillMeasurementsConfEvent_t);
     //  17 : (queryTrunkGroupMeas       : ATTQueryTrunkGroupMeasurementsConfEvent_t);
     //  18 : (queryVdnMeas              : ATTQueryVdnMeasurementsConfEvent_t);
     //  19 : (snapshotDevice            : ATTSnapshotDeviceConfEvent_t);
     //  20 : (monitorStart              : ATTMonitorConfEvent_t);
     //  21 : (monitorCallStart          : ATTMonitorCallConfEvent_t);
     //  22 : (monitorStopOnCall         : ATTMonitorStopOnCallConfEvent_t);
       23 : (callClearedEvent          : ATTCallClearedEvent_t);
       24 : (conferencedEvent          : ATTConferencedEvent_t);
       25 : (connectionClearedEvent    : ATTConnectionClearedEvent_t);
       26 : (deliveredEvent            : ATTDeliveredEvent_t);
     //  27 : (enteredDigitsEvent        : ATTEnteredDigitsEvent_t);
       28 : (establishedEvent          : ATTEstablishedEvent_t);
       29 : (loggedOnEvent             : ATTLoggedOnEvent_t);
       30 : (networkReachedEvent       : ATTNetworkReachedEvent_t);
       31 : (originatedEvent           : ATTOriginatedEvent_t);
       32 : (transferredEvent          : ATTTransferredEvent_t);
     //  33 : (routeRequest              : ATTRouteRequestEvent_t);
     //  34 : (routeUsed                 : ATTRouteUsedEvent_t);
     //  35 : (linkStatus                : ATTLinkStatusEvent_t);
     //  36 : (getAPICaps                : ATTGetAPICapsConfEvent_t);
       37 : (serviceInitiated          : ATTServiceInitiatedEvent_t);
       38 : (chargeAdviceEvent         : ATTChargeAdviceEvent_t);
     //  39 : (setBillRate               : ATTSetBillRateConfEvent_t);
     //  40 : (queryUCID                 : ATTQueryUcidConfEvent_t);
       41 : (loggedOffEvent            : ATTLoggedOffEvent_t);
       42 : (consultationCall          : ATTConsultationCallConfEvent_t);
       43 : (conferenceCall            : ATTConferenceCallConfEvent_t);
     //  44 : (makeCall                  : ATTMakeCallConfEvent_t);
       45 : (makePredictiveCall        : ATTMakePredictiveCallConfEvent_t);
     //  46 : (transferCall              : ATTTransferCallConfEvent_t);
     //  47 : (setAdviceOfCharge         : ATTSetAdviceOfChargeConfEvent_t);}
       48 : (setAgentState             : ATTSetAgentStateConfEvent_t);

      //* the following are obsolete a s of protocol version 4 and should not be used */

     //  49 : (v3conferencedEvent        : ATTV3ConferencedEvent_t);
     //  50 : (v3deliveredEvent          : ATTV3DeliveredEvent_t);
     //  51 : (v3establishedEvent        : ATTV3EstablishedEvent_t);
     //  52 : (v3transferredEvent        : ATTV3TransferredEvent_t);
     //  53 : (v3linkStatus              : ATTV3LinkStatusEvent_t);

      //* version 4 events */

     //  54 : (v4queryDeviceInfo         : ATTV4QueryDeviceInfoConfEvent_t);
     //  55 : (v4getAPICaps              : ATTV4GetAPICapsConfEvent_t);
     //  56 : (v4snapshotDevice          : ATTV4SnapshotDeviceConfEvent_t);
     //  57 : (v4conferencedEvent        : ATTV4ConferencedEvent_t);
     //  58 : (v4deliveredEvent          : ATTV4DeliveredEvent_t);
     //  59 : (v4establishedEvent        : ATTV4EstablishedEvent_t);
     //  60 : (v4transferredEvent        : ATTV4TransferredEvent_t);
     //  61 : (v4linkStatus              : ATTV4LinkStatusEvent_t);
     //  62 : (v4routeRequest            : ATTV4RouteRequestEvent_t);
     //  63 : (v4queryAgentState         : ATTV4QueryAgentStateConfEvent_t);
     //  64 : (v4queryDeviceName         : ATTV4QueryDeviceNameConfEvent_t);
     //  65 : (v4monitorStart            : ATTV4MonitorConfEvent_t);
     //  66 : (v4monitorCallStart        : ATTV4MonitorCallConfEvent_t);
     //  67 : (v4networkReachedEvent     : ATTV4NetworkReachedEvent_t);

      //*version 5 events*/

     //  68 : (v5queryAgentState         : ATTV5QueryAgentStateConfEvent_t);
     //  69 : (v5routeRequest            : ATTV5RouteRequestEvent_t);
     //  70 : (v5transferredEvent        : ATTV5TransferredEvent_t);
     //  71 : (v5conferencedEvent        : ATTV5ConferencedEvent_t);
     //  72 : (v5connectionClearedEvent  : ATTV5ConnectionClearedEvent_t);
     //  73 : (v5originatedEvent         : ATTV5OriginatedEvent_t);
     //  74 : (v5establishedEvent        : ATTV5EstablishedEvent_t);
     //  75 : (v5deliveredEvent          : ATTV5DeliveredEvent_t);


      //* events received by the G3PD /*/

     //  76 : (clearConnectionReq        : ATTClearConnection_t);
     //  77 : (consultationCallReq       : ATTConsultationCall_t);
     //  78 : (makeCallReq               : ATTMakeCall_t);
     //  79 : (directAgentCallReq        : ATTDirectAgentCall_t);
     //  80 : (makePredictiveCallReq     : ATTMakePredictiveCall_t);
     //  81 : (supervisorAssistCallReq   : ATTSupervisorAssistCall_t);
     //  82 : (reconnectCallReq          : ATTReconnectCall_t);
     //  83 : (sendDTMFToneReq           : ATTSendDTMFTone_t);
     //  84 : (ssconferenceReq           : ATTSingleStepConferenceCall_t);
     //  85 : (slholdReq                 : ATTSelectiveListeningHold_t);
     //  86 : (slretrieveReq             : ATTSelectiveListeningRetrieve_t);
     //  87 : (setAgentStateReq          : ATTSetAgentState_t);
     //  88 : (queryAgentStateReq        : ATTQueryAgentState_t);
     //  89 : (queryAcdSplitReq          : ATTQueryAcdSplit_t);
     //  90 : (queryAgentLoginReq        : ATTQueryAgentLogin_t);
     //  91 : (queryCallClassifierReq    : ATTQueryCallClassifier_t);
     //  92 : (queryDeviceNameReq        : ATTQueryDeviceName_t);
     //  93 : (queryStationStatusReq     : ATTQueryStationStatus_t);
     //  94 : (queryTodReq               : ATTQueryTod_t);
     //  95 : (queryTgReq                : ATTQueryTg_t);
     //  96 : (queryAgentMeasReq         : ATTQueryAgentMeasurements_t);
     //  97 : (querySplitSkillMeasReq    : ATTQuerySplitSkillMeasurements_t);
     //  98 : (queryTrunkGroupMeasReq    : ATTQueryTrunkGroupMeasurements_t);
     //  99 : (queryVdnMeasReq           : ATTQueryVdnMeasurements_t);
     // 100 : (monitorFilterReq          : ATTMonitorFilter_t);
     // 101 : (monitorStopOnCallReq      : ATTMonitorStopOnCall_t);
     // 102 : (routeSelectReq            : ATTRouteSelect_t);
     // 103 : (sysStatReq                : ATTSysStat_t);
     // 104 : (setBillRateReq            : ATTSetBillRate_t);
     // 105 : (queryUCIDReq              : ATTQueryUcid_t);
     // 106 : (adviceOfChargeReq         : ATTSetAdviceOfCharge_t);

      // private data version 4

     // 107 : (v4sendDTMFToneReq         : ATTV4SendDTMFTone_t);
     // 108 : (v4setAgentStateReq        : ATTV4SetAgentState_t);
     // 109 : (v4monitorFilterReq        : ATTV4MonitorFilter_t);

      // version 5 of private data

     // 110 : (v5setAgentStateReq        : ATTV5SetAgentState_t);
     // 111 : (v5clearConnectionReq      : ATTV5ClearConnection_t);
     // 112 : (v5consultationCallReq     : ATTV5ConsultationCall_t);
     // 113 : (v5makeCallReq             : ATTV5MakeCall_t);
     // 114 : (v5directAgentCallReq      : ATTV5DirectAgentCall_t);
     // 115 : (v5makePredictiveCallReq   : ATTV5MakePredictiveCall_t);
     // 116 : (v5supervisorAssistCallReq : ATTV5SupervisorAssistCall_t);
     // 117 : (v5reconnectCallReq        : ATTV5ReconnectCall_t);
     // 118 : (v5routeSelectReq          : ATTV5RouteSelect_t);
      end;


  ATTEvent_t = record
    eventType : ATTEventType_t;
    u         : TATTEventType;
    heap      : array [0..ATTPRIV_MAX_HEAP - 1] of Char;
    end;

  pATTEvent_t = ^ATTEvent_t;




function attMakeVersionString (requestedVersion: PChar;
  supportedVersion: PChar): TSAPI;stdcall; external ATT_DLL_NAME;


function attV6MakeCall( privateData  : pATTPrivateData_t;
  destRoute : pDeviceID_t; priorityCalling : Boolean;
  userInfo : pATTUserToUserInfo_t) : TSAPI; stdcall; external ATT_DLL_NAME;

procedure initATTPrivate (priv : pPrivateData_t); cdecl; external ATT_DLL_NAME;

function attPrivateData( const privateData : pATTPrivateData_t;
  eventBuffer : pATTEvent_t ) : TSAPI; stdcall; external ATT_DLL_NAME;

function attV6ConsultationCall ( privateData  : pATTPrivateData_t;
  destRoute : pDeviceID_t;  priorityCalling : Boolean;
  userInfo : pATTUserToUserInfo_t): TSAPI; stdcall; external ATT_DLL_NAME;

function attV6ClearConnection( privateData : pATTPrivateData_t;
  dropResource : ATTDropResource_t;
  userInfo : pATTUserToUserInfo_t): TSAPI; stdcall; external ATT_DLL_NAME;

function attQueryAcdSplit( privateData : pATTPrivateData_t;
  device : pDeviceID_t): TSAPI; stdcall; external ATT_DLL_NAME;

function attV6MakePredictiveCall( privateData : pATTPrivateData_t;
  priorityCalling : Boolean; maxRings : SHORT; answerTreat : ATTAnswerTreat_t;
  destRoute : pDeviceID_t;
  userInfo : pATTUserToUserInfo_t): TSAPI; stdcall; external ATT_DLL_NAME;

function attQueryCallClassifier(
  privateData : pATTPrivateData_t): TSAPI; stdcall; external ATT_DLL_NAME;

function attQueryAgentLogin( privateData : pATTPrivateData_t;
  device : pDeviceID_t): TSAPI; stdcall; external ATT_DLL_NAME;

function attV6SetAgentState( privateData : pATTPrivateData_t;
  workMode : ATTWorkMode_t; reasonCode : LongInt;
  enablePending : Boolean) : TSAPI; stdcall; external ATT_DLL_NAME;

function attQueryAgentState( privateData : pATTPrivateData_t;
  const device : pDeviceID_t): TSAPI; stdcall; external ATT_DLL_NAME;

function attQueryTrunkGroup( privateData : pATTPrivateData_t;
  const device : pDeviceID_t): TSAPI; stdcall; external ATT_DLL_NAME;

function attQueryDeviceName( privateData : pATTPrivateData_t;
  const device : pDeviceID_t): TSAPI; stdcall; external ATT_DLL_NAME;

implementation

end.

