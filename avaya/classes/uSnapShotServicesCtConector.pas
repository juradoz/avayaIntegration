{******************************************************************************
                                Autor: Daniel Jurado
                                 jurado@gmail.com
******************************************************************************}
unit uSnapShotServicesCtConector;

interface

uses uTelephonySuplementaryCtConector, uCtTypes, uACS_h, uCtEvents, uCSTA_h,
  uATTPriv_h;

type
  // CLASSE QUE IMPLEMENTA OS SERVICOS SNAPSHOT
  TSnapShotServicesCtConector = class( TTelephonySuplementaryCtConector )
    private
      FOnCSTASnapshotDeviceConf : TCSTASnapshotDeviceConfEvent;
      FOnCSTASnapshotCallConf: TCSTASnapshotCallConfEvent;

      procedure RaiseCSTASnapshotDeviceConfEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
      procedure RaiseCSTASnapshotCallConfEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    protected
      procedure HandleCtEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );override;
    public
      function SnapshotDeviceReq( const snapshotObj : TDeviceID; const InvokeID : TInvokeID = 0 ) : TSAPI;
      function SnapshotCallReq( const call : TCallID; const device : TDeviceID; const InvokeID : TInvokeID = 0 ) : TSAPI;

    published
      property OnCSTASnapshotCallConf : TCSTASnapshotCallConfEvent read FOnCSTASnapshotCallConf write FOnCSTASnapshotCallConf;
      property OnCSTASnapshotDeviceConf : TCSTASnapshotDeviceConfEvent read FOnCSTASnapshotDeviceConf write FOnCSTASnapshotDeviceConf;
  end;

implementation

uses SysUtils, uStreamerCtConector, uMonitorServicesCtConector, uCSTADefs_h, uACSDefs_h;

{ TSnapShotServicesCtConector }

// TRATADOR PRINCIPAL DOS EVENTOS DESTA CLASSE
procedure TSnapShotServicesCtConector.HandleCtEvent(Event: CSTAEvent_t;
  PrivateData: ATTPrivateData_t);
begin
inherited;
case Event.eventHeader.eventClass of

  CSTACONFIRMATION :
    case Event.eventHeader.eventType of
      CSTA_SNAPSHOT_DEVICE_CONF :
        RaiseCSTASnapshotDeviceConfEvent( Event, PrivateData );

      CSTA_SNAPSHOT_CALL_CONF :
        RaiseCSTASnapshotCallConfEvent(Event, PrivateData);
    end;
  end;
end;

// DISPARADOR DO EVENTO DE CSTASNAPSHOTDEVICECONF
procedure TSnapShotServicesCtConector.RaiseCSTASnapshotCallConfEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if not Assigned( FOnCSTASnapshotCallConf ) then
  exit;

try
  FOnCSTASnapshotCallConf( Self, Event._event.cstaConfirmation.invokeID,
    Event._event.cstaConfirmation.snapshotCall.snapshotData );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTASnapshotCallConf', E.Message );
    end;
end;
end;

procedure TSnapShotServicesCtConector.RaiseCSTASnapshotDeviceConfEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if not Assigned( FOnCSTASnapshotDeviceConf ) then
  exit;

try
  FOnCSTASnapshotDeviceConf( Self, Event._event.cstaConfirmation.invokeID,
    Event._event.cstaConfirmation.snapshotDevice.snapshotData );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTASnapshotDeviceConf', E.Message );
    end;
end;
end;

// FUNCAO QUE SOLICITA SNAPSHOT DE UM DISPOSITIVO
function TSnapShotServicesCtConector.SnapshotCallReq(const call: TCallID;
  const device: TDeviceID; const InvokeID: TInvokeID): TSAPI;
var _snapshotObj : ConnectionID_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( (call > 0) and (device <> EmptyStr), 'SnapshotCallReq' ) then
  exit;

PrepareConnectionID_t(_snapshotObj, call, device);
Result := cstaSnapshotCallReq( FAcsHandle, InvokeID, @_snapshotObj, nil );
CheckForGoodCtResult( Result, 'cstaSnapshotDeviceReq' );
end;

function TSnapShotServicesCtConector.SnapshotDeviceReq(
  const snapshotObj: TDeviceID; const InvokeID : TInvokeID): TSAPI;
var _snapshotObj : DeviceID_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( snapshotObj <> EmptyStr, 'SnapshotDeviceReq' ) then
  exit;

PrepareDeviceID_t( _snapshotObj, snapshotObj );
Result := cstaSnapshotDeviceReq( FAcsHandle, InvokeID, @_snapshotObj, nil );
CheckForGoodCtResult( Result, 'cstaSnapshotDeviceReq' );
end;

end.
