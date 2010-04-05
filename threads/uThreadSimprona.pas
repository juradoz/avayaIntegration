{******************************************************************************
                                Autor: Daniel Jurado
                                 jurado@gmail.com
******************************************************************************}
unit uThreadSimprona;

interface

uses Classes;

type
  TThreadSimprona = class(TThread)
  private
    FOnThreadError: TGetStrProc;
  protected
    procedure Inicializa;virtual;abstract;
    procedure Repete;virtual;abstract;
    procedure Finaliza;virtual;abstract;

    procedure RaiseThreadErrorEvent( Msg : ShortString );
  public
    constructor Create(CreateSuspended : Boolean);virtual;
    procedure Execute;override;
    property OnThreadError : TGetStrProc read FOnThreadError write FOnThreadError;
  end;

implementation

uses SysUtils;

{ TThreadSimprona }

constructor TThreadSimprona.Create(CreateSuspended: Boolean);
begin
inherited Create(true);
FreeOnTerminate := True;
if CreateSuspended then
  exit;

Resume;
end;

procedure TThreadSimprona.Execute;
begin
try
  try
    Inicializa;

    repeat
      try
      Repete;
      except
        on e : Exception do
          begin
          RaiseThreadErrorEvent(E.Message);
          end;
        end;
    until Terminated;
    
  except
    on E : Exception do
      begin
      RaiseThreadErrorEvent(E.Message);
      end;
  end;
finally
  try
    Finaliza;
  except
    on E : Exception do
      begin
      RaiseThreadErrorEvent(E.Message);
      end;
    end;
  end;
end;

procedure TThreadSimprona.RaiseThreadErrorEvent(Msg: ShortString);
begin
if not Assigned(FOnThreadError) then
  exit;

try
  FOnThreadError(Msg);
except
end;
end;

end.
 