program AvayaIntegration;

uses
  Forms,
  uMain in 'uMain.pas' {Form1},
  uBasicCallControlCtConector in 'avaya\classes\uBasicCallControlCtConector.pas',
  uCtClient in 'avaya\classes\uCtClient.pas',
  uCtConector in 'avaya\classes\uCtConector.pas',
  uEscapeServicesCtConector in 'avaya\classes\uEscapeServicesCtConector.pas',
  uMonitorServicesCtConector in 'avaya\classes\uMonitorServicesCtConector.pas',
  uSnapShotServicesCtConector in 'avaya\classes\uSnapShotServicesCtConector.pas',
  uStreamerCtConector in 'avaya\classes\uStreamerCtConector.pas',
  uTelephonySuplementaryCtConector in 'avaya\classes\uTelephonySuplementaryCtConector.pas',
  uACS_h in 'avaya\cTranslations\uACS_h.pas',
  uACSdefs_h in 'avaya\cTranslations\uACSdefs_h.pas',
  uAttpdefs_h in 'avaya\cTranslations\uATTpdefs_h.pas',
  uATTpriv_h in 'avaya\cTranslations\uATTpriv_h.pas',
  uCSTA_h in 'avaya\cTranslations\uCSTA_h.pas',
  uCSTADefs_h in 'avaya\cTranslations\uCSTAdefs_h.pas',
  uTsplatfm_h in 'avaya\cTranslations\uTsplatfm_h.pas',
  uCtEvents in 'avaya\utils\uCtEvents.pas',
  uCtMessages in 'avaya\utils\uCtMessages.pas',
  uCtTypes in 'avaya\utils\uCtTypes.pas',
  uTranslations in 'avaya\utils\uTranslations.pas',
  uThreadSimprona in 'threads\uThreadSimprona.pas',
  uRoutingServicesCtConector in 'avaya\classes\uRoutingServicesCtConector.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
