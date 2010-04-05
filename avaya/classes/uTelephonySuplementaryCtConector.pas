{******************************************************************************
                                Autor: Daniel Jurado
                                 jurado@gmail.com
******************************************************************************}
unit uTelephonySuplementaryCtConector;

interface

uses uBasicCallControlCtConector, uCtTypes, uCSTADefs_h, uACS_h, uATTPDefs_h,
  uCtEvents, uATTPriv_h, uCSTA_h;

type
  // CLASSE QUE IMPLEMENTA OS SERVICOS SUPLEMENTARES DE TELEFONIA
  TTelephonySuplementaryCtConector = class( TBasicCallControlCtConector )
  private
    FOnCSTASetAgentStateConf   : TCSTASetAgentStateConfEvent;
    FOnCSTAQueryAgentStateConf : TCSTAQueryAgentStateConfEvent;
    FOnCSTAQueryDeviceInfoConf : TCSTAQueryDeviceInfoConfEvent;

    procedure RaiseCSTASetAgentStateConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAQueryAgentStateConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAQueryDeviceInfoConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
  protected
    procedure HandleCtEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );override;
  public
    function SetAgentState( const device : TDeviceID;
      const agentMode : AgentMode_t;
      const agentID, agentGroup, agentPassword : ShortString;
      const workMode : ATTWorkMode_t; const reasonCode : Integer;
      const enablePending : Boolean; const InvokeID : TInvokeID = 0 ) : TSAPI;

    function QueryAgentState( const device : TDeviceID;
      const InvokeID : TInvokeID = 0 ) : TSAPI;

    function QueryDeviceInfo( const device : TDeviceID;
      const InvokeID : TInvokeID = 0 ) : TSAPI;

  published
    property OnCSTASetAgentStateConf    : TCSTASetAgentStateConfEvent   read FOnCSTASetAgentStateConf   write FOnCSTASetAgentStateConf;
    property OnCSTAQueryAgentStateConf  : TCSTAQueryAgentStateConfEvent read FOnCSTAQueryAgentStateConf write FOnCSTAQueryAgentStateConf;
    property OnCSTAQueryDeviceInfoConf  : TCSTAQueryDeviceInfoConfEvent read FOnCSTAQueryDeviceInfoConf write FOnCSTAQueryDeviceInfoConf;
  end;

implementation

uses SysUtils, uStreamerCtConector, uMonitorServicesCtConector;

{ TTelephonySuplementaryCtConector }

// TRATADOR PRINCIPAL DOS EVENTOS DESTA CLASSE
procedure TTelephonySuplementaryCtConector.HandleCtEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
inherited;
case Event.eventHeader.eventClass of

  CSTACONFIRMATION :
    case Event.eventHeader.eventType of
      CSTA_SET_AGENT_STATE_CONF :
        RaiseCSTASetAgentStateConf( Event, PrivateData );

      CSTA_QUERY_AGENT_STATE_CONF :
        RaiseCSTAQueryAgentStateConf( Event, PrivateData );

      CSTA_QUERY_DEVICE_INFO_CONF :
        RaiseCSTAQueryDeviceInfoConf( Event, PrivateData );

    end;
end;
end;

// FUNCAO QUE SOLICITA O ESTADO DE UM DETERMINADO AGENTE NO PABX
function TTelephonySuplementaryCtConector.QueryAgentState(
  const device: TDeviceID; const InvokeID : TInvokeID = 0): TSAPI;
var
  _device : DeviceID_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( device <> EmptyStr, 'QueryAgentState' ) then
  exit;

PrepareDeviceID_t( _device, device );
Result := cstaQueryAgentState( FAcsHandle, InvokeID, @_device, nil );
CheckForGoodCtResult( Result, 'cstaQueryAgentState' );
end;

// FUNCAO QUE SOLICITA INFORMACOES SOBRE UM DETERMINADO DISPOSITIVO
function TTelephonySuplementaryCtConector.QueryDeviceInfo(
  const device: TDeviceID; const InvokeID : TInvokeID = 0): TSAPI;
var _device : DeviceID_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( device <> EmptyStr, 'QueryDeviceInfo' ) then
  exit;

PrepareDeviceID_t( _device, device );
Result := cstaQueryDeviceInfo( FAcsHandle, InvokeID, @_device, nil );
CheckForGoodCtResult( Result, 'cstaQueryDeviceInfo' );
end;

// DISPARADOR DO EVENTO CSTAQUERYAGENTSTATECONF
procedure TTelephonySuplementaryCtConector.RaiseCSTAQueryAgentStateConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var ATTEvent : ATTEvent_t;
begin
if not Assigned( FOnCSTAQueryAgentStateConf ) then
  exit;

if PrivateData.length <= 0 then
  begin
  try
    FOnCSTAQueryAgentStateConf( Self, Event._event.cstaConfirmation.invokeID,
      Event._event.cstaConfirmation.queryAgentState.agentState, WM_NONE,
      TS_IDLE, 0, WM_NONE, 0 );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnCSTAQueryAgentStateConf', E.Message );
      end;
  end;
  exit;
  end;

if not ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_QUERY_AGENT_STATE_CONF,
  ATTEvent, 'FOnCSTAQueryAgentStateConf' ) then
  exit;

try
  FOnCSTAQueryAgentStateConf( Self, Event._event.cstaConfirmation.invokeID,
    Event._event.cstaConfirmation.queryAgentState.agentState,
    ATTEvent.u.queryAgentState.workMode,
    ATTEvent.u.queryAgentState.talkState,
    ATTEvent.u.queryAgentState.reasonCode,
    ATTEvent.u.queryAgentState.pendingWorkMode,
    ATTEvent.u.queryAgentState.pendingReasonCode );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTAQueryAgentStateConf', E.Message );
    end;
end;
end;

// DISPARADOR DO EVENTO CSTAQUERYDEVICEINFOCONF
procedure TTelephonySuplementaryCtConector.RaiseCSTAQueryDeviceInfoConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var ATTEvent : ATTEvent_t;
begin
if not Assigned( FOnCSTAQueryDeviceInfoConf ) then
  exit;

if not ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_QUERY_DEVICE_INFO_CONF,
  ATTEvent, 'FOnCSTAQueryDeviceInfoConf' ) then
  exit;

try
  FOnCSTAQueryDeviceInfoConf( Self, Event._event.cstaConfirmation.invokeID,
    Event._event.cstaConfirmation.queryDeviceInfo.device,
    Event._event.cstaConfirmation.queryDeviceInfo.deviceType,
    Event._event.cstaConfirmation.queryDeviceInfo.deviceClass,
    ATTEvent.u.queryDeviceInfo.extensionClass,
    ATTEvent.u.queryDeviceInfo.associatedClass,
    ATTEvent.u.queryDeviceInfo.associatedDevice );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTAQueryDeviceInfoConf', E.Message );
    end;
end;
end;

// DISPARADOR DO EVENTO CSTASETAGENTSTATECONF
procedure TTelephonySuplementaryCtConector.RaiseCSTASetAgentStateConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var ATTEvent : ATTEvent_t;
begin
if not Assigned( FOnCSTASetAgentStateConf ) then
  exit;

if not ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_SET_AGENT_STATE_CONF,
  ATTEvent, 'FOnCSTASetAgentStateConf' ) then
  exit;

try
  FOnCSTASetAgentStateConf( Self, Event._event.cstaConfirmation.invokeID,
    ATTEvent.u.setAgentState.isPending );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTASetAgentStateConf', E.Message );
    end;
end;
end;

// FUNCAO QUE SOLICITA A MODIFICACAO DO ESTADO DE UM AGENTE NO PABX
function TTelephonySuplementaryCtConector.SetAgentState(
  const device: TDeviceID; const agentMode: AgentMode_t; const agentID,
  agentGroup, agentPassword: ShortString;
  const workMode : ATTWorkMode_t; const reasonCode : Integer;
  const enablePending : Boolean; const InvokeID : TInvokeID = 0): TSAPI;
var
  _device : DeviceID_t;
  _agentID : AgentID_t;
  _agentGroup : AgentGroup_t;
  _agentPassword : AgentPassword_t;
  PrivateData : ATTPrivateData_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( ( device <> EmptyStr ) and ( agentGroup <> EmptyStr ),
  'SetAgentState' ) then
  exit;

PrepareDeviceID_t( _device, device );
ShortStringToArrayOfChar( _agentID, agentID );
PrepareDeviceID_t( _agentGroup, agentGroup );
ShortStringToArrayOfChar( _agentPassword, agentPassword );
PrepareATTPrivateData_t( PrivateData );

Result := attV6SetAgentState( @PrivateData, workMode, reasonCode, enablePending );

if not CheckForGoodCtResult( Result, 'attV6SetAgentState' ) then
  exit;

Result := cstaSetAgentState( FAcsHandle, InvokeID, @_device, agentMode, @_agentID,
  @_agentGroup, @_agentPassword, @PrivateData );
CheckForGoodCtResult( Result, 'cstaSetAgentState' );
end;

end.

