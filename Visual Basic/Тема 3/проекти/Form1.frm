VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4155
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   5535
   LinkTopic       =   "Form1"
   ScaleHeight     =   4155
   ScaleWidth      =   5535
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame2 
      Caption         =   "Вибір функції"
      Height          =   1215
      Left            =   2760
      TabIndex        =   3
      Top             =   840
      Width           =   1575
      Begin VB.TextBox Text4 
         Height          =   285
         Left            =   120
         TabIndex        =   9
         Text            =   $"Form1.frx":0000
         Top             =   720
         Width           =   1215
      End
      Begin VB.TextBox Text3 
         Height          =   285
         Left            =   120
         TabIndex        =   8
         Text            =   "F(x) = a*x^2+b"
         Top             =   360
         Width           =   1215
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Ввід даних"
      Height          =   1215
      Left            =   720
      TabIndex        =   2
      Top             =   840
      Width           =   1575
      Begin VB.TextBox Text2 
         Height          =   285
         Left            =   600
         TabIndex        =   7
         Top             =   720
         Width           =   855
      End
      Begin VB.TextBox Text1 
         Height          =   285
         Left            =   600
         TabIndex        =   6
         Top             =   360
         Width           =   855
      End
      Begin VB.Label Label2 
         Caption         =   "b ="
         Height          =   255
         Left            =   240
         TabIndex        =   5
         Top             =   720
         Width           =   255
      End
      Begin VB.Label Label1 
         Caption         =   "a = "
         Height          =   255
         Left            =   240
         TabIndex        =   4
         Top             =   360
         Width           =   375
      End
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Вихід"
      Height          =   375
      Left            =   2880
      TabIndex        =   1
      Top             =   2280
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Обчислення"
      Height          =   495
      Left            =   840
      TabIndex        =   0
      Top             =   2280
      Width           =   1455
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public a As Single, b As Single, S As Single, N As Integer
Public x As Single, ax As Single, bx As Single, e As Single
Public Flag1 As Boolean
Private Sub Form_Load()
Left = (Screen.Width - Me.Width) / 2
Top = (Screen.Height - Me.Height) / 2
Flag1 = False
End Sub
Private Sub Command2_Click()
Unload Me
End Sub
Private Sub Command1_Click()
ax = Val(Text3.Text)
bx = Val(Text4.Text)
If ax = 0 And bx = 0 Then
MsgBox "Введіть дані"
End If
If Flag1 = True And ax = 0 Then
MsgBox "Неправильне введення даних"
Exit Sub
End If
a = Val(InputBox("Введіть нижню границю інтегрування ", _
"Введення даних"))
b = Val(InputBox("Введіть верхню границю інтегрування ", _
"Введення даних"))
N = Val(InputBox("Введіть кількість відрізків розбиття", _
"Введення даних"))
e = Val(InputBox("Вкажіть потрібну тоність", "Введення даних"))
S = 0
Integral2 a, b, N
MsgBox "Інтеграл = " & Str(S), , "Значення інтегралу"
End Sub
Public Sub Integral2(a As Single, b As Single, N As Integer)
Dim y As Single, i As Integer, R As Single
Dim int0 As Single, int1 As Integer
Dim dx As Single
R = 1 + e: int0 = 0
While Abs(R) > e
int1 = int0:
x = a: dx = (b - a) / N
For i = 1 To N
If Flag1 Then
y = FNy2(x, ax, bx)
Else
y = FNy1(x, ax, bx)
End If
S = S + y * dx
x = x + dx
Next i
R = (int0 - int1) / 3
N = N * 2
Wend
End Sub

Public Function FNy1(x As Single, ax As Single, bx As Single)
Dim y As Single
y = ax * x ^ 2 + bx
FNy1 = y
End Function
Public Function FNy2(x As Single, ax As Single, bx As Single)
Dim y As Single
y = 1 / (ax * x) + bx
FNy2 = y
End Function

Private Sub Text1_Change()
Flag1 = False
End Sub
Private Sub Text2_Click()
Flag1 = True
End Sub

