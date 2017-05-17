VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form2"
   ClientHeight    =   3030
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   7440
   LinkTopic       =   "Form2"
   ScaleHeight     =   3030
   ScaleWidth      =   7440
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Caption         =   "Вихід"
      Height          =   375
      Left            =   3360
      TabIndex        =   9
      Top             =   2040
      Width           =   855
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Обчислення"
      Height          =   375
      Left            =   1560
      TabIndex        =   8
      Top             =   2040
      Width           =   1215
   End
   Begin VB.Frame Frame2 
      Caption         =   "Вибір функції"
      Height          =   1335
      Left            =   3120
      TabIndex        =   1
      Top             =   600
      Width           =   2055
      Begin VB.TextBox Text4 
         Height          =   285
         Left            =   120
         TabIndex        =   7
         Top             =   720
         Width           =   1215
      End
      Begin VB.TextBox Text3 
         Height          =   285
         Left            =   120
         TabIndex        =   6
         Top             =   360
         Width           =   1215
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Ввід даних"
      Height          =   1335
      Left            =   480
      TabIndex        =   0
      Top             =   600
      Width           =   2295
      Begin VB.TextBox Text2 
         Height          =   285
         Left            =   840
         TabIndex        =   5
         Top             =   720
         Width           =   1095
      End
      Begin VB.TextBox Text1 
         Height          =   285
         Left            =   840
         TabIndex        =   2
         Top             =   360
         Width           =   1095
      End
      Begin VB.Label Label2 
         Caption         =   "b ="
         Height          =   255
         Left            =   360
         TabIndex        =   4
         Top             =   720
         Width           =   375
      End
      Begin VB.Label Label1 
         Caption         =   "а = "
         Height          =   255
         Left            =   360
         TabIndex        =   3
         Top             =   360
         Width           =   375
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
Me.Left = (Screen.Width - Me.Width) / 2
Me.Top = (Screen.Height - Me.Height) / 2
Flag1 = False
End Sub
