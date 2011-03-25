{******************************************************************************
                                Autor: Daniel Jurado
                                 jurado@gmail.com
******************************************************************************}
unit uEscapeServicesCtConector;

interface

uses uACS_h, uCtTypes, uCtEvents, uStreamerCtConector,
  uSnapShotServicesCtConector, uATTPriv_h, uCSTADefs_h, uCSTA_h;

type
  // CLASSE QUE IMPLEMENTA OS SERVICOS DE ESCAPE, OU SEJA, SERVICOS
  // E EVENTOS DENTRO DAS ESTRUTURAS PRIVADAS
  TEscapeServicesCtConector = class( TSnapShotServicesCtConector )
    private
      FOnCSTAEscapeSvcConf          : TCSTAEscapeSvcConfEvent;
      FOnATTQueryAcdSplitConf       : TATTQueryAcdSplitConfEvent;
      FOnATTQueryAgentLoginConf     : TATTQueryAgentLoginConfEvent;
      FOnATTQueryAgentLoginResp     : TATTQueryAgentLoginResp;
      FOnATTQueryAgentLoginEnd      : TATTQueryAgentLoginEnd;
      FOnATTQueryTgConf             : TATTQueryTgConfEvent;
      FOnCSTAPrivate                : TCSTAPrivateEvent;
      FOnATTQueryCallClassifierConf : TATTQueryCallClassifierConfEvent;
      FOnATTQueryDeviceNameConf     : TATTQueryDeviceNameConfEvent;
      FOnATTSelectiveListeningHoldConf : TATTSelectiveListeningHoldConfEvent;
      FOnATTSelectiveListeningRetrieveConf : TATTSelectiveListeningRetrieveConfEvent;

      procedure RaiseCSTAEscapeSvcConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
      procedure RaiseATTQueryAcdSplitConf( Event : CSTAEvent_t; ATTEvent : ATTEvent_t );
      procedure RaiseATTQueryAgentLoginConf( Event : CSTAEvent_t; ATTEvent : ATTEvent_t );
      procedure RaiseATTQueryAgentLoginResp( Event : CSTAEvent_t; ATTEvent : ATTEvent_t );
      procedure RaiseATTQueryAgentLoginEnd( Event : CSTAEvent_t; ATTEvent : ATTEvent_t );
      procedure RaiseCSTAPrivateEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
      procedure RaiseATTQueryTgConfEvent( Event : CSTAEvent_t; ATTEvent : ATTEvent_t );
      procedure RaiseATTQueryCallClassifierConfEvent( Event : CSTAEvent_t; ATTEvent : ATTEvent_t );
      procedure RaiseATTQueryDeviceNameEvent( Event : CSTAEvent_t; ATTEvent : ATTEvent_t );
      procedure RaiseATTSelectiveListeningHoldConfEvent( Event : CSTAEvent_t; ATTEvent : ATTEvent_t );
      procedure RaiseATTSelectiveListeningRetrieveConfEvent( Event : CSTAEvent_t; ATTEvent : ATTEvent_t );
    protected
      procedure HandleCtEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );override;
    public
      function EscapeServices( const PrivateData : ATTPrivateData_t; const InvokeID : TInvokeID = 0 ) : TSAPI;
      function QueryAcdSplit( const device : TDeviceID; const InvokeID : TInvokeID = 0 ) : TSAPI;
      function QueryAgentLogin( const device : TDeviceID; const InvokeID : TInvokeID = 0 ) : TSAPI;
      function QueryTrunkGroup( const device : TDeviceID; const InvokeID : TInvokeID = 0 ) : TSAPI;
      function QueryCallClassifier( const InvokeID : TInvokeID = 0 ) : TSAPI;
      function QueryDeviceName( const device : TDeviceID; const InvokeID : TInvokeID = 0 ) : TSAPI;
      function SelectiveListeningHold(const subjectConnectionCallId : TCallId;
        const subjectConnectionDevice : TDeviceId; const allParties : boolean;
        const selectedPartyCallId : TCallId;
        const selectedPartyDevice : TDeviceId;
        const InvokeID : TInvokeID = 0) : TSAPI;
      function SelectiveListeningRetrieve(const subjectConnectionCallId : TCallId;
        const subjectConnectionDevice : TDeviceId; const allParties : boolean;
        const selectedPartyCallId : TCallId;
        const selectedPartyDevice : TDeviceId;
        const InvokeID : TInvokeID = 0) : TSAPI;
    published
      property OnCSTAEscapeSvcConf : TCSTAEscapeSvcConfEvent read FOnCSTAEscapeSvcConf write FOnCSTAEscapeSvcConf;
      property OnATTQueryAcdSplitConf : TATTQueryAcdSplitConfEvent read FOnATTQueryAcdSplitConf write FOnATTQueryAcdSplitConf;
      property OnATTQueryAgentLoginConf : TATTQueryAgentLoginConfEvent read FOnATTQueryAgentLoginConf write FOnATTQueryAgentLoginConf;
      property OnATTQueryAgentLoginResp : TATTQueryAgentLoginResp read FOnATTQueryAgentLoginResp write FOnATTQueryAgentLoginResp;
      property OnATTQueryAgentLoginEnd  : TATTQueryAgentLoginEnd read FOnATTQueryAgentLoginEnd write FOnATTQueryAgentLoginEnd;
      property OnCSTAPrivate            : TCSTAPrivateEvent read FOnCSTAPrivate write FOnCSTAPrivate;
      property OnATTQueryTgConf         : TATTQueryTgConfEvent read FOnATTQueryTgConf write FOnATTQueryTgConf;
      property OnATTQueryCallClassifierConf : TATTQueryCallClassifierConfEvent read FOnATTQueryCallClassifierConf write FOnATTQueryCallClassifierConf;
      property OnATTQueryDeviceNameConf : TATTQueryDeviceNameConfEvent read FOnATTQueryDeviceNameConf write FOnATTQueryDeviceNameConf;
      property OnATTSelectiveListeningHoldConf : TATTSelectiveListeningHoldConfEvent read FOnATTSelectiveListeningHoldConf write FOnATTSelectiveListeningHoldConf;
      property OnATTSelectiveListeningRetrieveConf : TATTSelectiveListeningRetrieveConfEvent read FOnATTSelectiveListeningRetrieveConf write FOnATTSelectiveListeningRetrieveConf;
  end;

implementation

uses SysUtils, uBasicCallControlCtConector, uMonitorServicesCtConector,
  uATTPDefs_h;

{ TEscapeServicesCtConector }

// FUNCAO QUE CHAMA DIRETAMENTE A ROTINA CSTAESCAPESERVICES
function TEscapeServicesCtConector.EscapeServices(
  const PrivateData: ATTPrivateData_t; const InvokeID : TInvokeID): TSAPI;
begin
Result := cstaEscapeService( FAcsHandle, InvokeID, @PrivateData );
CheckForGoodCtResult( Result, 'cstaEscapeService' );
end;

// TRATADOR PRINCIPAL DOS EVENTOS DESTA CLASSE
procedure TEscapeServicesCtConector.HandleCtEvent(Event: CSTAEvent_t;
  PrivateData: ATTPrivateData_t);
begin
inherited;
case Event.eventHeader.eventClass of

  CSTACONFIRMATION :
    case Event.eventHeader.eventType of
      CSTA_ESCAPE_SVC_CONF :
        RaiseCSTAEscapeSvcConf( Event, PrivateData );
    end;

  CSTAEVENTREPORT_ :
    case Event.eventHeader.eventType of
      CSTA_PRIVATE :
        RaiseCSTAPrivateEvent( Event, PrivateData );
    end;

  end;
end;

// FUNCAO UTILITARIA QUE MONTA A SOLICITACAO DE QUERYACDSPLIT E SOLICITA-A
// AO PABX
function TEscapeServicesCtConector.QueryAcdSplit(
  const device: TDeviceID; const InvokeID : TInvokeID): TSAPI;
var
  _device : DeviceID_t;
  PrivateData : ATTPrivateData_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( device <> EmptyStr, 'QueryAcdSplit' ) then
  exit;

PrepareDeviceID_t( _device, device );
PrepareATTPrivateData_t( PrivateData );

Result := attQueryAcdSplit( @PrivateData, @_device );

if not CheckForGoodCtResult( Result, 'attQueryAcdSplit' ) then
  exit;

Result := EscapeServices( PrivateData, InvokeID );
end;

// FUNCAO UTILITARIA QUE MONTA A SOLICITACAO DE QUERYAGENTLOGIN E SOLICITA-A
// AO PABX
function TEscapeServicesCtConector.QueryAgentLogin(
  const device: TDeviceID; const InvokeID : TInvokeID): TSAPI;
var
  _device : DeviceID_t;
  PrivateData : ATTPrivateData_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( device <> EmptyStr, 'QueryAcdSplit' ) then
  exit;

PrepareDeviceID_t( _device, device );
PrepareATTPrivateData_t( PrivateData );

Result := attQueryAgentLogin( @PrivateData, @_device );

if not CheckForGoodCtResult( Result, 'attQueryAgentLogin' ) then
  exit;

Result := EscapeServices( PrivateData, InvokeID );
end;

// FUNCAO UTILITARIA QUE MONTA A SOLICITACAO DE QUERYTRUNKGROUP E SOLICITA-A
// AO PABX
function TEscapeServicesCtConector.QueryTrunkGroup(
  const device: TDeviceID; const InvokeID : TInvokeID): TSAPI;
var
  _device : DeviceID_t;
  PrivateData : ATTPrivateData_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( device <> EmptyStr, 'QueryTrunkGroup' ) then
  exit;

PrepareDeviceID_t( _device, device );
PrepareATTPrivateData_t( PrivateData );

Result := attQueryTrunkGroup( @PrivateData, @_device );

if not CheckForGoodCtResult( Result, 'attQueryTrunkGroup' ) then
  exit;

Result := EscapeServices( PrivateData, InvokeID );
end;

// DISPARADOR DO EVENTO ATTQUERYACDSPLITCONF
procedure TEscapeServicesCtConector.RaiseATTQueryAcdSplitConf(
  Event: CSTAEvent_t; ATTEvent: ATTEvent_t);
begin
if not Assigned( FOnATTQueryAcdSplitConf ) then
  exit;

try
  FOnATTQueryAcdSplitConf( Self, Event._event.cstaConfirmation.invokeID,
    ATTEvent.u.queryAcdSplit.availableAgents,
    ATTEvent.u.queryAcdSplit.callsInQueue,
    ATTEvent.u.queryAcdSplit.agentsLoggedIn );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnATTQueryAcdSplitConf', E.Message );
    end;
end;
end;

// DISPARADOR DO EVENTO ATTQUERYAGENTLOGINCONF
procedure TEscapeServicesCtConector.RaiseATTQueryAgentLoginConf(
  Event: CSTAEvent_t; ATTEvent: ATTEvent_t);
begin
if not Assigned( FOnATTQueryAgentLoginConf ) then
  exit;

try
  FOnATTQueryAgentLoginConf( Self, Event._event.cstaConfirmation.invokeID,
    ATTEvent.u.queryAgentLogin.privEventCrossRefID );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnATTQueryAgentLoginConf', E.Message );
    end;
end;
end;

// DISPARADOR DO EVENTO ATTQUERYAGENTLOGINEND
procedure TEscapeServicesCtConector.RaiseATTQueryAgentLoginEnd(
  Event: CSTAEvent_t; ATTEvent: ATTEvent_t);
begin
if not Assigned( FOnATTQueryAgentLoginEnd ) then
  exit;

try
  FOnATTQueryAgentLoginEnd( Self, ATTEvent.u.queryAgentLoginResp.privEventCrossRefID );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnATTQueryAgentLoginEnd', E.Message );
    end;
end;
end;

// DISPARADOR DO EVENTO ATTQUERYAGENTLOGINRESP
procedure TEscapeServicesCtConector.RaiseATTQueryAgentLoginResp(
  Event: CSTAEvent_t; ATTEvent: ATTEvent_t);
var
  I : Integer;
  vec : array of ShortString;
begin
if not Assigned( FOnATTQueryAgentLoginResp ) then
  exit;

if ATTEvent.u.queryAgentLoginResp.list.count <= 0 then
  begin
  RaiseATTQueryAgentLoginEnd( Event, ATTEvent );
  exit;
  end;

SetLength( vec, ATTEvent.u.queryAgentLoginResp.list.count );

for I := 0 to ATTEvent.u.queryAgentLoginResp.list.count - 1 do
  vec[ I ] := ATTEvent.u.queryAgentLoginResp.list.device[ I ];

try
  FOnATTQueryAgentLoginResp( Self,
  ATTEvent.u.queryAgentLoginResp.privEventCrossRefID, vec );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnATTQueryAgentLoginResp', E.Message );
    end;
end;
end;

// DISPARADOR DO EVENTO CSTAESCAPESVCCONF
// DENTRO DESTE EVENTO SAO OBTIDOS OS EVENTOS PRIVADOS DE ESCAPESERVICE
procedure TEscapeServicesCtConector.RaiseCSTAEscapeSvcConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var
  ret : TSAPI;
  ATTEvent : ATTEvent_t;
begin

RaiseNullConfEvent( FOnCSTAEscapeSvcConf, 'FOnCSTAEscapeSvcConf', Event, PrivateData );

if not CheckPrivateDataLength( PrivateData, 'RaiseCSTAEscapeSvcConf' ) then
  exit;

ret := attPrivateData( @PrivateData, @ATTEvent );

if not CheckForGoodCtResult( ret, 'attPrivateData' ) then
  exit;

case ATTEvent.eventType of
  ATT_QUERY_ACD_SPLIT_CONF :
    RaiseATTQueryAcdSplitConf( Event, ATTEvent );

  ATT_QUERY_AGENT_LOGIN_CONF :
    RaiseATTQueryAgentLoginConf( Event, ATTEvent );

  ATT_QUERY_TG_CONF :
    RaiseATTQueryTgConfEvent( Event, ATTEvent );

  ATT_QUERY_CALL_CLASSIFIER_CONF :
    RaiseATTQueryCallClassifierConfEvent( Event, ATTEvent );

  ATT_QUERY_DEVICE_NAME_CONF :
    RaiseATTQueryDeviceNameEvent( Event, ATTEvent );

  ATT_SELECTIVE_LISTENING_HOLD_CONF :
    RaiseATTSelectiveListeningHoldConfEvent( Event, ATTEvent );

  ATT_SELECTIVE_LISTENING_RETRIEVE_CONF :
    RaiseATTSelectiveListeningRetrieveConfEvent( Event, ATTEvent );
  end;
end;

// DISPARADOR DO EVENTO CSTAPRIVATE
procedure TEscapeServicesCtConector.RaiseCSTAPrivateEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var
  ret : TSAPI;
  ATTEvent : ATTEvent_t;
begin

if not Assigned( FOnCSTAPrivate ) then
  exit;

try
  FOnCSTAPrivate( Self, PrivateData );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTAPrivate', E.Message );
    end;
end;

if not CheckPrivateDataLength( PrivateData, 'FOnCSTAPrivate' ) then
  exit;

ret := attPrivateData( @PrivateData, @ATTEvent );

if not CheckForGoodCtResult( ret, 'attPrivateData' ) then
  exit;

  case ATTEvent.eventType of

    ATT_QUERY_AGENT_LOGIN_RESP :
      RaiseATTQueryAgentLoginResp( Event, ATTEvent );

    end;
end;

// DISPARADOR DO EVENTO ATTQUERYTGCONF (TRUNKGROUP)
procedure TEscapeServicesCtConector.RaiseATTQueryTgConfEvent(
  Event: CSTAEvent_t; ATTEvent: ATTEvent_t);
begin
if not Assigned( FOnATTQueryTgConf ) then
  exit;

try
  FOnATTQueryTgConf( Self, Event._event.cstaConfirmation.invokeID,
    ATTEvent.u.queryTg.idleTrunks,
    ATTEvent.u.queryTg.usedTrunks );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnATTQueryTgConf', E.Message );
    end;
end;
end;

// FUNCAO UTILITARIA QUE MONTA A SOLICITACAO DE QUERYCALLCLASSIFIER E SOLICITA-A
// AO PABX
function TEscapeServicesCtConector.QueryCallClassifier(
  const InvokeID : TInvokeID ): TSAPI;
var PrivateData : ATTPrivateData_t;
begin
PrepareATTPrivateData_t( PrivateData );
Result := attQueryCallClassifier( @PrivateData );
if not CheckForGoodCtResult( Result, 'attQueryCallClassifier' ) then
  exit;

EscapeServices( PrivateData, InvokeID );
end;

// DISPARADOR DO EVENTO ATTQUERYCALLCLASSIFIER
procedure TEscapeServicesCtConector.RaiseATTQueryCallClassifierConfEvent(
  Event: CSTAEvent_t; ATTEvent: ATTEvent_t);
begin
if not Assigned( FOnATTQueryCallClassifierConf ) then
  exit;

try
  FOnATTQueryCallClassifierConf( Self, Event._event.cstaConfirmation.invokeID,
    ATTEvent.u.queryCallClassifier.numAvailPorts,
    ATTEvent.u.queryCallClassifier.numInUsePorts );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnATTQueryCallClassifierConf', E.Message );
    end;
end;
end;

function TEscapeServicesCtConector.QueryDeviceName(const device: TDeviceID;
  const InvokeID: TInvokeID): TSAPI;
var
  _device : DeviceID_t;
  PrivateData : ATTPrivateData_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( device <> EmptyStr, 'QueryDeviceName' ) then
  exit;

PrepareDeviceID_t( _device, device );
PrepareATTPrivateData_t( PrivateData );

Result := attQueryDeviceName( @PrivateData, @_device );

if not CheckForGoodCtResult( Result, 'attQueryDeviceName' ) then
  exit;

Result := EscapeServices( PrivateData, InvokeID );
end;

procedure TEscapeServicesCtConector.RaiseATTQueryDeviceNameEvent(
  Event: CSTAEvent_t; ATTEvent: ATTEvent_t);
begin
if not Assigned( FOnATTQueryDeviceNameConf ) then
  exit;

try
  FOnATTQueryDeviceNameConf( Self, Event._event.cstaConfirmation.invokeID, ATTEvent.u.queryDeviceName.deviceType,
    ATTEvent.u.queryDeviceName.device, ATTEvent.u.queryDeviceName.name, ATTEvent.u.queryDeviceName.uname);
except
  on E : Exception do
    begin
    CatchEventException( 'FOnATTQueryDeviceNameConf', E.Message );
    end;
end;
end;

function TEscapeServicesCtConector.SelectiveListeningHold(
  const subjectConnectionCallId: TCallId;
  const subjectConnectionDevice: TDeviceId; const allParties: boolean;
  const selectedPartyCallId: TCallId; const selectedPartyDevice: TDeviceId;
  const InvokeID : TInvokeID): TSAPI;
var
  subjectConnection, selectedParty : ConnectionID_t;
  PrivateData : ATTPrivateData_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( (subjectConnectionCallId > 0) and
  (Length(subjectConnectionDevice) > 0) and (selectedPartyCallId > 0) and
  (Length(selectedPartyDevice) > 0), Format( '%s.HoldCall', [ ClassName ] ) ) then
  exit;

PrepareATTPrivateData_t(PrivateData);
PrepareConnectionID_t( subjectConnection, subjectConnectionCallId,
  subjectConnectionDevice );
PrepareConnectionID_t( selectedParty, selectedPartyCallId, selectedPartyDevice );

Result := attSelectiveListeningHold(@PrivateData, @subjectConnection,
  allParties, @selectedParty);

if not CheckForGoodCtResult( Result, 'attSelectiveListeningHold' ) then
  exit;

Result := EscapeServices( PrivateData, InvokeID );
end;

function TEscapeServicesCtConector.SelectiveListeningRetrieve(
  const subjectConnectionCallId: TCallId;
  const subjectConnectionDevice: TDeviceId; const allParties: boolean;
  const selectedPartyCallId: TCallId; const selectedPartyDevice: TDeviceId;
  const InvokeID: TInvokeID): TSAPI;
var
  subjectConnection, selectedParty : ConnectionID_t;
  PrivateData : ATTPrivateData_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( (subjectConnectionCallId > 0) and
  (Length(subjectConnectionDevice) > 0) and (selectedPartyCallId > 0) and
  (Length(selectedPartyDevice) > 0), Format( '%s.HoldCall', [ ClassName ] ) ) then
  exit;

PrepareATTPrivateData_t(PrivateData);
PrepareConnectionID_t( subjectConnection, subjectConnectionCallId,
  subjectConnectionDevice );
PrepareConnectionID_t( selectedParty, selectedPartyCallId, selectedPartyDevice );

Result := attSelectiveListeningRetrieve(@PrivateData, @subjectConnection,
  allParties, @selectedParty);

if not CheckForGoodCtResult( Result, 'attSelectiveListeningRetrieve' ) then
  exit;

Result := EscapeServices( PrivateData, InvokeID );
end;

procedure TEscapeServicesCtConector.RaiseATTSelectiveListeningHoldConfEvent(
  Event: CSTAEvent_t; ATTEvent: ATTEvent_t);
begin
if not Assigned( FOnATTSelectiveListeningHoldConf ) then
  exit;

try
  FOnATTSelectiveListeningHoldConf( Self, Event._event.cstaConfirmation.invokeID);
except
  on E : Exception do
    begin
    CatchEventException( 'FOnATTSelectiveListeningHoldConf', E.Message );
    end;
end;
end;

procedure TEscapeServicesCtConector.RaiseATTSelectiveListeningRetrieveConfEvent(
  Event: CSTAEvent_t; ATTEvent: ATTEvent_t);
begin
if not Assigned( FOnATTSelectiveListeningRetrieveConf ) then
  exit;

try
  FOnATTSelectiveListeningRetrieveConf( Self, Event._event.cstaConfirmation.invokeID);
except
  on E : Exception do
    begin
    CatchEventException( 'FOnATTSelectiveListeningRetrieveConf', E.Message );
    end;
end;
end;

end.
