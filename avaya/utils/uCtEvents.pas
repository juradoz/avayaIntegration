{******************************************************************************
                                Autor: Daniel Jurado
                                 jurado@gmail.com
******************************************************************************}
unit uCtEvents;

interface

uses uCtTypes, uCSTADefs_h, uCSTA_h, uACSDefs_h, uACS_h, uATTPDefs_h,
  uATTPriv_h, Windows;

  //////////////////////////////////
  //TCtConnector events prototypes//
  //////////////////////////////////

type
{ Class-independent events }
  { Generic event, with InvokeID only }
  TNullConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID ) of object;

  { Error event }
  TErrorEvent = procedure( Sender : TObject; Msg : ShortString ) of object;

  { Generic event to inform any CtEvent received }
  TCtEvent = procedure( Sender : TObject; Event : CSTAEvent_t; PrivateData : ATTPrivateData_t ) of object;

{ Events presents on TStreamerCtConector }
  { Confirmation to acsOpenStream }
  TACSOpenStreamConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    apiVer, libVer, tsrvVer, drvrVer : uACSDefs_h.Version_t ) of object;

  { Confirmation to acsCloseStream }
  TACSCloseStreamConfEvent = TNullConfEvent;

  { Failure confirmation to ACS (stream) requests }
  TACSUniversalFailureConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID; error : ACSUniversalFailure_t ) of object;

  { Failure confirmation to CSTA requests }
  TCSTAUniversalFailureConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID; error : CSTAUniversalFailure_t ) of object;

{ Events presents in TMonitorServicesCTConector }
  { Confirmation to cstaMonitorCall, cstaMonitorDevice or cstaMonitorCallsViaDevice }
  TCSTAMonitorConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    monitorCrossRefID : CSTAMonitorCrossRefID_t;
    monitorFilter     : CSTAMonitorFilter_t ) of object;

  { Confirmation to cstaMonitorStop }
  TCSTAMonitorStopConfEvent = TNullConfEvent;

  { Notifies unexpected monitor termination }
  TCSTAMonitorEndedEvent = procedure( Sender : TObject;
    monitorCrossRefId : CSTAMonitorCrossRefID_t;
    cause : CSTAEventCause_t ) of object;

  { Notifies the off-hook event from a monitored statin (dialtone) }
  TCSTAServiceInitiatedEvent = procedure( Sender : TObject;
    monitorCrossRefId : CSTAMonitorCrossRefID_t;
    initiatedConnection : ConnectionID_t;
    localConnectionInfo : LocalConnectionState_t;
    cause : CSTAEventCause_t;
    ucid : ATTUCID_t ) of object;

  { Notifies that a station has originated a call }
  TCSTAOriginatedEvent = procedure( Sender : TObject;
    monitorCrossRefId   : CSTAMonitorCrossRefID_t;
    originatedConnection : ConnectionID_t;
    callingDevice       : SubjectDeviceID_t;
    calledDevice        : CalledDeviceID_t;
    localConnectionInfo : LocalConnectionState_t;
    cause               : CSTAEventCause_t;    logicalAgent        : DeviceID_t;
    { NEXT UNSUPPORTED. ALWAYS EMPTY }
    userInfo            : ATTUserToUserInfo_t ) of object;

  { Notifies that a call was delivered to an ACD (for distribution) or a
  station (ringing) }
  TCSTADeliveredEvent = procedure( Sender : TObject;
    monitorCrossRefId     : CSTAMonitorCrossRefID_t;
    connection            : ConnectionID_t;
    alertingDevice        : SubjectDeviceID_t;
    callingDevice         : CallingDeviceID_t;
    calledDevice          : CalledDeviceID_t ;
    lastRedirectionDevice : RedirectionDeviceID_t;
    localConnectionInfo   : LocalConnectionState_t;
    cause                 : CSTAEventCause_t;
    deliveredType         : ATTDeliveredType_t;
    trunkGroup            : DeviceID_t;
    trunkMember           : DeviceID_t;
    split                 : DeviceID_t;
    lookaheadInfo         : ATTLookaheadInfo_t;
    userEnteredCode       : ATTUserEnteredCode_t;
    userInfo              : ATTUserToUserInfo_t;
    reason                : ATTReasonCode_t;
    originalCallInfo      : ATTOriginalCallInfo_t;
    distributingDevice    : CalledDeviceID_t;
    ucid                  : ATTUCID_t;
    callOriginatorInfo    : ATTCallOriginatorInfo_t;
    flexibleBilling       : Boolean ) of object;

  { Notifies that a call was established }
  TCSTAEstablishedEvent = procedure( Sender : TObject;
    monitorCrossRefId     : CSTAMonitorCrossRefID_t;
    establishedConnection : ConnectionID_t;
    answeringDevice       : SubjectDeviceID_t;
    callingDevice         : CallingDeviceID_t;
    calledDevice          : CalledDeviceID_t;
    lastRedirectionDevice : RedirectionDeviceID_t;
    localConnectionInfo   : LocalConnectionState_t;
    cause                 : CSTAEventCause_t;
    trunkGroup            : DeviceID_t;
    trunkMember           : DeviceID_t;
    split                 : DeviceID_t;
    lookaheadInfo         : ATTLookaheadInfo_t;
    userEnteredCode       : ATTUserEnteredCode_t;
    userInfo              : ATTUserToUserInfo_t;
    reason                : ATTReasonCode_t;
    originalCallInfo      : ATTOriginalCallInfo_t;
    distributingDevice    : CalledDeviceID_t;
    ucid                  : ATTUCID_t;
    callOriginatorInfo    : ATTCallOriginatorInfo_t;
    flexibleBilling       : Boolean ) of object;

  { Usually received when a call was delivered to a trunk and got a positive ack
  from the PSTN }
  TCSTANetworkReachedEvent = procedure( Sender : TObject;
    monitorCrossRefId     : CSTAMonitorCrossRefID_t;
    connection            : ConnectionID_t;
    trunkUsed             : SubjectDeviceID_t;
    calledDevice          : CalledDeviceID_t;
    localConnectionInfo   : LocalConnectionState_t;
    cause                 : CSTAEventCause_t;
    progressLocation      : ATTProgressLocation_t;
    progressDescription   : ATTProgressDescription_t;
    trunkGroup            : DeviceID_t;
    trunkMember           : DeviceID_t ) of object;

  { Notifies that a call was cleared }
  TCSTACallClearedEvent = procedure( Sender : TObject;
    monitorCrossRefId     : CSTAMonitorCrossRefID_t;
    clearedCall           : ConnectionID_t;
    localConnectionInfo   : LocalConnectionState_t;
    cause                 : CSTAEventCause_t;
    reason                : ATTReasonCode_t ) of object;

  { Notifies that a connection between two devices was cleared }
  TCSTAConnectionClearedEvent = procedure( Sender : TObject;
    monitorCrossRefId     : CSTAMonitorCrossRefID_t;
    droppedConnection     : ConnectionID_t;
    releasingDevice       : SubjectDeviceID_t;
    localConnectionInfo   : LocalConnectionState_t;
    cause                 : CSTAEventCause_t;
    userInfo              : ATTUserToUserInfo_t ) of object;

  { Notifies that a call was conferenced with other calls }
  TCSTAConferencedEvent = procedure( Sender : TObject;
    monitorCrossRefId     : CSTAMonitorCrossRefID_t;
    primaryOldCall        : ConnectionID_t;
    secondaryOldCall      : ConnectionID_t;
    confController        : SubjectDeviceID_t;
    addedParty            : SubjectDeviceID_t;
    conferenceConnections : ConnectionList_t;
    localConnectionInfo   : LocalConnectionState_t;
    cause                 : CSTAEventCause_t;
    originalCallInfo      : ATTOriginalCallInfo_t;
    distributingDevice    : CalledDeviceID_t;
    ucid                  : ATTUCID_t;
    trunkList             : ATTTrunkList_t ) of object;

  { Notifies that a ringing call was diverted to other device }
  TCSTADivertedEvent = procedure( Sender : TObject;
    monitorCrossRefId     : CSTAMonitorCrossRefID_t;
    connection            : ConnectionID_t;
    divertingDevice       : SubjectDeviceID_t;
    newDestination        : CalledDeviceID_t;
    localConnectionInfo   : LocalConnectionState_t;
    cause                 : CSTAEventCause_t ) of object;

  { Notifies a failure. Check documentation. }
  TCSTAFailedEvent = procedure( Sender : TObject;
    monitorCrossRefId     : CSTAMonitorCrossRefID_t;
    failedConnection      : ConnectionID_t;
    failingDevice         : SubjectDeviceID_t;
    calledDevice          : CalledDeviceID_t;
    localConnectionInfo   : LocalConnectionState_t;
    cause                 : CSTAEventCause_t ) of object;

  { Notifies that the call was held. }
  TCSTAHeldEvent = procedure( Sender : TObject;
    monitorCrossRefId     : CSTAMonitorCrossRefID_t;
    heldConnection        : ConnectionID_t;
    holdingDevice         : SubjectDeviceID_t;
    localConnectionInfo   : LocalConnectionState_t;
    cause                 : CSTAEventCause_t ) of object;

  { Notifies that the call was queued on an ACDSplit }
  TCSTAQueuedEvent = procedure( Sender : TObject;
    monitorCrossRefId     : CSTAMonitorCrossRefID_t;
    queuedConnection      : ConnectionID_t;
    queue                 : SubjectDeviceID_t;
    callingDevice         : CallingDeviceID_t;
    calledDevice          : CalledDeviceID_t;
    lastRedirectionDevice : RedirectionDeviceID_t;
    numberQueued          : short;
    localConnectionInfo   : LocalConnectionState_t;
    cause                 : CSTAEventCause_t ) of object;

  { Notifies that the call was retrieved and is active again }
  TCSTARetrievedEvent = procedure( Sender : TObject;
    monitorCrossRefId     : CSTAMonitorCrossRefID_t;
    retrievedConnection   : ConnectionID_t;
    retrievingDevice      : SubjectDeviceID_t;
    localConnectionInfo   : LocalConnectionState_t;
    cause                 : CSTAEventCause_t ) of object;

  { Notifies that the call was transferred }
  TCSTATransferredEvent = procedure( Sender : TObject;
    monitorCrossRefId      : CSTAMonitorCrossRefID_t;
    primaryOldCall         : ConnectionID_t;
    secondaryOldCall       : ConnectionID_t;
    transferringDevice     : SubjectDeviceID_t;
    transferredDevice      : SubjectDeviceID_t;
    transferredConnections : ConnectionList_t;
    localConnectionInfo    : LocalConnectionState_t;
    cause                  : CSTAEventCause_t;
    originalCallInfo       : ATTOriginalCallInfo_t;
    distributingDevice     : CalledDeviceID_t;
    ucid                   : ATTUCID_t;
    trunkList              : ATTTrunkList_t ) of object;

  { Dunno. Check documentation. }
  TCSTACallInformationEvent = procedure( Sender : TObject;
    monitorCrossRefId      : CSTAMonitorCrossRefID_t;
    connection             : ConnectionID_t;
    device                 : SubjectDeviceID_t;
    accountInfo            : AccountInfo_t;
    authorizationCode      : AuthCode_t ) of object;

  { Dunno. Check documentation. }
  TCSTADoNotDisturbEvent = procedure( Sender : TObject;
    monitorCrossRefId      : CSTAMonitorCrossRefID_t;
    device                 : SubjectDeviceID_t;
    doNotDisturbOn         : Boolean ) of object;

  { Dunno. Check documentation. }
  TCSTAForwardingEvent = procedure( Sender : TObject;
    monitorCrossRefId      : CSTAMonitorCrossRefID_t;
    device                 : SubjectDeviceID_t;
    forwardingInformation  : ForwardingInfo_t ) of object;

  { Dunno. Check documentation. }
  TCSTAMessageWaitingEvent = procedure( Sender : TObject;
    monitorCrossRefId      : CSTAMonitorCrossRefID_t;
    deviceForMessage       : CalledDeviceID_t;
    invokingDevice         : SubjectDeviceID_t;
    messageWaitingOn       : Boolean ) of object;

  { Notifies that monitored agent logged on ACDSplit }
  TCSTALoggedOnEvent = procedure( Sender : TObject;
    monitorCrossRefId      : CSTAMonitorCrossRefID_t;
    agentDevice            : SubjectDeviceID_t;
    agentID                : AgentID_t;
    agentGroup             : AgentGroup_t;
    password               : AgentPassword_t;
    workMode               : ATTWorkMode_t ) of object;

  { Notifies that monitored agent logged off ACDSplit }
  TCSTALoggedOffEvent = procedure( Sender : TObject;
    monitorCrossRefId      : CSTAMonitorCrossRefID_t;
    agentDevice            : SubjectDeviceID_t;
    agentID                : AgentID_t;
    agentGroup             : AgentGroup_t;
    reasonCode             : Integer ) of object;

  { Notifies that monitored agent changed his status on ACDSplit }
  TCSTAAgentStatusChangeEvent = procedure( Sender : TObject;
    monitorCrossRefId      : CSTAMonitorCrossRefID_t;
    agentDevice            : SubjectDeviceID_t;
    agentID                : AgentID_t ) of object;

  { Notifies that agent entered NotReady state }
  TCSTANotReadyEvent = TCSTAAgentStatusChangeEvent;

  { Notifies that agent entered Ready state }
  TCSTAReadyEvent = TCSTAAgentStatusChangeEvent;

  { Notifies that agent entered WorkNotReady state }
  TCSTAWorkNotReadyEvent = TCSTAAgentStatusChangeEvent;

  { Notifies that agent entered WorkReady state }
  TCSTAWorkReadyEvent = TCSTAAgentStatusChangeEvent;

  { Dunno. Check documentation. }
  TCSTAServiceStatusChange = procedure( Sender : TObject;
    monitorCrossRefId      : CSTAMonitorCrossRefID_t;
    device                 : DeviceID_t;
    cause                  : CSTAEventCause_t ) of object;

  { Notifies that CTServer is back in service }
  TCSTABackInServiceEvent = TCSTAServiceStatusChange;

  { Notifies that CTServer is out of service }
  TCSTAOutOfServiceEvent = TCSTAServiceStatusChange;

  { Dunno. Check documentation. }
  TCSTAPrivateStatusEvent = procedure( Sender : TObject;
    monitorCrossRefId      : CSTAMonitorCrossRefID_t;
    connection             : ConnectionID_t;
    calledDevice           : DeviceID_t;
    chargingDevice         : DeviceID_t;
    trunkGroup             : DeviceID_t;
    trunkMember            : DeviceID_t;
    chargeType             : ATTChargeType_t;
    charge                 : LongInt;
    error                  : ATTChargeError_t ) of object;

{ Events presents in TBasicCallControlCtConector }
  { Confirmation to cstaAlternateCall }
  TCSTAAlternateCallConfEvent = TNullConfEvent;

  { Confirmation to cstaAnswerCall }
  TCSTAAnswerCallConfEvent    = TNullConfEvent;

  { Confirmation to cstaConferenceCall }
  TCSTAConferenceCallConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    newCall : ConnectionID_t; connList : ConnectionList_t; ucid : ATTUCID_t ) of object;

  { Confirmation to cstaConsultationCall }
  TCSTAConsultationCallConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    newCall : ConnectionID_t; ucid : ATTUCID_t ) of object;

  { Confirmation to cstaDeflectCall }
  TCSTADeflectCallConfEvent = TNullConfEvent;

  { Confirmation to cstaClearCall }
  TCSTAClearCallConfEvent = TNullConfEvent;

  { Confirmation to cstaClearConnection }
  TCSTAClearConnectionConfEvent = TNullConfEvent;

  { Confirmation to cstaGroupPickupCall }
  TCSTAGroupPickupCallConfEvent = TNullConfEvent;

  { Confirmation to cstaHoldCall }
  TCSTAHoldCallConfEvent = TNullConfEvent;

  { Confirmation to cstaMakeCall }
  TCSTAMakeCallConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    newCall : ConnectionID_t; ucid : ATTUCID_t ) of object;

  { Confirmation to cstaMakePredicitiveCall }
  TCSTAMakePredictiveCallConfEvent = procedure( Sender : TObject;
    InvokeID : TInvokeID; newCall : ConnectionID_t; ucid : ATTUCID_t ) of object;

  { Confirmation to cstaRetrieveCall }
  TCSTARetrieveCallConfEvent = TNullConfEvent;

  { Confirmation to cstaTransferCall }
  TCSTATransferCallConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    newCall : ConnectionID_t; connList : ConnectionList_t; ucid : ATTUCID_t ) of object;

{ Events presents in TTelephonySuplementaryCtConector }
  { Confirmation to cstaSetAgentState }
  TCSTASetAgentStateConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    isPending : Boolean ) of object;

  { Confirmation to cstaQueryAgentState }
  TCSTAQueryAgentStateConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    agentState        : AgentState_t;
    workMode          : ATTWorkMode_t;
    talkState         : ATTTalkState_t;
    reasonCode        : Integer;
    pendingWorkMode   : ATTWorkMode_t;
    pendingReasonCode : Integer ) of object;

  { Confirmation to cstaQueryDeviceInfo }
  TCSTAQueryDeviceInfoConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    device           : DeviceID_t;
    deviceType       : DeviceType_t;
    deviceClass      : DeviceClass_t;
    extensionClass   : ATTExtensionClass_t;
    associatedClass  : ATTExtensionClass_t;
    associatedDevice : DeviceID_t ) of object;

{ Events presents in TSnapShotServicesCtConector }
  { Confirmation to cstaSnapshotDevice }
  TCSTASnapshotDeviceConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    snapshotData               : CSTASnapshotDeviceData_t ) of object;

  { Confirmation to cstaSnapshotCall }
  TCSTASnapshotCallConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    snapshotData               : CSTASnapshotCallData_t ) of object;

{ Events presents in TEscapeServicesCtConector }
  { Confirmation to cstaEscapeSvc }
  TCSTAEscapeSvcConfEvent = TNullConfEvent;

  { Confirmation to attQueryAcdSplit }
  TATTQueryAcdSplitConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    availableAgents : short;
    callsInQueue    : short;
    agentsLoggedIn  : short ) of object;

  { Confirmation to attQueryAgentLogin }
  TATTQueryAgentLoginConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    privEventCrossRefID : ATTPrivEventCrossRefID_t ) of object;

  { Confirmation to attQueryAgentLogin }
  TATTQueryAgentLoginResp = procedure( Sender : TObject;
    privEventCrossRefID   : ATTPrivEventCrossRefID_t;
    devices : array of ShortString ) of object;

  { Confirmation to attQueryAgentLogin }
  TATTQueryAgentLoginEnd = procedure( Sender : TObject;
    privEventCrossRefID   : ATTPrivEventCrossRefID_t ) of object;

  { Private event from cstaEscapeSvc }
  TCSTAPrivateEvent = procedure( Sender : TObject;
    privateData   : ATTPrivateData_t ) of object;

  { Confirmation to attQueryTg }
  TATTQueryTgConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    idleTrunks         : short;
    usedTrunks         : short ) of object;

  { Confirmation to attQueryCallClassifier }
  TATTQueryCallClassifierConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    numAvailPorts      : short;
    numInUsePorts      : short ) of object;

  TATTQueryDeviceNameConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
      deviceType : ATTDeviceType_t;
      device     : DeviceID_t;
      name       : DeviceID_t;
      uname      : ATTUnicodeDeviceID_t) of object;

  TCSTARouteRegisterReqConfEvent = procedure(Sender : TObject; InvokeID : TInvokeID;
    routeRegisterReqId : RouteRegisterReqID_t) of object;

  TCSTARouteRegisterCancelConfEvent = procedure(Sender : TObject; InvokeID : TInvokeID;
    routeRegisterReqId : RouteRegisterReqID_t) of object;

implementation

end.
