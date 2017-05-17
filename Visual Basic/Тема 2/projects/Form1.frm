VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Калькулятор 1"
   ClientHeight    =   4860
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   6075
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   204
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   4860
   ScaleWidth      =   6075
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text5 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3480
      TabIndex        =   29
      Top             =   3720
      Width           =   1215
   End
   Begin VB.CommandButton Command21 
      Caption         =   "Сума в степені"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2040
      TabIndex        =   28
      Top             =   3720
      Width           =   1335
   End
   Begin VB.CommandButton Command20 
      Caption         =   "Частка куба"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   360
      TabIndex        =   27
      Top             =   3720
      Width           =   1455
   End
   Begin VB.CommandButton Command18 
      Caption         =   "<="
      Height          =   375
      Left            =   2880
      TabIndex        =   22
      Top             =   2280
      Width           =   495
   End
   Begin VB.CommandButton Command17 
      Caption         =   "<="
      Height          =   375
      Left            =   2880
      TabIndex        =   21
      Top             =   1560
      Width           =   495
   End
   Begin VB.CommandButton Command16 
      Caption         =   "/"
      Height          =   375
      Left            =   4920
      TabIndex        =   20
      Top             =   3000
      Width           =   375
   End
   Begin VB.CommandButton Command15 
      Caption         =   "*"
      Height          =   375
      Left            =   4320
      TabIndex        =   19
      Top             =   3000
      Width           =   375
   End
   Begin VB.CommandButton Command14 
      Caption         =   "-"
      Height          =   375
      Left            =   3720
      TabIndex        =   18
      Top             =   3000
      Width           =   375
   End
   Begin VB.CommandButton Command13 
      Caption         =   "+"
      Height          =   375
      Left            =   3120
      TabIndex        =   17
      Top             =   3000
      Width           =   375
   End
   Begin VB.TextBox Text4 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   600
      TabIndex        =   16
      Top             =   3000
      Width           =   2175
   End
   Begin VB.CommandButton Command12 
      Caption         =   "Вихід"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4800
      TabIndex        =   15
      Top             =   4320
      Width           =   1215
   End
   Begin VB.CommandButton Command11 
      Caption         =   "Очистити"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   14
      Top             =   4320
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   600
      TabIndex        =   12
      Top             =   840
      Width           =   2175
   End
   Begin VB.TextBox Text3 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   600
      TabIndex        =   11
      Top             =   2280
      Width           =   2175
   End
   Begin VB.TextBox Text2 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   600
      TabIndex        =   10
      Top             =   1560
      Width           =   2175
   End
   Begin VB.CommandButton Command10 
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4080
      TabIndex        =   9
      Top             =   2280
      Width           =   375
   End
   Begin VB.CommandButton Command9 
      Caption         =   "9"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4560
      TabIndex        =   8
      Top             =   1800
      Width           =   375
   End
   Begin VB.CommandButton Command8 
      Caption         =   "8"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4080
      TabIndex        =   7
      Top             =   1800
      Width           =   375
   End
   Begin VB.CommandButton Command7 
      Caption         =   "7"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3600
      TabIndex        =   6
      Top             =   1800
      Width           =   375
   End
   Begin VB.CommandButton Command6 
      Caption         =   "6"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4560
      TabIndex        =   5
      Top             =   1320
      Width           =   375
   End
   Begin VB.CommandButton Command5 
      Caption         =   "5"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4080
      TabIndex        =   4
      Top             =   1320
      Width           =   375
   End
   Begin VB.CommandButton Command4 
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3600
      TabIndex        =   3
      Top             =   1320
      Width           =   375
   End
   Begin VB.CommandButton Command3 
      Caption         =   "3"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4560
      TabIndex        =   2
      Top             =   840
      Width           =   375
   End
   Begin VB.CommandButton Command2 
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4080
      TabIndex        =   1
      Top             =   840
      Width           =   375
   End
   Begin VB.CommandButton Command1 
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3600
      TabIndex        =   0
      Top             =   840
      Width           =   375
   End
   Begin VB.Label Label5 
      Caption         =   "Rez"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Left            =   120
      TabIndex        =   26
      Top             =   3000
      Width           =   495
   End
   Begin VB.Label Label4 
      Caption         =   "Nb"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   120
      TabIndex        =   25
      Top             =   2280
      Width           =   375
   End
   Begin VB.Label Label3 
      Caption         =   "Na"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   375
      Left            =   120
      TabIndex        =   24
      Top             =   1560
      Width           =   375
   End
   Begin VB.Label Label2 
      Caption         =   "N0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   375
      Left            =   120
      TabIndex        =   23
      Top             =   840
      Width           =   375
   End
   Begin VB.Label Label1 
      Caption         =   "Моя перша програма"
      ForeColor       =   &H000000FF&
      Height          =   375
      Left            =   1800
      TabIndex        =   13
      Top             =   120
      Width           =   1935
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Text1 = Text1 + "1"
End Sub
Private Sub Command10_Click()
Text1 = Text1 + "0"
End Sub

Private Sub Command13_Click()
Text4 = Int(Text2.Text) + Int(Text3.Text)
End Sub

Private Sub Command14_Click()
Text4 = Int(Text2.Text) - Int(Text3.Text)
End Sub

Private Sub Command15_Click()
Text4 = Int(Text2.Text) * Int(Text3.Text)
End Sub

Private Sub Command16_Click()
Text4 = Int(Text2.Text) / Int(Text3.Text)
End Sub

Private Sub Command17_Click()
Text2 = Text1
Text1 = ""
End Sub
Private Sub Command18_Click()
Text3 = Text1
Text1 = ""
End Sub

Private Sub Command2_Click()
Text1 = Text1 + "2"
End Sub

Private Sub Command20_Click()
Text4 = (Int(Text2) ^ 3) / (Int(Text2) ^ 2 + Int(Text3) ^ 2)
End Sub

Private Sub Command21_Click()
Dim a As Integer
If Len(Text4) <> 0 Then
a = Int(Text4)
Text4 = Int(Text2) ^ Int(Text3) + a
Else
Text4 = Int(Text2) ^ Int(Text3)
End If
Text2 = ""
End Sub

Private Sub Command3_Click()
Text1 = Text1 + "3"
End Sub
Private Sub Command4_Click()
Text1 = Text1 + "4"
End Sub
Private Sub Command5_Click()
Text1 = Text1 + "5"
End Sub
Private Sub Command6_Click()
Text1 = Text1 + "6"
End Sub
Private Sub Command7_Click()
Text1 = Text1 + "7"
End Sub
Private Sub Command8_Click()
Text1 = Text1 + "8"
End Sub
Private Sub Command9_Click()
Text1 = Text1 + "9"
End Sub
Private Sub Command11_Click()
Text1 = ""
Text2 = ""
Text3 = ""
End Sub
Private Sub Command12_Click()
End
End Sub
