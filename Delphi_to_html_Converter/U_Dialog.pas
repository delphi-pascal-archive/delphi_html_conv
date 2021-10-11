unit U_Dialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls;

type
  TfmFontDialog = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ColorBox1: TColorBox;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    ColorBox2: TColorBox;
    Label4: TLabel;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    Label5: TLabel;
    Label6: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    ColorBox3: TColorBox;
    Label7: TLabel;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    Label8: TLabel;
    Label9: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    ColorBox4: TColorBox;
    Label10: TLabel;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    Label11: TLabel;
    Label12: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    ColorBox5: TColorBox;
    Label13: TLabel;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    Label14: TLabel;
    Label15: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox10Click(Sender: TObject);
    procedure CheckBox13Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GenOpenTag(Color: TColor; IsBold, IsItalic, IsUnderLine: Boolean):
      string;
    function GenCloseTag(Color: TColor; IsBold, IsItalic, IsUnderLine: Boolean):
      string;
  end;

var
  fmFontDialog: TfmFontDialog;

implementation

{$R *.dfm}

{ TfmFontDialog }

function TfmFontDialog.GenCloseTag(Color: TColor; IsBold, IsItalic,
  IsUnderLine: Boolean): string;
begin
  Result := '';
  if not (IsBold or IsItalic or IsUnderLine) then begin
    if Color <> clBlack then Result := '</span>'; end else
  begin
    if IsUnderLine then Result := Result + '</u>';
    if IsItalic then Result := Result + '</i>';
    if IsBold then Result := Result + '</b>';
  end;
end;

function TfmFontDialog.GenOpenTag(Color: TColor; IsBold, IsItalic,
  IsUnderLine: Boolean): string;
var
  S: string;
begin
  Result := '';
  if Color = clBlack then S := '' else
    S := ' style="color: ' + ColorToString(Color) + ';"';
  if not (IsBold or IsItalic or IsUnderLine) then begin
    if S <> '' then Result := '<span' + S + '>'; end else
  begin
    if IsBold then Result := '<b' + S + '>';
    if IsItalic then if IsBold then Result := Result + '<i>' else
        Result := '<i' + S + '>';
    if IsUnderLine then if IsBold or IsItalic then Result := Result + '<u>' else
        Result := '<u' + S + '>';
  end;
end;

procedure TfmFontDialog.CheckBox1Click(Sender: TObject);
begin
  Edit1.Text := GenOpenTag(ColorBox1.Selected, CheckBox1.Checked,
    CheckBox2.Checked, CheckBox3.Checked);
  Edit2.Text := GenCloseTag(ColorBox1.Selected, CheckBox1.Checked,
    CheckBox2.Checked, CheckBox3.Checked);
end;

procedure TfmFontDialog.CheckBox4Click(Sender: TObject);
begin
  Edit3.Text := GenOpenTag(ColorBox2.Selected, CheckBox4.Checked,
    CheckBox5.Checked, CheckBox6.Checked);
  Edit4.Text := GenCloseTag(ColorBox2.Selected, CheckBox4.Checked,
    CheckBox5.Checked, CheckBox6.Checked);
end;

procedure TfmFontDialog.CheckBox7Click(Sender: TObject);
begin
  Edit5.Text := GenOpenTag(ColorBox3.Selected, CheckBox7.Checked,
    CheckBox8.Checked, CheckBox9.Checked);
  Edit6.Text := GenCloseTag(ColorBox3.Selected, CheckBox7.Checked,
    CheckBox8.Checked, CheckBox9.Checked);
end;

procedure TfmFontDialog.CheckBox10Click(Sender: TObject);
begin
  Edit7.Text := GenOpenTag(ColorBox4.Selected, CheckBox10.Checked,
    CheckBox11.Checked, CheckBox12.Checked);
  Edit8.Text := GenCloseTag(ColorBox4.Selected, CheckBox10.Checked,
    CheckBox11.Checked, CheckBox12.Checked);
end;

procedure TfmFontDialog.CheckBox13Click(Sender: TObject);
begin
  Edit9.Text := GenOpenTag(ColorBox5.Selected, CheckBox13.Checked,
    CheckBox14.Checked, CheckBox15.Checked);
  Edit10.Text := GenCloseTag(ColorBox5.Selected, CheckBox13.Checked,
    CheckBox14.Checked, CheckBox15.Checked);
end;

procedure TfmFontDialog.Button9Click(Sender: TObject);
begin
 Close;
end;

end.

