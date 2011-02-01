unit uRoutingServicesCtConector;

interface

uses uEscapeServicesCtConector, uCtTypes, uACS_h, uCSTA_h, uCSTADefs_h,
  uATTPriv_h, uCtEvents;

type
  TRoutingServicesCtConector = class(TEscapeServicesCtConector)
  private
    FOnCSTARouteRegisterRegisterRecConf : TCSTARouteRegisterReqConfEvent;
    FOnCSTARouteRegisterRegisterCancelConf : TCSTARouteRegisterCancelConfEvent;

    procedure RaiseCSTARouteRegisterReqConfEvent(Event : CSTAEvent_t; PrivateData : ATTPrivateData_t);
    procedure RaiseCSTARouteRegisterCancelConfEvent(Event : CSTAEvent_t; PrivateData : ATTPrivateData_t);
  protected
    procedure HandleCtEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );override;
  public
    function RouteRegisterReq( const routingDevice : TDeviceID;
      const InvokeID : TInvokeID = 0 ) : TSAPI;
    function RouteRegisterCancel( const routeRegisterReqID : RouteRegisterReqID_t;
      const InvokeID : TInvokeID = 0 ) : TSAPI;
    function RouteSelectInv(const routeRegisterReqID : RouteRegisterReqID_t;
      const routingCrossRefID : RoutingCrossRefID_t; const routeSelected : TDeviceID;
      const remainRetry : RetryValue_t; const routeUsedReq : Boolean;
      const InvokeID : TInvokeID = 0 ) : TSAPI;
    function RouteEndInv(const routeRegisterReqID : RouteRegisterReqID_t;
      const routingCrossRefID : RoutingCrossRefID_t;
      const errorValue : CSTAUniversalFailure_t;
      const InvokeId : TInvokeID = 0) : TSAPI;
  published
    property OnCSTARouteRegisterRegisterRecConf : TCSTARouteRegisterReqConfEvent read FOnCSTARouteRegisterRegisterRecConf write FOnCSTARouteRegisterRegisterRecConf;
    property OnCSTARouteRegisterRegisterCancelConf : TCSTARouteRegisterCancelConfEvent read FOnCSTARouteRegisterRegisterCancelConf write FOnCSTARouteRegisterRegisterCancelConf;
  end;

implementation

uses SysUtils, uStreamerCtConector, uMonitorServicesCtConector;

{ TRoutingServicesCtConector }

procedure TRoutingServicesCtConector.HandleCtEvent(Event: CSTAEvent_t;
  PrivateData: ATTPrivateData_t);
begin
inherited;
case Event.eventHeader.eventClass of
  CSTACONFIRMATION :
    case Event.eventHeader.eventType of
      CSTA_ROUTE_REGISTER_REQ_CONF :
        RaiseCSTARouteRegisterReqConfEvent(Event, PrivateData);

      CSTA_ROUTE_REGISTER_CANCEL_CONF :
        RaiseCSTARouteRegisterCancelConfEvent(Event, PrivateData);
      end;
  end;
end;

procedure TRoutingServicesCtConector.RaiseCSTARouteRegisterCancelConfEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if not Assigned(FOnCSTARouteRegisterRegisterCancelConf) then
  exit;

try
  FOnCSTARouteRegisterRegisterCancelConf(Self, Event._event.cstaConfirmation.invokeID,
    Event._event.cstaConfirmation.routeCancel.routeRegisterReqID);
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTARouteRegisterRegisterCancelConf', E.Message );
    end;
end;
end;

procedure TRoutingServicesCtConector.RaiseCSTARouteRegisterReqConfEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if not Assigned(FOnCSTARouteRegisterRegisterRecConf) then
  exit;

try
  FOnCSTARouteRegisterRegisterRecConf(Self, Event._event.cstaConfirmation.invokeID,
    Event._event.cstaConfirmation.routeRegister.registerReqID);
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTARouteRegisterRegisterRecConf', E.Message );
    end;
end;
end;

function TRoutingServicesCtConector.RouteEndInv(
  const routeRegisterReqID: RouteRegisterReqID_t;
  const routingCrossRefID: RoutingCrossRefID_t;
  const errorValue: CSTAUniversalFailure_t;
  const InvokeId: TInvokeID): TSAPI;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( ((routeRegisterReqID > 0) and (routingCrossRefID > 0)),
  Format( '%s.RouteEndInv', [ ClassName ] ) ) then
  exit;

Result := cstaRouteEndInv(FAcsHandle, InvokeId, routeRegisterReqID,
  routingCrossRefID, errorValue, nil);
CheckForGoodCtResult(Result, 'cstaRouteEndInv');
end;

function TRoutingServicesCtConector.RouteRegisterCancel(
  const routeRegisterReqID: RouteRegisterReqID_t;
  const InvokeID: TInvokeID): TSAPI;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( routeRegisterReqID > 0,
  Format( '%s.RouteRegisterCancel', [ ClassName ] ) ) then
  exit;

Result := cstaRouteRegisterCancel(FAcsHandle, InvokeID, routeRegisterReqID, nil);
CheckForGoodCtResult(Result, 'cstaRouteRegisterCancel');
end;

function TRoutingServicesCtConector.RouteRegisterReq(
  const routingDevice: TDeviceID; const InvokeID: TInvokeID): TSAPI;
var
  _routingDevice : DeviceId_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( Length(routingDevice) > 0,
  Format( '%s.RouteRegisterReq', [ ClassName ] ) ) then
  exit;

PrepareDeviceID_t( _routingDevice, routingDevice );
Result := cstaRouteRegisterReq(FAcsHandle, InvokeID, @_routingDevice, nil);
CheckForGoodCtResult(Result, 'cstaRouteRegisterReq');
end;

function TRoutingServicesCtConector.RouteSelectInv(
  const routeRegisterReqID: RouteRegisterReqID_t;
  const routingCrossRefID: RoutingCrossRefID_t;
  const routeSelected: TDeviceID; const remainRetry: RetryValue_t;
  const routeUsedReq: Boolean; const InvokeID: TInvokeID): TSAPI;
var
  _routeSelected : DeviceID_t;
begin
Result := DEFAULT_ERROR_CODE;
if not CheckParams( ((routeRegisterReqID > 0) and (routingCrossRefID > 0)
  and (Length(routeSelected) > 0)),
  Format( '%s.RouteSelectInv', [ ClassName ] ) ) then
  exit;

PrepareDeviceID_t( _routeSelected, routeSelected );
Result := cstaRouteSelectInv(FAcsHandle, InvokeID, routeRegisterReqID,
  routingCrossRefID, @_routeSelected, remainRetry, nil, routeUsedReq, nil);
CheckForGoodCtResult(Result, 'cstaRouteSelectInv');
end;

end.
 