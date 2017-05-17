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
    Conn.Open "DSN=phone_unicode; UID=root; PWD=12345; database=phone"

    Set RS = Server.CreateObject("ADODB.Recordset")
    strSQL = "SELECT `Abonent`, (CASE WHEN House % 2 > 0 THEN 'Ліва' ELSE 'права' END) as Side FROM `phone` WHERE `Street` = 'РУСЬКА'"

    RS.Open strSQL, Conn
    RS.MoveFirst

    strOut = strOut & "<TABLE BORDER=""1"">"
    strOut = strOut & "<TR><TH>Абонент</TH><TH>Сторона</TH></TR>"

    Do While Not RS.EOF
    	strOut = strOut & "<TR>"
    	strOut = strOut & "<TD>" & RS.Fields("Abonent") & "</TD>"
    	strOut = strOut & "<TD>" & RS.Fields("side") & "</TD>"
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