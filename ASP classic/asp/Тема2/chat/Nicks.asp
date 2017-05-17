<html>
<%

Set Conn = Server.CreateObject("ADODB.Connection")


 Response. Write "<META http-equiv='refresh' content='" & CInt(Session("RefreshTime")) & "'>"
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
</head>
<body>

Ñåé÷àñ â ÷àòå:<br>

<%

  Conn.Open "DSN=chat;"

  Set RS = Server.CreateObject("ADODB.Recordset")
  strSQL = "Select nick FROM nicks WHERE 1"

  RS.Open strSQL, Conn
  RS.MoveFirst

  On Error Resume Next	
  
  CurUser = 0
  Odd = 0

  Do While Not RS.EOF
        If Odd = 0 Then
        Str = RS.Fields("nick")
        If Str <> "" Then
          Response.Write "[" & Str & "]<br>"
          Odd = 1
          CurUser = CurUser + 1
        End If
        Else
      	Odd = 0
      	rs.Movenext
      	end if
  Loop
  conn.close
'	 Do While Not InStream.AtEndOfStream
'    If Odd = 0 Then
'      Str = InStream.ReadLine()
'      If Str <> "" Then
'        Response.Write "[" & Str & "]<br>"
'        Odd = 1
'        CurUser = CurUser + 1
'      End If
'    Else
'      Odd = 0
'      InStream.SkipLine()
'    End If
'  Loop	

  If CurUser = 0 Then
    Response.Write "<br>íåò ïîëüçîâàòåëåé"
  Else
    Response.Write "<br>Âñåãî " & CurUser
  End If

  Set Instream = Nothing

%>

</body>
</html>