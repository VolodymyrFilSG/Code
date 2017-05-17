VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   1395
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   2580
   LinkTopic       =   "Form1"
   ScaleHeight     =   1395
   ScaleWidth      =   2580
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
Kill ("C:\Vbas\f1.txt")
RmDir ("C:\Vbas\")
End Sub
