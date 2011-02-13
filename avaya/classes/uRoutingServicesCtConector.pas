unit uRoutingServicesCtConector;

interface

uses uEscapeServicesCtConector, uCtTypes, uACS_h, uCSTA_h, uCSTADefs_h,
  uATTPriv_h, uCtEvents;

type
  TRoutingServicesCtConector = class(TEscapeServicesCtConector)
  private
    FOnCSTARouteRegisterRecConf : TCSTARouteRegisterReqConfEvent;
    FOnCSTARouteRegisterCancelConf : TCSTARouteRegisterCancelConfEvent;
    FOnCSTARouteRegisterAbort : TCSTARouteRegisterAbortEvent;
    FOnCSTARouteRequest : TCSTARouteRequestEvent;
    FOnCSTARouteRequestExt : TCSTARouteRequestExtEvent;
    FOnCSTAReRouteRequest : TCSTAReRouteRequestEvent;
    FOnCSTARouteUsed : TCSTARouteUsedEvent;
    FOnCSTARouteUsedExt : TCSTARouteUsedExtEvent;
    FOnCSTARouteEnd : TCSTARouteEndEvent;

    procedure RaiseCSTARouteRegisterReqConfEvent(Event : CSTAEvent_t; PrivateData : ATTPrivateData_t);
    procedure RaiseCSTARouteRegisterCancelConfEvent(Event : CSTAEvent_t; PrivateData : ATTPrivateData_t);
    procedure RaiseCSTARouteRegisterAbortEvent(Event : CSTAEvent_t; PrivateData : ATTPrivateData_t);
    procedure RaiseCSTARouteRequestEvent(Event : CSTAEvent_t; PrivateData : ATTPrivateData_t);
    procedure RaiseCSTARouteRequestExtEvent(Event : CSTAEvent_t; PrivateData : ATTPrivateData_t);
    procedure RaiseCSTAReRouteRequestEvent(Event : CSTAEvent_t; PrivateData : ATTPrivateData_t);
    procedure RaiseCSTARouteUsedEvent(Event : CSTAEvent_t; PrivateData : ATTPrivateData_t);
    procedure RaiseCSTARouteUsedExtEvent(Event : CSTAEvent_t; PrivateData : ATTPrivateData_t);
    procedure RaiseCSTARouteEndEvent(Event : CSTAEvent_t; PrivateData : ATTPrivateData_t);
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
    property OnCSTARouteRegisterRecConf : TCSTARouteRegisterReqConfEvent read FOnCSTARouteRegisterRecConf write FOnCSTARouteRegisterRecConf;
    property OnCSTARouteRegisterCancelConf : TCSTARouteRegisterCancelConfEvent read FOnCSTARouteRegisterCancelConf write FOnCSTARouteRegisterCancelConf;
    property OnCSTARouteRegisterAbort : TCSTARouteRegisterAbortEvent read FOnCSTARouteRegisterAbort write FOnCSTARouteRegisterAbort;
    property OnCSTARouteRequest : TCSTARouteRequestEvent read FOnCSTARouteRequest write FOnCSTARouteRequest;
    property OnCSTARouteRequestExt : TCSTARouteRequestExtEvent read FOnCSTARouteRequestExt write FOnCSTARouteRequestExt;
    property OnCSTAReRouteRequest : TCSTAReRouteRequestEvent read FOnCSTAReRouteRequest write FOnCSTAReRouteRequest;
    property OnCSTARouteUsed : TCSTARouteUsedEvent read FOnCSTARouteUsed write FOnCSTARouteUsed;
    property OnCSTARouteUsedExt : TCSTARouteUsedExtEvent read FOnCSTARouteUsedExt write FOnCSTARouteUsedExt;
    property OnCSTARouteEnd : TCSTARouteEndEvent read FOnCSTARouteEnd write FOnCSTARouteEnd;
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

  CSTAEVENTREPORT_ :
    case Event.eventHeader.eventType of
      CSTA_ROUTE_REGISTER_ABORT :
        RaiseCSTARouteRegisterAbortEvent(Event, PrivateData);

      CSTA_ROUTE_USED :
        RaiseCSTARouteUsedEvent(Event, PrivateData);

      CSTA_ROUTE_USED_EXT :
        RaiseCSTARouteUsedExtEvent(Event, PrivateData);

      CSTA_ROUTE_END :
        RaiseCSTARouteEndEvent(Event, PrivateData);
      end;

  CSTAREQUEST :
    case Event.eventHeader.eventType of
      CSTA_ROUTE_REQUEST :
        RaiseCSTARouteRequestEvent(Event, PrivateData);

      CSTA_ROUTE_REQUEST_EXT :
        RaiseCSTARouteRequestExtEvent(Event, PrivateData);

      CSTA_RE_ROUTE_REQUEST :
        RaiseCSTAReRouteRequestEvent(Event, PrivateData);
      end;
  end;
end;

procedure TRoutingServicesCtConector.RaiseCSTAReRouteRequestEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if not Assigned(FOnCSTAReRouteRequest) then
  exit;

try
  FOnCSTAReRouteRequest(Self, Event._event.cstaRequest.routeRequest.routeRegisterReqID,
    Event._event.cstaRequest.routeRequest.routingCrossRefID);
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTAReRouteRequest', E.Message );
    end;
end;
end;

procedure TRoutingServicesCtConector.RaiseCSTARouteEndEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if not Assigned(FOnCSTARouteEnd) then
  exit;

try
  FOnCSTARouteEnd(Self, Event._event.cstaEventReport.routeEnd.routeRegisterReqID,
    Event._event.cstaEventReport.routeEnd.routingCrossRefID,
    Event._event.cstaEventReport.routeEnd.errorValue);
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTARouteEnd', E.Message );
    end;
end;
end;

procedure TRoutingServicesCtConector.RaiseCSTARouteRegisterAbortEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if not Assigned(FOnCSTARouteRegisterAbort) then
  exit;

try
  FOnCSTARouteRegisterAbort(Self, Event._event.cstaEventReport.registerAbort.routeRegisterReqID);
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTARouteRegisterAbort', E.Message );
    end;
end;
end;

procedure TRoutingServicesCtConector.RaiseCSTARouteRegisterCancelConfEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if not Assigned(FOnCSTARouteRegisterCancelConf) then
  exit;

try
  FOnCSTARouteRegisterCancelConf(Self, Event._event.cstaConfirmation.invokeID,
    Event._event.cstaConfirmation.routeCancel.routeRegisterReqID);
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTARouteRegisterCancelConf', E.Message );
    end;
end;
end;

procedure TRoutingServicesCtConector.RaiseCSTARouteRegisterReqConfEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if not Assigned(FOnCSTARouteRegisterRecConf) then
  exit;

try
  FOnCSTARouteRegisterRecConf(Self, Event._event.cstaConfirmation.invokeID,
    Event._event.cstaConfirmation.routeRegister.registerReqID);
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTARouteRegisterRecConf', E.Message );
    end;
end;
end;

procedure TRoutingServicesCtConector.RaiseCSTARouteRequestEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if not Assigned(FOnCSTARouteRequest) then
  exit;

try
  FOnCSTARouteRequest(Self, Event._event.cstaRequest.routeRequest.routeRegisterReqID,
    Event._event.cstaRequest.routeRequest.routingCrossRefID, Event._event.cstaRequest.routeRequest.currentRoute,
    Event._event.cstaRequest.routeRequest.callingDevice, Event._event.cstaRequest.routeRequest.routedCall,
    Event._event.cstaRequest.routeRequest.routedSelAlgorithm, Event._event.cstaRequest.routeRequest.priority,
    Event._event.cstaRequest.routeRequest.setupInformation);
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTARouteRequest', E.Message );
    end;
end;
end;

procedure TRoutingServicesCtConector.RaiseCSTARouteRequestExtEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if not Assigned(FOnCSTARouteRequestExt) then
  exit;

try
  FOnCSTARouteRequestExt(Self, Event._event.cstaRequest.routeRequestExt.routeRegisterReqID,
    Event._event.cstaRequest.routeRequestExt.routingCrossRefID,
    Event._event.cstaRequest.routeRequestExt.currentRoute,
    Event._event.cstaRequest.routeRequestExt.callingDevice,
    Event._event.cstaRequest.routeRequestExt.routedCall,
    Event._event.cstaRequest.routeRequestExt.routedSelAlgorithm,
    Event._event.cstaRequest.routeRequestExt.priority,
    Event._event.cstaRequest.routeRequestExt.setupInformation);
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTARouteRequestExt', E.Message );
    end;
end;
end;

procedure TRoutingServicesCtConector.RaiseCSTARouteUsedEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if not Assigned(FOnCSTARouteUsed) then
  exit;

try
  FOnCSTARouteUsed(Self, Event._event.cstaEventReport.routeUsed.routeRegisterReqID,
  Event._event.cstaEventReport.routeUsed.routingCrossRefID,
  Event._event.cstaEventReport.routeUsed.routeUsed,
  Event._event.cstaEventReport.routeUsed.callingDevice,
  Event._event.cstaEventReport.routeUsed.domain);
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTARouteUsed', E.Message );
    end;
end;
end;

procedure TRoutingServicesCtConector.RaiseCSTARouteUsedExtEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if not Assigned(FOnCSTARouteUsedExt) then
  exit;

try
  FOnCSTARouteUsedExt(Self, Event._event.cstaEventReport.routeUsedExt.routeRegisterReqID,
  Event._event.cstaEventReport.routeUsedExt.routingCrossRefID,
  Event._event.cstaEventReport.routeUsedExt.routeUsed,
  Event._event.cstaEventReport.routeUsedExt.callingDevice,
  Event._event.cstaEventReport.routeUsedExt.domain);
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTARouteUsedExt', E.Message );
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
 