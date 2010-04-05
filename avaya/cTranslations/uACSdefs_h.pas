{******************************************************************************
                                Autor: Daniel Jurado
                                 jurado@gmail.com
******************************************************************************}
unit uACSdefs_h;

interface
uses
  uTsplatfm_h;

const
  ACS_OPEN_STREAM            =  1;
  ACS_OPEN_STREAM_CONF       =  2;
  ACS_CLOSE_STREAM           =  3;
  ACS_CLOSE_STREAM_CONF      =  4;
  ACS_ABORT_STREAM           =  5;
  ACS_UNIVERSAL_FAILURE_CONF =  6;
  ACS_UNIVERSAL_FAILURE      =  7;
  ACS_KEY_REQUEST            =  8;
  ACS_KEY_REPLY              =  9;
  ACS_NAME_SRV_REQUEST       = 10;
  ACS_NAME_SRV_REPLY         = 11;
  ACS_AUTH_REPLY             = 12;
  ACS_AUTH_REPLY_TWO         = 13;


type
  StreamType_t = ( ST_CSTA      = 1,
    ST_OAM       = 2,
    ST_DIRECTORY = 3,
    ST_NMSRV     = 4);

  ServerID_t  = array [0..48] of Char;
  pServerID_t = ^ServerID_t;

  LoginID_t  = array [0..48] of Char;
  pLoginID_t = ^LoginID_t;

  AppName_t  = array [0..20] of Char;
  pAppName_t = ^AppName_t;

  CryptPasswd_t = record
    length : Word;
    value  : array [0..46] of Byte;
    end;

  pVersion_t = ^Version_t;
  Version_t = array [0..20] of Char;

  ACSOpenStreamConfEvent_t = record
    apiVer  : Version_t;
    libVer  : Version_t;
    tsrvVer : Version_t;
    drvrVer : Version_t;
    end;

  ACSUniversalFailure_t = (
    TSERVER_STREAM_FAILED                          = 0,
    TSERVER_NO_THREAD                              = 1,
    TSERVER_BAD_DRIVER_ID                          = 2,
    TSERVER_DEAD_DRIVER                            = 3,
    TSERVER_MESSAGE_HIGH_WATER_MARK                = 4,
    TSERVER_FREE_BUFFER_FAILED                     = 5,
    TSERVER_SEND_TO_DRIVER                         = 6,
    TSERVER_RECEIVE_FROM_DRIVER                    = 7,
    TSERVER_REGISTRATION_FAILED                    = 8,
    TSERVER_SPX_FAILED                             = 9,
    TSERVER_TRACE                                  = 10,
    TSERVER_NO_MEMORY                              = 11,
    TSERVER_ENCODE_FAILED                          = 12,
    TSERVER_DECODE_FAILED                          = 13,
    TSERVER_BAD_CONNECTION                         = 14,
    TSERVER_BAD_PDU                                = 15,
    TSERVER_NO_VERSION                             = 16,
    TSERVER_ECB_MAX_EXCEEDED                       = 17,
    TSERVER_NO_ECBS                                = 18,
    TSERVER_NO_SDB                                 = 19,
    TSERVER_NO_SDB_CHECK_NEEDED                    = 20,
    TSERVER_SDB_CHECK_NEEDED                       = 21,
    TSERVER_BAD_SDB_LEVEL                          = 22,
    TSERVER_BAD_SERVERID                           = 23,
    TSERVER_BAD_STREAM_TYPE                        = 24,
    TSERVER_BAD_PASSWORD_OR_LOGIN                  = 25,
    TSERVER_NO_USER_RECORD                         = 26,
    TSERVER_NO_DEVICE_RECORD                       = 27,
    TSERVER_DEVICE_NOT_ON_LIST                     = 28,
    TSERVER_USERS_RESTRICTED_HOME                  = 30,
    TSERVER_NO_AWAYPERMISSION                      = 31,
    TSERVER_NO_HOMEPERMISSION                      = 32,
    TSERVER_NO_AWAY_WORKTOP                        = 33,
    TSERVER_BAD_DEVICE_RECORD                      = 34,
    TSERVER_DEVICE_NOT_SUPPORTED                   = 35,
    TSERVER_INSUFFICIENT_PERMISSION                = 36,
    TSERVER_NO_RESOURCE_TAG                        = 37,
    TSERVER_INVALID_MESSAGE                        = 38,
    TSERVER_EXCEPTION_LIST                         = 39,
    TSERVER_NOT_ON_OAM_LIST                        = 40,
    TSERVER_PBX_ID_NOT_IN_SDB                      = 41,
    TSERVER_USER_LICENSES_EXCEEDED                 = 42,
    TSERVER_OAM_DROP_CONNECTION                    = 43,
    TSERVER_NO_VERSION_RECORD                      = 44,
    TSERVER_OLD_VERSION_RECORD                     = 45,
    TSERVER_BAD_PACKET                             = 46,
    TSERVER_OPEN_FAILED                            = 47,
    TSERVER_OAM_IN_USE                             = 48,
    TSERVER_DEVICE_NOT_ON_HOME_LIST                = 49,
    TSERVER_DEVICE_NOT_ON_CALL_CONTROL_LIST        = 50,
    TSERVER_DEVICE_NOT_ON_AWAY_LIST                = 51,
    TSERVER_DEVICE_NOT_ON_ROUTE_LIST               = 52,
    TSERVER_DEVICE_NOT_ON_MONITOR_DEVICE_LIST      = 53,
    TSERVER_DEVICE_NOT_ON_MONITOR_CALL_DEVICE_LIST = 54,
    TSERVER_NO_CALL_CALL_MONITOR_PERMISSION        = 55,
    TSERVER_HOME_DEVICE_LIST_EMPTY                 = 56,
    TSERVER_CALL_CONTROL_LIST_EMPTY                = 57,
    TSERVER_AWAY_LIST_EMPTY                        = 58,
    TSERVER_ROUTE_LIST_EMPTY                       = 59,
    TSERVER_MONITOR_DEVICE_LIST_EMPTY              = 60,
    TSERVER_MONITOR_CALL_DEVICE_LIST_EMPTY         = 61,
    TSERVER_USER_AT_HOME_WORKTOP                   = 62,
    TSERVER_DEVICE_LIST_EMPTY                      = 63,
    TSERVER_BAD_GET_DEVICE_LEVEL                   = 64,
    TSERVER_DRIVER_UNREGISTERED                    = 65,
    TSERVER_NO_ACS_STREAM                          = 66,
    TSERVER_DROP_OAM                               = 67,
    TSERVER_ECB_TIMEOUT                            = 68,
    TSERVER_BAD_ECB                                = 69,
    TSERVER_ADVERTISE_FAILED                       = 70,
    TSERVER_NETWARE_FAILURE                        = 71,
    TSERVER_TDI_QUEUE_FAULT                        = 72,
    TSERVER_DRIVER_CONGESTION                      = 73,
    TSERVER_NO_TDI_BUFFERS                         = 74,
    TSERVER_OLD_INVOKEID                           = 75,
    TSERVER_HWMARK_TO_LARGE                        = 76,
    TSERVER_SET_ECB_TO_LOW                         = 77,
    TSERVER_NO_RECORD_IN_FILE                      = 78,
    TSERVER_ECB_OVERDUE                            = 79,
    TSERVER_BAD_PW_ENCRYPTION                      = 80,
    TSERVER_BAD_TSERV_PROTOCOL                     = 81,
    TSERVER_BAD_DRIVER_PROTOCOL                    = 82,
    TSERVER_BAD_TRANSPORT_TYPE                     = 83,
    TSERVER_PDU_VERSION_MISMATCH                   = 84,
    TSERVER_VERSION_MISMATCH                       = 85,
    TSERVER_LICENSE_MISMATCH                       = 86,
    TSERVER_BAD_ATTRIBUTE_LIST                     = 87,
    TSERVER_BAD_TLIST_TYPE                         = 88,
    TSERVER_BAD_PROTOCOL_FORMAT                    = 89,
    TSERVER_OLD_TSLIB                              = 90,
    TSERVER_BAD_LICENSE_FILE                       = 91,
    TSERVER_NO_PATCHES                             = 92,
    TSERVER_SYSTEM_ERROR                           = 93,
    TSERVER_OAM_LIST_EMPTY                         = 94,
    TSERVER_TCP_FAILED                             = 95,
    TSERVER_SPX_DISABLED                           = 96,
    TSERVER_TCP_DISABLED                           = 97,
    TSERVER_REQUIRED_MODULES_NOT_LOADED            = 98,
    TSERVER_TRANSPORT_IN_USE_BY_OAM                = 99,
    TSERVER_NO_NDS_OAM_PERMISSION                  = 100,
    TSERVER_OPEN_SDB_LOG_FAILED                    = 101,
    TSERVER_INVALID_LOG_SIZE                       = 102,
    TSERVER_WRITE_SDB_LOG_FAILED                   = 103,
    TSERVER_NT_FAILURE                             = 104,
    TSERVER_LOAD_LIB_FAILED                        = 105,
    TSERVER_INVALID_DRIVER                         = 106,
    TSERVER_REGISTRY_ERROR                         = 107,
    TSERVER_DUPLICATE_ENTRY                        = 108,
    TSERVER_DRIVER_LOADED                          = 109,
    TSERVER_DRIVER_NOT_LOADED                      = 110,
    TSERVER_NO_LOGON_PERMISSION                    = 111,
    TSERVER_ACCOUNT_DISABLED                       = 112,
    TSERVER_NO_NETLOGON                            = 113,
    TSERVER_ACCT_RESTRICTED                        = 114,
    TSERVER_INVALID_LOGON_TIME                     = 115,
    TSERVER_INVALID_WORKSTATION                    = 116,
    TSERVER_ACCT_LOCKED_OUT                        = 117,
    TSERVER_PASSWORD_EXPIRED                       = 118,
    DRIVER_DUPLICATE_ACSHANDLE                     = 1000,
    DRIVER_INVALID_ACS_REQUEST                     = 1001,
    DRIVER_ACS_HANDLE_REJECTION                    = 1002,
    DRIVER_INVALID_CLASS_REJECTION                 = 1003,
    DRIVER_GENERIC_REJECTION                       = 1004,
    DRIVER_RESOURCE_LIMITATION                     = 1005,
    DRIVER_ACSHANDLE_TERMINATION                   = 1006,
    DRIVER_LINK_UNAVAILABLE                        = 1007,
    DRIVER_OAM_IN_USE                              = 1008);

  ACSCloseStreamConfEvent_t = record
  null: Nulltype;
  end;

  ACSUniversalFailureEvent_t = record
    error: ACSUniversalFailure_t;
    end;


  ACSUniversalFailureConfEvent_t = record
    error: ACSUniversalFailure_t;
    end;


implementation

end.
