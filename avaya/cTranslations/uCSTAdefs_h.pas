{******************************************************************************
                                Autor: Daniel Jurado
                                 jurado@gmail.com
******************************************************************************}
unit uCSTADefs_h;

interface

uses
  uTsplatfm_h;

{$Z4}

const
  CSTA_ALTERNATE_CALL              =   1;
  CSTA_ALTERNATE_CALL_CONF         =   2;
  CSTA_ANSWER_CALL                 =   3;
  CSTA_ANSWER_CALL_CONF            =   4;
  CSTA_CALL_COMPLETION             =   5;
  CSTA_CALL_COMPLETION_CONF        =   6;
  CSTA_CLEAR_CALL                  =   7;
  CSTA_CLEAR_CALL_CONF             =   8;
  CSTA_CLEAR_CONNECTION            =   9;
  CSTA_CLEAR_CONNECTION_CONF       =  10;
  CSTA_CONFERENCE_CALL             =  11;
  CSTA_CONFERENCE_CALL_CONF        =  12;
  CSTA_CONSULTATION_CALL           =  13;
  CSTA_CONSULTATION_CALL_CONF      =  14;
  CSTA_DEFLECT_CALL                =  15;
  CSTA_DEFLECT_CALL_CONF           =  16;
  CSTA_PICKUP_CALL                 =  17;
  CSTA_PICKUP_CALL_CONF            =  18;
  CSTA_GROUP_PICKUP_CALL           =  19;
  CSTA_GROUP_PICKUP_CALL_CONF      =  20;
  CSTA_HOLD_CALL                   =  21;
  CSTA_HOLD_CALL_CONF              =  22;
  CSTA_MAKE_CALL                   =  23;
  CSTA_MAKE_CALL_CONF              =  24;
  CSTA_MAKE_PREDICTIVE_CALL        =  25;
  CSTA_MAKE_PREDICTIVE_CALL_CONF   =  26;
  CSTA_QUERY_MWI                   =  27;
  CSTA_QUERY_MWI_CONF              =  28;
  CSTA_QUERY_DND                   =  29;
  CSTA_QUERY_DND_CONF              =  30;
  CSTA_QUERY_FWD                   =  31;
  CSTA_QUERY_FWD_CONF              =  32;
  CSTA_QUERY_AGENT_STATE           =  33;
  CSTA_QUERY_AGENT_STATE_CONF      =  34;
  CSTA_QUERY_LAST_NUMBER           =  35;
  CSTA_QUERY_LAST_NUMBER_CONF      =  36;
  CSTA_QUERY_DEVICE_INFO           =  37;
  CSTA_QUERY_DEVICE_INFO_CONF      =  38;
  CSTA_RECONNECT_CALL              =  39;
  CSTA_RECONNECT_CALL_CONF         =  40;
  CSTA_RETRIEVE_CALL               =  41;
  CSTA_RETRIEVE_CALL_CONF          =  42;
  CSTA_SET_MWI                     =  43;
  CSTA_SET_MWI_CONF                =  44;
  CSTA_SET_DND                     =  45;
  CSTA_SET_DND_CONF                =  46;
  CSTA_SET_FWD                     =  47;
  CSTA_SET_FWD_CONF                =  48;
  CSTA_SET_AGENT_STATE             =  49;
  CSTA_SET_AGENT_STATE_CONF        =  50;
  CSTA_TRANSFER_CALL               =  51;
  CSTA_TRANSFER_CALL_CONF          =  52;
  CSTA_UNIVERSAL_FAILURE_CONF      =  53;
  CSTA_CALL_CLEARED                =  54;
  CSTA_CONFERENCED                 =  55;
  CSTA_CONNECTION_CLEARED          =  56;
  CSTA_DELIVERED                   =  57;
  CSTA_DIVERTED                    =  58;
  CSTA_ESTABLISHED                 =  59;
  CSTA_FAILED                      =  60;
  CSTA_HELD                        =  61;
  CSTA_NETWORK_REACHED             =  62;
  CSTA_ORIGINATED                  =  63;
  CSTA_QUEUED                      =  64;
  CSTA_RETRIEVED                   =  65;
  CSTA_SERVICE_INITIATED           =  66;
  CSTA_TRANSFERRED                 =  67;
  CSTA_CALL_INFORMATION            =  68;
  CSTA_DO_NOT_DISTURB              =  69;
  CSTA_FORWARDING                  =  70;
  CSTA_MESSAGE_WAITING             =  71;
  CSTA_LOGGED_ON                   =  72;
  CSTA_LOGGED_OFF                  =  73;
  CSTA_NOT_READY                   =  74;
  CSTA_READY                       =  75;
  CSTA_WORK_NOT_READY              =  76;
  CSTA_WORK_READY                  =  77;
  CSTA_ROUTE_REGISTER_REQ          =  78;
  CSTA_ROUTE_REGISTER_REQ_CONF     =  79;
  CSTA_ROUTE_REGISTER_CANCEL       =  80;
  CSTA_ROUTE_REGISTER_CANCEL_CONF  =  81;
  CSTA_ROUTE_REGISTER_ABORT        =  82;
  CSTA_ROUTE_REQUEST               =  83;
  CSTA_ROUTE_SELECT_REQUEST        =  84;
  CSTA_RE_ROUTE_REQUEST            =  85;
  CSTA_ROUTE_USED                  =  86;
  CSTA_ROUTE_END                   =  87;
  CSTA_ROUTE_END_REQUEST           =  88;
  CSTA_ESCAPE_SVC                  =  89;
  CSTA_ESCAPE_SVC_CONF             =  90;
  CSTA_ESCAPE_SVC_REQ              =  91;
  CSTA_ESCAPE_SVC_REQ_CONF         =  92;
  CSTA_PRIVATE                     =  93;
  CSTA_PRIVATE_STATUS              =  94;
  CSTA_SEND_PRIVATE                =  95;
  CSTA_BACK_IN_SERVICE             =  96;
  CSTA_OUT_OF_SERVICE              =  97;
  CSTA_REQ_SYS_STAT                =  98;
  CSTA_SYS_STAT_REQ_CONF           =  99;
  CSTA_SYS_STAT_START              = 100;
  CSTA_SYS_STAT_START_CONF         = 101;
  CSTA_SYS_STAT_STOP               = 102;
  CSTA_SYS_STAT_STOP_CONF          = 103;
  CSTA_CHANGE_SYS_STAT_FILTER      = 104;
  CSTA_CHANGE_SYS_STAT_FILTER_CONF = 105;
  CSTA_SYS_STAT                    = 106;
  CSTA_SYS_STAT_ENDED              = 107;
  CSTA_SYS_STAT_REQ                = 108;
  CSTA_REQ_SYS_STAT_CONF           = 109;
  CSTA_SYS_STAT_EVENT_SEND         = 110;
  CSTA_MONITOR_DEVICE              = 111;
  CSTA_MONITOR_CALL                = 112;
  CSTA_MONITOR_CALLS_VIA_DEVICE    = 113;
  CSTA_MONITOR_CONF                = 114;
  CSTA_CHANGE_MONITOR_FILTER       = 115;
  CSTA_CHANGE_MONITOR_FILTER_CONF  = 116;
  CSTA_MONITOR_STOP                = 117;
  CSTA_MONITOR_STOP_CONF           = 118;
  CSTA_MONITOR_ENDED               = 119;
  CSTA_SNAPSHOT_CALL               = 120;
  CSTA_SNAPSHOT_CALL_CONF          = 121;
  CSTA_SNAPSHOT_DEVICE             = 122;
  CSTA_SNAPSHOT_DEVICE_CONF        = 123;
  CSTA_GETAPI_CAPS                 = 124;
  CSTA_GETAPI_CAPS_CONF            = 125;
  CSTA_GET_DEVICE_LIST             = 126;
  CSTA_GET_DEVICE_LIST_CONF        = 127;
  CSTA_QUERY_CALL_MONITOR          = 128;
  CSTA_QUERY_CALL_MONITOR_CONF     = 129;
  CSTA_ROUTE_REQUEST_EXT           = 130;
  CSTA_ROUTE_USED_EXT              = 131;
  CSTA_ROUTE_SELECT_INV_REQUEST    = 132;
  CSTA_ROUTE_END_INV_REQUEST       = 133;

type
  DeviceID_t = array [0..63] of Char;
  pDeviceID_t = ^DeviceID_t;

  ConnectionID_Device_t = ( STATIC_ID = 0,
    DYNAMIC_ID                        = 1 );

  ConnectionID_t = record
    callID    : LongInt;
    deviceID  : DeviceID_t;
    devIDType : ConnectionID_Device_t;
    end;

  pConnectionID_t = ^ConnectionID_t;

  DeviceIDType_t = (  DEVICE_IDENTIFIER     =  0,
    IMPLICIT_PUBLIC                         = 20,
    EXPLICIT_PUBLIC_UNKNOWN                 = 30,
    EXPLICIT_PUBLIC_INTERNATIONAL           = 31,
    EXPLICIT_PUBLIC_NATIONAL                = 32,
    EXPLICIT_PUBLIC_NETWORK_SPECIFIC        = 33,
    EXPLICIT_PUBLIC_SUBSCRIBER              = 34,
    EXPLICIT_PUBLIC_ABBREVIATED             = 35,
    IMPLICIT_PRIVATE                        = 40,
    EXPLICIT_PRIVATE_UNKNOWN                = 50,
    EXPLICIT_PRIVATE_LEVEL3_REGIONAL_NUMBER = 51,
    EXPLICIT_PRIVATE_LEVEL2_REGIONAL_NUMBER = 52,
    EXPLICIT_PRIVATE_LEVEL1_REGIONAL_NUMBER = 53,
    EXPLICIT_PRIVATE_PTN_SPECIFIC_NUMBER    = 54,
    EXPLICIT_PRIVATE_LOCAL_NUMBER           = 55,
    EXPLICIT_PRIVATE_ABBREVIATED            = 56,
    OTHER_PLAN                              = 60,
    TRUNK_IDENTIFIER                        = 70,
    TRUNK_GROUP_IDENTIFIER                  = 71 );

  DeviceIDStatus_t = ( ID_PROVIDED = 0,
    ID_NOT_KNOWN                   = 1,
    ID_NOT_REQUIRED                = 2 );

  LocalConnectionState_t = ( CS_NONE = -1,
    CS_NULL                          = 0,
    CS_INITIATE                      = 1,
    CS_ALERTING                      = 2,
    CS_CONNECT                       = 3,
    CS_HOLD                          = 4,
    CS_QUEUED                        = 5,
    CS_FAIL                          = 6 );

  CSTAEventCause_t = ( EC_NONE     = -1,
    EC_ACTIVE_MONITOR              =  1,
    EC_ALTERNATE                   =  2,
    EC_BUSY                        =  3,
    EC_CALL_BACK                   =  4,
    EC_CALL_CANCELLED              =  5,
    EC_CALL_FORWARD_ALWAYS         =  6,
    EC_CALL_FORWARD_BUSY           =  7,
    EC_CALL_FORWARD_NO_ANSWER      =  8,
    EC_CALL_FORWARD                =  9,
    EC_CALL_NOT_ANSWERED           = 10,
    EC_CALL_PICKUP                 = 11,
    EC_CAMP_ON                     = 12,
    EC_DEST_NOT_OBTAINABLE         = 13,
    EC_DO_NOT_DISTURB              = 14,
    EC_INCOMPATIBLE_DESTINATION    = 15,
    EC_INVALID_ACCOUNT_CODE        = 16,
    EC_KEY_CONFERENCE              = 17,
    EC_LOCKOUT                     = 18,
    EC_MAINTENANCE                 = 19,
    EC_NETWORK_CONGESTION          = 20,
    EC_NETWORK_NOT_OBTAINABLE      = 21,
    EC_NEW_CALL                    = 22,
    EC_NO_AVAILABLE_AGENTS         = 23,
    EC_OVERRIDE                    = 24,
    EC_PARK                        = 25,
    EC_OVERFLOW                    = 26,
    EC_RECALL                      = 27,
    EC_REDIRECTED                  = 28,
    EC_REORDER_TONE                = 29,
    EC_RESOURCES_NOT_AVAILABLE     = 30,
    EC_SILENT_MONITOR              = 31,
    EC_TRANSFER                    = 32,
    EC_TRUNKS_BUSY                 = 33,
    EC_VOICE_UNIT_INITIATOR        = 34,
    EC_NETWORKSIGNAL               = 46,
    EC_ALERTTIMEEXPIRED            = 60,
    EC_DESTOUTOFORDER              = 65,
    EC_NOTSUPPORTEDBEARERSERVICE   = 80,
    EC_UNASSIGNED_NUMBER           = 81,
    EC_INCOMPATIBLE_BEARER_SERVICE = 87 );

  ExtendedDeviceID_t = record
    deviceID       : DeviceID_t;
    deviceIDType   : DeviceIDType_t;
    deviceIDStatus : DeviceIDStatus_t;
    end;

  CallingDeviceID_t = ExtendedDeviceID_t;

  CalledDeviceID_t = ExtendedDeviceID_t;

  SubjectDeviceID_t = ExtendedDeviceID_t;

  RedirectionDeviceID_t = ExtendedDeviceID_t;

  CSTAOriginatedEvent_t = record
    originatedConnection : ConnectionID_t;
    callingDevice        : SubjectDeviceID_t;
    calledDevice         : CalledDeviceID_t;
    localConnectionInfo  : LocalConnectionState_t;
    cause                : CSTAEventCause_t;
    end;

  CSTADeliveredEvent_t = record
    connection            : ConnectionID_t;
    alertingDevice        : SubjectDeviceID_t;
    callingDevice         : CallingDeviceID_t;
    calledDevice          : CalledDeviceID_t;
    lastRedirectionDevice : RedirectionDeviceID_t;
    localConnectionInfo   : LocalConnectionState_t;
    cause                 : CSTAEventCause_t;
    end;

   CSTACallFilter_t        = Word;
   CSTAFeatureFilter_t     = Byte;
   CSTAAgentFilter_t       = Byte;
   CSTAMaintenanceFilter_t = Byte;

   CSTAMonitorFilter_t = record
      call          : CSTACallFilter_t;
      feature       : CSTAFeatureFilter_t;
      agent         : CSTAAgentFilter_t;
      maintenance   : CSTAMaintenanceFilter_t;
      privateFilter : Integer;
      end;

   pCSTAMonitorFilter_t = ^CSTAMonitorFilter_t;

   CSTAMonitorCrossRefID_t = Integer;

   CSTAMonitorConfEvent_t = record
      monitorCrossRefID : CSTAMonitorCrossRefID_t;
      monitorFilter     : CSTAMonitorFilter_t;
      end;

   CSTAConnectionClearedEvent_t = record
     droppedConnection   : ConnectionID_t;
     releasingDevice     : SubjectDeviceID_t;
     localConnectionInfo : LocalConnectionState_t;
     cause               : CSTAEventCause_t ;
     end;

  CSTAMakeCallConfEvent_t  = record
    newCall : ConnectionID_t;
    end;

  CSTAServiceInitiatedEvent_t = record
    initiatedConnection : ConnectionID_t;
    localConnectionInfo : LocalConnectionState_t ;
    cause               : CSTAEventCause_t ;
    end;

  CSTAEstablishedEvent_t = record
    establishedConnection : ConnectionID_t;
    answeringDevice       : SubjectDeviceID_t;
    callingDevice         : CallingDeviceID_t ;
    calledDevice          : CalledDeviceID_t ;
    lastRedirectionDevice : RedirectionDeviceID_t ;
    localConnectionInfo   : LocalConnectionState_t ;
    cause                 : CSTAEventCause_t ;
    end;

  CSTAHoldCallConfEvent_t = record
    null : Nulltype;
  end;

  CSTAHeldEvent_t = record
    heldConnection      : ConnectionID_t;
    holdingDevice       : SubjectDeviceID_t;
    localConnectionInfo : LocalConnectionState_t;
    cause               : CSTAEventCause_t;
    end;

  CSTARetrievedEvent_t = record
    retrievedConnection : ConnectionID_t;
    retrievingDevice    : SubjectDeviceID_t;
    localConnectionInfo : LocalConnectionState_t;
    cause               : CSTAEventCause_t;
    end;

  CSTARetrieveCallConfEvent_t = record
    null : Nulltype;
    end;

  RouteRegisterReqID_t = Integer;
  RoutingCrossRefID_t  = Integer;
  RetryValue_t = Smallint;

  SelectValue_t = ( SV_NORMAL = 0,
    SV_LEAST_COST             = 1,
    SV_EMERGENCY              = 2,
    SV_ACD                    = 3,
    SV_USER_DEFINED           = 4 );

  pSetUpValues_t = ^SetUpValues_t;
  SetUpValues_t = record
    length : _Int;
    value  : ^Byte;
    end;


  CSTARouteRequestEvent_t = record
    routeRegisterReqID : RouteRegisterReqID_t;
    routingCrossRefID  : RoutingCrossRefID_t;
    currentRoute       : DeviceID_t;
    callingDevice      : DeviceID_t;
    routedCall         : ConnectionID_t;
    routedSelAlgorithm : SelectValue_t;
    priority           : Boolean;
    setupInformation   : SetUpValues_t;
    end;


  CSTARouteRequestExtEvent_t = record
    routeRegisterReqID : RouteRegisterReqID_t;
    routingCrossRefID  : RoutingCrossRefID_t;
    currentRoute       : CalledDeviceID_t;
    callingDevice      : CallingDeviceID_t;
    routedCall         : ConnectionID_t;
    routedSelAlgorithm : SelectValue_t;
    priority           : Boolean;
    setupInformation   : SetUpValues_t;
    end;


  CSTAReRouteRequest_t = record
    routeRegisterReqID : RouteRegisterReqID_t;
    routingCrossRefID  : RoutingCrossRefID_t;
    end;


  CSTAEscapeSvcReqEvent_t = record
    null : Nulltype;
    end;


  CSTASysStatReqEvent_t = record
    null : Nulltype;
    end;


  Connection_t = record
    party        : ConnectionID_t;
    staticDevice : SubjectDeviceID_t;
    end;


 TArrayOfConnection_t = array [0..9] of Connection_t;

 ConnectionList_t = record
    count      : _Int;
    connection : ^TArrayOfConnection_t;
    end;


  CSTADoNotDisturbEvent_t = record
    device         : SubjectDeviceID_t;
    doNotDisturbOn : Boolean;
    end;


  CSTACallClearedEvent_t = record
    clearedCall         : ConnectionID_t;
    localConnectionInfo : LocalConnectionState_t;
    cause               : CSTAEventCause_t;
    end;


  CSTADivertedEvent_t = record
    connection          : ConnectionID_t;
    divertingDevice     : SubjectDeviceID_t;
    newDestination      : CalledDeviceID_t;
    localConnectionInfo : LocalConnectionState_t;
    cause               : CSTAEventCause_t;
    end;


  CSTAFailedEvent_t = record
    failedConnection    : ConnectionID_t;
    failingDevice       : SubjectDeviceID_t;
    calledDevice        : CalledDeviceID_t;
    localConnectionInfo : LocalConnectionState_t;
    cause               : CSTAEventCause_t;
    end;


  CSTANetworkReachedEvent_t = record
    connection          : ConnectionID_t;
    trunkUsed           : SubjectDeviceID_t;
    calledDevice        : CalledDeviceID_t;
    localConnectionInfo : LocalConnectionState_t;
    cause               : CSTAEventCause_t;
    end;


  CSTAQueuedEvent_t = record
    queuedConnection      : ConnectionID_t;
    queue                 : SubjectDeviceID_t;
    callingDevice         : CallingDeviceID_t;
    calledDevice          : CalledDeviceID_t;
    lastRedirectionDevice : RedirectionDeviceID_t;
    numberQueued          : SmallInt;
    localConnectionInfo   : LocalConnectionState_t;
    cause                 : CSTAEventCause_t;
    end;


  ForwardingType_t = ( FWD_IMMEDIATE = 0,
    FWD_BUSY                         = 1,
    FWD_NO_ANS                       = 2,
    FWD_BUSY_INT                     = 3,
    FWD_BUSY_EXT                     = 4,
    FWD_NO_ANS_INT                   = 5,
    FWD_NO_ANS_EXT                   = 6 );


  ForwardingInfo_t = record
    forwardingType : ForwardingType_t;
    forwardingOn   : Boolean;
    forwardDN      : DeviceID_t;
    end;


  CSTAForwardingEvent_t = record
    device                : SubjectDeviceID_t;
    forwardingInformation : ForwardingInfo_t;
    end;


  CSTAMessageWaitingEvent_t = record
    deviceForMessage : CalledDeviceID_t;
    invokingDevice   : SubjectDeviceID_t;
    messageWaitingOn : Boolean;
    end;


  CSTAConferencedEvent_t = record
    primaryOldCall        : ConnectionID_t;
    secondaryOldCall      : ConnectionID_t;
    confController        : SubjectDeviceID_t;
    addedParty            : SubjectDeviceID_t;
    conferenceConnections : ConnectionList_t;
    localConnectionInfo   : LocalConnectionState_t;
    cause                 : CSTAEventCause_t;
    end;


  AccountInfo_t = array [0..31] of Char;


  AuthCode_t = array [0..31] of Char;


  CSTACallInformationEvent_t = record
    connection        : ConnectionID_t;
    device            : SubjectDeviceID_t;
    accountInfo       : AccountInfo_t;
    authorisationCode : AuthCode_t;
    end;


  CSTATransferredEvent_t = record
    primaryOldCall         : ConnectionID_t;
    secondaryOldCall       : ConnectionID_t;
    transferringDevice     : SubjectDeviceID_t;
    transferredDevice      : SubjectDeviceID_t;
    transferredConnections : ConnectionList_t;
    localConnectionInfo    : LocalConnectionState_t;
    cause                  : CSTAEventCause_t;
    end;


  AgentID_t       = array [0..31] of Char;
  pAgentID_t      = ^AgentID_t;
  AgentPassword_t = array [0..31] of Char;
  pAgentPassword_t = ^AgentPassword_t;
  AgentGroup_t    = DeviceID_t;
  pAgentGroup_t   = ^AgentGroup_t;


  CSTALoggedOnEvent_t = record
    agentDevice : SubjectDeviceID_t;
    agentID     : AgentID_t;
    agentGroup  : AgentGroup_t;
    password    : AgentPassword_t;
    end;


  CSTALoggedOffEvent_t = record
    agentDevice : SubjectDeviceID_t;
    agentID     : AgentID_t;
    agentGroup  : AgentGroup_t;
    end;


  CSTANotReadyEvent_t = record
    agentDevice : SubjectDeviceID_t;
    agentID     : AgentID_t;
    end;


  CSTAReadyEvent_t = record
    agentDevice : SubjectDeviceID_t;
    agentID     : AgentID_t;
    end;


  CSTAWorkNotReadyEvent_t = record
    agentDevice : SubjectDeviceID_t;
    agentID     : AgentID_t;
    end;


  CSTAWorkReadyEvent_t = record
    agentDevice : SubjectDeviceID_t;
    agentID     : AgentID_t;
    end;


  CSTABackInServiceEvent_t = record
    device : DeviceID_t;
    cause  : CSTAEventCause_t;
    end;


  CSTAOutOfServiceEvent_t = record
    device : DeviceID_t;
    cause  : CSTAEventCause_t;
    end;


  CSTAPrivateStatusEvent_t = record
    null : Nulltype;
    end;


  CSTAMonitorEndedEvent_t = record
    cause : CSTAEventCause_t;
    end;


  CSTAAlternateCall_t = record
    activeCall : ConnectionID_t;
    otherCall  : ConnectionID_t;
    end;


  CSTAAlternateCallConfEvent_t = record
    null : Nulltype;
    end;


  CSTAAnswerCallConfEvent_t = record
    null : Nulltype;
    end;


  CSTACallCompletionConfEvent_t = record
    null : Nulltype;
    end;


  CSTAClearCallConfEvent_t = record
    null : Nulltype;
    end;


  CSTAClearConnectionConfEvent_t = record
    null : Nulltype;
    end;


  CSTAConferenceCallConfEvent_t = record
    newCall  : ConnectionID_t;
    connList : ConnectionList_t;
    end;


  CSTAConsultationCallConfEvent_t = record
    newCall : ConnectionID_t;
    end;


  CSTADeflectCallConfEvent_t = record
    null : Nulltype;
    end;


  CSTAPickupCallConfEvent_t = record
    null : Nulltype;
    end;


  CSTAGroupPickupCallConfEvent_t = record
    null : Nulltype;
    end;


  CSTAMakePredictiveCallConfEvent_t = record
    newCal:     ConnectionID_t;
    end;


  CSTAQueryMwiConfEvent_t = record
    messages : Boolean;
    end;


  CSTAQueryDndConfEvent_t = record
    doNotDisturb : Boolean;
    end;


  CSTAQueryFwd_t = record
    device : DeviceID_t;
    end;


  ListForwardParameters_t = record
    count : SmallInt;
    param : array [0..6] of ForwardingInfo_t;
    end;


  CSTAQueryFwdConfEvent_t = record
    _forward : ListForwardParameters_t;
    end;


  AgentState_t = (AG_NOT_READY = 0,
    AG_NULL                    = 1,
    AG_READY                   = 2,
    AG_WORK_NOT_READY          = 3,
    AG_WORK_READY              = 4);


  CSTAQueryAgentState_t = record
    device : DeviceID_t;
    end;


  CSTAQueryAgentStateConfEvent_t = record
    agentState : AgentState_t;
    end;


  CSTAQueryLastNumberConfEvent_t = record
    lastNumber : DeviceID_t;
    end;


  DeviceType_t = ( DT_STATION =   0,
    DT_LINE                   =   1,
    DT_BUTTON                 =   2,
    DT_ACD                    =   3,
    DT_TRUNK                  =   4,
    DT_OPERATOR               =   5,
    DT_STATION_GROUP          =  16,
    DT_LINE_GROUP             =  17,
    DT_BUTTON_GROUP           =  18,
    DT_ACD_GROUP              =  19,
    DT_TRUNK_GROUP            =  20,
    DT_OPERATOR_GROUP         =  21,
    DT_OTHER                  = 255 );

  DeviceClass_t = Byte;


  CSTAQueryDeviceInfoConfEvent_t = record
    device      : DeviceID_t;
    deviceType  : DeviceType_t;
    deviceClass : DeviceClass_t;
    end;


  CSTAReconnectCallConfEvent_t = record
    null : Nulltype;
    end;


  CSTARetrieveCall_t = record
    heldCall : ConnectionID_t;
    end;


  CSTASetMwiConfEvent_t = record
    heldCall : ConnectionID_t;
    end;


  CSTASetDnd_t = record
    device       : DeviceID_t;
    doNotDisturb : Boolean;
    end;


  CSTASetDndConfEvent_t = record
    null : Nulltype;
    end;


  CSTASetFwd_t = record
    device   : DeviceID_t;
    _forward : ForwardingInfo_t;
    end;


  CSTASetFwdConfEvent_t = record
    null : Nulltype;
    end;


  CSTASetAgentStateConfEvent_t = record
    null : Nulltype;
    end;


  CSTATransferCallConfEvent_t = record
    newCall  : ConnectionID_t;
    connList : ConnectionList_t ;
    end;


  CSTAUniversalFailure_t = (GENERIC_UNSPECIFIED = 0,
    GENERIC_OPERATION                           = 1,
    REQUEST_INCOMPATIBLE_WITH_OBJECT            = 2,
    VALUE_OUT_OF_RANGE                          = 3,
    OBJECT_NOT_KNOWN                            = 4,
    INVALID_CALLING_DEVICE                      = 5,
    INVALID_CALLED_DEVICE                       = 6,
    INVALID_FORWARDING_DESTINATION              = 7,
    PRIVILEGE_VIOLATION_ON_SPECIFIED_DEVICE     = 8,
    PRIVILEGE_VIOLATION_ON_CALLED_DEVICE        = 9,
    PRIVILEGE_VIOLATION_ON_CALLING_DEVICE       = 10,
    INVALID_CSTA_CALL_IDENTIFIER                = 11,
    INVALID_CSTA_DEVICE_IDENTIFIER              = 12,
    INVALID_CSTA_CONNECTION_IDENTIFIER          = 13,
    INVALID_DESTINATION                         = 14,
    INVALID_FEATURE                             = 15,
    INVALID_ALLOCATION_STATE                    = 16,
    INVALID_CROSS_REF_ID                        = 17,
    INVALID_OBJECT_TYPE                         = 18,
    SECURITY_VIOLATION                          = 19,
    GENERIC_STATE_INCOMPATIBILITY               = 21,
    INVALID_OBJECT_STATE                        = 22,
    INVALID_CONNECTION_ID_FOR_ACTIVE_CALL       = 23,
    NO_ACTIVE_CALL                              = 24,
    NO_HELD_CALL                                = 25,
    NO_CALL_TO_CLEAR                            = 26,
    NO_CONNECTION_TO_CLEAR                      = 27,
    NO_CALL_TO_ANSWER                           = 28,
    NO_CALL_TO_COMPLETE                         = 29,
    GENERIC_SYSTEM_RESOURCE_AVAILABILITY        = 31,
    SERVICE_BUSY                                = 32,
    RESOURCE_BUSY                               = 33,
    RESOURCE_OUT_OF_SERVICE                     = 34,
    NETWORK_BUSY                                = 35,
    NETWORK_OUT_OF_SERVICE                      = 36,
    OVERALL_MONITOR_LIMIT_EXCEEDED              = 37,
    CONFERENCE_MEMBER_LIMIT_EXCEEDED            = 38,
    GENERIC_SUBSCRIBED_RESOURCE_AVAILABILITY    = 41,
    OBJECT_MONITOR_LIMIT_EXCEEDED               = 42,
    EXTERNAL_TRUNK_LIMIT_EXCEEDED               = 43,
    OUTSTANDING_REQUEST_LIMIT_EXCEEDED          = 44,
    GENERIC_PERFORMANCE_MANAGEMENT              = 51,
    PERFORMANCE_LIMIT_EXCEEDED                  = 52,
    UNSPECIFIED_SECURITY_ERROR                  = 60,
    SEQUENCE_NUMBER_VIOLATED                    = 61,
    TIME_STAMP_VIOLATED                         = 62,
    PAC_VIOLATED                                = 63,
    SEAL_VIOLATED                               = 64,
    GENERIC_UNSPECIFIED_REJECTION               = 70,
    GENERIC_OPERATION_REJECTION                 = 71,
    DUPLICATE_INVOCATION_REJECTION              = 72,
    UNRECOGNIZED_OPERATION_REJECTION            = 73,
    MISTYPED_ARGUMENT_REJECTION                 = 74,
    RESOURCE_LIMITATION_REJECTION               = 75,
    ACS_HANDLE_TERMINATION_REJECTION            = 76,
    SERVICE_TERMINATION_REJECTION               = 77,
    REQUEST_TIMEOUT_REJECTION                   = 78,
    REQUESTS_ON_DEVICE_EXCEEDED_REJECTION       = 79,
    UNRECOGNIZED_APDU_REJECTION                 = 80,
    MISTYPED_APDU_REJECTION                     = 81,
    BADLY_STRUCTURED_APDU_REJECTION             = 82,
    INITIATOR_RELEASING_REJECTION               = 83,
    UNRECOGNIZED_LINKEDID_REJECTION             = 84,
    LINKED_RESPONSE_UNEXPECTED_REJECTION        = 85,
    UNEXPECTED_CHILD_OPERATION_REJECTION        = 86,
    MISTYPED_RESULT_REJECTION                   = 87,
    UNRECOGNIZED_ERROR_REJECTION                = 88,
    UNEXPECTED_ERROR_REJECTION                  = 89,
    MISTYPED_PARAMETER_REJECTION                = 90,
    NON_STANDARD                                = 100);


  CSTAUniversalFailureConfEvent_t = record
    error : CSTAUniversalFailure_t;
    end;


  CSTAChangeMonitorFilterConfEvent_t = record
    monitorFilter : CSTAMonitorFilter_t;
    end;


  CSTAMonitorStopConfEvent_t = record
    null : Nulltype;
    end;


  CSTACallState_t = record
    count : _Int;
    state : ^LocalConnectionState_t;
    end;


  CSTASnapshotDeviceResponseInfo_t = record
    callIdentifier : ConnectionID_t;
    localCallState : CSTACallState_t;
    end;


  ArrayOfCSTASnapshotDeviceResponseInfo_t =
    array [0..9] of CSTASnapshotDeviceResponseInfo_t;

  CSTASnapshotDeviceData_t = record
    count : _Int;
    info  : ^ArrayOfCSTASnapshotDeviceResponseInfo_t;
    end;

  CSTASnapshotDeviceConfEvent_t = record
    snapshotData : CSTASnapshotDeviceData_t;
    end;

  CSTASnapshotCallResponseInfo_t = record
    deviceOnCall         : SubjectDeviceID_t;
    callIdentifier       : ConnectionID_t;
    localConnectionState : LocalConnectionState_t;
    end;

  ArrayOfCSTASnapshotCallResponseInfo_t =
    array [0..9] of CSTASnapshotCallResponseInfo_t;

  pCSTASnapshotCallResponseInfo_t = ^CSTASnapshotCallResponseInfo_t;


  CSTASnapshotCallData_t = record
    count : _Int;
    info : ^ArrayOfCSTASnapshotCallResponseInfo_t;
    end;


  CSTASnapshotCallConfEvent_t = record
    snapshotData : CSTASnapshotCallData_t;
    end;


  CSTARouteRegisterReqConfEvent_t = record
    registerReqID : RouteRegisterReqID_t;
    end;


  CSTARouteRegisterCancelConfEvent_t = record
    routeRegisterReqID : RouteRegisterReqID_t;
    end;


  CSTAEscapeSvcConfEvent_t = record
    null : Nulltype;
    end;


  SystemStatus_t = (SS_INITIALIZING = 0,
    SS_ENABLED                      = 1,
    SS_NORMAL                       = 2,
    SS_MESSAGES_LOST                = 3,
    SS_DISABLED                     = 4,
    SS_OVERLOAD_IMMINENT            = 5,
    SS_OVERLOAD_REACHED             = 6,
    SS_OVERLOAD_RELIEVED            = 7);


  CSTASysStatReqConfEvent_t = record
    systemStatus : SystemStatus_t;
    end;


  SystemStatusFilter_t = Byte;


  CSTASysStatStartConfEvent_t = record
    statusFilter : SystemStatusFilter_t;
    end;


  CSTASysStatStopConfEvent_t = record
    null : Nulltype;
    end;


  CSTAChangeSysStatFilterConfEvent_t = record
    statusFilterSelected : SystemStatusFilter_t;
    statusFilterActive   : SystemStatusFilter_t;
    end;


  CSTAGetAPICapsConfEvent_t = record
    alternateCall          : SmallInt;
    answerCall             : SmallInt;
    callCompletion         : SmallInt;
    clearCall              : SmallInt;
    clearConnection        : SmallInt;
    conferenceCall         : SmallInt;
    consultationCall       : SmallInt;
    deflectCall            : SmallInt;
    pickupCall             : SmallInt;
    groupPickupCall        : SmallInt;
    holdCall               : SmallInt;
    makeCall               : SmallInt;
    makePredictiveCall     : SmallInt;
    queryMwi               : SmallInt;
    queryDnd               : SmallInt;
    queryFwd               : SmallInt;
    queryAgentState        : SmallInt;
    queryLastNumber        : SmallInt;
    queryDeviceInfo        : SmallInt;
    reconnectCall          : SmallInt;
    retrieveCall           : SmallInt;
    setMwi                 : SmallInt;
    setDnd                 : SmallInt;
    setFwd                 : SmallInt;
    setAgentState          : SmallInt;
    transferCall           : SmallInt;
    eventReport            : SmallInt;
    callClearedEvent       : SmallInt;
    conferencedEvent       : SmallInt;
    connectionClearedEvent : SmallInt;
    deliveredEvent         : SmallInt;
    divertedEvent          : SmallInt;
    establishedEvent       : SmallInt;
    failedEvent            : SmallInt;
    heldEvent              : SmallInt;
    networkReachedEvent    : SmallInt;
    originatedEvent        : SmallInt;
    queuedEvent            : SmallInt;
    retrievedEvent         : SmallInt;
    serviceInitiatedEvent  : SmallInt;
    transferredEvent       : SmallInt;
    callInformationEvent   : SmallInt;
    doNotDisturbEvent      : SmallInt;
    forwardingEvent        : SmallInt;
    messageWaitingEvent    : SmallInt;
    loggedOnEvent          : SmallInt;
    loggedOffEvent         : SmallInt;
    notReadyEvent          : SmallInt;
    readyEvent             : SmallInt;
    workNotReadyEvent      : SmallInt;
    workReadyEvent         : SmallInt;
    backInServiceEvent     : SmallInt;
    outOfServiceEvent      : SmallInt;
    privateEvent           : SmallInt;
    routeRequestEvent      : SmallInt;
    reRoute                : SmallInt;
    routeSelectv           : SmallInt;
    routeUsedEvent         : SmallInt;
    routeEndEvent          : SmallInt;
    monitorDevice          : SmallInt;
    monitorCall            : SmallInt;
    monitorCallsViaDevice  : SmallInt;
    changeMonitorFilter    : SmallInt;
    monitorStop            : SmallInt;
    monitorEnded           : SmallInt;
    snapshotDeviceReq      : SmallInt;
    snapshotCallReq        : SmallInt;
    escapeService          : SmallInt;
    privateStatusEvent     : SmallInt;
    escapeServiceEvent     : SmallInt;
    escapeServiceConf      : SmallInt;
    sendPrivateEvent       : SmallInt;
    sysStatReq             : SmallInt;
    sysStatStart           : SmallInt;
    sysStatStop            : SmallInt;
    changeSysStatFilter    : SmallInt;
    sysStatReqEvent        : SmallInt;
    sysStatReqConf         : SmallInt;
    sysStatEvent           : SmallInt;
    end;


  SDBLevel_t = (NO_SDB_CHECKING = -1,
    ACS_ONLY                    =  1,
    ACS_AND_CSTA_CHECKING       =  0);

  CSTALevel_t = (CSTA_HOME_WORK_TOP  = 1,
    CSTA_AWAY_WORK_TOP               = 2,
    CSTA_DEVICE_DEVICE_MONITOR       = 3,
    CSTA_CALL_DEVICE_MONITOR         = 4,
    CSTA_CALL_CONTROL                = 5,
    CSTA_ROUTING                     = 6,
    CSTA_CALL_CALL_MONITOR           = 7);

  DeviceList_t = record
    count  : SmallInt;
    device : array [0..19] of DeviceID_t;
    end;


  CSTAGetDeviceListConfEvent_t = record
    driverSdbLevel : SDBLevel_t;
    level          : CSTALevel_t;
    index          : Integer;
    devList        : DeviceList_t;
    end;


  CSTAQueryCallMonitorConfEvent_t = record
    callMonitor : Boolean;
    end;


  CSTARouteRegisterAbortEvent_t = record
    routeRegisterReqID : RouteRegisterReqID_t;
    end;


  CSTARouteUsedEvent_t = record
    routeRegisterReqID : RouteRegisterReqID_t;
    routingCrossRefID  : RoutingCrossRefID_t;
    routeUsed          : DeviceID_t;
    callingDevice      : DeviceID_t;
    domain             : Boolean;
    end;


  CSTARouteUsedExtEvent_t = record
    routeRegisterReqID : RouteRegisterReqID_t;
    routingCrossRefID  : RoutingCrossRefID_t;
    routeUsed          : CalledDeviceID_t;
    callingDevice      : CallingDeviceID_t;
    domain             : Boolean;
    end;


  CSTARouteEndEvent_t = record
    routeRegisterReqID : RouteRegisterReqID_t;
    routingCrossRefID  : RoutingCrossRefID_t;
    errorValue         : CSTAUniversalFailure_t;
    end;


  CSTAPrivateEvent_t = record
    null: Nulltype;
    end;


  CSTASysStatEvent_t = record
    systemStatus : SystemStatus_t;
    end;


  CSTASysStatEndedEvent_t = record
    null : Nulltype;
    end;

  CSTASimpleCallState_t = (CALL_NULL = 0,
    CALL_PENDING                     = 1,
    CALL_ORIGINATED                  = 3,
    CALL_DELIVERED                   = 35,
    CALL_DELIVERED_HELD              = 36,
    CALL_RECEIVED                    = 50,
    CALL_ESTABLISHED                 = 51,
    CALL_ESTABLISHED_HELD            = 52,
    CALL_RECEIVED_ON_HOLD            = 66,
    CALL_ESTABLISHED_ON_HOLD         = 67,
    CALL_QUEUED                      = 83,
    CALL_QUEUED_HELD                 = 84,
    CALL_FAILED                      = 99,
    CALL_FAILED_HELD                 = 100);

  AllocationState_t = ( AS_CALL_DELIVERED = 0,
    AS_CALL_ESTABLISHED = 1 );

  AgentMode_t = ( AM_LOG_IN = 0,
    AM_LOG_OUT              = 1,
    AM_NOT_READY            = 2,
    AM_READY                = 3,
    AM_WORK_NOT_READY       = 4,
    AM_WORK_READY           = 5 );

implementation

end.
