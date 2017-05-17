Attribute VB_Name = "Module1"
Option Explicit
Public a As Single, b As Single, S As Single, N As Integer
Public X As Single, ax As Single, bx As Single, e As Single
Public Flag1 As Boolean
' процедура для обчислення визначеного інтегралу
Public Sub Integral2(a As Single, b As Single, N As Integer)
Dim Y As Single, i As Integer, R As Single
Dim int0 As Single, int1 As Integer
Dim dx As Single
R = 1 + e: int0 = 0
While Abs(R) > e 'цикл "Поки" забезпечить контроль заданої точності
int1 = int0:
X = a: dx = (b - a) / N
For i = 1 To N
'Цикл з лічильником забезпечить обчислення інтегралу при поточному значенні N'
If Flag1 Then
Y = FNy2(X, ax, bx)
Else
Y = FNy1(X, ax, bx)
End If
S = S + Y * dx
X = X + dx
Next i
'обчислення точності
R = (int0 - int1) / 3
N = N * 2
Wend
End Sub
Public Function FNy1(X As Single, ax As Single, bx As Single)
' функція користувача
Dim Y As Single
Y = ax * X ^ 2 + bx
FNy1 = Y
End Function
Public Function FNy2(X As Single, ax As Single, bx As Single)
' функція користувача
Dim Y As Single
Y = 1 / (ax * X) + bx
FNy2 = Y
End Function

Sub Form2_Load()
' Відцентрування форми
Me.Left = (Screen.Width - Me.Width) / 2
Me.Top = (Screen.Height - Me.Height) / 2
Flag1 = False
End Sub
Sub Command1_Click() ' Обчислення інтегралу
ax = Val(Text3.Text)
bx = Val(Text4.Text)
' контроль введення даних
If ax = 0 And bx = 0 Then
MsgBox "Введіть дані"
Exit Sub
End If
If Flag1 = True And ax = 0 Then
MsgBox "Неправильне введення даних"
Exit Sub
End If
a = Val(InputBox("Введіть нижню границю інтегрування ", "Введення даних"))
b = Val(InputBox("Введіть верхню границю інтегрування ", "Введення даних"))
N = Val(InputBox("Вкажіть число відрізків розбиття", "Введення даних"))
e = Val(InputBox("Вкажіть потрібну точність", "Введення даних"))
S = 0
Integral2 a, b, N
MsgBox "Інтеграл = " & Str(S), , "Значення інтегралу"
End Sub
Private Sub Command2_Click()
'Вихід з програми'
Unload Me
End Sub
Private Sub Text1_Change()
Flag1 = False
End Sub
Private Sub Text2_Click()
Flag1 = True
End Sub

