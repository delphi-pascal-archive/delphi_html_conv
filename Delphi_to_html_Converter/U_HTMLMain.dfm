object fmMain: TfmMain
  Left = 233
  Top = 136
  Width = 783
  Height = 480
  Caption = 'Delphi to HTML Converter'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020040000000000E80200001600000028000000200000004000
    0000010004000000000000020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    000000000000000000000000000000087777777777777777777770700000008F
    FFFFFFFFFFFFFFFFFFFFF7070000008FFFFFFFFFFFFFFFFFFFFFF7070000008F
    F000000FFFFFFFFFFFFFF7070000008FFFFFFFFFFFFFFFFFFFFFF7070000008F
    F000000FFFFFFFFFFFFFF7070000008FFFFFFFFFFFFFFFFFFFFFF7070000008F
    FFFFFFFFFFFFFFFFFFFFF7070000008FF000000000000000000FF7070000008F
    FFFFFFFFFFFFFFFFFFFFF7070000008FF000000000000000000FF7070000008F
    FFFFFFFFFFFFFFFFFFFFF7070000008FF000000000000000000FF7070000008F
    FFFFFFFFFFFFFFFFFFFFF7070000008FF000000000000000000FF7070000008F
    FFFFFFFFFFFFFFFFFFFFF7070000008FFFFFFFFFFFFFFFFFFFFFF7070000008F
    F000000FFFFFFFFFFFFFF7070000008FFFFFFFFFFFFFFFFFFFFFF7070000008F
    FFFFFFFFFFFFFFFFFFFFF7070000008FFFFFFFFFFFFFFFFFFFFFF7070000008F
    F000000FFFFFFFFFFFFFF7070000008FFFFFFFFFFFFFFFFFFFFFF7070000008F
    F000000FFFFFFF0F000FF7070000008FFFFFFFFFFFFFFFFFFFFFF7070000008F
    FFFFFFFFFFFFFFFFFFFFF7070000008FFFFFFFFFFFFFFFFFFFFFF7070000008F
    0FF0FF0FF0FF0FF0FF0FF8070000008F0FF0FF0FF0FF0FF0FF0FF80700000008
    F88F88F88F88F88F88F88F80000000000000000000000000000000000000F000
    001FE000000FC0000007C0000007C0000007C0000007C0000007C0000007C000
    0007C0000007C0000007C0000007C0000007C0000007C0000007C0000007C000
    0007C0000007C0000007C0000007C0000007C0000007C0000007C0000007C000
    0007C0000007C0000007C0000007C0000007C0000007E000000FF24924BF}
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 120
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 395
    Top = 41
    Height = 411
    Color = clActiveCaption
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 775
    Height = 41
    Align = alTop
    TabOrder = 0
    DesignSize = (
      775
      41)
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 97
      Height = 25
      Caption = #1054#1090#1082#1088#1099#1090#1100'...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 216
      Top = 8
      Width = 129
      Height = 25
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080'...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 350
      Top = 8
      Width = 155
      Height = 25
      Caption = #1050#1086#1085#1074#1077#1088#1090#1080#1088#1086#1074#1072#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 544
      Top = 8
      Width = 113
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 664
      Top = 8
      Width = 105
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100'...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 855
      Top = 10
      Width = 70
      Height = 31
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 112
      Top = 8
      Width = 97
      Height = 25
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = Button7Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 395
    Height = 411
    Align = alLeft
    TabOrder = 1
    object Memo1: TMemo
      Left = 1
      Top = 26
      Width = 393
      Height = 384
      Align = alClient
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 393
      Height = 25
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = '     '#1042#1074#1077#1076#1080#1090#1077' '#1082#1086#1076' Delphi'
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        393
        25)
      object SpeedButton1: TSpeedButton
        Left = 0
        Top = 0
        Width = 16
        Height = 27
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100' (F1)'
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object CheckBox1: TCheckBox
        Left = 177
        Top = 4
        Width = 189
        Height = 18
        Anchors = [akTop, akRight]
        Caption = #1043#1077#1085'. HTML-'#1089#1090#1088#1072#1085#1080#1094#1091
        TabOrder = 0
      end
    end
  end
  object Panel3: TPanel
    Left = 398
    Top = 41
    Width = 377
    Height = 411
    Align = alClient
    TabOrder = 2
    object Memo2: TMemo
      Left = 1
      Top = 26
      Width = 375
      Height = 384
      Align = alClient
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 375
      Height = 25
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = '     HTML - '#1082#1086#1076
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        375
        25)
      object SpeedButton2: TSpeedButton
        Left = 0
        Top = -2
        Width = 16
        Height = 28
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100' (F2)'
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton2Click
      end
      object Button8: TButton
        Left = 147
        Top = 2
        Width = 222
        Height = 21
        Anchors = [akTop, akRight]
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1074' '#1073#1088#1072#1091#1079#1077#1088#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Button8Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' Delphi (*.pas;*.dpr)|*.pas;*.dpr|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 16
    Top = 73
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.html'
    Filter = #1057#1090#1088#1072#1085#1080#1094#1072' HTML (*.html)|*.html|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 16
    Top = 105
  end
end
