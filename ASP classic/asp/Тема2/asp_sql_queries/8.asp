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
    strSQL = "SELECT COUNT(house) as `counter`, `Street` FROM `phone` group by `Street` ORDER BY `counter` DESC LIMIT 1"

    RS.Open strSQL, Conn
    RS.MoveFirst

    strOut = strout & "В Тернополі найбільше будинків на вулиці " & RS.Fields("street") & "."


    RS.Close
    Set RS = Nothing
    Conn.Close
    Set Conn = Nothing
    Response.Write strOut

 %>

 

</BODY>

</HTML>