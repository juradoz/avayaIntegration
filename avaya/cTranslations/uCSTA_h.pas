{******************************************************************************
                                Autor: Daniel Jurado
                                 jurado@gmail.com
******************************************************************************}
unit uCSTA_h;

interface

uses
  uCSTADefs_h,
  uTsplatfm_h,
  uACS_h;

const

  //* defines for CSTA event classes */

  CSTAREQUEST      = 3;
  CSTAUNSOLICITED  = 4;
  CSTACONFIRMATION = 5;
  CSTAEVENTREPORT_ = 6;

  CSTA_MAX_HEAP	= 1024;

type
  CSTARequestEvent = record
    case invokeID: InvokeID_t of
      0: (routeRequest    : CSTARouteRequestEvent_t);
      1: (routeRequestExt : CSTARouteRequestExtEvent_t);
      2: (reRouteRequest  : CSTAReRouteRequest_t);
      3: (escapeSvcReqeust: CSTAEscapeSvcReqEvent_t);
      4: (sysStatRequest  : CSTASysStatReqEvent_t);
    end;

  CSTAUnsolicitedEvent = record
    case monitorCrossRefId : CSTAMonitorCrossRefID_t of
      0 : (callCleared       : CSTACallClearedEvent_t);
      1 : (conferenced       : CSTAConferencedEvent_t);
      2 : (connectionCleared : CSTAConnectionClearedEvent_t);
      3 : (delivered         : CSTADeliveredEvent_t);
      4 : (diverted          : CSTADivertedEvent_t);
      5 : (established       : CSTAEstablishedEvent_t);
      6 : (failed            : CSTAFailedEvent_t);
      7 : (held              : CSTAHeldEvent_t);
      8 : (networkReached    : CSTANetworkReachedEvent_t);
      9 : (originated        : CSTAOriginatedEvent_t);
      10: (queued            : CSTAQueuedEvent_t);
      11: (retrieved         : CSTARetrievedEvent_t);
      12: (serviceInitiated  : CSTAServiceInitiatedEvent_t);
      13: (transferred       : CSTATransferredEvent_t);
      14: (callInformation   : CSTACallInformationEvent_t);
      15: (doNotDisturb      : CSTADoNotDisturbEvent_t);
      16: (forwarding        : CSTAForwardingEvent_t);
      17: (messageWaiting    : CSTAMessageWaitingEvent_t);
      18: (loggedOn          : CSTALoggedOnEvent_t);
      19: (loggedOff         : CSTALoggedOffEvent_t);
      20: (notReady          : CSTANotReadyEvent_t);
      21: (ready             : CSTAReadyEvent_t);
      22: (workNotReady      : CSTAWorkNotReadyEvent_t);
      23: (workReady         : CSTAWorkReadyEvent_t);
      24: (backInService     : CSTABackInServiceEvent_t);
      25: (outOfService      : CSTAOutOfServiceEvent_t);
      26: (privateStatus     : CSTAPrivateStatusEvent_t);
      27: (monitorEnded      : CSTAMonitorEndedEvent_t);
    end;

  CSTAConfirmationEvent = record
    case invokeID: InvokeID_t of
      0 : (alternateCall       : CSTAAlternateCallConfEvent_t);
      1 : (answerCall          : CSTAAnswerCallConfEvent_t);
      2 : (callCompletion      : CSTACallCompletionConfEvent_t);
      3 : (clearCall           : CSTAClearCallConfEvent_t);
      4 : (clearConnection     : CSTAClearConnectionConfEvent_t);
      5 : (conferenceCall      : CSTAConferenceCallConfEvent_t);
      6 : (consultationCall    : CSTAConsultationCallConfEvent_t);
      7 : (deflectCall         : CSTADeflectCallConfEvent_t);
      8 : (pickupCall          : CSTAPickupCallConfEvent_t);
      9 : (groupPickupCall     : CSTAGroupPickupCallConfEvent_t);
      10 : (holdCall            : CSTAHoldCallConfEvent_t);
      11 : (makeCall            : CSTAMakeCallConfEvent_t);
      12 : (makePredictiveCall  : CSTAMakePredictiveCallConfEvent_t);
      13 : (queryMwi            : CSTAQueryMwiConfEvent_t);
      14 : (queryDnd            : CSTAQueryDndConfEvent_t);
      15 : (queryFwd            : CSTAQueryFwdConfEvent_t);
      16 : (queryAgentState     : CSTAQueryAgentStateConfEvent_t);
      17 : (queryLastNumber     : CSTAQueryLastNumberConfEvent_t);
      18 : (queryDeviceInfo     : CSTAQueryDeviceInfoConfEvent_t);
      19 : (reconnectCall       : CSTAReconnectCallConfEvent_t);
      20 : (retrieveCall        : CSTARetrieveCallConfEvent_t);
      21 : (setMwi              : CSTASetMwiConfEvent_t);
      22 : (setDnd              : CSTASetDndConfEvent_t);
      23 : (setFwd              : CSTASetFwdConfEvent_t);
      24 : (setAgentState       : CSTASetAgentStateConfEvent_t);
      25 : (transferCall        : CSTATransferCallConfEvent_t);
      26 : (universalFailure    : CSTAUniversalFailureConfEvent_t);
      27 : (monitorStart        : CSTAMonitorConfEvent_t);
      28 : (changeMonitorFilter : CSTAChangeMonitorFilterConfEvent_t);
      29 : (monitorStop         : CSTAMonitorStopConfEvent_t);
      30 : (snapshotDevice      : CSTASnapshotDeviceConfEvent_t);
      31 : (snapshotCall        : CSTASnapshotCallConfEvent_t);
      32 : (routeRegister       : CSTARouteRegisterReqConfEvent_t);
      33 : (routeCancel         : CSTARouteRegisterCancelConfEvent_t);
      34 : (escapeService       : CSTAEscapeSvcConfEvent_t);
      35 : (sysStatReq          : CSTASysStatReqConfEvent_t);
      36 : (sysStatStart        : CSTASysStatStartConfEvent_t);
      37 : (sysStatStop         : CSTASysStatStopConfEvent_t);
      38 : (changeSysStatFilter : CSTAChangeSysStatFilterConfEvent_t);
      39 : (getAPICaps          : CSTAGetAPICapsConfEvent_t);
      40 : (getDeviceList       : CSTAGetDeviceListConfEvent_t);
      41 : (queryCallMonitor    : CSTAQueryCallMonitorConfEvent_t);
    end;

  CSTAEventReport = record
    case Integer of
      0: (registerAbort : CSTARouteRegisterAbortEvent_t);
      1: (routeUsed     : CSTARouteUsedEvent_t);
      2: (routeUsedExt  : CSTARouteUsedExtEvent_t);
      3: (routeEnd      : CSTARouteEndEvent_t);
      4: (privateEvent  : CSTAPrivateEvent_t);
      5: (sysStat       : CSTASysStatEvent_t);
      6: (sysStatEnded  : CSTASysStatEndedEvent_t);
    end;

  event = record
    case Integer of
      0: (acsUnsolicited   : ACSUnsolicitedEvent);
      1: (acsConfirmation  : ACSConfirmationEvent);
      2: (cstaRequest      : CSTARequestEvent);
      3: (cstaUnsolicited  : CSTAUnsolicitedEvent);
      4: (cstaConfirmation : CSTAConfirmationEvent);
      5: (cstaEventReport  : CSTAEventReport);
    end;


  pCSTAEvent_t = ^CSTAEvent_t;
  CSTAEvent_t = record
    eventHeader : ACSEventHeader_t;
    _event      : event;
    heap : array [0..CSTA_MAX_HEAP - 1] of Char;
    end;

function cstaMakeCall( acsHandle : ACSHandle_t ; invokeID : InvokeID_t;
  const callingDevice : pDeviceID_t; const calledDevice : pDeviceID_t;
  const priv : pPrivateData_t): TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaRetrieveCall( acsHandle : ACSHandle_t; invokeID : InvokeID_t;
  const heldCall : pConnectionID_t;
  const priv : pPrivateData_t) : TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaTransferCall( acsHandle : ACSHandle_t ; invokeID : InvokeID_t;
  const heldCall : pConnectionID_t; const activeCall : pConnectionID_t;
  const priv : pPrivateData_t) : TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaClearCall(	acsHandle : ACSHandle_t; invokeID : InvokeID_t;
  const call : pConnectionID_t;
  const privateData : pPrivateData_t) : TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaClearConnection(	acsHandle : ACSHandle_t; invokeID : InvokeID_t;
  const call : pConnectionID_t;
  const privateData : pPrivateData_t) : TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaMonitorDevice( acsHandle : ACSHandle_t; invokeID : InvokeID_t;
  const deviceID : pDeviceID_t; const monitorFilter : pCSTAMonitorFilter_t;
  const privateData   : pPrivateData_t): TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaMonitorCall( acsHandle : ACSHandle_t; invokeID : InvokeID_t;
  const call : pConnectionID_t; const monitorFilter : pCSTAMonitorFilter_t;
  const privateData : pPrivateData_t): TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaMonitorStop( acsHandle : ACSHandle_t; invokeID : InvokeID_t;
  monitorCrossRefID : CSTAMonitorCrossRefID_t;
  const privateData : pPrivateData_t): TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaHoldCall( acsHandle : ACSHandle_t; invokeID : InvokeID_t;
  const activeCall : pConnectionID_t; reservation : Boolean;
  const privateData : pPrivateData_t): TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaSnapshotCallReq(acsHandle : ACSHandle_t; invokeID : InvokeID_t;
  snapshotObj: pConnectionID_t;
  const privateData: pPrivateData_t): TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaSnapshotDeviceReq(acsHandle : ACSHandle_t; invokeID : InvokeID_t;
  snapshotObj: pDeviceID_t;
  const privateData: pPrivateData_t): TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaConsultationCall( acsHandle : ACSHandle_t; invokeID : InvokeID_t;
  const activeCall : pConnectionID_t; const calledDevice : pDeviceID_t;
  const privateData: pPrivateData_t): TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaConferenceCall( acsHandle : ACSHandle_t; invokeID : InvokeID_t;
  const heldCall : pConnectionID_t; const activeCall : pConnectionID_t;
  const privateData: pPrivateData_t): TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaAnswerCall( acsHandle : ACSHandle_t;invokeID : InvokeID_t;
  const alertingCall : pConnectionID_t;
  const privateData: pPrivateData_t): TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaDeflectCall( acsHandle : ACSHandle_t; invokeID : InvokeID_t;
  const deflectCall : pConnectionID_t; const calledDevice : pDeviceID_t;
  const privateData: pPrivateData_t): TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaAlternateCall( acsHandle : ACSHandle_t; invokeID   : InvokeID_t;
  const activeCall : pConnectionID_t; const otherCall : pConnectionID_t;
  const privateData: pPrivateData_t): TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaEscapeService( acsHandle : ACSHandle_t; invokeID : InvokeID_t;
  const privateData: pPrivateData_t): TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaMakePredictiveCall( acsHandle : ACSHandle_t; invokeID : InvokeID_t;
  const callingDevice : pDeviceID_t; const calledDevice   : pDeviceID_t;
  allocationState : AllocationState_t;
  const privateData: pPrivateData_t): TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaQueryAgentState( acsHandle : ACSHandle_t; invokeID : InvokeID_t;
  const device : pDeviceID_t;
  const privateData: pPrivateData_t): TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaSetAgentState( acsHandle : ACSHandle_t; invokeID : InvokeID_t;
  const device : pDeviceID_t; agentMode : AgentMode_t;
  const agentID : pAgentID_t; const agentGroup : pAgentGroup_t;
  const agentPassword : pAgentPassword_t;
  const privateData: pPrivateData_t): TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaGroupPickupCall( acsHandle : ACSHandle_t; invokeID : InvokeID_t;
  deflectCall  : pConnectionID_t; pickupDevice : pDeviceID_t;
  const privateData  : pPrivateData_t): TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaMonitorCallsViaDevice( acsHandle : ACSHandle_t;
  invokeID : InvokeID_t; const device : pDeviceID_t;
  const monitorFilter : pCSTAMonitorFilter_t;
  const privateData : pPrivateData_t): TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaQueryDeviceInfo ( acsHandle : ACSHandle_t; invokeID : InvokeID_t;
  const device : pDeviceID_t;
  const privateData   : pPrivateData_t): TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaRouteRegisterReq( acsHandle : ACSHandle_t; invokeID : InvokeID_t;
  const routingDevice : pDeviceID_t;
  const privateData   : pPrivateData_t ) : TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaRouteRegisterCancel( acsHandle : ACSHandle_t; invokeID : InvokeID_t;
  const routeRegisterReqID : RouteRegisterReqID_t;
  const privateData   : pPrivateData_t ) : TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaRouteSelectInv( acsHandle : ACSHandle_t; invokeID : InvokeID_t;
  const routeRegisterReqID : RouteRegisterReqID_t;
  const routingCrossRefID : RoutingCrossRefID_t;
  const routeSelected : pDeviceID_t;
  const remainRetry : RetryValue_t;
  const setupInformation : pSetUpValues_t;
  const routeUsedReq : Boolean;
  const privateData : pPrivateData_t) : TSAPI; stdcall; external CSTA_DLL_NAME;

function cstaRouteEndInv( acsHandle : ACSHandle_t; invokeID : InvokeID_t;
  const routeRegisterReqID : RouteRegisterReqID_t;
  const routingCrossRefID : RoutingCrossRefID_t;
  const errorValue : CSTAUniversalFailure_t;
  const privateData : pPrivateData_t) : TSAPI; stdcall; external CSTA_DLL_NAME;

implementation

end.
