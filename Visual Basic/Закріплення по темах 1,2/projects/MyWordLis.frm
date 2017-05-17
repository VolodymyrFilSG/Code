VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   2610
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   5985
   LinkTopic       =   "Form1"
   ScaleHeight     =   2610
   ScaleWidth      =   5985
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox List1 
      Height          =   1035
      Left            =   840
      TabIndex        =   1
      Top             =   1200
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "вихід"
      Height          =   495
      Left            =   2640
      TabIndex        =   0
      Top             =   1680
      Width           =   1215
   End
   Begin VB.Label Label3 
      Caption         =   "дієслово"
      Height          =   255
      Left            =   960
      TabIndex        =   4
      Top             =   960
      Width           =   975
   End
   Begin VB.Label Label2 
      Caption         =   "Для перекладу клацніть на слово двічі"
      Height          =   375
      Left            =   1320
      TabIndex        =   3
      Top             =   600
      Width           =   3495
   End
   Begin VB.Label Label1 
      Caption         =   "ІТАЛІЙСЬКИЙ СЛОВНИК"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   840
      TabIndex        =   2
      Top             =   120
      Width           =   4815
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
Private Sub Form_Load()
 List1.AddItem "aprire"
 List1.AddItem "ascoltare"
 List1.AddItem "bere"
 List1.AddItem "cucinare"
 List1.AddItem "dormire"
 List1.AddItem "pagare"
 List1.AddItem "scrivere"
End Sub
Private Sub List1_DblClick()
 Select Case List1.ListIndex
 Case 0
 Def = "відкрити"
 Case 1
 Def = "слухати"
 Case 2
 Def = "пити"
 Case 3
 Def = "готувати"
 Case 4
 Def = "спати"
 Case 5
 Def = "платити, оплачувати"
 Case 6
 Def = "писати"
 End Select
 MsgBox (Def), , List1.Text
End Sub
