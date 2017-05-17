Attribute VB_Name = "Module1"
Option Explicit
Public a As Single, b As Single, S As Single, N As Integer
Public X As Single, ax As Single, bx As Single, e As Single
Public Flag1 As Boolean
' ��������� ��� ���������� ����������� ���������
Public Sub Integral2(a As Single, b As Single, N As Integer)
Dim Y As Single, i As Integer, R As Single
Dim int0 As Single, int1 As Integer
Dim dx As Single
R = 1 + e: int0 = 0
While Abs(R) > e '���� "����" ����������� �������� ������ �������
int1 = int0:
X = a: dx = (b - a) / N
For i = 1 To N
'���� � ���������� ����������� ���������� ��������� ��� ��������� ������� N'
If Flag1 Then
Y = FNy2(X, ax, bx)
Else
Y = FNy1(X, ax, bx)
End If
S = S + Y * dx
X = X + dx
Next i
'���������� �������
R = (int0 - int1) / 3
N = N * 2
Wend
End Sub
Public Function FNy1(X As Single, ax As Single, bx As Single)
' ������� �����������
Dim Y As Single
Y = ax * X ^ 2 + bx
FNy1 = Y
End Function
Public Function FNy2(X As Single, ax As Single, bx As Single)
' ������� �����������
Dim Y As Single
Y = 1 / (ax * X) + bx
FNy2 = Y
End Function

Sub Form2_Load()
' ³������������ �����
Me.Left = (Screen.Width - Me.Width) / 2
Me.Top = (Screen.Height - Me.Height) / 2
Flag1 = False
End Sub
Sub Command1_Click() ' ���������� ���������
ax = Val(Text3.Text)
bx = Val(Text4.Text)
' �������� �������� �����
If ax = 0 And bx = 0 Then
MsgBox "������ ���"
Exit Sub
End If
If Flag1 = True And ax = 0 Then
MsgBox "����������� �������� �����"
Exit Sub
End If
a = Val(InputBox("������ ����� ������� ������������ ", "�������� �����"))
b = Val(InputBox("������ ������ ������� ������������ ", "�������� �����"))
N = Val(InputBox("������ ����� ������ ��������", "�������� �����"))
e = Val(InputBox("������ ������� �������", "�������� �����"))
S = 0
Integral2 a, b, N
MsgBox "�������� = " & Str(S), , "�������� ���������"
End Sub
Private Sub Command2_Click()
'����� � ��������'
Unload Me
End Sub
Private Sub Text1_Change()
Flag1 = False
End Sub
Private Sub Text2_Click()
Flag1 = True
End Sub

