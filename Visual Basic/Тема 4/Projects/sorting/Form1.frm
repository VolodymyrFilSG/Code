VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   1080
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   2205
   LinkTopic       =   "Form1"
   ScaleHeight     =   1080
   ScaleWidth      =   2205
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "¬в≥д"
      Height          =   855
      Left            =   120
      TabIndex        =   0
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
Dim arrout As String
Dim arr() As Variant
size = Int(InputBox("¬вед≥ть розм≥р одновим≥рного масиву"))
ReDim arr(size)

For i = 0 To size - 1
arr(i) = Int(InputBox("¬вед≥ть " & i + 1 & " значенн€ масиву "))
Next
For j = 0 To size - 1
arrout = arrout & " " & arr(j)
Next
a = MsgBox(arrout)

End Sub
