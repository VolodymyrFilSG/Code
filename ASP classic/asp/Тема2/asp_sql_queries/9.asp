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
    Conn.Open "DSN=phone_unicode; UID=root;PWD=12345;database=phone"

    Set RS = Server.CreateObject("ADODB.Recordset")
    strSQL = "SELECT LEFT(street,1) as letter, COUNT(*) as street_cnt FROM (SELECT DISTINCT street FROM phone WHERE Street IS NOT NULL) as t GROUP BY LEFT(street, 1)"

    RS.Open strSQL, Conn
    RS.MoveFirst

    strOut = strOut & "<TABLE BORDER=""1""><tr><td colspan = ""2"">Вулиці по перших буквах</td></tr><tr><td>Буква</td><td>Кількість вулиць</td></tr>"

    Do While Not RS.EOF
        strOut = strOut & "<TR><TD>" & RS.Fields("letter") & "</TD>" & "<TD>" & RS.Fields("street_cnt") & "</TD></TR>"
        RS.MoveNext
    Loop

    RS.Close
    Set RS = Nothing
    Conn.Close
    Set Conn = Nothing
    Response.Write strOut

 %>

 

</BODY>

</HTML>