VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Пори року"
   ClientHeight    =   3705
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   7980
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   21.75
      Charset         =   204
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   3705
   ScaleWidth      =   7980
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame2 
      Caption         =   "Місяці"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   12
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2055
      Left            =   5400
      TabIndex        =   7
      Top             =   960
      Width           =   2295
      Begin VB.CheckBox Check1 
         Caption         =   "Місяць"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   12
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Left            =   480
         TabIndex        =   11
         Top             =   1560
         Width           =   1335
      End
      Begin VB.Label Label3 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   12
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   240
         TabIndex        =   10
         Top             =   1320
         Width           =   1695
      End
      Begin VB.Label Label2 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   12
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   240
         TabIndex        =   9
         Top             =   840
         Width           =   1575
      End
      Begin VB.Label Label1 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   12
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   240
         TabIndex        =   8
         Top             =   360
         Width           =   1815
      End
   End
   Begin VB.CommandButton CmdExit 
      Caption         =   "Вихід"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   15.75
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   480
      TabIndex        =   6
      Top             =   3120
      Width           =   2055
   End
   Begin VB.Frame Frame1 
      Caption         =   "Виберіть пору року"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   12
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2055
      Left            =   240
      TabIndex        =   1
      Top             =   960
      Width           =   2415
      Begin VB.OptionButton OptAutumn 
         Caption         =   "Осінь"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   14.25
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000080FF&
         Height          =   255
         Left            =   240
         TabIndex        =   5
         Top             =   1560
         Width           =   1215
      End
      Begin VB.OptionButton OptSummer 
         Caption         =   "Літо"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   14.25
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00008000&
         Height          =   255
         Left            =   240
         TabIndex        =   4
         Top             =   1200
         Width           =   1575
      End
      Begin VB.OptionButton OptSpring 
         Caption         =   "Весна"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   14.25
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FF00&
         Height          =   255
         Left            =   240
         TabIndex        =   3
         Top             =   840
         Width           =   1455
      End
      Begin VB.OptionButton OptWinter 
         Caption         =   "Зима"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   14.25
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   225
         Left            =   240
         TabIndex        =   2
         Top             =   480
         Width           =   1455
      End
   End
   Begin VB.Image Img 
      BorderStyle     =   1  'Fixed Single
      Height          =   2415
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   1080
      Visible         =   0   'False
      Width           =   2415
   End
   Begin VB.Label LblSeason 
      Alignment       =   2  'Center
      Caption         =   "Пори року"
      Height          =   495
      Left            =   1320
      TabIndex        =   0
      Top             =   120
      Width           =   2895
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim z, k As Integer

Private Sub Check1_Click()
z = month()
End Sub

Private Sub CmdExit_Click()
End
End Sub

Private Sub Form_Load()
Img.Visible = False
End Sub

Private Sub OptWinter_Click()
Img.Picture = LoadPicture(App.Path & "\winter.jpg")
Img.Visible = True
k = 1
z = month()
End Sub
Private Sub OptSummer_Click()
Img.Picture = LoadPicture(App.Path & "\Summer.jpg")
Img.Visible = True
k = 2
z = month()
End Sub
Private Sub OptAutumn_Click()
Img.Picture = LoadPicture(App.Path & "\Autumn.jpg")
Img.Visible = True
k = 3
z = month()
End Sub
Private Sub OptSpring_Click()
Img.Picture = LoadPicture(App.Path & "\Spring.jpg")
Img.Visible = True
k = 4
z = month()
End Sub

Function month()
If Check1.Value = 1 Then
Select Case k
Case 1:
Label1.Caption = "Грудень"
Label2.Caption = "Січень"
Label3.Caption = "Лютий"
Case 2:
Label1.Caption = "Червень"
Label2.Caption = "Липень"
Label3.Caption = "Серпень"
Case 3:
Label1.Caption = "Вересень"
Label2.Caption = "Жовтень"
Label3.Caption = "Листопад"
Case 4:
Label1.Caption = "Березень"
Label2.Caption = "Квітень"
Label3.Caption = "Травень"
End Select
Else
Label1.Caption = ""
Label2.Caption = ""
Label3.Caption = ""
End If
End Function
