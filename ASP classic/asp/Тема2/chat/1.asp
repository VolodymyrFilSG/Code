<HTML>

<HEAD>

    <meta charset="CP1251">

    <META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">

</HEAD>

<BODY>



<%

    Dim Conn, RS, strSQL, strOut
    strOut = ""

    Set Conn = Server.CreateObject("ADODB.Connection")
    Conn.Open "DSN=chat; UID=root;PWD=12345;database=chat"

    Set RS = Server.CreateObject("ADODB.Recordset")
    strSQL = "SELECT color, nick, message FROM chat WHERE 1 order by id desc"

    RS.Open strSQL, Conn
    RS.MoveFirst

    strOut = strOut & "<TABLE BORDER=""1"">"
    strOut = strOut & "<TR><TH>Абонент</TH><TH>Сторона</TH><TH>Сторона</TH></TR>"

    Do While Not RS.EOF
        strOut = strOut & "<TR>"
        strOut = strOut & "<TD>" & RS.Fields("color") & "</TD>"
        strOut = strOut & "<TD>" & RS.Fields("nick") & "</TD>"
        strOut = strOut & "<TD>" & RS.Fields("message") & "</TD>"
        strOut = strOut & "</TR>"
        RS.MoveNext
    Loop

    strOut = strOut & "</TABLE>"



    RS.Close
    Set RS = Nothing
    Conn.Close
    Set Conn = Nothing
    Response.Write strOut

 %>

 

</BODY>

</HTML>