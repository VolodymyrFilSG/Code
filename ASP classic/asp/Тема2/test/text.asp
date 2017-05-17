<html>
<%
 Response. Write "<META http-equiv='refresh' content='" & CInt(Session("RefreshTime")) & "'>"
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
</head>
<body>

<%
  Set FileObject = Server.CreateObject("Scripting.FileSystemObject")
  TestFile = Server.MapPath ("/Chat/Chat.txt")

  On Error Resume Next	
  Set InStream = FileObject.OpenTextFile (TestFile, 1, False, False)

  CurLine = 0
  MaxLines = CInt(Session("LNum"))

  Do While Not InStream.AtEndOfStream
    Response.Write InStream.ReadLine()
    CurLine = CurLine + 1
    If CurLine >= MaxLines Then Exit Do End If
  Loop	

  Response.Write "<br>"

  Set Instream = Nothing
%>

</body>
</html>