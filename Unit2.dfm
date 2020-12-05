object Carpet: TCarpet
  Left = 0
  Top = 0
  Caption = #1082#1086#1074#1105#1088' '#1057#1077#1088#1087#1080#1085#1089#1082#1086#1075#1086
  ClientHeight = 559
  ClientWidth = 658
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel: TPanel
    Left = 8
    Top = 8
    Width = 641
    Height = 537
    Caption = 'Main Panel'
    TabOrder = 0
    object Image: TImage
      Left = 8
      Top = 8
      Width = 516
      Height = 516
    end
    object Scale: TLabel
      Left = 530
      Top = 8
      Width = 87
      Height = 19
      Caption = #1052#1072#1089#1096#1090#1072#1073': '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Navigation: TLabel
      Left = 530
      Top = 95
      Width = 97
      Height = 19
      Caption = #1053#1072#1074#1080#1075#1072#1094#1080#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Data: TLabel
      Left = 530
      Top = 246
      Width = 71
      Height = 19
      Caption = #1044#1072#1085#1085#1099#1077':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Play: TButton
      Left = 530
      Top = 456
      Width = 88
      Height = 68
      Caption = 'PLAY'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 0
      OnClick = PlayClick
    end
    object Down: TButton
      Left = 530
      Top = 213
      Width = 88
      Height = 27
      Caption = #8744
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = DownClick
    end
    object Up: TButton
      Left = 530
      Top = 182
      Width = 88
      Height = 25
      Caption = #8743
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = UpClick
    end
    object Left: TButton
      Left = 530
      Top = 151
      Width = 88
      Height = 25
      Caption = '<'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = LeftClick
    end
    object Right: TButton
      Left = 530
      Top = 120
      Width = 88
      Height = 25
      Caption = '>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = RightClick
    end
    object Minus: TButton
      Left = 530
      Top = 64
      Width = 88
      Height = 25
      Caption = #8212
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = MinusClick
    end
    object Plus: TButton
      Left = 530
      Top = 33
      Width = 88
      Height = 25
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = PlusClick
    end
    object NEdit: TEdit
      Left = 530
      Top = 271
      Width = 87
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 7
      Text = 'N:'
      OnClick = NEditClick
    end
    object ZEdit: TEdit
      Left = 530
      Top = 301
      Width = 88
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 8
      Text = 'Z:'
      OnClick = ZEditClick
    end
    object Button1: TButton
      Left = 530
      Top = 352
      Width = 87
      Height = 41
      Caption = 'SAVE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 9
      OnClick = Button1Click
    end
  end
end
