VERSION 5.00
Begin VB.Form Form2 
   Caption         =   "Form2"
   ClientHeight    =   6330
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   6885
   LinkTopic       =   "Form2"
   ScaleHeight     =   6330
   ScaleWidth      =   6885
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Закрити"
      Height          =   375
      Left            =   2520
      TabIndex        =   1
      Top             =   5880
      Width           =   1455
   End
   Begin VB.PictureBox Picture1 
      Height          =   5775
      Left            =   0
      Picture         =   "My.frx":0000
      ScaleHeight     =   5715
      ScaleWidth      =   6795
      TabIndex        =   0
      Top             =   0
      Width           =   6855
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Form2.Hide
End Sub

Private Sub Picture1_Click()

End Sub
