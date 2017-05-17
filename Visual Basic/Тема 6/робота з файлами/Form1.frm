VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3435
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   4995
   LinkTopic       =   "Form1"
   ScaleHeight     =   3435
   ScaleWidth      =   4995
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Caption         =   "Вивести файл 2"
      Height          =   495
      Left            =   2640
      TabIndex        =   7
      Top             =   2520
      Width           =   2175
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Переписати в другий файл"
      Height          =   495
      Left            =   240
      TabIndex        =   6
      Top             =   2520
      Width           =   2175
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   2280
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.TextBox Text3 
      Height          =   495
      Left            =   2640
      MultiLine       =   -1  'True
      TabIndex        =   4
      Top             =   1920
      Width           =   2175
   End
   Begin VB.TextBox Text2 
      Height          =   975
      Left            =   2640
      MultiLine       =   -1  'True
      TabIndex        =   1
      Top             =   720
      Width           =   2175
   End
   Begin VB.TextBox Text1 
      Height          =   975
      Left            =   240
      MultiLine       =   -1  'True
      TabIndex        =   0
      Top             =   720
      Width           =   2175
   End
   Begin VB.Label Label3 
      Caption         =   "Розміри файлів"
      Height          =   375
      Left            =   1080
      TabIndex        =   5
      Top             =   1920
      Width           =   1215
   End
   Begin VB.Label Label2 
      Caption         =   "Шлях 2"
      Height          =   255
      Left            =   3480
      TabIndex        =   3
      Top             =   360
      Width           =   615
   End
   Begin VB.Label Label1 
      Caption         =   "Шлях 1"
      Height          =   255
      Left            =   960
      TabIndex        =   2
      Top             =   360
      Width           =   615
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
ChDir ("C:\Vbas")
CommonDialog1.ShowOpen
FPath1 = CommonDialog1.FileName
Label1.Caption = FPath1
FNum1 = FreeFile
Open FPath1 For Input As FNum1
While Not EOF(FNum1)
Line Input #FNum1, strA
strtext = strtext & strA
Wend
Close #FNum1
Text1.Text = strtext
CommonDialog1.ShowSave
FPath2 = CommonDialog1.FileName
Label2.Caption = FPath2
FNum1 = FreeFile
Open FPath1 For Input As FNum1
FNum2 = FreeFile
Open FPath2 For Output As FNum2
While Not EOF(FNum1)
Line Input #FNum1, strA
Print #FNum2, strA
Wend
int1 = LOF(FNum1)
Close FNum1
Print #FNum2, "Імена файлів – це порядкові константи"
int2 = LOF(FNum2)
Close FNum2
Text3.Text = Str(int1) & Str(int2)
Kill (FPath1)
'RmDir ("C:\Vbas")
End Sub


Private Sub Command2_Click()
Dim newstrtext As String
FNum2 = FreeFile
FPath2 = "C:\Vbas1\f2.txt"
Open FPath2 For Input As FNum2
While Not EOF(FNum2)
Line Input #FNum2, strA
newstrtext = newstrtext & strA
Wend
Close #FNum2
Text2.Text = newstrtext
End Sub

Private Sub Form_Load()
Dim FNum1 As Integer, FNum2 As Integer
Dim int1 As Integer, int2 As Integer
Dim strA As String, strtext As String
Dim FPath1 As String, FPath2 As String
End Sub
