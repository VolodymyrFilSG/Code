VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   Caption         =   "Вправа"
   ClientHeight    =   3030
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3030
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   240
      Top             =   2400
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton CmdSave 
      Caption         =   "Зберегти файл"
      Height          =   375
      Left            =   2760
      TabIndex        =   4
      Top             =   1680
      Width           =   1575
   End
   Begin VB.CommandButton CmdOpen 
      Caption         =   "Відкрити файл"
      Height          =   375
      Left            =   2760
      TabIndex        =   3
      Top             =   1200
      Width           =   1575
   End
   Begin VB.TextBox Text2 
      Height          =   405
      Left            =   2760
      TabIndex        =   2
      Top             =   720
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      Height          =   1575
      Left            =   240
      MultiLine       =   -1  'True
      TabIndex        =   1
      Top             =   720
      Width           =   2295
   End
   Begin VB.Label Label1 
      Height          =   375
      Left            =   360
      TabIndex        =   0
      Top             =   120
      Width           =   3735
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CmdOpen_Click()
CommonDialog1.ShowOpen
strFileName = CommonDialog1.FileName
Label1.Caption = strFileName
FileNumber = FreeFile
Open strFileName For Input As FileNumber
While Not EOF(FileNumber)
Line Input #FileNumber, strBuffer
Text1 = Text1 & strBuffer
Wend
Close #FileNumber
End Sub
Private Sub CmdSave_click()
FileNumber = FreeFile
Open Label1.Caption For Append As FileNumber
Print #FileNumber, Text2
Close #FileNumber
End Sub
Private Sub Form_Load()
Dim strFileName As String, strBuffer As String
Dim FileNumber As Integer
End Sub

