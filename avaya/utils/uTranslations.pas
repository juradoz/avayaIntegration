{******************************************************************************
                                Autor: Daniel Jurado
                                 jurado@gmail.com
******************************************************************************}
unit uTranslations;

interface

uses
  SysUtils, uACSdefs_h, uACS_h, uCSTAdefs_h, uCSTA_h, uATTPDefs_h, uATTPriv_h;

function EventTypeToStr(EventClass: EventClass_t; EventType: EventType_t): String;
function EventClassToStr(EventClass: EventClass_t): String;
function CSTAUniversalFailureToStr(CSTAUniversalFailure: CSTAUniversalFailure_t): String;
function ACSUniversalFailureToStr(ACSUniversalFailure: ACSUniversalFailure_t): String;
function CtReturnToStr(ErrorCode: TSAPI): String;
function DeviceTypeToStr(DeviceType: DeviceType_t): String;
function CallStateToStr(CSTASimpleCallState: CSTASimpleCallState_t): String;
function LocalConnectionStateToStr(LocalConnectionState: LocalConnectionState_t): String;
function ATTEventTypeToStr(ATTEventType : ATTEventType_t): String;
function CSTAEventCauseToStr( CSTAEventCause : CSTAEventCause_t ) : String;
function ATTDeliveredTypeToStr( ATTDeliveredType : ATTDeliveredType_t ) : String;
function ATTReasonCodeToStr( ATTReasonCode : ATTReasonCode_t ) : String;
function ATTProgressLocationToStr( ATTProgressLocation : ATTProgressLocation_t ) : String;
function ATTProgressDescriptionToStr( ATTProgressDescription : ATTProgressDescription_t ) : String;
function AgentStateToStr( agentState : AgentState_t ) : String;
function AgentModeToStr( agentMode : AgentMode_t ) : String;
function ATTWorkModeToStr( workMode : ATTWorkMode_t ) : String;
function ATTTalkStateToStr( talkState : ATTTalkState_t ) : String;
function ATTUserToUserInfoToString( userInfo : ATTUserToUserInfo_t ) : String;

implementation

function EventTypeToStr(EventClass: EventClass_t; EventType: EventType_t): String;
begin
case EventClass of
  CSTAREQUEST, CSTAUNSOLICITED, CSTACONFIRMATION, CSTAEVENTREPORT_:
    begin

    case EventType of
      CSTA_ALTERNATE_CALL              : Result := 'CSTA_ALTERNATE_CALL';
      CSTA_ALTERNATE_CALL_CONF         : Result := 'CSTA_ALTERNATE_CALL_CONF';
      CSTA_ANSWER_CALL                 : Result := 'CSTA_ANSWER_CALL';
      CSTA_ANSWER_CALL_CONF            : Result := 'CSTA_ANSWER_CALL_CONF';
      CSTA_CALL_COMPLETION             : Result := 'CSTA_CALL_COMPLETION';
      CSTA_CALL_COMPLETION_CONF        : Result := 'CSTA_CALL_COMPLETION_CONF';
      CSTA_CLEAR_CALL                  : Result := 'CSTA_CLEAR_CALL';
      CSTA_CLEAR_CALL_CONF             : Result := 'CSTA_CLEAR_CALL_CONF';
      CSTA_CLEAR_CONNECTION            : Result := 'CSTA_CLEAR_CONNECTION';
      CSTA_CLEAR_CONNECTION_CONF       : Result := 'CSTA_CLEAR_CONNECTION_CONF';
      CSTA_CONFERENCE_CALL             : Result := 'CSTA_CONFERENCE_CALL';
      CSTA_CONFERENCE_CALL_CONF        : Result := 'CSTA_CONFERENCE_CALL_CONF';
      CSTA_CONSULTATION_CALL           : Result := 'CSTA_CONSULTATION_CALL';
      CSTA_CONSULTATION_CALL_CONF      : Result := 'CSTA_CONSULTATION_CALL_CONF';
      CSTA_DEFLECT_CALL                : Result := 'CSTA_DEFLECT_CALL';
      CSTA_DEFLECT_CALL_CONF           : Result := 'CSTA_DEFLECT_CALL_CONF';
      CSTA_PICKUP_CALL                 : Result := 'CSTA_PICKUP_CALL';
      CSTA_PICKUP_CALL_CONF            : Result := 'CSTA_PICKUP_CALL_CONF';
      CSTA_GROUP_PICKUP_CALL           : Result := 'CSTA_GROUP_PICKUP_CALL';
      CSTA_GROUP_PICKUP_CALL_CONF      : Result := 'CSTA_GROUP_PICKUP_CALL_CONF';
      CSTA_HOLD_CALL                   : Result := 'CSTA_HOLD_CALL';
      CSTA_HOLD_CALL_CONF              : Result := 'CSTA_HOLD_CALL_CONF';
      CSTA_MAKE_CALL                   : Result := 'CSTA_MAKE_CALL';
      CSTA_MAKE_CALL_CONF              : Result := 'CSTA_MAKE_CALL_CONF';
      CSTA_MAKE_PREDICTIVE_CALL        : Result := 'CSTA_MAKE_PREDICTIVE_CALL';
      CSTA_MAKE_PREDICTIVE_CALL_CONF   : Result := 'CSTA_MAKE_PREDICTIVE_CALL_CONF';
      CSTA_QUERY_MWI                   : Result := 'CSTA_QUERY_MWI';
      CSTA_QUERY_MWI_CONF              : Result := 'CSTA_QUERY_MWI_CONF';
      CSTA_QUERY_DND                   : Result := 'CSTA_QUERY_DND';
      CSTA_QUERY_DND_CONF              : Result := 'CSTA_QUERY_DND_CONF';
      CSTA_QUERY_FWD                   : Result := 'CSTA_QUERY_FWD';
      CSTA_QUERY_FWD_CONF              : Result := 'CSTA_QUERY_FWD_CONF';
      CSTA_QUERY_AGENT_STATE           : Result := 'CSTA_QUERY_AGENT_STATE';
      CSTA_QUERY_AGENT_STATE_CONF      : Result := 'CSTA_QUERY_AGENT_STATE_CONF';
      CSTA_QUERY_LAST_NUMBER           : Result := 'CSTA_QUERY_LAST_NUMBER';
      CSTA_QUERY_LAST_NUMBER_CONF      : Result := 'CSTA_QUERY_LAST_NUMBER_CONF';
      CSTA_QUERY_DEVICE_INFO           : Result := 'CSTA_QUERY_DEVICE_INFO';
      CSTA_QUERY_DEVICE_INFO_CONF      : Result := 'CSTA_QUERY_DEVICE_INFO_CONF';
      CSTA_RECONNECT_CALL              : Result := 'CSTA_RECONNECT_CALL';
      CSTA_RECONNECT_CALL_CONF         : Result := 'CSTA_RECONNECT_CALL_CONF';
      CSTA_RETRIEVE_CALL               : Result := 'CSTA_RETRIEVE_CALL';
      CSTA_RETRIEVE_CALL_CONF          : Result := 'CSTA_RETRIEVE_CALL_CONF';
      CSTA_SET_MWI                     : Result := 'CSTA_SET_MWI';
      CSTA_SET_MWI_CONF                : Result := 'CSTA_SET_MWI_CONF';
      CSTA_SET_DND                     : Result := 'CSTA_SET_DND';
      CSTA_SET_DND_CONF                : Result := 'CSTA_SET_DND_CONF';
      CSTA_SET_FWD                     : Result := 'CSTA_SET_FWD';
      CSTA_SET_FWD_CONF                : Result := 'CSTA_SET_FWD_CONF';
      CSTA_SET_AGENT_STATE             : Result := 'CSTA_SET_AGENT_STATE';
      CSTA_SET_AGENT_STATE_CONF        : Result := 'CSTA_SET_AGENT_STATE_CONF';
      CSTA_TRANSFER_CALL               : Result := 'CSTA_TRANSFER_CALL';
      CSTA_TRANSFER_CALL_CONF          : Result := 'CSTA_TRANSFER_CALL_CONF';
      CSTA_UNIVERSAL_FAILURE_CONF      : Result := 'CSTA_UNIVERSAL_FAILURE_CONF';
      CSTA_CALL_CLEARED                : Result := 'CSTA_CALL_CLEARED';
      CSTA_CONFERENCED                 : Result := 'CSTA_CONFERENCED';
      CSTA_CONNECTION_CLEARED          : Result := 'CSTA_CONNECTION_CLEARED';
      CSTA_DELIVERED                   : Result := 'CSTA_DELIVERED';
      CSTA_DIVERTED                    : Result := 'CSTA_DIVERTED';
      CSTA_ESTABLISHED                 : Result := 'CSTA_ESTABLISHED';
      CSTA_FAILED                      : Result := 'CSTA_FAILED';
      CSTA_HELD                        : Result := 'CSTA_HELD';
      CSTA_NETWORK_REACHED             : Result := 'CSTA_NETWORK_REACHED';
      CSTA_ORIGINATED                  : Result := 'CSTA_ORIGINATED';
      CSTA_QUEUED                      : Result := 'CSTA_QUEUED';
      CSTA_RETRIEVED                   : Result := 'CSTA_RETRIEVED';
      CSTA_SERVICE_INITIATED           : Result := 'CSTA_SERVICE_INITIATED';
      CSTA_TRANSFERRED                 : Result := 'CSTA_TRANSFERRED';
      CSTA_CALL_INFORMATION            : Result := 'CSTA_CALL_INFORMATION';
      CSTA_DO_NOT_DISTURB              : Result := 'CSTA_DO_NOT_DISTURB';
      CSTA_FORWARDING                  : Result := 'CSTA_FORWARDING';
      CSTA_MESSAGE_WAITING             : Result := 'CSTA_MESSAGE_WAITING';
      CSTA_LOGGED_ON                   : Result := 'CSTA_LOGGED_ON';
      CSTA_LOGGED_OFF                  : Result := 'CSTA_LOGGED_OFF';
      CSTA_NOT_READY                   : Result := 'CSTA_NOT_READY';
      CSTA_READY                       : Result := 'CSTA_READY';
      CSTA_WORK_NOT_READY              : Result := 'CSTA_WORK_NOT_READY';
      CSTA_WORK_READY                  : Result := 'CSTA_WORK_READY';
      CSTA_ROUTE_REGISTER_REQ          : Result := 'CSTA_ROUTE_REGISTER_REQ';
      CSTA_ROUTE_REGISTER_REQ_CONF     : Result := 'CSTA_ROUTE_REGISTER_REQ_CONF';
      CSTA_ROUTE_REGISTER_CANCEL       : Result := 'CSTA_ROUTE_REGISTER_CANCEL';
      CSTA_ROUTE_REGISTER_CANCEL_CONF  : Result := 'CSTA_ROUTE_REGISTER_CANCEL_CONF';
      CSTA_ROUTE_REGISTER_ABORT        : Result := 'CSTA_ROUTE_REGISTER_ABORT';
      CSTA_ROUTE_REQUEST               : Result := 'CSTA_ROUTE_REQUEST';
      CSTA_ROUTE_SELECT_REQUEST        : Result := 'CSTA_ROUTE_SELECT_REQUEST';
      CSTA_RE_ROUTE_REQUEST            : Result := 'CSTA_RE_ROUTE_REQUEST';
      CSTA_ROUTE_USED                  : Result := 'CSTA_ROUTE_USED';
      CSTA_ROUTE_END                   : Result := 'CSTA_ROUTE_END';
      CSTA_ROUTE_END_REQUEST           : Result := 'CSTA_ROUTE_END_REQUEST';
      CSTA_ESCAPE_SVC                  : Result := 'CSTA_ESCAPE_SVC';
      CSTA_ESCAPE_SVC_CONF             : Result := 'CSTA_ESCAPE_SVC_CONF';
      CSTA_ESCAPE_SVC_REQ              : Result := 'CSTA_ESCAPE_SVC_REQ';
      CSTA_ESCAPE_SVC_REQ_CONF         : Result := 'CSTA_ESCAPE_SVC_REQ_CONF';
      CSTA_PRIVATE                     : Result := 'CSTA_PRIVATE';
      CSTA_PRIVATE_STATUS              : Result := 'CSTA_PRIVATE_STATUS';
      CSTA_SEND_PRIVATE                : Result := 'CSTA_SEND_PRIVATE';
      CSTA_BACK_IN_SERVICE             : Result := 'CSTA_BACK_IN_SERVICE';
      CSTA_OUT_OF_SERVICE              : Result := 'CSTA_OUT_OF_SERVICE';
      CSTA_REQ_SYS_STAT                : Result := 'CSTA_REQ_SYS_STAT';
      CSTA_SYS_STAT_REQ_CONF           : Result := 'CSTA_SYS_STAT_REQ_CONF';
      CSTA_SYS_STAT_START              : Result := 'CSTA_SYS_STAT_START';
      CSTA_SYS_STAT_START_CONF         : Result := 'CSTA_SYS_STAT_START_CONF';
      CSTA_SYS_STAT_STOP               : Result := 'CSTA_SYS_STAT_STOP';
      CSTA_SYS_STAT_STOP_CONF          : Result := 'CSTA_SYS_STAT_STOP_CONF';
      CSTA_CHANGE_SYS_STAT_FILTER      : Result := 'CSTA_CHANGE_SYS_STAT_FILTER';
      CSTA_CHANGE_SYS_STAT_FILTER_CONF : Result := 'CSTA_CHANGE_SYS_STAT_FILTER_CONF';
      CSTA_SYS_STAT                    : Result := 'CSTA_SYS_STAT';
      CSTA_SYS_STAT_ENDED              : Result := 'CSTA_SYS_STAT_ENDED';
      CSTA_SYS_STAT_REQ                : Result := 'CSTA_SYS_STAT_REQ ';
      CSTA_REQ_SYS_STAT_CONF           : Result := 'CSTA_REQ_SYS_STAT_CONF';
      CSTA_SYS_STAT_EVENT_SEND         : Result := 'CSTA_SYS_STAT_EVENT_SEND';
      CSTA_MONITOR_DEVICE              : Result := 'CSTA_MONITOR_DEVICE';
      CSTA_MONITOR_CALL                : Result := 'CSTA_MONITOR_CALL';
      CSTA_MONITOR_CALLS_VIA_DEVICE    : Result := 'CSTA_MONITOR_CALLS_VIA_DEVICE';
      CSTA_MONITOR_CONF                : Result := 'CSTA_MONITOR_CONF';
      CSTA_CHANGE_MONITOR_FILTER       : Result := 'CSTA_CHANGE_MONITOR_FILTER';
      CSTA_CHANGE_MONITOR_FILTER_CONF  : Result := 'CSTA_CHANGE_MONITOR_FILTER_CONF';
      CSTA_MONITOR_STOP                : Result := 'CSTA_MONITOR_STOP';
      CSTA_MONITOR_STOP_CONF           : Result := 'CSTA_MONITOR_STOP_CONF';
      CSTA_MONITOR_ENDED               : Result := 'CSTA_MONITOR_ENDED';
      CSTA_SNAPSHOT_CALL               : Result := 'CSTA_SNAPSHOT_CALL';
      CSTA_SNAPSHOT_CALL_CONF          : Result := 'CSTA_SNAPSHOT_CALL_CONF';
      CSTA_SNAPSHOT_DEVICE             : Result := 'CSTA_SNAPSHOT_DEVICE';
      CSTA_SNAPSHOT_DEVICE_CONF        : Result := 'CSTA_SNAPSHOT_DEVICE_CONF';
      CSTA_GETAPI_CAPS                 : Result := 'CSTA_GETAPI_CAPS';
      CSTA_GETAPI_CAPS_CONF            : Result := 'CSTA_GETAPI_CAPS_CONF';
      CSTA_GET_DEVICE_LIST             : Result := 'CSTA_GET_DEVICE_LIST';
      CSTA_GET_DEVICE_LIST_CONF        : Result := 'CSTA_GET_DEVICE_LIST_CONF';
      CSTA_QUERY_CALL_MONITOR          : Result := 'CSTA_QUERY_CALL_MONITOR';
      CSTA_QUERY_CALL_MONITOR_CONF     : Result := 'CSTA_QUERY_CALL_MONITOR_CONF';
      CSTA_ROUTE_REQUEST_EXT           : Result := 'CSTA_ROUTE_REQUEST_EXT';
      CSTA_ROUTE_USED_EXT              : Result := 'CSTA_ROUTE_USED_EXT';
      CSTA_ROUTE_SELECT_INV_REQUEST    : Result := 'CSTA_ROUTE_SELECT_INV_REQUEST';
      CSTA_ROUTE_END_INV_REQUEST       : Result := 'CSTA_ROUTE_END_INV_REQUEST';
      else                               raise Exception.Create(Format('Event type %d sem tratamento',[EventType]));
      end;
    end;

  ACSREQUEST, ACSUNSOLICITED, ACSCONFIRMATION:
    begin

    case EventType of
      ACS_OPEN_STREAM            : Result := 'ACS_OPEN_STREAM'           ;
      ACS_OPEN_STREAM_CONF       : Result := 'ACS_OPEN_STREAM_CONF'      ;
      ACS_CLOSE_STREAM           : Result := 'ACS_CLOSE_STREAM'          ;
      ACS_CLOSE_STREAM_CONF      : Result := 'ACS_CLOSE_STREAM_CONF'     ;
      ACS_ABORT_STREAM           : Result := 'ACS_ABORT_STREAM'          ;
      ACS_UNIVERSAL_FAILURE_CONF : Result := 'ACS_UNIVERSAL_FAILURE_CONF';
      ACS_UNIVERSAL_FAILURE      : Result := 'ACS_UNIVERSAL_FAILURE'     ;
      ACS_KEY_REQUEST            : Result := 'ACS_KEY_REQUEST'           ;
      ACS_KEY_REPLY              : Result := 'ACS_KEY_REPLY'             ;
      ACS_NAME_SRV_REQUEST       : Result := 'ACS_NAME_SRV_REQUEST'      ;
      ACS_NAME_SRV_REPLY         : Result := 'ACS_NAME_SRV_REPLY'        ;
      ACS_AUTH_REPLY             : Result := 'ACS_AUTH_REPLY'            ;
      ACS_AUTH_REPLY_TWO         : Result := 'ACS_AUTH_REPLY_TWO'        ;
      else                       raise Exception.Create(Format('Erro em TraduzEventType(). Tipo de Evento %d ACS sem tratamento',[EventType]));
      end;
    end;
  end;
end;

function EventClassToStr(EventClass: EventClass_t): String;
begin
case EventClass of
  CSTAREQUEST      : Result := 'CSTAREQUEST';
  CSTAUNSOLICITED  : Result := 'CSTAUNSOLICITED';
  CSTACONFIRMATION : Result := 'CSTACONFIRMATION';
  CSTAEVENTREPORT_ : Result := 'CSTAEVENTREPORT_';
  ACSREQUEST       : Result := 'ACSREQUEST';
  ACSUNSOLICITED   : Result := 'ACSUNSOLICITED';
  ACSCONFIRMATION  : Result := 'ACSCONFIRMATION';
  else raise Exception.Create(Format('Erro em TraduzEventClass. Tipo classe %d sem tratamento',[EventClass]))
  end;
end;

function CSTAUniversalFailureToStr(CSTAUniversalFailure: CSTAUniversalFailure_t): String;
begin
case CSTAUniversalFailure of
   GENERIC_UNSPECIFIED                       : Result := 'GENERIC_UNSPECIFIED';
   GENERIC_OPERATION                         : Result := 'GENERIC_OPERATION';
   REQUEST_INCOMPATIBLE_WITH_OBJECT          : Result := 'REQUEST_INCOMPATIBLE_WITH_OBJECT';
   VALUE_OUT_OF_RANGE                        : Result := 'VALUE_OUT_OF_RANGE';
   OBJECT_NOT_KNOWN                          : Result := 'OBJECT_NOT_KNOWN';
   INVALID_CALLING_DEVICE                    : Result := 'INVALID_CALLING_DEVICE';
   INVALID_CALLED_DEVICE                     : Result := 'INVALID_CALLED_DEVICE';
   INVALID_FORWARDING_DESTINATION            : Result := 'INVALID_FORWARDING_DESTINATION';
   PRIVILEGE_VIOLATION_ON_SPECIFIED_DEVICE   : Result := 'PRIVILEGE_VIOLATION_ON_SPECIFIED_DEVICE';
   PRIVILEGE_VIOLATION_ON_CALLED_DEVICE      : Result := 'PRIVILEGE_VIOLATION_ON_CALLED_DEVICE';
   PRIVILEGE_VIOLATION_ON_CALLING_DEVICE     : Result := 'PRIVILEGE_VIOLATION_ON_CALLING_DEVICE';
   INVALID_CSTA_CALL_IDENTIFIER              : Result := 'INVALID_CSTA_CALL_IDENTIFIER';
   INVALID_CSTA_DEVICE_IDENTIFIER            : Result := 'INVALID_CSTA_DEVICE_IDENTIFIER';
   INVALID_CSTA_CONNECTION_IDENTIFIER        : Result := 'INVALID_CSTA_CONNECTION_IDENTIFIER';
   INVALID_DESTINATION                       : Result := 'INVALID_DESTINATION';
   INVALID_FEATURE                           : Result := 'INVALID_FEATURE';
   INVALID_ALLOCATION_STATE                  : Result := 'INVALID_ALLOCATION_STATE';
   INVALID_CROSS_REF_ID                      : Result := 'INVALID_CROSS_REF_ID';
   INVALID_OBJECT_TYPE                       : Result := 'INVALID_OBJECT_TYPE';
   SECURITY_VIOLATION                        : Result := 'SECURITY_VIOLATION';
   GENERIC_STATE_INCOMPATIBILITY             : Result := 'GENERIC_STATE_INCOMPATIBILITY';
   INVALID_OBJECT_STATE                      : Result := 'INVALID_OBJECT_STATE';
   INVALID_CONNECTION_ID_FOR_ACTIVE_CALL     : Result := 'INVALID_CONNECTION_ID_FOR_ACTIVE_CALL';
   NO_ACTIVE_CALL                            : Result := 'NO_ACTIVE_CALL';
   NO_HELD_CALL                              : Result := 'NO_HELD_CALL';
   NO_CALL_TO_CLEAR                          : Result := 'NO_CALL_TO_CLEAR';
   NO_CONNECTION_TO_CLEAR                    : Result := 'NO_CONNECTION_TO_CLEAR';
   NO_CALL_TO_ANSWER                         : Result := 'NO_CALL_TO_ANSWER';
   NO_CALL_TO_COMPLETE                       : Result := 'NO_CALL_TO_COMPLETE';
   GENERIC_SYSTEM_RESOURCE_AVAILABILITY      : Result := 'GENERIC_SYSTEM_RESOURCE_AVAILABILITY';
   SERVICE_BUSY                              : Result := 'SERVICE_BUSY';
   RESOURCE_BUSY                             : Result := 'RESOURCE_BUSY';
   RESOURCE_OUT_OF_SERVICE                   : Result := 'RESOURCE_OUT_OF_SERVICE';
   NETWORK_BUSY                              : Result := 'NETWORK_BUSY';
   NETWORK_OUT_OF_SERVICE                    : Result := 'NETWORK_OUT_OF_SERVICE';
   OVERALL_MONITOR_LIMIT_EXCEEDED            : Result := 'OVERALL_MONITOR_LIMIT_EXCEEDED';
   CONFERENCE_MEMBER_LIMIT_EXCEEDED          : Result := 'CONFERENCE_MEMBER_LIMIT_EXCEEDED';
   GENERIC_SUBSCRIBED_RESOURCE_AVAILABILITY  : Result := 'GENERIC_SUBSCRIBED_RESOURCE_AVAILABILITY';
   OBJECT_MONITOR_LIMIT_EXCEEDED             : Result := 'OBJECT_MONITOR_LIMIT_EXCEEDED';
   EXTERNAL_TRUNK_LIMIT_EXCEEDED             : Result := 'EXTERNAL_TRUNK_LIMIT_EXCEEDED';
   OUTSTANDING_REQUEST_LIMIT_EXCEEDED        : Result := 'OUTSTANDING_REQUEST_LIMIT_EXCEEDED';
   GENERIC_PERFORMANCE_MANAGEMENT            : Result := 'GENERIC_PERFORMANCE_MANAGEMENT';
   PERFORMANCE_LIMIT_EXCEEDED                : Result := 'PERFORMANCE_LIMIT_EXCEEDED';
   UNSPECIFIED_SECURITY_ERROR                : Result := 'UNSPECIFIED_SECURITY_ERROR';
   SEQUENCE_NUMBER_VIOLATED                  : Result := 'SEQUENCE_NUMBER_VIOLATED';
   TIME_STAMP_VIOLATED                       : Result := 'TIME_STAMP_VIOLATED';
   PAC_VIOLATED                              : Result := 'PAC_VIOLATED';
   SEAL_VIOLATED                             : Result := 'SEAL_VIOLATED';
   GENERIC_UNSPECIFIED_REJECTION             : Result := 'GENERIC_UNSPECIFIED_REJECTION';
   GENERIC_OPERATION_REJECTION               : Result := 'GENERIC_OPERATION_REJECTION';
   DUPLICATE_INVOCATION_REJECTION            : Result := 'DUPLICATE_INVOCATION_REJECTION';
   UNRECOGNIZED_OPERATION_REJECTION          : Result := 'UNRECOGNIZED_OPERATION_REJECTION';
   MISTYPED_ARGUMENT_REJECTION               : Result := 'MISTYPED_ARGUMENT_REJECTION';
   RESOURCE_LIMITATION_REJECTION             : Result := 'RESOURCE_LIMITATION_REJECTION';
   ACS_HANDLE_TERMINATION_REJECTION          : Result := 'ACS_HANDLE_TERMINATION_REJECTION';
   SERVICE_TERMINATION_REJECTION             : Result := 'SERVICE_TERMINATION_REJECTION';
   REQUEST_TIMEOUT_REJECTION                 : Result := 'REQUEST_TIMEOUT_REJECTION';
   REQUESTS_ON_DEVICE_EXCEEDED_REJECTION     : Result := 'REQUESTS_ON_DEVICE_EXCEEDED_REJECTION';
   UNRECOGNIZED_APDU_REJECTION               : Result := 'UNRECOGNIZED_APDU_REJECTION';
   MISTYPED_APDU_REJECTION                   : Result := 'MISTYPED_APDU_REJECTION';
   BADLY_STRUCTURED_APDU_REJECTION           : Result := 'BADLY_STRUCTURED_APDU_REJECTION';
   INITIATOR_RELEASING_REJECTION             : Result := 'INITIATOR_RELEASING_REJECTION';
   UNRECOGNIZED_LINKEDID_REJECTION           : Result := 'UNRECOGNIZED_LINKEDID_REJECTION';
   LINKED_RESPONSE_UNEXPECTED_REJECTION      : Result := 'LINKED_RESPONSE_UNEXPECTED_REJECTION';
   UNEXPECTED_CHILD_OPERATION_REJECTION      : Result := 'UNEXPECTED_CHILD_OPERATION_REJECTION';
   MISTYPED_RESULT_REJECTION                 : Result := 'MISTYPED_RESULT_REJECTION';
   UNRECOGNIZED_ERROR_REJECTION              : Result := 'UNRECOGNIZED_ERROR_REJECTION';
   UNEXPECTED_ERROR_REJECTION                : Result := 'UNEXPECTED_ERROR_REJECTION';
   MISTYPED_PARAMETER_REJECTION              : Result := 'MISTYPED_PARAMETER_REJECTION';
   NON_STANDARD                              : Result := 'NON_STANDARD';
   else  raise Exception.Create(Format('Erro na funcao TraduzCSTAUniversalFailure . %d sem tratamento',[Ord(CSTAUniversalFailure)]));
   end;
end;

function ACSUniversalFailureToStr(ACSUniversalFailure: ACSUniversalFailure_t): String;
begin
case ACSUniversalFailure of
  TSERVER_STREAM_FAILED                          : Result := 'TSERVER_STREAM_FAILED';
  TSERVER_NO_THREAD                              : Result := 'TSERVER_NO_THREAD';
  TSERVER_BAD_DRIVER_ID                          : Result := 'TSERVER_BAD_DRIVER_ID';
  TSERVER_DEAD_DRIVER                            : Result := 'TSERVER_DEAD_DRIVER';
  TSERVER_MESSAGE_HIGH_WATER_MARK                : Result := 'TSERVER_MESSAGE_HIGH_WATER_MARK';
  TSERVER_FREE_BUFFER_FAILED                     : Result := 'TSERVER_FREE_BUFFER_FAILED';
  TSERVER_SEND_TO_DRIVER                         : Result := 'TSERVER_SEND_TO_DRIVER';
  TSERVER_RECEIVE_FROM_DRIVER                    : Result := 'TSERVER_RECEIVE_FROM_DRIVER';
  TSERVER_REGISTRATION_FAILED                    : Result := 'TSERVER_REGISTRATION_FAILED';
  TSERVER_SPX_FAILED                             : Result := 'TSERVER_SPX_FAILED';
  TSERVER_TRACE                                  : Result := 'TSERVER_TRACE';
  TSERVER_NO_MEMORY                              : Result := 'TSERVER_NO_MEMORY';
  TSERVER_ENCODE_FAILED                          : Result := 'TSERVER_ENCODE_FAILED';
  TSERVER_DECODE_FAILED                          : Result := 'TSERVER_DECODE_FAILED';
  TSERVER_BAD_CONNECTION                         : Result := 'TSERVER_BAD_CONNECTION';
  TSERVER_BAD_PDU                                : Result := 'TSERVER_BAD_PDU';
  TSERVER_NO_VERSION                             : Result := 'TSERVER_NO_VERSION';
  TSERVER_ECB_MAX_EXCEEDED                       : Result := 'TSERVER_ECB_MAX_EXCEEDED';
  TSERVER_NO_ECBS                                : Result := 'TSERVER_NO_ECBS';
  TSERVER_NO_SDB                                 : Result := 'TSERVER_NO_SDB';
  TSERVER_NO_SDB_CHECK_NEEDED                    : Result := 'TSERVER_NO_SDB_CHECK_NEEDED';
  TSERVER_SDB_CHECK_NEEDED                       : Result := 'TSERVER_SDB_CHECK_NEEDED';
  TSERVER_BAD_SDB_LEVEL                          : Result := 'TSERVER_BAD_SDB_LEVEL';
  TSERVER_BAD_SERVERID                           : Result := 'TSERVER_BAD_SERVERID';
  TSERVER_BAD_STREAM_TYPE                        : Result := 'TSERVER_BAD_STREAM_TYPE';
  TSERVER_BAD_PASSWORD_OR_LOGIN                  : Result := 'TSERVER_BAD_PASSWORD_OR_LOGIN';
  TSERVER_NO_USER_RECORD                         : Result := 'TSERVER_NO_USER_RECORD';
  TSERVER_NO_DEVICE_RECORD                       : Result := 'TSERVER_NO_DEVICE_RECORD';
  TSERVER_DEVICE_NOT_ON_LIST                     : Result := 'TSERVER_DEVICE_NOT_ON_LIST';
  TSERVER_USERS_RESTRICTED_HOME                  : Result := 'TSERVER_USERS_RESTRICTED_HOME';
  TSERVER_NO_AWAYPERMISSION                      : Result := 'TSERVER_NO_AWAYPERMISSION';
  TSERVER_NO_HOMEPERMISSION                      : Result := 'TSERVER_NO_HOMEPERMISSION';
  TSERVER_NO_AWAY_WORKTOP                        : Result := 'TSERVER_NO_AWAY_WORKTOP';
  TSERVER_BAD_DEVICE_RECORD                      : Result := 'TSERVER_BAD_DEVICE_RECORD';
  TSERVER_DEVICE_NOT_SUPPORTED                   : Result := 'TSERVER_DEVICE_NOT_SUPPORTED';
  TSERVER_INSUFFICIENT_PERMISSION                : Result := 'TSERVER_INSUFFICIENT_PERMISSION';
  TSERVER_NO_RESOURCE_TAG                        : Result := 'TSERVER_NO_RESOURCE_TAG';
  TSERVER_INVALID_MESSAGE                        : Result := 'TSERVER_INVALID_MESSAGE';
  TSERVER_EXCEPTION_LIST                         : Result := 'TSERVER_EXCEPTION_LIST';
  TSERVER_NOT_ON_OAM_LIST                        : Result := 'TSERVER_NOT_ON_OAM_LIST';
  TSERVER_PBX_ID_NOT_IN_SDB                      : Result := 'TSERVER_PBX_ID_NOT_IN_SDB';
  TSERVER_USER_LICENSES_EXCEEDED                 : Result := 'TSERVER_USER_LICENSES_EXCEEDED';
  TSERVER_OAM_DROP_CONNECTION                    : Result := 'TSERVER_OAM_DROP_CONNECTION';
  TSERVER_NO_VERSION_RECORD                      : Result := 'TSERVER_NO_VERSION_RECORD';
  TSERVER_OLD_VERSION_RECORD                     : Result := 'TSERVER_OLD_VERSION_RECORD';
  TSERVER_BAD_PACKET                             : Result := 'TSERVER_BAD_PACKET';
  TSERVER_OPEN_FAILED                            : Result := 'TSERVER_OPEN_FAILED';
  TSERVER_OAM_IN_USE                             : Result := 'TSERVER_OAM_IN_USE';
  TSERVER_DEVICE_NOT_ON_HOME_LIST                : Result := 'TSERVER_DEVICE_NOT_ON_HOME_LIST';
  TSERVER_DEVICE_NOT_ON_CALL_CONTROL_LIST        : Result := 'TSERVER_DEVICE_NOT_ON_CALL_CONTROL_LIST';
  TSERVER_DEVICE_NOT_ON_AWAY_LIST                : Result := 'TSERVER_DEVICE_NOT_ON_AWAY_LIST';
  TSERVER_DEVICE_NOT_ON_ROUTE_LIST               : Result := 'TSERVER_DEVICE_NOT_ON_ROUTE_LIST';
  TSERVER_DEVICE_NOT_ON_MONITOR_DEVICE_LIST      : Result := 'TSERVER_DEVICE_NOT_ON_MONITOR_DEVICE_LIST';
  TSERVER_DEVICE_NOT_ON_MONITOR_CALL_DEVICE_LIST : Result := 'TSERVER_DEVICE_NOT_ON_MONITOR_CALL_DEVICE_LIST';
  TSERVER_NO_CALL_CALL_MONITOR_PERMISSION        : Result := 'TSERVER_NO_CALL_CALL_MONITOR_PERMISSION';
  TSERVER_HOME_DEVICE_LIST_EMPTY                 : Result := 'TSERVER_HOME_DEVICE_LIST_EMPTY';
  TSERVER_CALL_CONTROL_LIST_EMPTY                : Result := 'TSERVER_CALL_CONTROL_LIST_EMPTY';
  TSERVER_AWAY_LIST_EMPTY                        : Result := 'TSERVER_AWAY_LIST_EMPTY';
  TSERVER_ROUTE_LIST_EMPTY                       : Result := 'TSERVER_ROUTE_LIST_EMPTY';
  TSERVER_MONITOR_DEVICE_LIST_EMPTY              : Result := 'TSERVER_MONITOR_DEVICE_LIST_EMPTY';
  TSERVER_MONITOR_CALL_DEVICE_LIST_EMPTY         : Result := 'TSERVER_MONITOR_CALL_DEVICE_LIST_EMPTY';
  TSERVER_USER_AT_HOME_WORKTOP                   : Result := 'TSERVER_USER_AT_HOME_WORKTOP';
  TSERVER_DEVICE_LIST_EMPTY                      : Result := 'TSERVER_DEVICE_LIST_EMPTY';
  TSERVER_BAD_GET_DEVICE_LEVEL                   : Result := 'TSERVER_BAD_GET_DEVICE_LEVEL';
  TSERVER_DRIVER_UNREGISTERED                    : Result := 'TSERVER_DRIVER_UNREGISTERED';
  TSERVER_NO_ACS_STREAM                          : Result := 'TSERVER_NO_ACS_STREAM';
  TSERVER_DROP_OAM                               : Result := 'TSERVER_DROP_OAM';
  TSERVER_ECB_TIMEOUT                            : Result := 'TSERVER_ECB_TIMEOUT';
  TSERVER_BAD_ECB                                : Result := 'TSERVER_BAD_ECB';
  TSERVER_ADVERTISE_FAILED                       : Result := 'TSERVER_ADVERTISE_FAILED';
  TSERVER_NETWARE_FAILURE                        : Result := 'TSERVER_NETWARE_FAILURE';
  TSERVER_TDI_QUEUE_FAULT                        : Result := 'TSERVER_TDI_QUEUE_FAULT';
  TSERVER_DRIVER_CONGESTION                      : Result := 'TSERVER_DRIVER_CONGESTION';
  TSERVER_NO_TDI_BUFFERS                         : Result := 'TSERVER_NO_TDI_BUFFERS';
  TSERVER_OLD_INVOKEID                           : Result := 'TSERVER_OLD_INVOKEID';
  TSERVER_HWMARK_TO_LARGE                        : Result := 'TSERVER_HWMARK_TO_LARGE';
  TSERVER_SET_ECB_TO_LOW                         : Result := 'TSERVER_SET_ECB_TO_LOW';
  TSERVER_NO_RECORD_IN_FILE                      : Result := 'TSERVER_NO_RECORD_IN_FILE';
  TSERVER_ECB_OVERDUE                            : Result := 'TSERVER_ECB_OVERDUE';
  TSERVER_BAD_PW_ENCRYPTION                      : Result := 'TSERVER_BAD_PW_ENCRYPTION';
  TSERVER_BAD_TSERV_PROTOCOL                     : Result := 'TSERVER_BAD_TSERV_PROTOCOL';
  TSERVER_BAD_DRIVER_PROTOCOL                    : Result := 'TSERVER_BAD_DRIVER_PROTOCOL';
  TSERVER_BAD_TRANSPORT_TYPE                     : Result := 'TSERVER_BAD_TRANSPORT_TYPE';
  TSERVER_PDU_VERSION_MISMATCH                   : Result := 'TSERVER_PDU_VERSION_MISMATCH';
  TSERVER_VERSION_MISMATCH                       : Result := 'TSERVER_VERSION_MISMATCH';
  TSERVER_LICENSE_MISMATCH                       : Result := 'TSERVER_LICENSE_MISMATCH';
  TSERVER_BAD_ATTRIBUTE_LIST                     : Result := 'TSERVER_BAD_ATTRIBUTE_LIST';
  TSERVER_BAD_TLIST_TYPE                         : Result := 'TSERVER_BAD_TLIST_TYPE';
  TSERVER_BAD_PROTOCOL_FORMAT                    : Result := 'TSERVER_BAD_PROTOCOL_FORMAT';
  TSERVER_OLD_TSLIB                              : Result := 'TSERVER_OLD_TSLIB';
  TSERVER_BAD_LICENSE_FILE                       : Result := 'TSERVER_BAD_LICENSE_FILE';
  TSERVER_NO_PATCHES                             : Result := 'TSERVER_NO_PATCHES';
  TSERVER_SYSTEM_ERROR                           : Result := 'TSERVER_SYSTEM_ERROR';
  TSERVER_OAM_LIST_EMPTY                         : Result := 'TSERVER_OAM_LIST_EMPTY';
  TSERVER_TCP_FAILED                             : Result := 'TSERVER_TCP_FAILED';
  TSERVER_SPX_DISABLED                           : Result := 'TSERVER_SPX_DISABLED';
  TSERVER_TCP_DISABLED                           : Result := 'TSERVER_TCP_DISABLED';
  TSERVER_REQUIRED_MODULES_NOT_LOADED            : Result := 'TSERVER_REQUIRED_MODULES_NOT_LOADED';
  TSERVER_TRANSPORT_IN_USE_BY_OAM                : Result := 'TSERVER_TRANSPORT_IN_USE_BY_OAM';
  TSERVER_NO_NDS_OAM_PERMISSION                  : Result := 'TSERVER_NO_NDS_OAM_PERMISSION';
  TSERVER_OPEN_SDB_LOG_FAILED                    : Result := 'TSERVER_OPEN_SDB_LOG_FAILED';
  TSERVER_INVALID_LOG_SIZE                       : Result := 'TSERVER_INVALID_LOG_SIZE';
  TSERVER_WRITE_SDB_LOG_FAILED                   : Result := 'TSERVER_WRITE_SDB_LOG_FAILED';
  TSERVER_NT_FAILURE                             : Result := 'TSERVER_NT_FAILURE';
  TSERVER_LOAD_LIB_FAILED                        : Result := 'TSERVER_LOAD_LIB_FAILED';
  TSERVER_INVALID_DRIVER                         : Result := 'TSERVER_INVALID_DRIVER';
  TSERVER_REGISTRY_ERROR                         : Result := 'TSERVER_REGISTRY_ERROR';
  TSERVER_DUPLICATE_ENTRY                        : Result := 'TSERVER_DUPLICATE_ENTRY';
  TSERVER_DRIVER_LOADED                          : Result := 'TSERVER_DRIVER_LOADED';
  TSERVER_DRIVER_NOT_LOADED                      : Result := 'TSERVER_DRIVER_NOT_LOADED';
  TSERVER_NO_LOGON_PERMISSION                    : Result := 'TSERVER_NO_LOGON_PERMISSION';
  TSERVER_ACCOUNT_DISABLED                       : Result := 'TSERVER_ACCOUNT_DISABLED';
  TSERVER_NO_NETLOGON                            : Result := 'TSERVER_NO_NETLOGON';
  TSERVER_ACCT_RESTRICTED                        : Result := 'TSERVER_ACCT_RESTRICTED';
  TSERVER_INVALID_LOGON_TIME                     : Result := 'TSERVER_INVALID_LOGON_TIME';
  TSERVER_INVALID_WORKSTATION                    : Result := 'TSERVER_INVALID_WORKSTATION';
  TSERVER_ACCT_LOCKED_OUT                        : Result := 'TSERVER_ACCT_LOCKED_OUT';
  TSERVER_PASSWORD_EXPIRED                       : Result := 'TSERVER_PASSWORD_EXPIRED';
  DRIVER_DUPLICATE_ACSHANDLE                     : Result := 'DRIVER_DUPLICATE_ACSHANDLE';
  DRIVER_INVALID_ACS_REQUEST                     : Result := 'DRIVER_INVALID_ACS_REQUEST';
  DRIVER_ACS_HANDLE_REJECTION                    : Result := 'DRIVER_ACS_HANDLE_REJECTION';
  DRIVER_INVALID_CLASS_REJECTION                 : Result := 'DRIVER_INVALID_CLASS_REJECTION';
  DRIVER_GENERIC_REJECTION                       : Result := 'DRIVER_GENERIC_REJECTION';
  DRIVER_RESOURCE_LIMITATION                     : Result := 'DRIVER_RESOURCE_LIMITATION';
  DRIVER_ACSHANDLE_TERMINATION                   : Result := 'DRIVER_ACSHANDLE_TERMINATION';
  DRIVER_LINK_UNAVAILABLE                        : Result := 'DRIVER_LINK_UNAVAILABLE';
  DRIVER_OAM_IN_USE                              : Result := 'DRIVER_OAM_IN_USE';
  else raise Exception.Create(Format('Erro em TraduzACSUniversalFailure(). Erro %d sem tratamento',[Ord(ACSUniversalFailure)]));
  end;
end;

function CtReturnToStr(ErrorCode: TSAPI): String;
begin
case ErrorCode of
  ACSERR_APIVERDENIED : Result := 'ACSERR_APIVERDENIED';
  ACSERR_BADPARAMETER : Result := 'ACSERR_BADPARAMETER';
  ACSERR_DUPSTREAM    : Result := 'ACSERR_DUPSTREAM';
  ACSERR_NODRIVER     : Result := 'ACSERR_NODRIVER';
  ACSERR_NOSERVER     : Result := 'ACSERR_NOSERVER';
  ACSERR_NORESOURCE   : Result := 'ACSERR_NORESOURCE';
  ACSERR_UBUFSMALL    : Result := 'ACSERR_UBUFSMALL';
  ACSERR_NOMESSAGE    : Result := 'ACSERR_NOMESSAGE';
  ACSERR_UNKNOWN      : Result := 'ACSERR_UNKNOWN';
  ACSERR_BADHDL       : Result := 'ACSERR_BADHDL';
  ACSERR_STREAM_FAILED: Result := 'ACSERR_STREAM_FAILED';
  ACSERR_NOBUFFERS    : Result := 'ACSERR_NOBUFFERS';
  ACSERR_QUEUE_FULL   : Result := 'ACSERR_QUEUE_FULL';
  else Result := IntToStr(ErrorCode);
  end;
end;

function DeviceTypeToStr(DeviceType: DeviceType_t): String;
begin
case DeviceType of
  DT_STATION        : Result := 'DT_STATION';
  DT_LINE           : Result := 'DT_LINE';
  DT_BUTTON         : Result := 'DT_BUTTON';
  DT_ACD            : Result := 'DT_ACD';
  DT_TRUNK          : Result := 'DT_TRUNK';
  DT_OPERATOR       : Result := 'DT_OPERATOR';
  DT_STATION_GROUP  : Result := 'DT_STATION_GROU';
  DT_LINE_GROUP     : Result := 'DT_LINE_GROUP';
  DT_BUTTON_GROUP   : Result := 'DT_BUTTON_GROUP';
  DT_ACD_GROUP      : Result := 'DT_ACD_GROUP';
  DT_TRUNK_GROUP    : Result := 'DT_TRUNK_GROUP';
  DT_OPERATOR_GROUP : Result := 'DT_OPERATOR_GROUP';
  DT_OTHER          : Result := 'DT_OTHER';
  else raise Exception.Create(Format('Erro em TraduzDeviceType(). %d sem tratamento' ,[Ord(DeviceType)]));
  end;
end;

function CallStateToStr(CSTASimpleCallState: CSTASimpleCallState_t): String;
begin
case CSTASimpleCallState of
  CALL_NULL                : Result := 'CALL_NULL';
  CALL_PENDING             : Result := 'CALL_PENDING';
  CALL_ORIGINATED          : Result := 'CALL_ORIGINATED';
  CALL_DELIVERED           : Result := 'CALL_DELIVERED';
  CALL_DELIVERED_HELD      : Result := 'CALL_DELIVERED_HELD';
  CALL_RECEIVED            : Result := 'CALL_RECEIVED';
  CALL_ESTABLISHED         : Result := 'CALL_ESTABLISHED';
  CALL_ESTABLISHED_HELD    : Result := 'CALL_ESTABLISHED_HELD';
  CALL_RECEIVED_ON_HOLD    : Result := 'CALL_RECEIVED_ON_HOLD';
  CALL_ESTABLISHED_ON_HOLD : Result := 'CALL_ESTABLISHED_ON_HOLD';
  CALL_QUEUED              : Result := 'CALL_QUEUED';
  CALL_QUEUED_HELD         : Result := 'CALL_QUEUED_HELD';
  CALL_FAILED              : Result := 'CALL_FAILED';
  CALL_FAILED_HELD         : Result := 'CALL_FAILED_HELD';
  else raise Exception.Create(Format('Erro em TraduzCallState(). CSTASimpleCallState %d sem tratamento',[Ord(CSTASimpleCallState)]));
  end;
end;

function LocalConnectionStateToStr(LocalConnectionState: LocalConnectionState_t): String;
begin
case LocalConnectionState of
  CS_NONE     : Result := 'CS_NONE';
  CS_NULL     : Result := 'CS_NULL';
  CS_INITIATE : Result := 'CS_INITIATE';
  CS_ALERTING : Result := 'CS_ALERTING';
  CS_CONNECT  : Result := 'CS_CONNECT';
  CS_HOLD     : Result := 'CS_HOLD';
  CS_QUEUED   : Result := 'CS_QUEUED';
  CS_FAIL     : Result := 'CS_FAIL';
  else raise Exception.Create(Format('Erro em TraduzLocalCallState(). LocalConnectionState %d sem tratamento' ,[Ord(LocalConnectionState)]));
  end;
end;

function ATTEventTypeToStr(ATTEventType : ATTEventType_t): String;
begin
case ATTEventType of
  ATTV5_CLEAR_CONNECTION : Result :='ATTV5_CLEAR_CONNECTION';
  ATTV5_CONSULTATION_CALL : Result :='ATTV5_CONSULTATION_CALL';
  ATTV5_MAKE_CALL : Result :='ATTV5_MAKE_CALL';
  ATTV5_DIRECT_AGENT_CALL : Result :='ATTV5_DIRECT_AGENT_CALL';
  ATTV5_MAKE_PREDICTIVE_CALL : Result :='ATTV5_MAKE_PREDICTIVE_CALL';
  ATTV5_SUPERVISOR_ASSIST_CALL : Result :='ATTV5_SUPERVISOR_ASSIST_CALL';
  ATTV5_RECONNECT_CALL : Result :='ATTV5_RECONNECT_CALL';
  ATTV4_SENDDTMF_TONE : Result :='ATTV4_SENDDTMF_TONE';
  ATT_SENDDTMF_TONE_CONF : Result :='ATT_SENDDTMF_TONE_CONF';
  ATTV4_SET_AGENT_STATE : Result :='ATTV4_SET_AGENT_STATE';
  ATT_QUERY_ACD_SPLIT : Result :='ATT_QUERY_ACD_SPLIT';
  ATT_QUERY_ACD_SPLIT_CONF : Result :='ATT_QUERY_ACD_SPLIT_CONF';
  ATT_QUERY_AGENT_LOGIN : Result :='ATT_QUERY_AGENT_LOGIN';
  ATT_QUERY_AGENT_LOGIN_CONF : Result :='ATT_QUERY_AGENT_LOGIN_CONF';
  ATT_QUERY_AGENT_LOGIN_RESP : Result :='ATT_QUERY_AGENT_LOGIN_RESP';
  ATT_QUERY_AGENT_STATE : Result :='ATT_QUERY_AGENT_STATE';
  ATTV4_QUERY_AGENT_STATE_CONF : Result :='ATTV4_QUERY_AGENT_STATE_CONF';
  ATT_QUERY_CALL_CLASSIFIER : Result :='ATT_QUERY_CALL_CLASSIFIER';
  ATT_QUERY_CALL_CLASSIFIER_CONF : Result :='ATT_QUERY_CALL_CLASSIFIER_CONF';
  ATTV4_QUERY_DEVICE_INFO_CONF : Result :='ATTV4_QUERY_DEVICE_INFO_CONF';
  ATT_QUERY_MWI_CONF : Result :='ATT_QUERY_MWI_CONF';
  ATT_QUERY_STATION_STATUS : Result :='ATT_QUERY_STATION_STATUS';
  ATT_QUERY_STATION_STATUS_CONF : Result :='ATT_QUERY_STATION_STATUS_CONF';
  ATT_QUERY_TOD : Result :='ATT_QUERY_TOD';
  ATT_QUERY_TOD_CONF : Result :='ATT_QUERY_TOD_CONF';
  ATT_QUERY_TG : Result :='ATT_QUERY_TG';
  ATT_QUERY_TG_CONF : Result :='ATT_QUERY_TG_CONF';
  ATTV4_SNAPSHOT_DEVICE_CONF : Result :='ATTV4_SNAPSHOT_DEVICE_CONF';
  ATTV4_MONITOR_FILTER : Result :='ATTV4_MONITOR_FILTER';
  ATTV4_MONITOR_CONF : Result :='ATTV4_MONITOR_CONF';
  ATT_MONITOR_STOP_ON_CALL : Result :='ATT_MONITOR_STOP_ON_CALL';
  ATT_MONITOR_STOP_ON_CALL_CONF : Result :='ATT_MONITOR_STOP_ON_CALL_CONF';
  ATTV4_MONITOR_CALL_CONF : Result :='ATTV4_MONITOR_CALL_CONF';
  ATT_CALL_CLEARED : Result :='ATT_CALL_CLEARED';
  ATTV3_CONFERENCED : Result :='ATTV3_CONFERENCED';
  ATTV5_CONNECTION_CLEARED : Result :='ATTV5_CONNECTION_CLEARED';
  ATTV3_DELIVERED : Result :='ATTV3_DELIVERED';
  ATT_ENTERED_DIGITS : Result :='ATT_ENTERED_DIGITS';
  ATTV3_ESTABLISHED : Result :='ATTV3_ESTABLISHED';
  ATTV4_NETWORK_REACHED : Result :='ATTV4_NETWORK_REACHED';
  ATTV3_TRANSFERRED : Result :='ATTV3_TRANSFERRED';
  ATTV4_ROUTE_REQUEST : Result :='ATTV4_ROUTE_REQUEST';
  ATTV5_ROUTE_SELECT : Result :='ATTV5_ROUTE_SELECT';
  ATT_ROUTE_USED : Result :='ATT_ROUTE_USED';
  ATT_SYS_STAT : Result :='ATT_SYS_STAT';
  ATTV3_LINK_STATUS : Result :='ATTV3_LINK_STATUS';
  ATTV5_ORIGINATED : Result :='ATTV5_ORIGINATED';
  ATT_LOGGED_ON : Result :='ATT_LOGGED_ON';
  ATT_QUERY_DEVICE_NAME : Result :='ATT_QUERY_DEVICE_NAME';
  ATTV4_QUERY_DEVICE_NAME_CONF : Result :='ATTV4_QUERY_DEVICE_NAME_CONF';
  ATT_QUERY_AGENT_MEASUREMENTS : Result :='ATT_QUERY_AGENT_MEASUREMENTS';
  ATT_QUERY_AGENT_MEASUREMENTS_CONF : Result :='ATT_QUERY_AGENT_MEASUREMENTS_CONF';
  ATT_QUERY_SPLIT_SKILL_MEASUREMENTS : Result :='ATT_QUERY_SPLIT_SKILL_MEASUREMENTS';
  ATT_QUERY_SPLIT_SKILL_MEASUREMENTS_CONF : Result :='ATT_QUERY_SPLIT_SKILL_MEASUREMENTS_CONF';
  ATT_QUERY_TRUNK_GROUP_MEASUREMENTS : Result :='ATT_QUERY_TRUNK_GROUP_MEASUREMENTS';
  ATT_QUERY_TRUNK_GROUP_MEASUREMENTS_CONF : Result :='ATT_QUERY_TRUNK_GROUP_MEASUREMENTS_CONF';
  ATT_QUERY_VDN_MEASUREMENTS : Result :='ATT_QUERY_VDN_MEASUREMENTS';
  ATT_QUERY_VDN_MEASUREMENTS_CONF : Result :='ATT_QUERY_VDN_MEASUREMENTS_CONF';
  ATTV4_CONFERENCED : Result :='ATTV4_CONFERENCED';
  ATTV4_DELIVERED : Result :='ATTV4_DELIVERED';
  ATTV4_ESTABLISHED : Result :='ATTV4_ESTABLISHED';
  ATTV4_TRANSFERRED : Result :='ATTV4_TRANSFERRED';
  ATTV4_LINK_STATUS : Result :='ATTV4_LINK_STATUS';
  ATTV4_GETAPI_CAPS_CONF : Result :='ATTV4_GETAPI_CAPS_CONF';
  ATT_SINGLE_STEP_CONFERENCE_CALL : Result :='ATT_SINGLE_STEP_CONFERENCE_CALL';
  ATT_SINGLE_STEP_CONFERENCE_CALL_CONF : Result :='ATT_SINGLE_STEP_CONFERENCE_CALL_CONF';
  ATT_SELECTIVE_LISTENING_HOLD : Result :='ATT_SELECTIVE_LISTENING_HOLD';
  ATT_SELECTIVE_LISTENING_HOLD_CONF : Result :='ATT_SELECTIVE_LISTENING_HOLD_CONF';
  ATT_SELECTIVE_LISTENING_RETRIEVE : Result :='ATT_SELECTIVE_LISTENING_RETRIEVE';
  ATT_SELECTIVE_LISTENING_RETRIEVE_CONF : Result :='ATT_SELECTIVE_LISTENING_RETRIEVE_CONF';
  ATT_SENDDTMF_TONE : Result :='ATT_SENDDTMF_TONE';
  ATT_SNAPSHOT_DEVICE_CONF : Result :='ATT_SNAPSHOT_DEVICE_CONF';
  ATT_LINK_STATUS : Result :='ATT_LINK_STATUS';
  ATT_SET_BILL_RATE : Result :='ATT_SET_BILL_RATE';
  ATT_SET_BILL_RATE_CONF : Result :='ATT_SET_BILL_RATE_CONF';
  ATT_QUERY_UCID : Result :='ATT_QUERY_UCID';
  ATT_QUERY_UCID_CONF : Result :='ATT_QUERY_UCID_CONF';
  ATTV5_CONFERENCED : Result :='ATTV5_CONFERENCED';
  ATT_LOGGED_OFF : Result :='ATT_LOGGED_OFF';
  ATTV5_DELIVERED : Result :='ATTV5_DELIVERED';
  ATTV5_ESTABLISHED : Result :='ATTV5_ESTABLISHED';
  ATTV5_TRANSFERRED : Result :='ATTV5_TRANSFERRED';
  ATTV5_ROUTE_REQUEST : Result :='ATTV5_ROUTE_REQUEST';
  ATT_CONSULTATION_CALL_CONF : Result :='ATT_CONSULTATION_CALL_CONF';
  ATT_MAKE_CALL_CONF : Result :='ATT_MAKE_CALL_CONF';
  ATT_MAKE_PREDICTIVE_CALL_CONF : Result :='ATT_MAKE_PREDICTIVE_CALL_CONF';
  ATTV5_SET_AGENT_STATE : Result :='ATTV5_SET_AGENT_STATE';
  ATTV5_QUERY_AGENT_STATE_CONF : Result :='ATTV5_QUERY_AGENT_STATE_CONF';
  ATT_QUERY_DEVICE_NAME_CONF : Result :='ATT_QUERY_DEVICE_NAME_CONF';
  ATT_CONFERENCE_CALL_CONF : Result :='ATT_CONFERENCE_CALL_CONF';
  ATT_TRANSFER_CALL_CONF : Result :='ATT_TRANSFER_CALL_CONF';
  ATT_MONITOR_FILTER : Result :='ATT_MONITOR_FILTER';
  ATT_MONITOR_CONF : Result :='ATT_MONITOR_CONF';
  ATT_MONITOR_CALL_CONF : Result :='ATT_MONITOR_CALL_CONF';
  ATT_SERVICE_INITIATED : Result :='ATT_SERVICE_INITIATED';
  ATT_CHARGE_ADVICE : Result :='ATT_CHARGE_ADVICE';
  ATT_GETAPI_CAPS_CONF : Result :='ATT_GETAPI_CAPS_CONF';
  ATT_QUERY_DEVICE_INFO_CONF : Result :='ATT_QUERY_DEVICE_INFO_CONF';
  ATT_SET_ADVICE_OF_CHARGE : Result :='ATT_SET_ADVICE_OF_CHARGE';
  ATT_SET_ADVICE_OF_CHARGE_CONF : Result :='ATT_SET_ADVICE_OF_CHARGE_CONF';
  ATT_NETWORK_REACHED : Result :='ATT_NETWORK_REACHED';
  ATT_SET_AGENT_STATE : Result :='ATT_SET_AGENT_STATE';
  ATT_SET_AGENT_STATE_CONF : Result :='ATT_SET_AGENT_STATE_CONF';
  ATT_QUERY_AGENT_STATE_CONF : Result :='ATT_QUERY_AGENT_STATE_CONF';
  ATT_ROUTE_REQUEST : Result :='ATT_ROUTE_REQUEST';
  ATT_TRANSFERRED : Result :='ATT_TRANSFERRED';
  ATT_CONFERENCED : Result :='ATT_CONFERENCED';
  ATT_CLEAR_CONNECTION : Result :='ATT_CLEAR_CONNECTION';
  ATT_CONSULTATION_CALL : Result :='ATT_CONSULTATION_CALL';
  ATT_MAKE_CALL : Result :='ATT_MAKE_CALL';
  ATT_DIRECT_AGENT_CALL : Result :='ATT_DIRECT_AGENT_CALL';
  ATT_MAKE_PREDICTIVE_CALL : Result :='ATT_MAKE_PREDICTIVE_CALL';
  ATT_SUPERVISOR_ASSIST_CALL : Result :='ATT_SUPERVISOR_ASSIST_CALL';
  ATT_RECONNECT_CALL : Result :='ATT_RECONNECT_CALL';
  ATT_CONNECTION_CLEARED : Result :='ATT_CONNECTION_CLEARED';
  ATT_ROUTE_SELECT : Result :='ATT_ROUTE_SELECT';
  ATT_DELIVERED : Result :='ATT_DELIVERED';
  ATT_ESTABLISHED : Result :='ATT_ESTABLISHED';
  ATT_ORIGINATED : Result :='ATT_ORIGINATED';
  end;
end;

function CSTAEventCauseToStr( CSTAEventCause : CSTAEventCause_t ) : String;
begin
case CSTAEventCause of
  EC_NONE                        : Result := 'EC_NONE';
  EC_ACTIVE_MONITOR              : Result := 'EC_ACTIVE_MONITOR';
  EC_ALTERNATE                   : Result := 'EC_ALTERNATE';
  EC_BUSY                        : Result := 'EC_BUSY';
  EC_CALL_BACK                   : Result := 'EC_CALL_BACK';
  EC_CALL_CANCELLED              : Result := 'EC_CALL_CANCELLED';
  EC_CALL_FORWARD_ALWAYS         : Result := 'EC_CALL_FORWARD_ALWAYS';
  EC_CALL_FORWARD_BUSY           : Result := 'EC_CALL_FORWARD_BUSY';
  EC_CALL_FORWARD_NO_ANSWER      : Result := 'EC_CALL_FORWARD_NO_ANSWER';
  EC_CALL_FORWARD                : Result := 'EC_CALL_FORWARD';
  EC_CALL_NOT_ANSWERED           : Result := 'EC_CALL_NOT_ANSWERED';
  EC_CALL_PICKUP                 : Result := 'EC_CALL_PICKUP';
  EC_CAMP_ON                     : Result := 'EC_CAMP_ON';
  EC_DEST_NOT_OBTAINABLE         : Result := 'EC_DEST_NOT_OBTAINABLE';
  EC_DO_NOT_DISTURB              : Result := 'EC_DO_NOT_DISTURB';
  EC_INCOMPATIBLE_DESTINATION    : Result := 'EC_INCOMPATIBLE_DESTINATION';
  EC_INVALID_ACCOUNT_CODE        : Result := 'EC_INVALID_ACCOUNT_CODE';
  EC_KEY_CONFERENCE              : Result := 'EC_KEY_CONFERENCE';
  EC_LOCKOUT                     : Result := 'EC_LOCKOUT';
  EC_MAINTENANCE                 : Result := 'EC_MAINTENANCE';
  EC_NETWORK_CONGESTION          : Result := 'EC_NETWORK_CONGESTION';
  EC_NETWORK_NOT_OBTAINABLE      : Result := 'EC_NETWORK_NOT_OBTAINABLE';
  EC_NEW_CALL                    : Result := 'EC_NEW_CALL';
  EC_NO_AVAILABLE_AGENTS         : Result := 'EC_NO_AVAILABLE_AGENTS';
  EC_OVERRIDE                    : Result := 'EC_OVERRIDE';
  EC_PARK                        : Result := 'EC_PARK';
  EC_OVERFLOW                    : Result := 'EC_OVERFLOW';
  EC_RECALL                      : Result := 'EC_RECALL';
  EC_REDIRECTED                  : Result := 'EC_REDIRECTED';
  EC_REORDER_TONE                : Result := 'EC_REORDER_TONE';
  EC_RESOURCES_NOT_AVAILABLE     : Result := 'EC_RESOURCES_NOT_AVAILABLE';
  EC_SILENT_MONITOR              : Result := 'EC_SILENT_MONITOR';
  EC_TRANSFER                    : Result := 'EC_TRANSFER';
  EC_TRUNKS_BUSY                 : Result := 'EC_TRUNKS_BUSY';
  EC_VOICE_UNIT_INITIATOR        : Result := 'EC_VOICE_UNIT_INITIATOR';
  EC_NETWORKSIGNAL               : Result := 'EC_NETWORKSIGNAL';
  EC_ALERTTIMEEXPIRED            : Result := 'EC_ALERTTIMEEXPIRED';
  EC_DESTOUTOFORDER              : Result := 'EC_DESTOUTOFORDER';
  EC_NOTSUPPORTEDBEARERSERVICE   : Result := 'EC_NOTSUPPORTEDBEARERSERVICE';
  EC_UNASSIGNED_NUMBER           : Result := 'EC_UNASSIGNED_NUMBER';
  EC_INCOMPATIBLE_BEARER_SERVICE : Result := 'EC_INCOMPATIBLE_BEARER_SERVICE';
  end
end;

function ATTDeliveredTypeToStr( ATTDeliveredType : ATTDeliveredType_t ) : String;
begin
case ATTDeliveredType of

  DELIVERED_TO_ACD     : Result := 'DELIVERED_TO_ACD';
  DELIVERED_TO_STATION : Result := 'DELIVERED_TO_STATION';
  DELIVERED_OTHER      : Result := 'DELIVERED_OTHER';

  end;
end;

function ATTReasonCodeToStr( ATTReasonCode : ATTReasonCode_t ) : String;
begin
case ATTReasonCode of

AR_NONE                    : Result := 'AR_NONE';
AR_ANSWER_NORMAL           : Result := 'AR_ANSWER_NORMAL';
AR_ANSWER_TIMED            : Result := 'AR_ANSWER_TIMED';
AR_ANSWER_VOICE_ENERGY     : Result := 'AR_ANSWER_VOICE_ENERGY';
AR_ANSWER_MACHINE_DETECTED : Result := 'AR_ANSWER_MACHINE_DETECTED';
AR_SIT_REORDER             : Result := 'AR_SIT_REORDER';
AR_SIT_NO_CIRCUIT          : Result := 'AR_SIT_NO_CIRCUIT';
AR_SIT_INTERCEPT           : Result := 'AR_SIT_INTERCEPT';
AR_SIT_VACANT_CODE         : Result := 'AR_SIT_VACANT_CODE';
AR_SIT_INEFFECTIVE_OTHER   : Result := 'AR_SIT_INEFFECTIVE_OTHER';
AR_SIT_UNKNOWN             : Result := 'AR_SIT_UNKNOWN';
AR_IN_QUEUE                : Result := 'AR_IN_QUEUE';
AR_SERVICE_OBSERVER        : Result := 'AR_SERVICE_OBSERVER';

  end;
end;

function ATTProgressLocationToStr( ATTProgressLocation : ATTProgressLocation_t ) : String;
begin
case ATTProgressLocation of
  PL_NONE        : Result := 'PL_NONE';
  PL_USER        : Result := 'PL_USER';
  PL_PUB_LOCAL   : Result := 'PL_PUB_LOCAL';
  PL_PUB_REMOTE  : Result := 'PL_PUB_REMOTE';
  PL_PRIV_REMOTE : Result := 'PL_PRIV_REMOTE';
  end;
end;

function ATTProgressDescriptionToStr( ATTProgressDescription : ATTProgressDescription_t ) : String;
begin
case ATTProgressDescription of
  PD_NONE          : Result := 'PD_NONE';
  PD_CALL_OFF_ISDN : Result := 'PD_CALL_OFF_ISDN';
  PD_DEST_NOT_ISDN : Result := 'PD_DEST_NOT_ISDN';
  PD_ORIG_NOT_ISDN : Result := 'PD_ORIG_NOT_ISDN';
  PD_CALL_ON_ISDN  : Result := 'PD_CALL_ON_ISDN';
  PD_INBAND        : Result := 'PD_INBAND';
  end;
end;

function AgentStateToStr( agentState : AgentState_t ) : String;
begin
case agentState of
  AG_NOT_READY      : Result := 'AG_NOT_READY';
  AG_NULL           : Result := 'AG_NULL';
  AG_READY          : Result := 'AG_READY';
  AG_WORK_NOT_READY : Result := 'AG_WORK_NOT_READY';
  AG_WORK_READY     : Result := 'AG_WORK_READY';
  end;
end;

function AgentModeToStr( agentMode : AgentMode_t ) : String;
begin
case agentMode of
  AM_LOG_IN         : Result := 'AM_LOG_IN';
  AM_LOG_OUT        : Result := 'AM_LOG_OUT';
  AM_NOT_READY      : Result := 'AM_NOT_READY';
  AM_READY          : Result := 'AM_READY';
  AM_WORK_NOT_READY : Result := 'AM_WORK_NOT_READY';
  AM_WORK_READY     : Result := 'AM_WORK_READY';
  end;
end;

function ATTWorkModeToStr( workMode : ATTWorkMode_t ) : String;
begin
case workMode of
  WM_NONE      : Result := 'WM_NONE';
  WM_AUX_WORK  : Result := 'WM_AUX_WORK';
  WM_AFTCAL_WK : Result := 'WM_AFTCAL_WK';
  WM_AUTO_IN   : Result := 'WM_AUTO_IN';
  WM_MANUAL_IN : Result := 'WM_MANUAL_IN';
  end
end;

function ATTTalkStateToStr( talkState : ATTTalkState_t ) : String;
begin
case talkState of
  TS_ON_CALL : Result := 'TS_ON_CALL';
  TS_IDLE    : Result := 'TS_IDLE';
  end
end;

function ATTUserToUserInfoToString( userInfo : ATTUserToUserInfo_t ) : String;
var I : Integer;
begin
Result := EmptyStr;
for I := 0 to userInfo.data.length - 1 do
  begin
  Result := Result + Char( userinfo.data.value[ I ] );
  end;
end;

end.
