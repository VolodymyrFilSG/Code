VERSION 5.00
Begin VB.Form Form3 
   Caption         =   "Form3"
   ClientHeight    =   3030
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   4560
   LinkTopic       =   "Form3"
   ScaleHeight     =   3030
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "�������"
      Height          =   495
      Left            =   1560
      TabIndex        =   4
      Top             =   2160
      Width           =   1095
   End
   Begin VB.ListBox List2 
      Height          =   1425
      Left            =   2280
      TabIndex        =   1
      Top             =   600
      Width           =   1815
   End
   Begin VB.ListBox List1 
      Height          =   1425
      Left            =   240
      TabIndex        =   0
      Top             =   600
      Width           =   1815
   End
   Begin VB.Label Label2 
      Caption         =   "������ ������"
      Height          =   375
      Left            =   2280
      TabIndex        =   3
      Top             =   120
      Width           =   1815
   End
   Begin VB.Label Label1 
      Caption         =   "������ �����"
      Height          =   375
      Left            =   360
      TabIndex        =   2
      Top             =   120
      Width           =   1455
   End
End
Attribute VB_Name = "Form3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Form3.Hide
End Sub

Private Sub Form_Load()
 List1.AddItem "� ���������"
 List1.AddItem "� �������"
 List1.AddItem "� ��������"
 List1.AddItem "� ��������"
 List2.AddItem "� ���������"
 List2.AddItem "� �������"
 List2.AddItem "�����"
End Sub
