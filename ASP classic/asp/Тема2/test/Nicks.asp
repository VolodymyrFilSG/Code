<html>
<%
 Response. Write "<META http-equiv='refresh' content='" & CInt(Session("RefreshTime")) & "'>"
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
</head>
<body>

Сейчас в чате:<br>

<%
  Set FileObject = Server.CreateObject("Scripting.FileSystemObject")
  TestFile = Server.MapPath ("/Chat/Nicks.txt")

  On Error Resume Next	
  Set InStream = FileObject.OpenTextFile (TestFile, 1, False, False)

  CurUser = 0
  Odd = 0

  Do While Not InStream.AtEndOfStream
    If Odd = 0 Then
      Str = InStream.ReadLine()
      If Str <> "" Then
        Response.Write "[" & Str & "]<br>"
        Odd = 1
        CurUser = CurUser + 1
      End If
    Else
      Odd = 0
      InStream.SkipLine()
    End If
  Loop	

  If CurUser = 0 Then
    Response.Write "<br>нет пользователей"
  Else
    Response.Write "<br>Всего " & CurUser
  End If

  Set Instream = Nothing

%>

</body>
</html>