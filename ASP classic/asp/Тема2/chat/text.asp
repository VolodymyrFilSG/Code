<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
</head>
<body>

<%
	Dim Conn, RS, strSQL, strOut
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open "DSN=chat; database=chat"
	Set RS = Server.CreateObject("ADODB.Recordset")
	MaxLines = 1
	strSQL = "SELECT `color`, nick, message FROM `chat` WHERE 1 order by id desc"
	RS.Open strSQL, Conn
	RS.MoveFirst
	strOut = ""

	Do While Not RS.EOF
		strOut = strOut & rs.fields("color")
		strOut = strOut & rs.fields("nick") & rs.fields("message")
    	 Response.Write("strHtml")
    	 Response.Write("<br>")
  	Loop
  	conn.close
  Response.Write "<br>"

%>

</body>
</html>