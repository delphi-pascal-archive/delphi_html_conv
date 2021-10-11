program CodeExport;

uses
  Forms,
  U_HTMLMain in 'U_HTMLMain.pas' {fmMain},
  U_Dialog in 'U_Dialog.pas' {fmFontDialog};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Delphi-HTML Converter';
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmFontDialog, fmFontDialog);
  Application.Run;
end.
