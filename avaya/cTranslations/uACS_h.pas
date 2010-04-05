{******************************************************************************
                                Autor: Daniel Jurado
                                 jurado@gmail.com
******************************************************************************}
unit uACS_h;

interface

uses
   Windows, uACSdefs_h, uTsplatfm_h;

const
   CSTA_DLL_NAME   = 'CSTA32.DLL';
   ACSPOSITIVE_ACK = 0;	//* The function was successful */
   PRIVATE_DATA_ENCODING = #0;

type
   pWord      = ^Word;
   TSAPI      = Integer;
   InvokeID_t = ULONG;

   InvokeIDType_t = (APP_GEN_ID,		//* application will provide invokeIDs; any 4-byte value is legal */
                  	 LIB_GEN_ID);		//* library will generate invokeIDs in the range 1-32767 */

   Passwd_t  = array [0..48] of Char;
   pPasswd_t = ^Passwd_t;

   Level_t  = (ACS_LEVEL1 = 1,
               ACS_LEVEL2 = 2,
               ACS_LEVEL3 = 3,
               ACS_LEVEL4 = 4);
const
   PRIVATE_VENDOR_SIZE = 32;

type
   PrivateData_t = record
      vendor : array [0..PRIVATE_VENDOR_SIZE - 1] of Char;
      length : WORD;
      data   : array [0..1023] of Char;	//* actual length determined by application */
      end;

pPrivateData_t = ^PrivateData_t;
EventClass_t   = Word;


//* defines for ACS event classes */
const
  ACSREQUEST			 = 0;
  ACSUNSOLICITED	 = 1;
  ACSCONFIRMATION	 = 2;

//* Error Codes */

  ACSERR_APIVERDENIED	 =  -1;	 {* This return indicates that the
                                  * API Version requested is invalid
			          * and not supported by the
            			  * existing API Client Library.
                                  *}

  ACSERR_BADPARAMETER	 =  -2;  {* One or more of the parameters is
                                  * invalid
                                  *}

  ACSERR_DUPSTREAM     =  -3;	 {* This return indicates that an
                                  * ACS Stream is already established
                                  * with the requested Server.
                                  *}

  ACSERR_NODRIVER      =  -4;  {* This error return value indicates
                                * that no API Client Library Driver
                                * was found or installed on the system.
                                *}

  ACSERR_NOSERVER      =  -5;  {* This indicates that the requested
                                * Server is not present in the network.
                                *}

  ACSERR_NORESOURCE    =  -6;  {* This return value indicates that
                                * there are insufficient resources
                                * to open a ACS Stream.
                                *}

  ACSERR_UBUFSMALL     =  -7;  {* The user buffer size was smaller
                                * than the size of the next available
                                * event.
                                *}

  ACSERR_NOMESSAGE     =  -8;  {* There were no messages available to
                                * return to the application.
                                *}

  ACSERR_UNKNOWN       =  -9;  {* The ACS Stream has encountered
                                * an unspecified error.
                                *}

  ACSERR_BADHDL        = -10;  {* The ACS Handle is invalid *}

  ACSERR_STREAM_FAILED = -11;  {* The ACS Stream has failed
                                * due to network problems.
                                * No further operations are
                                * possible on this stream.
                                *}

  ACSERR_NOBUFFERS     = -12;  {* There were not enough buffers
                                * available to place an outgoing
                                * message on the send queue.
                                * No message has been sent.
                                *}

  ACSERR_QUEUE_FULL    = -13; {* The send queue is full.
                               * No message has been sent.
                               *}
type

  EventType_t    = Word;	//* event types are defined in acs.h and csta.h */

  ACSEventHeader_t = record
    acsHandle  : ACSHandle_t;
    eventClass : EventClass_t;
    eventType  : EventType_t;
    end;

ACSUnsolicitedEvent = record
  case Integer of
    0: (failureEvent: ACSUniversalFailureEvent_t);
  end;

ACSConfirmationEvent = record
	case invokeID: InvokeID_t of
	  0: (acsopen     : ACSOpenStreamConfEvent_t);
		1: (acsclose    : ACSCloseStreamConfEvent_t);
		2: (failureEvent: ACSUniversalFailureConfEvent_t);
  end;

function acsOpenStream ( acsHandle             : pACSHandle_t;
  invokeIDType          : InvokeIDType_t;
  invokeID              : InvokeID_t;
  streamType            : StreamType_t;
  const serverID        : pServerID_t;
  const loginID         : pLoginID_t;
  const passwd          : pPasswd_t;
  const applicationName : pAppName_t;
  acsLevelReq           : Level_t;
  const apiVer          : pVersion_t;
  sendQSize             : WORD;
  sendExtraBufs         : WORD;
  recvQSize             : WORD;
  recvExtraBufs         : WORD;
  const priv            : pPrivateData_t): TSAPI; stdcall; external CSTA_DLL_NAME;


function acsCloseStream ( acsHandle  : ACSHandle_t;
  invokeID   : InvokeID_t;
  const priv : pPrivateData_t) : TSAPI; stdcall; external CSTA_DLL_NAME;

function acsEventNotify (acsHandle : ACSHandle_t;
  _hwnd     : HWND;
  msg       : UINT;
  notifyAll : Boolean): TSAPI; stdcall; external CSTA_DLL_NAME;

function acsGetEventPoll (acsHandle    : ACSHandle_t   ;
  eventBuf     : Pointer;
  eventBufSize : pWord;
  privData     : pPrivateData_t;
  numEvents    : pWord): TSAPI ; stdcall; external CSTA_DLL_NAME;

function acsGetEventBlock (acsHandle    : ACSHandle_t   ;
  eventBuf     : Pointer;
  eventBufSize : pWord;
  privData     : pPrivateData_t;
  numEvents    : pWord): TSAPI ; stdcall; external CSTA_DLL_NAME;

function acsAbortStream (acsHandle : ACSHandle_t;
  const priv: pPrivateData_t): TSAPI;  stdcall; external CSTA_DLL_NAME;

implementation

end.
