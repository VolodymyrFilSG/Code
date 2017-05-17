VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   2475
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   5670
   LinkTopic       =   "Form1"
   ScaleHeight     =   2475
   ScaleWidth      =   5670
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command3 
      Caption         =   "Меню"
      Height          =   495
      Left            =   3480
      TabIndex        =   4
      Top             =   840
      Width           =   1575
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Показати на карті"
      Height          =   375
      Left            =   720
      TabIndex        =   3
      Top             =   1560
      Width           =   1815
   End
   Begin VB.CommandButton Command1 
      Caption         =   "вихід"
      Height          =   495
      Left            =   3720
      TabIndex        =   0
      Top             =   1560
      Width           =   1215
   End
   Begin VB.Label Label2 
      Caption         =   "Наша адреса : Бульвар Тараса Шевченка 27"
      Height          =   615
      Left            =   720
      TabIndex        =   2
      Top             =   840
      Width           =   1695
   End
   Begin VB.Label Label1 
      Caption         =   "Презентація фірми Пиріжки"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   960
      TabIndex        =   1
      Top             =   120
      Width           =   4455
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
End
End Sub

Private Sub Command2_Click()
Load Form2
Form2.Show
End Sub

Private Sub Command3_Click()
Load Form3
Form3.Show
End Sub
