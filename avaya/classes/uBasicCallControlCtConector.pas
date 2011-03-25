{******************************************************************************
                                Autor: Daniel Jurado
                                 jurado@gmail.com
******************************************************************************}
unit uBasicCallControlCtConector;

interface

uses uStreamerCtConector, uMonitorServicesCtConector, uCSTADefs_h, uATTPDefs_h,
  uATTPriv_h, uACS_h, uCSTA_h, uCtTypes, uCtEvents;

type
  // CLASSE QUE IMPLEMENTA OS SERVICOS BASICOS DE TELEFONIA
  TBasicCallControlCtConector = class( TMonitorServicesCtConector )
  private

    FOnCSTAAlternateCallConf      : TCSTAAlternateCallConfEvent;
    FOnCSTAAnswerCallConf         : TCSTAAnswerCallConfEvent;
    FOnCSTAConferenceCallConf     : TCSTAConferenceCallConfEvent;
    FOnCSTAConsultationCallConf   : TCSTAConsultationCallConfEvent;
    FOnCSTADeflectCallConf        : TCSTADeflectCallConfEvent;
    FOnCSTAClearCallConf          : TCSTAClearCallConfEvent;
    FOnCSTAClearConnectionConf    : TCSTAClearConnectionConfEvent;
    FOnCSTAGroupPickupCallConf    : TCSTAGroupPickupCallConfEvent;
    FOnCSTAHoldCallConf           : TCSTAHoldCallConfEvent;
    FOnCSTAMakeCallConf           : TCSTAMakeCallConfEvent;
    FOnCSTAMakePredictiveCallConf : TCSTAMakePredictiveCallConfEvent;
    FOnCSTARetrieveCallConf       : TCSTARetrieveCallConfEvent;
    FOnCSTATransferCallConf       : TCSTATransferCallConfEvent;

    procedure RaiseCSTAAlternateCallConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAAnswerCallConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAConferenceCallConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAConsultationCallConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTADeflectCallConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAClearCallConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAClearConnectionConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAGroupPickUpCallConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAHoldCallConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAMakeCallConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAMakePredictiveCallCallConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTARetrieveCallConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTATransferCallConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );

  protected
    procedure HandleCtEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );override;

    procedure PrepareATTPrivateData_t( var MyPrivateData : ATTPrivateData_t );
    procedure PrepareATTUserToUserInfo_t( var MyUserToUserInfo : ATTUserToUserInfo_t;
      const UserToUserInfo : ShortString );

  public

    function AlternateCall( const activeCall, otherCall : TCallID;
      DeviceID : TDeviceID = ''; const InvokeID : TInvokeID = 0 ) : TSAPI;

    function AnswerCall( const alertingCall : TCallID;
      DeviceID : TDeviceID = ''; const InvokeID : TInvokeID = 0 ) : TSAPI;

    function ConferenceCall( const heldCall, activeCall : TCallID;
      const deviceID : TDeviceID; const InvokeID : TInvokeID = 0 ) : TSAPI;

    function ConsultationCall( const activeCall : TCallID;
      const callingDevice, calledDevice : TDeviceID;
      const UserToUserInformation : ShortString = '';
      const InvokeID : TInvokeID = 0 ) : TSAPI;

    function DeflectCall( const deflectCall : TCallID;
      const deviceID, calledDevice : TDeviceID;
      const InvokeID : TInvokeID = 0 ) : TSAPI;

    function ClearCall( const call : TCallID; const deviceID : TDeviceID;
      const InvokeID : TInvokeID = 0 ) : TSAPI;

    function ClearConnection( const call : TCallID; const deviceID : TDeviceID;
      const UserToUserInformation : ShortString = '';
      const InvokeID : TInvokeID = 0 ) : TSAPI;

    function GroupPickupCall( const deflectCall : TCallID;
      const deviceID, pickupDevice : TDeviceID;
      const InvokeID : TInvokeID = 0 ) : TSAPI;

    function HoldCall( const activeCall : TCallID; const deviceID : TDeviceID;
      const InvokeID : TInvokeID = 0 ) : TSAPI;

    function MakeCall( const callingDevice : TDeviceID;
      const calledDevice : TDeviceID;
      const UserToUserInformation : ShortString = '';
      const InvokeID : TInvokeID = 0 ) : TSAPI;

    function MakePredictiveCall( const callingDevice, calledDevice : TDeviceID;
      const allocationState : AllocationState_t; const priorityCalling : Boolean;
      const maxRings : Cardinal; answerTreat : ATTAnswerTreat_t;
      const UserToUserInformation : ShortString = '';
      const InvokeID : TInvokeID = 0 ) : TSAPI;

    function RetrieveCall( const heldCall : TCallID; const deviceID : TDeviceID;
      const InvokeID : TInvokeID = 0 ) : TSAPI;

    function TransferCall( const heldCall, activeCall : TCallID;
      const deviceID : TDeviceID;
      const InvokeID : TInvokeID = 0 ) : TSAPI;

  published
    property OnCSTAAlternateCallConf      : TCSTAAlternateCallConfEvent      read FOnCSTAAlternateCallConf      write FOnCSTAAlternateCallConf;
    property OnCSTAAnswerCallConf         : TCSTAAnswerCallConfEvent         read FOnCSTAAnswerCallConf         write FOnCSTAAnswerCallConf;
    property OnCSTAConferenceCallConf     : TCSTAConferenceCallConfEvent     read FOnCSTAConferenceCallConf     write FOnCSTAConferenceCallConf;
    property OnCSTAConsultationCallConf   : TCSTAConsultationCallConfEvent   read FOnCSTAConsultationCallConf   write FOnCSTAConsultationCallConf;
    property OnCSTADeflectCallConf        : TCSTADeflectCallConfEvent        read FOnCSTADeflectCallConf        write FOnCSTADeflectCallConf;
    property OnCSTAClearCallConf          : TCSTAClearCallConfEvent          read FOnCSTAClearCallConf          write FOnCSTAClearCallConf;
    property OnCSTAClearConnectionConf    : TCSTAClearConnectionConfEvent    read FOnCSTAClearConnectionConf    write FOnCSTAClearConnectionConf;
    property OnCSTAGroupPickupCallConf    : TCSTAGroupPickupCallConfEvent    read FOnCSTAGroupPickupCallConf    write FOnCSTAGroupPickupCallConf;
    property OnCSTAHoldCallConf           : TCSTAHoldCallConfEvent           read FOnCSTAHoldCallConf           write FOnCSTAHoldCallConf;
    property OnCSTAMakeCallConf           : TCSTAMakeCallConfEvent           read FOnCSTAMakeCallConf           write FOnCSTAMakeCallConf;
    property OnCSTAMakePredictiveCallConf : TCSTAMakePredictiveCallConfEvent read FOnCSTAMakePredictiveCallConf write FOnCSTAMakePredictiveCallConf;
    property OnCSTARetrieveCallConf       : TCSTARetrieveCallConfEvent       read FOnCSTARetrieveCallConf       write FOnCSTARetrieveCallConf;
    property OnCSTATransferCallConf       : TCSTATransferCallConfEvent       read FOnCSTATransferCallConf       write FOnCSTATransferCallConf;
  end;

implementation

uses SysUtils, Math, Classes, uTranslations;

{ TSwitchingCtConector }

// SOLICITA ALTERNANCIA (PENDULO) ENTRE DUAS CHAMADAS ATIVAS
function TBasicCallControlCtConector.AlternateCall(const activeCall,
  otherCall : TCallID; DeviceID : ShortString; const InvokeID : TInvokeID ): TSAPI;
var
  FactiveCall, FotherCall : ConnectionID_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( ( ( activecall > 0 ) and ( otherCall > 0 ) ),
  Format( '%s.AlternateCall', [ ClassName ] ) ) then
  exit;

PrepareConnectionID_t( FactiveCall, activeCall, DeviceID );
PrepareConnectionID_t( FotherCall, otherCall, DeviceID );
Result := cstaAlternateCall( FAcsHandle, InvokeID, @FactiveCall, @FotherCall, nil );
CheckForGoodCtResult( Result, 'cstaAlternateCall' );
end;

// SOLICITA O ATENDIMENTO DE UMA CHAMADA. FUNCIONA COMO SE O RAMAL TIVESSE
// SIDO TIRADO DO GANCHO PARA REALIZAR O ATENDIMENTO
function TBasicCallControlCtConector.AnswerCall(const alertingCall: TCallID;
  DeviceID: ShortString; const InvokeID : TInvokeID): TSAPI;
var
  FalertingCall : ConnectionID_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( alertingCall > 0, Format( '%s.AnswerCall', [ ClassName ] ) ) then
  exit;

PrepareConnectionID_t( FalertingCall, alertingCall, DeviceID );
Result := cstaAnswerCall( FAcsHandle, InvokeID, @FalertingCall, nil );
CheckForGoodCtResult( Result, 'cstaAnswerCall' );
end;

// SOLICITA ENCERRAMENTO DE UMA DETERMINADA CHAMADA (POR NO GANCHO)
function TBasicCallControlCtConector.ClearCall(const call: TCallID;
  const deviceID : TDeviceID; const InvokeID : TInvokeID): TSAPI;
var _call : ConnectionID_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( call > 0, Format( '%s.ClearCall', [ ClassName ] ) ) then
  exit;

PrepareConnectionID_t( _call, call, deviceID );
Result := cstaClearCall( FAcsHandle, InvokeID, @_call, nil );
CheckForGoodCtResult( Result, 'cstaClearCall' );
end;

// SOLICITA ENCERRAMENTO DE UMA CONEXAO ENTRE DOIS DISPOSITIVOS
// (ANALOGO, MAS NAO IDENTICO, A ENCERRAR UMA CHAMADA)
function TBasicCallControlCtConector.ClearConnection(const call: TCallID;
  const deviceID : TDeviceID;
  const UserToUserInformation: ShortString;
  const InvokeID : TInvokeID): TSAPI;
var
  _call : ConnectionID_t;
  PrivateData : ATTPrivateData_t;
  UserToUserInfo : ATTUserToUserInfo_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( call > 0, Format( '%s.ClearConnection', [ ClassName ] ) ) then
  exit;

PrepareConnectionID_t( _call, call, deviceID );
PrepareATTPrivateData_t( PrivateData );
PrepareATTUserToUserInfo_t( UserToUserInfo, UserToUserInformation );

Result := attV6ClearConnection( @PrivateData, DR_NONE, @UserToUserInfo );

if not CheckForGoodCtResult( Result, 'attV6ClearConnection' ) then
  exit;

Result := cstaClearConnection( FAcsHandle, InvokeID, @_call, @PrivateData );
CheckForGoodCtResult( Result, 'cstaClearConnection' );
end;

// SOLICITA UMA CONFERENCIA ENTRE UMA CHAMADA ATIVA E UMA RETIDA
function TBasicCallControlCtConector.ConferenceCall(const heldCall,
  activeCall: TCallID; const deviceID : TDeviceID;
  const InvokeID : TInvokeID): TSAPI;
var
  _heldCall,
  _activeCall : ConnectionID_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( ( heldCall > 0 ) and ( activeCall > 0 ),
  Format( '%s.ConferenceCall', [ ClassName ] ) ) then
  exit;

PrepareConnectionID_t( _heldCall, heldCall, deviceID );
PrepareConnectionID_t( _activeCall, activeCall, deviceID );
Result := cstaConferenceCall( FAcsHandle, InvokeID, @_heldCall, @_activeCall, nil );
CheckForGoodCtResult( Result, 'cstaConferenceCall' );
end;

// REALIZA UMA CONSULTA, RETENDO A CHAMADA ATIVA E REALIZANDO UMA NOVA
function TBasicCallControlCtConector.ConsultationCall(
  const activeCall : TCallID;
  const callingDevice, calledDevice: TDeviceID;
  const UserToUserInformation: ShortString;
  const InvokeID : TInvokeID): TSAPI;
var
  _activeCall          : ConnectionID_t;
  _calledDevice        : DeviceID_t;
  PrivateData          : ATTPrivateData_t;
  UserToUserInfo       : ATTUserToUserInfo_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( ( activeCall > 0 ) and ( calledDevice <> EmptyStr ),
  Format( '%s.ConsultationCall', [ ClassName ] ) ) then
  exit;

PrepareConnectionID_t( _activeCall, activeCall, callingDevice );
PrepareDeviceID_t( _calledDevice, calledDevice );
PrepareATTPrivateData_t( PrivateData );
PrepareATTUserToUserInfo_t( UserToUserInfo, UserToUserInformation );

Result := attV6ConsultationCall( @PrivateData, nil, false, @UserToUserInfo );

if not CheckForGoodCtResult( Result, 'attV6ConsultationCall' ) then
  exit;

Result := cstaConsultationCall( FAcsHandle, InvokeID, @_activeCall,
  @_calledDevice, @PrivateData );
CheckForGoodCtResult( Result, 'cstaConsultationCall' );
end;

// TRANSFERE UMA CHAMADA (RINGANDO) PARA OUTRO DISPOSITIVO.
function TBasicCallControlCtConector.DeflectCall(const deflectCall: TCallID;
  const deviceID, calledDevice: TDeviceID;
  const InvokeID : TInvokeID): TSAPI;
var
  _deflectCall : ConnectionID_t;
  _calledDevice : DeviceID_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( ( deflectCall > 0 ) and ( calledDevice <> EmptyStr ),
  Format( '%s.DeflectCall', [ ClassName ] ) ) then
  exit;

PrepareConnectionID_t( _deflectCall, deflectCall, deviceID );
PrepareDeviceID_t( _calledDevice, calledDevice );
Result := cstaDeflectCall( FAcsHandle, InvokeID, @_deflectCall, @_calledDevice, nil );
CheckForGoodCtResult( Result, 'cstaDeflectCall' );
end;

// ATENDE UMA CHAMADA RINGANDO DENTRO DE UM GRUPO DE PICKUP
function TBasicCallControlCtConector.GroupPickupCall(const deflectCall: TCallID;
  const deviceID, pickupDevice: TDeviceID;
  const InvokeID : TInvokeID): TSAPI;
var
  _deflectCall : ConnectionID_t;
  _pickupDevice : DeviceID_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( deflectCall > 0,
  Format( '%s.GroupPickupCall', [ ClassName ] ) ) then
  exit;

PrepareConnectionID_t( _deflectCall, deflectCall, deviceID );
PrepareDeviceID_t( _pickupDevice, pickupDevice );
Result := cstaGroupPickupCall( FAcsHandle, InvokeID, @_deflectCall, @_pickUpDevice, nil );
CheckForGoodCtResult( Result, 'cstaGroupPickupCall' );
end;

// TRATADOR PRINCIPAL DOS EVENTOS DESTA CLASSE
procedure TBasicCallControlCtConector.HandleCtEvent(Event: CSTAEvent_t;
  PrivateData: ATTPrivateData_t);
begin
inherited;
case Event.eventHeader.eventClass of

  CSTACONFIRMATION :
    case Event.eventHeader.eventType of

      CSTA_ALTERNATE_CALL_CONF :
        RaiseCSTAAlternateCallConf( Event, PrivateData );

      CSTA_ANSWER_CALL_CONF :
        RaiseCSTAAnswerCallConf( Event, PrivateData );

      CSTA_CONFERENCE_CALL_CONF :
        RaiseCSTAConferenceCallConf( Event, PrivateData );

      CSTA_CONSULTATION_CALL_CONF :
        RaiseCSTAConsultationCallConf( Event, PrivateData );

      CSTA_DEFLECT_CALL_CONF :
        RaiseCSTADeflectCallConf( Event, PrivateData );

      CSTA_CLEAR_CALL_CONF :
        RaiseCSTAClearCallConf( Event, PrivateData );

      CSTA_CLEAR_CONNECTION_CONF :
        RaiseCSTAClearConnectionConf( Event, PrivateData );

      CSTA_GROUP_PICKUP_CALL_CONF :
        RaiseCSTAGroupPickUpCallConf( Event, PrivateData );

      CSTA_HOLD_CALL_CONF :
        RaiseCSTAHoldCallConf( Event, PrivateData );

      CSTA_MAKE_PREDICTIVE_CALL_CONF :
        RaiseCSTAMakePredictiveCallCallConf( Event, PrivateData );

      CSTA_MAKE_CALL_CONF :
        RaiseCSTAMakeCallConf( Event, PrivateData );

      CSTA_RETRIEVE_CALL_CONF :
        RaiseCSTARetrieveCallConf( Event, PrivateData );

      CSTA_TRANSFER_CALL_CONF :
        RaiseCSTATransferCallConf( Event, PrivateData );

    end;
end;
end;

// SOLICITA A RETENCAO DE UMA CHAMADA ATIVA
function TBasicCallControlCtConector.HoldCall(
  const activeCall: TCallID; const deviceID : TDeviceID;
  const InvokeID : TInvokeID): TSAPI;
var _activeCall : ConnectionID_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( activeCall > 0, Format( '%s.HoldCall', [ ClassName ] ) ) then
  exit;

PrepareConnectionID_t( _activeCall, activeCall, deviceID );
Result := cstaHoldCall( FAcsHandle, InvokeID, @_activeCall, true, nil );
CheckForGoodCtResult( Result, 'cstaHoldCall' );
end;

// REALIZA UMA CHAMADA A PARTIR DE UM DISPOSITIVO (RAMAL)
function TBasicCallControlCtConector.MakeCall(const callingDevice: TDeviceID;
  const calledDevice : TDeviceID;
  const UserToUserInformation: ShortString;
  const InvokeID : TInvokeID ): TSAPI;
var
  _calledDevice,
  _callingDevice      : DeviceID_t;
  PrivateData          : ATTPrivateData_t;
  UserToUserInfo       : ATTUserToUserInfo_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( calledDevice <> EmptyStr,
  Format( '%s.MakeCall', [ ClassName ] ) ) then
  exit;

PrepareDeviceID_t( _callingDevice, callingDevice );
PrepareDeviceID_t( _calledDevice, calledDevice );

PrepareATTPrivateData_t( PrivateData );
PrepareATTUserToUserInfo_t( UserToUserInfo, UserToUserInformation );

Result := attV6MakeCall(@PrivateData, nil, False, @UserToUserInfo );

if not CheckForGoodCtResult( Result, 'attV6MakeCall' ) then
  exit;

Result := cstaMakeCall( FAcsHandle, InvokeID, @_callingDevice, @_calledDevice, @PrivateData );
CheckForGoodCtResult( Result, 'cstaMakeCall' );
end;

// SOLICITA UMA CHAMADA COM DESTINO A UM ACDSPLIT.
// QUANDO O DESTINO DA CHAMADA ATENDÊ-LA, ELA É ENCAMINHADA PARA O GRUPO.
function TBasicCallControlCtConector.MakePredictiveCall(
  const callingDevice, calledDevice : TDeviceID;
  const allocationState : AllocationState_t; const priorityCalling : Boolean;
  const maxRings : Cardinal; answerTreat : ATTAnswerTreat_t;
  const UserToUserInformation : ShortString;
  const InvokeID : TInvokeID ) : TSAPI;
var
  _callingDevice, _calledDevice : DeviceID_t;
  PrivateData : ATTPrivateData_t;
  UserToUserInfo : ATTUserToUserInfo_t;
begin
Result := ACSERR_BADPARAMETER;
if not CheckParams( ( callingDevice <> EmptyStr ) and
  ( calledDevice <> EmptyStr ), 'MakePredictiveCall' ) then
  exit;

PrepareDeviceID_t( _callingDevice, callingDevice );
PrepareDeviceID_t( _calledDevice, calledDevice );
PrepareATTPrivateData_t( PrivateData );
PrepareATTUserToUserInfo_t( UserToUserInfo, UserToUserInformation );

Result := attV6MakePredictiveCall( @PrivateData, priorityCalling, maxRings,
  answerTreat, nil, @UserToUserInfo );

if not CheckForGoodCtResult( Result, 'attV6MakePredictiveCall' ) then
  exit;

Result := cstaMakePredictiveCall( FAcsHandle, InvokeID, @_callingDevice,
  @_calledDevice, allocationState, @PrivateData );
CheckForGoodCtResult( Result, 'cstaMakePredictiveCall' );
end;

// ROTINA UTILITARIA DE MONTAGEM DE ESTRUTURA DE PRIVATEDATA PARA TRAFEGO
// DE INFORMACOES JUNTO COM A CHAMADA.
procedure TBasicCallControlCtConector.PrepareATTPrivateData_t(
  var MyPrivateData: ATTPrivateData_t);
begin
FillChar( MyPrivateData, SizeOf( MyPrivateData ), 0 );
initATTPrivate( @MyPrivateData );
end;

// ROTINA UTILITARIA DE MONTAGEM DE UUI (USERTOUSERINFORMATION)
procedure TBasicCallControlCtConector.PrepareATTUserToUserInfo_t(
  var MyUserToUserInfo: ATTUserToUserInfo_t;
  const UserToUserInfo: ShortString);
begin
FillChar( MyUserToUserInfo, SizeOf( MyUserToUserInfo ), 0 );
MyUserToUserInfo._type := UUI_IA5_ASCII;
MyUserToUserInfo.data.length := Min( Length( UserToUserInfo ), ATT_MAX_UUI_SIZE );
StrPLCopy( @MyUserToUserInfo.data.value, UserToUserInfo , Min( Length( UserToUserInfo ), ATT_MAX_UUI_SIZE ) );
end;

// DISPARADOR DO EVENTO CSTAALTERNATECALLCONF
procedure TBasicCallControlCtConector.RaiseCSTAAlternateCallConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
  RaiseNullConfEvent( FOnCSTAAlternateCallConf, 'FOnCSTAAlternateCallConf', Event, PrivateData );
end;

// DISPARADOR DO EVENTO CSTAANSWERCALLCONF
procedure TBasicCallControlCtConector.RaiseCSTAAnswerCallConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
RaiseNullConfEvent( FOnCSTAAnswerCallConf, 'FOnCSTAAnswerCallConf', Event, PrivateData );
end;

// DISPARADOR DO EVENTO CSTACLEARCALLCONF
procedure TBasicCallControlCtConector.RaiseCSTAClearCallConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
RaiseNullConfEvent( FOnCSTAClearCallConf, 'FOnCSTAClearCallConf', Event, PrivateData );
end;

// DISPARADOR DO EVENTO CSTACLEARCONNECTIONCONF
procedure TBasicCallControlCtConector.RaiseCSTAClearConnectionConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
RaiseNullConfEvent( FOnCSTAClearConnectionConf, 'FOnCSTAClearConnectionConf', Event, PrivateData );
end;

// DISPARADOR DO EVENTO CSTACONFERENCECALLCONF
procedure TBasicCallControlCtConector.RaiseCSTAConferenceCallConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var
  ATTEvent : ATTEvent_t;
begin
if not Assigned( FOnCSTAConferenceCallConf ) then
  exit;

if not ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_CONFERENCE_CALL_CONF,
  ATTEvent, 'FOnCSTAConferenceCallConf' ) then
  exit;

try
  FOnCSTAConferenceCallConf( Self, Event._event.cstaConfirmation.invokeID,
    Event._event.cstaConfirmation.conferenceCall.newCall,
    Event._event.cstaConfirmation.conferenceCall.connList,
    ATTEvent.u.conferenceCall.ucid );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTAConferenceCallConf', E.Message );
    end;
end;
end;

// DISPARADOR DO EVENTO CSTACONSULTATIONCALLCONF
procedure TBasicCallControlCtConector.RaiseCSTAConsultationCallConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var
  ATTEvent : ATTEvent_t;
begin
if not Assigned( FOnCSTAConsultationCallConf ) then
  exit;

if not ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_CONSULTATION_CALL_CONF,
  ATTEvent, 'FOnCSTAConsultationCallConf' ) then
  exit;

try
  FOnCSTAConsultationCallConf( Self, Event._event.cstaConfirmation.invokeID,
    Event._event.cstaConfirmation.consultationCall.newCall,
    ATTEvent.u.consultationCall.ucid );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTAConsultationCallConf', E.Message );
    end;
end;
end;

// DISPARADOR DO EVENTO CSTADEFLECTCALLCONF
procedure TBasicCallControlCtConector.RaiseCSTADeflectCallConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
RaiseNullConfEvent( FOnCSTADeflectCallConf, 'FOnCSTADeflectCallConf', Event, PrivateData );
end;

// DISPARADOR DO EVENTO CSTAGROUPPICKUPCONF
procedure TBasicCallControlCtConector.RaiseCSTAGroupPickupCallConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
RaiseNullConfEvent( FOnCSTAGroupPickupCallConf, 'FOnCSTAGroupPickupCallConf', Event, PrivateData );
end;

// DISPARADOR DO EVENTO CSTAHOLDCALLCONF
procedure TBasicCallControlCtConector.RaiseCSTAHoldCallConf(Event: CSTAEvent_t;
  PrivateData: ATTPrivateData_t);
begin
RaiseNullConfEvent( FOnCSTAHoldCallConf, 'FOnCSTAHoldCallConf', Event, PrivateData );
end;

// DISPARADOR DO EVENTO CSTAMAKECALLCONF
procedure TBasicCallControlCtConector.RaiseCSTAMakeCallConf(Event: CSTAEvent_t;
  PrivateData: ATTPrivateData_t);
var
  ATTEvent : ATTEvent_t;
begin
if not Assigned( FOnCSTAMakeCallConf ) then
  exit;

if not ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_MAKE_CALL_CONF,
  ATTEvent, 'FOnCSTAMakeCallConf' ) then
  exit;

try
  FOnCSTAMakeCallConf( Self, Event._event.cstaConfirmation.invokeID,
    Event._event.cstaConfirmation.makeCall.newCall,
    ATTEvent.u.consultationCall.ucid );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTAMakeCallConf', E.Message );
    end;
end;
end;

// DISPARADOR DO EVENTO CSTAMAKEPREDICTIVECALLCONF
procedure TBasicCallControlCtConector.RaiseCSTAMakePredictiveCallCallConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var
  ATTEvent : ATTEvent_t;
begin
if not Assigned( FOnCSTAMakePredictiveCallConf ) then
  exit;

if not ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_MAKE_PREDICTIVE_CALL_CONF,
  ATTEvent, 'FOnCSTAMakePredictiveCallConf' ) then
  exit;

try
  FOnCSTAMakePredictiveCallConf( Self, Event._event.cstaConfirmation.invokeID,
   Event._event.cstaConfirmation.makePredictiveCall.newCal,
   ATTEvent.u.makePredictiveCall.ucid );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTAMakePredictiveCallConf', E.Message );
    end;
end;
end;

// DISPARADOR DO EVENTO CSTARETRIEVECALLCONF
procedure TBasicCallControlCtConector.RaiseCSTARetrieveCallConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
RaiseNullConfEvent( FOnCSTARetrieveCallConf, 'FOnCSTARetrieveCallConf', Event, PrivateData );
end;

// DISPARADOR DO EVENTO CSTATRANSFERCALLCONF
procedure TBasicCallControlCtConector.RaiseCSTATransferCallConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var
  ATTEvent : ATTEvent_t;
begin
if not Assigned( FOnCSTATransferCallConf ) then
  exit;

if not ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_TRANSFER_CALL_CONF,
  ATTEvent, 'FOnCSTATransferCallConf' ) then
  exit;

try
  FOnCSTATransferCallConf( Self, Event._event.cstaConfirmation.invokeID,
    Event._event.cstaConfirmation.conferenceCall.newCall,
    Event._event.cstaConfirmation.conferenceCall.connList,
    ATTEvent.u.conferenceCall.ucid );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTATransferCallConf', E.Message );
    end;
end;
end;

// SOLICITA A RECUPERACAO DE UMA CHAMADA PREVIAMENTE RETIDA
function TBasicCallControlCtConector.RetrieveCall(
  const heldCall: TCallID; const deviceID : TDeviceID;
  const InvokeID : TInvokeID): TSAPI;
var _heldCall : ConnectionID_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( heldCall > 0, Format( '%s.RetrieveCall', [ ClassName ] ) ) then
  exit;

PrepareConnectionID_t( _heldCall, heldCall, deviceID );
Result := cstaRetrieveCall( FAcsHandle, InvokeID, @_heldCall, nil );
CheckForGoodCtResult( Result, 'cstaRetrieveCall' );
end;

// SOLICITA A TRANSFERENCIA DE UMA CHAMADA RETIDA PARA O DESTINO DE UMA CHAMADA
// ATIVA
function TBasicCallControlCtConector.TransferCall(const heldCall,
  activeCall: TCallID; const deviceID : TDeviceID;
  const InvokeID : TInvokeID): TSAPI;
var
  _heldCall,
  _activeCall : ConnectionID_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( ( heldCall > 0 ) and ( activeCall > 0 ),
  Format( '%s.TransferCall', [ ClassName ] ) ) then
  exit;

PrepareConnectionID_t( _heldCall, heldCall, deviceID );
PrepareConnectionID_t( _activeCall, activeCall, deviceID );
Result := cstaTransferCall( FAcsHandle, InvokeID, @_heldCall, @_activeCall, nil );
CheckForGoodCtResult( Result, 'cstaTransferCall' );
end;

end.
