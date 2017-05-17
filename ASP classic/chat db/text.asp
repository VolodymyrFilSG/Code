<html>

<head>
<meta charset="CP1251">
<%
 Response. Write "<META http-equiv='refresh' content='" & CInt(Session("RefreshTime")) & "'>"
%>

</head>
<body>

<%

    Dim Conn, RS, strSQL, strOut
    strOut = ""

    Set Conn = Server.CreateObject("ADODB.Connection")
    Conn.Open "DSN=chat; UID=root;PWD=12345;database=chat"

    Set RS = Server.CreateObject("ADODB.Recordset")
    strSQL = "SELECT color, smile, nick, message FROM chat WHERE db = '" & Session("room") & "' order by id desc limit '" & session("lnum") & "'"

    RS.Open strSQL, Conn
    RS.MoveFirst

        Do While Not RS.EOF
        strOut = strOut & "<table><td width=15 valign='top'></td><tr><td><b><font color='" & RS.Fields("color") & "'><img src = " & rs.Fields("smile") & ">  " & RS.Fields("nick") & "</font></B> " & RS.Fields("message") & "</td></tr></table>"
        RS.MoveNext
    Loop




    RS.Close
    Set RS = Nothing
    Conn.Close
    Set Conn = Nothing
    Response.Write strOut

 %>

</body>
</html>