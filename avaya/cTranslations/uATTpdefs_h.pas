{******************************************************************************
                                Autor: Daniel Jurado
                                 jurado@gmail.com
******************************************************************************}
unit uAttpdefs_h;

interface

uses
  Windows, uCSTADefs_h, uTsplatfm_h;

{$Z4}

const
  ATTV5_CLEAR_CONNECTION                  =   1;
  FIRST_PRIV_TYPE                         =   ATTV5_CLEAR_CONNECTION;
  ATTV5_CONSULTATION_CALL                 =   2;
  ATTV5_MAKE_CALL                         =   3;
  ATTV5_DIRECT_AGENT_CALL                 =   4;
  ATTV5_MAKE_PREDICTIVE_CALL              =   5;
  ATTV5_SUPERVISOR_ASSIST_CALL            =   6;
  ATTV5_RECONNECT_CALL                    =   7;
  ATTV4_SENDDTMF_TONE                     =   8;
  ATT_SENDDTMF_TONE_CONF                  =   9;
  ATTV4_SET_AGENT_STATE                   =  10;
  ATT_QUERY_ACD_SPLIT                     =  11;
  ATT_QUERY_ACD_SPLIT_CONF                =  12;
  ATT_QUERY_AGENT_LOGIN                   =  13;
  ATT_QUERY_AGENT_LOGIN_CONF              =  14;
  ATT_QUERY_AGENT_LOGIN_RESP              =  15;
  ATT_QUERY_AGENT_STATE                   =  16;
  ATTV4_QUERY_AGENT_STATE_CONF            =  17;
  ATT_QUERY_CALL_CLASSIFIER               =  18;
  ATT_QUERY_CALL_CLASSIFIER_CONF          =  19;
  ATTV4_QUERY_DEVICE_INFO_CONF            =  20;
  ATT_QUERY_MWI_CONF                      =  21;
  ATT_QUERY_STATION_STATUS                =  22;
  ATT_QUERY_STATION_STATUS_CONF           =  23;
  ATT_QUERY_TOD                           =  24;
  ATT_QUERY_TOD_CONF                      =  25;
  ATT_QUERY_TG                            =  26;
  ATT_QUERY_TG_CONF                       =  27;
  ATTV4_SNAPSHOT_DEVICE_CONF              =  28;
  ATTV4_MONITOR_FILTER                    =  29;
  ATTV4_MONITOR_CONF                      =  30;
  ATT_MONITOR_STOP_ON_CALL                =  31;
  ATT_MONITOR_STOP_ON_CALL_CONF           =  32;
  ATTV4_MONITOR_CALL_CONF                 =  33;
  ATT_CALL_CLEARED                        =  34;
  ATTV3_CONFERENCED                       =  35;
  ATTV5_CONNECTION_CLEARED                =  36;
  ATTV3_DELIVERED                         =  37;
  ATT_ENTERED_DIGITS                      =  38;
  ATTV3_ESTABLISHED                       =  39;
  ATTV4_NETWORK_REACHED                   =  40;
  ATTV3_TRANSFERRED                       =  41;
  ATTV4_ROUTE_REQUEST                     =  42;
  ATTV5_ROUTE_SELECT                      =  43;
  ATT_ROUTE_USED                          =  44;
  ATT_SYS_STAT                            =  45;
  ATTV3_LINK_STATUS                       =  46;
  ATTV5_ORIGINATED                        =  47;
  ATT_LOGGED_ON                           =  48;
  ATT_QUERY_DEVICE_NAME                   =  49;
  ATTV4_QUERY_DEVICE_NAME_CONF            =  50;
  ATT_QUERY_AGENT_MEASUREMENTS            =  51;
  ATT_QUERY_AGENT_MEASUREMENTS_CONF       =  52;
  ATT_QUERY_SPLIT_SKILL_MEASUREMENTS      =  53;
  ATT_QUERY_SPLIT_SKILL_MEASUREMENTS_CONF =  54;
  ATT_QUERY_TRUNK_GROUP_MEASUREMENTS      =  55;
  ATT_QUERY_TRUNK_GROUP_MEASUREMENTS_CONF =  56;
  ATT_QUERY_VDN_MEASUREMENTS              =  57;
  ATT_QUERY_VDN_MEASUREMENTS_CONF         =  58;
  ATTV4_CONFERENCED                       =  59;
  ATTV4_DELIVERED                         =  60;
  ATTV4_ESTABLISHED                       =  61;
  ATTV4_TRANSFERRED                       =  62;
  ATTV4_LINK_STATUS                       =  63;
  ATTV4_GETAPI_CAPS_CONF                  =  64;
  ATT_SINGLE_STEP_CONFERENCE_CALL         =  65;
  ATT_SINGLE_STEP_CONFERENCE_CALL_CONF    =  66;
  ATT_SELECTIVE_LISTENING_HOLD            =  67;
  ATT_SELECTIVE_LISTENING_HOLD_CONF       =  68;
  ATT_SELECTIVE_LISTENING_RETRIEVE        =  69;
  ATT_SELECTIVE_LISTENING_RETRIEVE_CONF   =  70;
  ATT_SENDDTMF_TONE                       =  71;
  ATT_SNAPSHOT_DEVICE_CONF                =  72;
  ATT_LINK_STATUS                         =  73;
  ATT_SET_BILL_RATE                       =  74;
  ATT_SET_BILL_RATE_CONF                  =  75;
  ATT_QUERY_UCID                          =  76;
  ATT_QUERY_UCID_CONF                     =  77;
  ATTV5_CONFERENCED                       =  78;
  ATT_LOGGED_OFF                          =  79;
  ATTV5_DELIVERED                         =  80;
  ATTV5_ESTABLISHED                       =  81;
  ATTV5_TRANSFERRED                       =  82;
  ATTV5_ROUTE_REQUEST                     =  83;
  ATT_CONSULTATION_CALL_CONF              =  84;
  ATT_MAKE_CALL_CONF                      =  85;
  ATT_MAKE_PREDICTIVE_CALL_CONF           =  86;
  ATTV5_SET_AGENT_STATE                   =  87;
  ATTV5_QUERY_AGENT_STATE_CONF            =  88;
  ATT_QUERY_DEVICE_NAME_CONF              =  89;
  ATT_CONFERENCE_CALL_CONF                =  90;
  ATT_TRANSFER_CALL_CONF                  =  91;
  ATT_MONITOR_FILTER                      =  92;
  ATT_MONITOR_CONF                        =  93;
  ATT_MONITOR_CALL_CONF                   =  94;
  ATT_SERVICE_INITIATED                   =  95;
  ATT_CHARGE_ADVICE                       =  96;
  ATT_GETAPI_CAPS_CONF                    =  97;
  ATT_QUERY_DEVICE_INFO_CONF              =  98;
  ATT_SET_ADVICE_OF_CHARGE                =  99;
  ATT_SET_ADVICE_OF_CHARGE_CONF           = 100;
  ATT_NETWORK_REACHED                     = 101;
  ATT_SET_AGENT_STATE                     = 102;
  ATT_SET_AGENT_STATE_CONF                = 103;
  ATT_QUERY_AGENT_STATE_CONF              = 104;
  ATT_ROUTE_REQUEST                       = 105;
  ATT_TRANSFERRED                         = 106;
  ATT_CONFERENCED                         = 107;
  ATT_CLEAR_CONNECTION                    = 108;
  ATT_CONSULTATION_CALL                   = 109;
  ATT_MAKE_CALL                           = 110;
  ATT_DIRECT_AGENT_CALL                   = 111;
  ATT_MAKE_PREDICTIVE_CALL                = 112;
  ATT_SUPERVISOR_ASSIST_CALL              = 113;
  ATT_RECONNECT_CALL                      = 114;
  ATT_CONNECTION_CLEARED                  = 115;
  ATT_ROUTE_SELECT                        = 116;
  ATT_DELIVERED                           = 117;
  ATT_ESTABLISHED                         = 118;
  ATT_ORIGINATED                          = 119;

  MAX_TRUNKS = 5;

type

  ATTUCID_t = array[0..63] of char;

  ATTMakeCallConfEvent_t = record
    ucid : ATTUCID_t;
    end;

  ATTUUIProtocolType_t = ( UUI_NONE = -1,
    UUI_USER_SPECIFIC               = 0,
    UUI_IA5_ASCII                   = 4 );

  Tdata = record
    length : WORD;
    value  : array [0..32] of BYTE;
    end;

  TdataV6 = record
    length : SHORT;
    value  : array [0..128] of BYTE;
    end;

  ATTV5UserToUserInfo_t = record
    _type : ATTUUIProtocolType_t;
    data  : Tdata;
    end;

  ATTUserToUserInfo_t = record
    _type : ATTUUIProtocolType_t;
    data  : TdataV6;
    end;

  pATTV5UserToUserInfo_t = ^ATTV5UserToUserInfo_t;

  pATTUserToUserInfo_t = ^ATTUserToUserInfo_t;


  ATTDeliveredType_t = ( DELIVERED_TO_ACD = 1,
    DELIVERED_TO_STATION                  = 2,
    DELIVERED_OTHER                       = 3 );

  ATTInterflow_t = ( LAI_NO_INTERFLOW = -1,
    LAI_ALL_INTERFLOW                 =  0,
    LAI_THRESHOLD_INTERFLOW           =  1,
    LAI_VECTORING_INTERFLOW           =  2 );

  ATTPriority_t = ( LAI_NOT_IN_QUEUE = 0,
    LAI_LOW                          = 1,
    LAI_MEDIUM                       = 2,
    LAI_HIGH                         = 3,
    LAI_TOP                          = 4 );

  ATTUnicodeDeviceID_t = record
    count : Smallint;
    value : array[ 0..63] of WORD;
    end;

  ATTLookaheadInfo_t = record
    _type      : ATTInterflow_t;
    priority   : ATTPriority_t;
    hours      : Smallint;
    minutes    : Smallint;
    seconds    : Smallint;
    sourceVDN  : DeviceID_t;
    uSourceVDN : ATTUnicodeDeviceID_t;
    end;

  ATTUserEnteredCodeType_t = ( UE_NONE = -1,
    UE_ANY                             =  0,
    UE_LOGIN_DIGITS                    =  2,
    UE_CALL_PROMPTER                   =  5,
    UE_DATA_BASE_PROVIDED              = 17,
    UE_TONE_DETECTOR                   = 32 );


  ATTUserEnteredCodeIndicator_t = ( UE_COLLECT = 0,
    UE_ENTERED                                 = 1 );



  ATTUserEnteredCode_t = record
    _type      : ATTUserEnteredCodeType_t;
    indicator  : ATTUserEnteredCodeIndicator_t;
    data       : array [0..24] of char;
    collectVDN : DeviceID_t;
    end;

  ATTReasonCode_t = ( AR_NONE  =  0,
    AR_ANSWER_NORMAL           =  1,
    AR_ANSWER_TIMED            =  2,
    AR_ANSWER_VOICE_ENERGY     =  3,
    AR_ANSWER_MACHINE_DETECTED =  4,
    AR_SIT_REORDER             =  5,
    AR_SIT_NO_CIRCUIT          =  6,
    AR_SIT_INTERCEPT           =  7,
    AR_SIT_VACANT_CODE         =  8,
    AR_SIT_INEFFECTIVE_OTHER   =  9,
    AR_SIT_UNKNOWN             = 10,
    AR_IN_QUEUE                = 11,
    AR_SERVICE_OBSERVER        = 12 );


  ATTReasonForCallInfo_t = ( OR_NONE = 0,
    OR_CONSULTATION                  = 1,
    OR_CONFERENCED                   = 2,
    OR_TRANSFERRED                   = 3,
    OR_NEW_CALL                      = 4 );


  ATTCallOriginatorInfo_t = record
    hasInfo                     : Boolean;
    callOriginatorType          : Smallint;
    end;


  ATTOriginalCallInfo_t  = record
    reason             : ATTReasonForCallInfo_t ;
    callingDevice      : CallingDeviceID_t ;
    calledDevice       : CalledDeviceID_t ;
    trunkGroup         : DeviceID_t;
    trunkMember        : DeviceID_t;
    lookaheadInfo      : ATTLookaheadInfo_t;
    userEnteredCode    : ATTUserEnteredCode_t;
    userInfo           : ATTUserToUserInfo_t;
    ucid               : ATTUCID_t;
    callOriginatorInfo : ATTCallOriginatorInfo_t;
    flexibleBilling    : Boolean;
    end;


  ATTDeliveredEvent_t = record
    deliveredType      : ATTDeliveredType_t;
    trunkGroup         : DeviceID_t;
    trunkMember        : DeviceID_t;
    split              : DeviceID_t;
    lookaheadInfo      : ATTLookaheadInfo_t;
    userEnteredCode    : ATTUserEnteredCode_t;
    userInfo           : ATTUserToUserInfo_t;
    reason             : ATTReasonCode_t;
    originalCallInfo   : ATTOriginalCallInfo_t;
    distributingDevice : CalledDeviceID_t;
    ucid               : ATTUCID_t;
    callOriginatorInfo : ATTCallOriginatorInfo_t;
    flexibleBilling    : Boolean;
    end;


  ATTSingleStepConferenceCallConfEvent_t = record
    newCall  : ConnectionID_t;
    connList : ConnectionList_t;
    ucid     : ATTUCID_t;
    end;


  ATTSelectiveListeningHoldConfEvent_t = record
    null : Nulltype;
    end;


  ATTSelectiveListeningRetrieveConfEvent_t = record
    null : Nulltype;
    end;

  ATTSendDTMFToneConfEvent_t = record
    null : Nulltype;
    end;

  ATTQueryAcdSplitConfEvent_t = record
    availableAgents : SHORT;
    callsInQueue    : SHORT;
    agentsLoggedIn  : SHORT;
    end;

  ATTPrivEventCrossRefID_t = Integer;

  ATTQueryAgentLoginConfEvent_t = record
    privEventCrossRefID : ATTPrivEventCrossRefID_t;
    end;

  list_t = record
    count  : SHORT;
    device : array [0..9] of DeviceID_t;
    end;

  ATTQueryAgentLoginResp_t = record
    privEventCrossRefID : ATTPrivEventCrossRefID_t;
    list : list_t
    end;

  ATTWorkMode_t  = ( WM_NONE = -1,
    WM_AUX_WORK              =  1,
    WM_AFTCAL_WK             =  2,
    WM_AUTO_IN               =  3,
    WM_MANUAL_IN             =  4 );


  ATTTalkState_t = ( TS_ON_CALL = 0,
    TS_IDLE                     = 1 );


  ATTQueryAgentStateConfEvent_t = record
    workMode          : ATTWorkMode_t;
    talkState         : ATTTalkState_t;
    reasonCode        : Integer;
    pendingWorkMode   : ATTWorkMode_t;
    pendingReasonCode : Integer;
    end;


  ATTQueryCallClassifierConfEvent_t = record
    numAvailPorts : SHORT;
    numInUsePorts : SHORT;
    end;

  ATTExtensionClass_t  = ( EC_VDN = 0,
    EC_ACD_SPLIT                  = 1,
    EC_ANNOUNCEMENT               = 2,
    EC_DATA                       = 4,
    EC_ANALOG                     = 5,
    EC_PROPRIETARY                = 6,
    EC_BRI                        = 7,
    EC_CTI                        = 8,
    EC_LOGICAL_AGENT              = 9,
    EC_OTHER                      = 10 );

  ATTQueryDeviceInfoConfEvent_t = record
    extensionClass   : ATTExtensionClass_t;
    associatedClass  : ATTExtensionClass_t;
    associatedDevice : DeviceID_t;
    end;


  ATTDeviceType_t = (ATT_DT_ACD_SPLIT = 1,
    ATT_DT_ANNOUNCEMENT               = 2,
    ATT_DT_DATA                       = 3,
    ATT_DT_LOGICAL_AGENT              = 4,
    ATT_DT_STATION                    = 5,
    ATT_DT_TRUNK_ACCESS_CODE          = 6,
    ATT_DT_VDN                        = 7 );


  ATTQueryDeviceNameConfEvent_t = record
    deviceType : ATTDeviceType_t;
    device     : DeviceID_t;
    name       : DeviceID_t;
    uname      : ATTUnicodeDeviceID_t;
    end;


  ATTMwiApplication_t = UCHAR;


  ATTQueryMwiConfEvent_t = record
    applicationType : ATTMwiApplication_t;
    end;


  ATTQueryStationStatusConfEvent_t = record
    stationStatus : Boolean;
    end;


  ATTQueryTodConfEvent_t = record
    year   : SHORT;
    month  : SHORT;
    day    : SHORT;
    hour   : SHORT;
    minute : SHORT;
    second : SHORT;
    end;


  ATTQueryTgConfEvent_t = record
    idleTrunks : Smallint;
    usedTrunks : Smallint;
    end;

  ATTAgentMeasurementsPresent_t = record
    allMeasurements         : Boolean;
    acdCalls                : Boolean;
    extension               : Boolean;
    name                    : Boolean;
    state                   : Boolean;
    avgACDTalkTime          : Boolean;
    avgExtensionTime        : Boolean;
    callRate                : Boolean;
    elapsedTime             : Boolean;
    extensionCalls          : Boolean;
    extensionIncomingCalls  : Boolean;
    extensionOutgoingCalls  : Boolean;
    shiftACDCalls           : Boolean;
    shiftAvgACDTalkTime     : Boolean;
    splitAcceptableSvcLevel : Boolean;
    splitACDCalls           : Boolean;
    splitAfterCallSessions  : Boolean;
    splitAgentsAvailable    : Boolean;
    splitAgentsInAfterCall  : Boolean;
    splitAgentsInAux        : Boolean;
    splitAgentsInOther      : Boolean;
    splitAgentsOnACDCalls   : Boolean;
    splitAgentsOnExtCalls   : Boolean;
    splitAgentsStaffed      : Boolean;
    splitAvgACDTalkTime     : Boolean;
    splitAvgAfterCallTime   : Boolean;
    splitAvgSpeedOfAnswer   : Boolean;
    splitAvgTimeToAbandon   : Boolean;
    splitCallRate           : Boolean;
    splitCallsAbandoned     : Boolean;
    splitCallsFlowedIn      : Boolean;
    splitCallsFlowedOut     : Boolean;
    splitCallsWaiting       : Boolean;
    splitName               : Boolean;
    splitNumber             : Boolean;
    splitExtension          : Boolean;
    splitObjective          : Boolean;
    splitOldestCallWaiting  : Boolean;
    splitPercentInSvcLevel  : Boolean;
    splitTotalACDTalkTime   : Boolean;
    splitTotalAfterCallTime : Boolean;
    splitTotalAuxTime       : Boolean;
    timeAgentEnteredState   : Boolean;
    totalACDTalkTime        : Boolean;
    totalAfterCallTime      : Boolean;
    totalAuxTime            : Boolean;
    totalAvailableTime      : Boolean;
    totalHoldTime           : Boolean;
    totalStaffedTime        : Boolean;
    totalACDCallTime        : Boolean;
    avgACDCallTime          : Boolean;
    end;

  ATTAgentMeasurements_t = record
    acdCalls                : Integer;
    extension               : array [0..5] of char;
    name                    : array [0..15] of char;
    state                   : Byte;
    avgACDTalkTime          : Integer;
    avgExtensionTime        : Integer;
    callRate                : Integer;
    elapsedTime             : SmallInt;
    extensionCalls          : Integer;
    extensionIncomingCalls  : Integer;
    extensionOutgoingCalls  : Integer;
    shiftACDCalls           : Integer;
    shiftAvgACDTalkTime     : Integer;
    splitAcceptableSvcLevel : SmallInt;
    splitACDCalls           : Integer;
    splitAfterCallSessions  : Integer;
    splitAgentsAvailable    : SmallInt;
    splitAgentsInAfterCall  : SmallInt;
    splitAgentsInAux        : SmallInt;
    splitAgentsInOther      : SmallInt;
    splitAgentsOnACDCalls   : SmallInt;
    splitAgentsOnExtCalls   : SmallInt;
    splitAgentsStaffed      : SmallInt;
    splitAvgACDTalkTime     : Integer;
    splitAvgAfterCallTime   : Integer;
    splitAvgSpeedOfAnswer   : SmallInt;
    splitAvgTimeToAbandon   : SmallInt;
    splitCallRate           : Integer;
    splitCallsAbandoned     : Integer;
    splitCallsFlowedIn      : Integer;
    splitCallsFlowedOut     : Integer;
    splitCallsWaiting       : SmallInt;
    splitName               : array [0..15] of char;
    splitNumber             : SmallInt;
    splitExtension          : array [0..5] of char;
    splitObjective          : array [0..5] of char;
    splitOldestCallWaiting  : SmallInt;
    splitPercentInSvcLevel  : Byte;
    splitTotalACDTalkTime   : Integer;
    splitTotalAfterCallTime : Integer;
    splitTotalAuxTime       : Integer;
    timeAgentEnteredState   : Integer;
    totalACDTalkTime        : Integer;
    totalAfterCallTime      : Integer;
    totalAuxTime            : Integer;
    totalAvailableTime      : Integer;
    totalHoldTime           : Integer;
    totalStaffedTime        : Integer;
    totalACDCallTime        : Integer;
    avgACDCallTime          : Integer;
    end;


  ATTQueryAgentMeasurementsConfEvent_t = record
    returnedItems       : ATTAgentMeasurementsPresent_t;
    values              : ATTAgentMeasurements_t;
    end;


  ATTSplitSkillMeasurementsPresent_t = record
    allMeasurements        : Boolean;
    acceptableSvcLevel     : Boolean;
    acdCalls               : Boolean;
    afterCallSessions      : Boolean;
    agentsAvailable        : Boolean;
    agentsInAfterCall      : Boolean;
    agentsInAux            : Boolean;
    agentsInOther          : Boolean;
    onACDCalls             : Boolean;
    agentsOnExtensionCalls : Boolean;
    agentsStaffed          : Boolean;
    avgACDTalkTime         : Boolean;
    afterCallTime          : Boolean;
    avgSpeedOfAnswer       : Boolean;
    avgTimeToAbandon       : Boolean;
    callRate               : Boolean;
    callsAbandoned         : Boolean;
    callsFlowedIn          : Boolean;
    callsFlowedOut         : Boolean;
    callsWaiting           : Boolean;
    oldestCallWaiting      : Boolean;
    percentInSvcLevel      : Boolean;
    name                   : Boolean;
    extension              : Boolean;
    number                 : Boolean;
    objective              : Boolean;
    totalAfterCallTime     : Boolean;
    totalAuxTime           : Boolean;
    totalACDTalkTime       : Boolean;
    end;

  ATTSplitSkillMeasurements_t = record
    acceptableSvcLevel     : SHORT;
    acdCalls               : Integer;
    afterCallSessions      : Integer;
    agentsAvailable        : SHORT;
    agentsInAfterCall      : SHORT;
    agentsInAux            : SHORT;
    agentsInOther          : SHORT;
    onACDCalls             : SHORT;
    agentsOnExtensionCalls : SHORT;
    agentsStaffed          : SHORT;
    avgACDTalkTime         : Integer;
    afterCallTime          : Integer;
    avgSpeedOfAnswer       : SHORT;
    avgTimeToAbandon       : SHORT;
    callRate               : Integer;
    callsAbandoned         : Integer;
    callsFlowedIn          : Integer;
    callsFlowedOut         : Integer;
    callsWaiting           : SHORT;
    oldestCallWaiting      : SHORT;
    percentInSvcLevel      : UCHAR;
    name                   : array [0..15] of Char;
    extension              : array [0..5] of Char;
    number                 : SHORT;
    objective              : array [0..5] of Char;
    totalAfterCallTime     : Integer;
    totalAuxTime           : Integer;
    totalACDTalkTime       : Integer;
    end;

  ATTQuerySplitSkillMeasurementsConfEvent_t = record
    returnedItems : ATTSplitSkillMeasurementsPresent_t;
    values        : ATTSplitSkillMeasurements_t;
    end;


  ATTTrunkGroupMeasurementsPresent_t = record
    allMeasurements        : Boolean;
    avgIncomingCallTime    : Boolean;
    avgOutgoingCallTime    : Boolean;
    incomingAbandonedCalls : Boolean;
    incomingCalls          : Boolean;
    incomingUsage          : Boolean;
    numberOfTrunks         : Boolean;
    outgoingCalls          : Boolean;
    outgoingCompletedCalls : Boolean;
    outgoingUsage          : Boolean;
    percentAllTrunksBusy   : Boolean;
    percentTrunksMaintBusy : Boolean;
    trunkGroupName         : Boolean;
    trunkGroupNumber       : Boolean;
    trunksInUse            : Boolean;
    trunksMaintBusy        : Boolean;
    end;


  ATTTrunkGroupMeasurements_t = record
    avgIncomingCallTime    : Integer;
    avgOutgoingCallTime    : Integer;
    incomingAbandonedCalls : Integer;
    incomingCalls          : Integer;
    incomingUsage          : Integer;
    numberOfTrunks         : SHORT;
    outgoingCalls          : Integer;
    outgoingCompletedCalls : Integer;
    outgoingUsage          : Integer;
    percentAllTrunksBusy   : UCHAR;
    percentTrunksMaintBusy : UCHAR;
    trunkGroupName         : array [0..15] of Char;
    trunkGroupNumber       : SHORT;
    trunksInUse            : SHORT;
    trunksMaintBusy        : SHORT;
    end;


  ATTQueryTrunkGroupMeasurementsConfEvent_t = record
    returnedItems : ATTTrunkGroupMeasurementsPresent_t;
    values        : ATTTrunkGroupMeasurements_t;
    end;


  ATTVdnMeasurementsPresent_t = record
    allMeasurements     : Boolean;
    acceptableSvcLevel  : Boolean;
    acdCalls            : Boolean;
    avgACDTalkTime      : Boolean;
    avgSpeedOfAnswer    : Boolean;
    avgTimeToAbandon    : Boolean;
    callsAbandoned      : Boolean;
    callsFlowedOut      : Boolean;
    callsForcedBusyDisc : Boolean;
    callsOffered        : Boolean;
    callsWaiting        : Boolean;
    callsNonACD         : Boolean;
    oldestCallWaiting   : Boolean;
    percentInSvcLevel   : Boolean;
    totalACDTalkTime    : Boolean;
    extension           : Boolean;
    name                : Boolean;
    end;


  ATTVdnMeasurements_t = record
    acceptableSvcLevel : SHORT;
    acdCalls           : Integer;
    avgACDTalkTime     : Integer;
    avgSpeedOfAnswer   : SHORT;
    avgTimeToAbandon   : SHORT;
    callsAbandoned     : Integer;
    callsFlowedOut     : Integer;
    callsForcedBusyDisc: Integer;
    callsOffered       : Integer;
    callsWaiting       : SHORT;
    callsNonACD        : Integer;
    oldestCallWaiting  : SHORT;
    percentInSvcLevel  : UCHAR;
    totalACDTalkTime   : Integer;
    extension          : array [0..5] of Char;
    name               : array [0..15] of Char;
    end;



  ATTQueryVdnMeasurementsConfEvent_t = record
    returnedItems : ATTVdnMeasurementsPresent_t;
    values        : ATTVdnMeasurements_t;
    end;


  ATTLocalCallState_t  = ( ATT_CS_INITIATED = 1,
    ATT_CS_ALERTING                         = 2,
    ATT_CS_CONNECTED                        = 3,
    ATT_CS_HELD                             = 4,
    ATT_CS_BRIDGED                          = 5,
    ATT_CS_OTHER                            = 6 );


  ATTSnapshotDevice_t = record
    call  : ConnectionID_t;
    state : ATTLocalCallState_t;
    end;

  pATTSnapshotDevice_t = ^ATTSnapshotDevice_t;


  ATTSnapshotDeviceConfEvent_t = record
    count           : Integer;
    pSnapshotDevice : pATTSnapshotDevice_t;
    end;


  ATTPrivateFilter_t = UCHAR;


  ATTMonitorConfEvent_t = record
    usedFilter : ATTPrivateFilter_t;
    end;


  ATTSnapshotCall_t = record
    count : Integer;
    pInfo : pCSTASnapshotCallResponseInfo_t;
    end;


  ATTMonitorCallConfEvent_t = record
    usedFilter   : ATTPrivateFilter_t;
    snapshotCall : ATTSnapshotCall_t;
    end;


  ATTMonitorStopOnCallConfEvent_t = record
    null : Nulltype;
    end;


  ATTCallClearedEvent_t = record
    reason : ATTReasonCode_t;
    end;


  ATTTrunkInfo_t = record
    connection : ConnectionID_t;
    trunkGroup : DeviceID_t;
    trunkMember: DeviceID_t;
    end;

  ATTTrunkList_t = record
    count  : SHORT;
    trunks : array [0..MAX_TRUNKS - 1] of ATTTrunkInfo_t;
    end;



  ATTConferencedEvent_t = record
    originalCallInfo   : ATTOriginalCallInfo_t;
    distributingDevice : CalledDeviceID_t;
    ucid               : ATTUCID_t;
    trunkList          : ATTTrunkList_t;
    end;



  ATTConnectionClearedEvent_t = record
    userInfo : ATTUserToUserInfo_t;
    end;


  ATTEnteredDigitsEvent_t = record
    connection          : ConnectionID_t;
    digits              : array [0..24] of Char;
    localConnectionInfo : LocalConnectionState_t;
    cause               : CSTAEventCause_t ;
    end;

  ATTEstablishedEvent_t = record
    trunkGroup         : DeviceID_t;
    trunkMember        : DeviceID_t;
    split              : DeviceID_t;
    lookaheadInfo      : ATTLookaheadInfo_t;
    userEnteredCode    : ATTUserEnteredCode_t;
    userInfo           : ATTUserToUserInfo_t;
    reason             : ATTReasonCode_t;
    originalCallInfo   : ATTOriginalCallInfo_t;
    distributingDevice : CalledDeviceID_t;
    ucid               : ATTUCID_t;
    callOriginatorInfo : ATTCallOriginatorInfo_t;
    flexibleBilling    : Boolean;
    end;


  ATTLoggedOnEvent_t = record
    workMode : ATTWorkMode_t;
    end;


  ATTProgressLocation_t = ( PL_NONE = -1,
    PL_USER                         =  0,
    PL_PUB_LOCAL                    =  1,
    PL_PUB_REMOTE                   =  4,
    PL_PRIV_REMOTE                  =  5 );


  ATTProgressDescription_t = ( PD_NONE = -1,
    PD_CALL_OFF_ISDN                   =  1,
    PD_DEST_NOT_ISDN                   =  2,
    PD_ORIG_NOT_ISDN                   =  3,
    PD_CALL_ON_ISDN                    =  4,
    PD_INBAND                          =  8 );

  ATTNetworkReachedEvent_t = record
    progressLocation    : ATTProgressLocation_t;
    progressDescription : ATTProgressDescription_t;
    trunkGroup          : DeviceID_t;
    trunkMember         : DeviceID_t;
    end;


  ATTOriginatedEvent_t = record
    logicalAgent : DeviceID_t;
    userInfo     : ATTUserToUserInfo_t;
    end;


  ATTTransferredEvent_t = record
    originalCallInfo   : ATTOriginalCallInfo_t;
    distributingDevice : CalledDeviceID_t ;
    ucid               : ATTUCID_t;
    trunkList          : ATTTrunkList_t;
    end;


  ATTRouteRequestEvent_t  = record
    trunkGroup         : DeviceID_t;
    lookaheadInfo      : ATTLookaheadInfo_t;
    userEnteredCode    : ATTUserEnteredCode_t;
    userInfo           : ATTUserToUserInfo_t;
    ucid               : ATTUCID_t;
    callOriginatorInfo : ATTCallOriginatorInfo_t;
    flexibleBilling    : Boolean;
    trunkMember        : DeviceID_t;
    end;


  ATTRouteUsedEvent_t = record
    destRoute : DeviceID_t;
    end;


  ATTLinkState_t = ( LS_LINK_UNAVAIL = 0,
    LS_LINK_UP                       = 1,
    LS_LINK_DOWN                     = 2 );


  ATTLinkStatus_t = record
    linkID    : SHORT;
    linkState : ATTLinkState_t;
    end;

  pATTLinkStatus_t = ^ATTLinkStatus_t;


  ATTLinkStatusEvent_t = record
    count      : Integer;
    pLinkStatus: pATTLinkStatus_t;
    end;


  ATTGetAPICapsConfEvent_t = record
    switchVersion              : array [0..15] of Char;
    sendDTMFTone               : Boolean;
    enteredDigitsEvent         : Boolean;
    queryDeviceName            : Boolean;
    queryAgentMeas             : Boolean;
    querySplitSkillMeas        : Boolean;
    queryTrunkGroupMeas        : Boolean;
    queryVdnMeas               : Boolean;
    singleStepConference       : Boolean;
    selectiveListeningHold     : Boolean;
    selectiveListeningRetrieve : Boolean;
    setBillingRate             : Boolean;
    queryUCID                  : Boolean;
    chargeAdviceEvent          : Boolean;
    reserved1                  : Boolean;
    reserved2                  : Boolean;
    end;


  ATTServiceInitiatedEvent_t = record
    ucid: ATTUCID_t;
    end;


  ATTChargeType_t = ( CT_INTERMEDIATE_CHARGE = 1,
    CT_FINAL_CHARGE        = 2,
    CT_SPLIT_CHARGE        = 3 );

  ATTChargeError_t = ( CE_NONE = 0,
    CE_NO_FINAL_CHARGE         = 1,
    CE_LESS_FINAL_CHARGE       = 2,
    CE_CHARGE_TOO_LARGE        = 3,
    CE_NETWORK_BUSY            = 4 );


  ATTChargeAdviceEvent_t = record
    connection     : ConnectionID_t;
    calledDevice   : DeviceID_t;
    chargingDevice : DeviceID_t;
    trunkGroup     : DeviceID_t;
    trunkMember    : DeviceID_t;
    chargeType     : ATTChargeType_t;
    charge         : Integer;
    error          : ATTChargeError_t;
    end;


  ATTSetBillRateConfEvent_t = record
    null : Nulltype;
    end;


  ATTQueryUcidConfEvent_t = record
    ucid : ATTUCID_t;
    end;


  ATTLoggedOffEvent_t = record
    reasonCode : Integer;
    end;


  ATTConsultationCallConfEvent_t = record
    ucid : ATTUCID_t;
    end;


  ATTConferenceCallConfEvent_t = record
    ucid : ATTUCID_t;
    end;


  ATTMakePredictiveCallConfEvent_t = record
    ucid : ATTUCID_t;
    end;


  ATTTransferCallConfEvent_t = record
    ucid : ATTUCID_t;
    end;


  ATTSetAdviceOfChargeConfEvent_t = record
    null : Nulltype;
    end;


  ATTSetAgentStateConfEvent_t = record
    isPending : Boolean;
    end;


  ATTV4LookaheadInfo_t = record
    type_     : ATTInterflow_t;
    priority  : ATTPriority_t;
    hours     : SHORT;
    minutes   : SHORT;
    seconds   : SHORT;
    sourceVDN : DeviceID_t;
    end;


  ATTV4OriginalCallInfo_t = record
    reason          : ATTReasonForCallInfo_t;
    callingDevice   : CallingDeviceID_t;
    calledDevice    : CalledDeviceID_t;
    trunk           : DeviceID_t;
    trunkMember     : DeviceID_t;
    lookaheadInfo   : ATTV4LookaheadInfo_t;
    userEnteredCode : ATTUserEnteredCode_t;
    userInfo        : ATTV5UserToUserInfo_t;
    end;


  ATTV3ConferencedEvent_t = record
    originalCallInfo : ATTV4OriginalCallInfo_t;
    end;


  ATTV3DeliveredEvent_t = record
    deliveredType    : ATTDeliveredType_t;
    trunk            : DeviceID_t;
    trunkMember      : DeviceID_t;
    split            : DeviceID_t;
    lookaheadInfo    : ATTV4LookaheadInfo_t;
    userEnteredCode  : ATTUserEnteredCode_t;
    userInfo         : ATTV5UserToUserInfo_t;
    reason           : ATTReasonCode_t;
    originalCallInfo : ATTV4OriginalCallInfo_t;
    end;


  ATTV3EstablishedEvent_t = record
    trunk            : DeviceID_t;
    trunkMember      : DeviceID_t;
    split            : DeviceID_t;
    lookaheadInfo    : ATTV4LookaheadInfo_t;
    userEnteredCode  : ATTUserEnteredCode_t;
    userInfo         : ATTV5UserToUserInfo_t;
    reason           : ATTReasonCode_t;
    originalCallInfo : ATTV4OriginalCallInfo_t;
    end;


  ATTV3TransferredEvent_t = record
    originalCallInfo : ATTV4OriginalCallInfo_t;
    end;


  ATTV3LinkStatusEvent_t = record
    count      : SHORT;
    linkStatus : array [0..3] of ATTLinkStatus_t;
    end;


  ATTV4QueryDeviceInfoConfEvent_t = record
    extensionClass : ATTExtensionClass_t;
    end;


  ATTV4GetAPICapsConfEvent_t = record
    switchVersion : array [0..15] of Char;
    sendDTMFTone        :Boolean;
    enteredDigitsEvent  :Boolean;
    queryDeviceName     :Boolean;
    queryAgentMeas      :Boolean;
    querySplitSkillMeas :Boolean;
    queryTrunkGroupMeas :Boolean;
    queryVdnMeas        :Boolean;
    reserved1           :Boolean;
    reserved2           :Boolean;
    end;


  ATTV4SnapshotDeviceConfEvent_t = record
    count : SHORT;
    snapshotDevice : array [0..5] of ATTSnapshotDevice_t;
    end;


  ATTV4ConferencedEvent_t = record
    originalCallInfo   : ATTV4OriginalCallInfo_t;
    distributingDevice : CalledDeviceID_t;
    end;


  ATTV4DeliveredEvent_t = record
    deliveredType      : ATTDeliveredType_t;
    trunk              : DeviceID_t;
    trunkMember        : DeviceID_t;
    split              : DeviceID_t;
    lookaheadInfo      : ATTV4LookaheadInfo_t;
    userEnteredCode    : ATTUserEnteredCode_t;
    userInfo           : ATTV5UserToUserInfo_t;
    reason             : ATTReasonCode_t;
    originalCallInfo   : ATTV4OriginalCallInfo_t;
    distributingDevice : CalledDeviceID_t;
    end;


  ATTV4EstablishedEvent_t = record
    trunk              : DeviceID_t;
    trunkMember        : DeviceID_t;
    split              : DeviceID_t;
    lookaheadInfo      : ATTV4LookaheadInfo_t;
    userEnteredCode    : ATTUserEnteredCode_t;
    userInfo           : ATTV5UserToUserInfo_t;
    reason             : ATTReasonCode_t;
    originalCallInfo   : ATTV4OriginalCallInfo_t;
    distributingDevice : CalledDeviceID_t;
    end;


  ATTV4TransferredEvent_t = record
    originalCallInfo   : ATTV4OriginalCallInfo_t;
    distributingDevice : CalledDeviceID_t;
    end;


  ATTV4LinkStatusEvent_t = record
    count     : SHORT;
    linkStatus: array [0..7] of ATTLinkStatus_t;
    end;


  ATTV4RouteRequestEvent_t = record
    trunk           : DeviceID_t;
    lookaheadInfo   : ATTV4LookaheadInfo_t;
    userEnteredCode : ATTUserEnteredCode_t;
    userInfo        : ATTV5UserToUserInfo_t;
    end;


  ATTV4QueryAgentStateConfEvent_t = record
    workMode  : ATTWorkMode_t;
    talkState : ATTTalkState_t;
    end;


  ATTV4QueryDeviceNameConfEvent_t = record
    deviceType : ATTDeviceType_t;
    device     : DeviceID_t;
    name       : array [0..15] of Char;
    end;


  ATTV4PrivateFilter_t = UCHAR;


  ATTV4MonitorConfEvent_t = record
    usedFilter : ATTV4PrivateFilter_t;
    end;


  ATTV4SnapshotCall_t = record
    count : SHORT;
    info : array [0..5] of CSTASnapshotCallResponseInfo_t;
    end;


  ATTV4MonitorCallConfEvent_t = record
    usedFilter   : ATTV4PrivateFilter_t;
    snapshotCall : ATTV4SnapshotCall_t;
    end;


  ATTV4NetworkReachedEvent_t = record
    progressLocation    : ATTProgressLocation_t;
    progressDescription : ATTProgressDescription_t;
    end;


  ATTV5QueryAgentStateConfEvent_t = record
    workMode   : ATTWorkMode_t;
    talkState  : ATTTalkState_t;
    reasonCode : Integer;
    end;


  ATTV5RouteRequestEvent_t = record
    trunkGroup         : DeviceID_t;
    lookaheadInfo      : ATTLookaheadInfo_t;
    userEnteredCode    : ATTUserEnteredCode_t;
    userInfo           : ATTV5UserToUserInfo_t;
    ucid               : ATTUCID_t;
    callOriginatorInfo : ATTCallOriginatorInfo_t;
    flexibleBilling    : Boolean;
    end;


  ATTV5OriginalCallInfo_t = record
    reason             : ATTReasonForCallInfo_t;
    callingDevice      : CallingDeviceID_t;
    calledDevice       : CalledDeviceID_t;
    trunkGroup         : DeviceID_t;
    trunkMember        : DeviceID_t;
    lookaheadInfo      : ATTLookaheadInfo_t;
    userEnteredCode    : ATTUserEnteredCode_t;
    userInfo           : ATTV5UserToUserInfo_t;
    ucid               : ATTUCID_t;
    callOriginatorInfo : ATTCallOriginatorInfo_t;
    flexibleBilling    : Boolean;
    end;


  ATTV5TransferredEvent_t = record
    originalCallInfo   : ATTV5OriginalCallInfo_t;
    distributingDevice : CalledDeviceID_t ;
    ucid               : ATTUCID_t;
    end;


  ATTV5ConferencedEvent_t = record
    originalCallInfo   : ATTV5OriginalCallInfo_t;
    distributingDevice : CalledDeviceID_t;
    ucid               : ATTUCID_t;
    end;


  ATTV5ConnectionClearedEvent_t = record
    userInfo : ATTV5UserToUserInfo_t;
    end;

  ATTV5OriginatedEvent_t = record
    logicalAgent : DeviceID_t;
    userInfo     : ATTV5UserToUserInfo_t;
    end;


  ATTV5EstablishedEvent_t = record
    trunkGroup         : DeviceID_t;
    trunkMember        : DeviceID_t;
    split              : DeviceID_t;
    lookaheadInfo      : ATTLookaheadInfo_t;
    userEnteredCode    : ATTUserEnteredCode_t;
    userInfo           : ATTV5UserToUserInfo_t;
    reason             : ATTReasonCode_t;
    originalCallInfo   : ATTV5OriginalCallInfo_t;
    distributingDevice : CalledDeviceID_t;
    ucid               : ATTUCID_t;
    callOriginatorInfo : ATTCallOriginatorInfo_t;
    flexibleBilling    : Boolean;
    end;


  ATTV5DeliveredEvent_t = record
    deliveredType      : ATTDeliveredType_t;
    trunkGroup         : DeviceID_t;
    trunkMember        : DeviceID_t;
    split              : DeviceID_t;
    lookaheadInfo      : ATTLookaheadInfo_t;
    userEnteredCode    : ATTUserEnteredCode_t;
    userInfo           : ATTV5UserToUserInfo_t;
    reason             : ATTReasonCode_t;
    originalCallInfo   : ATTV5OriginalCallInfo_t ;
    distributingDevice : CalledDeviceID_t ;
    ucid               : ATTUCID_t;
    callOriginatorInfo : ATTCallOriginatorInfo_t;
    flexibleBilling    : Boolean;
    end;


  ATTDropResource_t = ( DR_NONE = -1,
    DR_CALL_CLASSIFIER          =  0,
    DR_TONE_GENERATOR           =  1 );


  ATTClearConnection_t = record
    dropResource : ATTDropResource_t;
    userInfo     : ATTUserToUserInfo_t;
    end;


  ATTConsultationCall_t = record
    destRoute       : DeviceID_t;
    priorityCalling : Boolean;
    userInfo        : ATTUserToUserInfo_t;
    end;


  ATTMakeCall_t = record
    destRoute       : DeviceID_t;
    priorityCalling : Boolean;
    userInfo        : ATTUserToUserInfo_t;
    end;


  ATTDirectAgentCall_t = record
    split           : DeviceID_t;
    priorityCalling : Boolean;
    userInfo        : ATTUserToUserInfo_t;
    end;


  ATTAnswerTreat_t = ( AT_NO_TREATMENT = 0,
    AT_NONE                            = 1,
    AT_DROP                            = 2,
    AT_CONNECT                         = 3 );


  ATTMakePredictiveCall_t = record
    priorityCalling : Boolean;
    maxRings        : SHORT;
    answerTreat     : ATTAnswerTreat_t;
    destRoute       : DeviceID_t;
    userInfo        : ATTUserToUserInfo_t;
    end;


  ATTSupervisorAssistCall_t = record
    split    : DeviceID_t;
    userInfo : ATTUserToUserInfo_t;
    end;


  ATTReconnectCall_t = record
    dropResource : ATTDropResource_t;
    userInfo     : ATTUserToUserInfo_t;
    end;


  ATTConnIDList_t = record
    count : Integer;
    pParty: pConnectionID_t;
    end;


  ATTSendDTMFTone_t = record
    sender        : ConnectionID_t;
    receivers     : ATTConnIDList_t;
    tones         : array [0..32] of Char;
    toneDuration  : SHORT;
    pauseDuration : SHORT;
    end;


  ATTParticipationType_t = ( PT_ACTIVE = 1,
    PT_SILENT = 0 );


  ATTSingleStepConferenceCall_t = record
    activeCall        : ConnectionID_t;
    deviceToBeJoin    : DeviceID_t;
    participationType : ATTParticipationType_t;
    alertDestination  : Boolean;
    end;


  ATTSelectiveListeningHold_t = record
    subjectConnection : ConnectionID_t;
    allParties        : Boolean;
    selectedParty     : ConnectionID_t;
    end;


  ATTSelectiveListeningRetrieve_t = record
    subjectConnection : ConnectionID_t;
    allParties        : Boolean;
    selectedParty     : ConnectionID_t;
    end;


  ATTSetAgentState_t = record
    workMode      : ATTWorkMode_t;
    reasonCode    : Integer;
    enablePending : Boolean;
    end;


  ATTQueryAgentState_t = record
    split : DeviceID_t;
    end;


  ATTQueryAcdSplit_t = record
    device: DeviceID_t;
    end;


  ATTQueryAgentLogin_t = record
    device: DeviceID_t;
    end;


  ATTQueryCallClassifier_t = record
    null : nulltype;
    end;


  ATTQueryDeviceName_t = record
    device : DeviceID_t;
    end;


  ATTQueryStationStatus_t = record
    device : DeviceID_t;
    end;


  ATTQueryTod_t = record
    null : Nulltype;
    end;


  ATTQueryTg_t = record
    device : DeviceID_t;
    end;


  ATTAgentTypeID_t = ( EXTENSION_ID = 0,
    LOGICAL_ID   = 1 );


  ATTSplitSkill_t = ( SPLIT_SKILL_NONE = -1,
    SPLIT_SKILL_ALL                    =  0,
    SPLIT_SKILL1                       =  1,
    SPLIT_SKILL2                       =  2,
    SPLIT_SKILL3                       =  3,
    SPLIT_SKILL4                       =  4 );

  ATTInterval_t = SHORT;

  ATTQueryAgentMeasurements_t = record
    agentID      : DeviceID_t;
    typeID       : ATTAgentTypeID_t;
    splitSkill   : ATTSplitSkill_t;
    requestItems : ATTAgentMeasurementsPresent_t;
    interval     : ATTInterval_t;
    end;


  ATTQuerySplitSkillMeasurements_t = record
    device       : DeviceID_t;
    requestItems : ATTSplitSkillMeasurementsPresent_t;
    interval     : ATTInterval_t;
    end;


  ATTQueryTrunkGroupMeasurements_t = record
    device : DeviceID_t;
    requestItems : ATTTrunkGroupMeasurementsPresent_t;
    interval     : ATTInterval_t;
    end;


  ATTQueryVdnMeasurements_t = record
    device       : DeviceID_t;
    requestItems : ATTVdnMeasurementsPresent_t;
    interval     : ATTInterval_t;
    end;


  ATTMonitorFilter_t = record
    privateFilter : ATTPrivateFilter_t;
    end;


  ATTMonitorStopOnCall_t = record
    monitorCrossRefID : CSTAMonitorCrossRefID_t;
    call              : ConnectionID_t;
    end;


  ATTCollectCodeType_t = ( UC_NONE = 0,
    UC_TONE_DETECTOR               = 32 );


  ATTSpecificEvent_t  = ( SE_ANSWER     = 11,
    SE_DISCONNECT                       = 4 );


  ATTUserCollectCode_t = record
    _type               : ATTCollectCodeType_t;
    digitsToBeCollected : SHORT;
    timeout             : SHORT;
    collectParty        : ConnectionID_t;
    specificEvent       : ATTSpecificEvent_t;
    end;


  ATTProvidedCodeType_t = ( UP_NONE               = 0,
    UP_DATA_BASE_PROVIDED                         = 17 );


  ATTUserProvidedCode_t = record
    _type : ATTProvidedCodeType_t;
    data  : array [0..24] of Char;
    end;


  ATTRouteSelect_t = record
    callingDevice        : DeviceID_t;
    directAgentCallSplit : DeviceID_t;
    priorityCalling      : Boolean;
    destRoute            : DeviceID_t;
    collectCode          : ATTUserCollectCode_t;
    userProvidedCode     : ATTUserProvidedCode_t;
    userInfo             : ATTUserToUserInfo_t;
    end;


  ATTSysStat_t = record
    linkStatusReq : Boolean;
    end;


  ATTBillType_t = ( BT_NEW_RATE       = 16,
    BT_FLAT_RATE                      = 17,
    BT_PREMIUM_CHARGE                 = 18,
    BT_PREMIUM_CREDIT                 = 19,
    BT_FREE_CALL                      = 24 );


  ATTSetBillRate_t = record
    call     : ConnectionID_t;
    billType : ATTBillType_t;
    billRate : real;
    end;


  ATTQueryUcid_t = record
    call: ConnectionID_t;
    end;


  ATTSetAdviceOfCharge_t = record
    featureFlag : Boolean;
    end;


  ATTV4ConnIDList_t = record
    count : SHORT;
    party : array [0..4] of ConnectionID_t;
    end;


  ATTV4SendDTMFTone_t = record
    sender        : ConnectionID_t;
    receivers     : ATTV4ConnIDList_t;
    tones         : array [0..32] of Char;
    toneDuration  : SHORT;
    pauseDuration : SHORT;
    end;


  ATTV4SetAgentState_t = record
    workMode : ATTWorkMode_t;
    end;


  ATTV4MonitorFilter_t = record
    privateFilter : ATTV4PrivateFilter_t;
    end;


  ATTV5SetAgentState_t = record
    workMode   : ATTWorkMode_t;
    reasonCode : Integer;
    end;


  ATTV5ClearConnection_t = record
    dropResource : ATTDropResource_t;
    userInfo     : ATTV5UserToUserInfo_t;
    end;


  ATTV5ConsultationCall_t = record
    destRoute       : DeviceID_t;
    priorityCalling : Boolean;
    userInfo        : ATTV5UserToUserInfo_t;
    end;

  ATTV5MakeCall_t = record
    destRoute       : DeviceID_t;
    priorityCalling : Boolean;
    userInfo        : ATTV5UserToUserInfo_t;
    end;


  ATTV5DirectAgentCall_t = record
    split           : DeviceID_t;
    priorityCalling : Boolean;
    userInfo        : ATTV5UserToUserInfo_t;
    end;


  ATTV5MakePredictiveCall_t = record
    priorityCalling : Boolean;
    maxRings        : SHORT;
    answerTreat     : ATTAnswerTreat_t;
    destRoute       : DeviceID_t;
    userInfo        : ATTV5UserToUserInfo_t;
    end;


  ATTV5SupervisorAssistCall_t = record
    split    : DeviceID_t;
    userInfo : ATTV5UserToUserInfo_t;
    end;


  ATTV5ReconnectCall_t = record
    dropResource : ATTDropResource_t;
    userInfo     : ATTV5UserToUserInfo_t;
    end;


  ATTV5RouteSelect_t = record
    callingDevice        : DeviceID_t;
    directAgentCallSplit : DeviceID_t;
    priorityCalling      : Boolean;
    destRoute            : DeviceID_t;
    collectCode          : ATTUserCollectCode_t;
    userProvidedCode     : ATTUserProvidedCode_t;
    userInfo             : ATTV5UserToUserInfo_t;
    end;


implementation

end.
