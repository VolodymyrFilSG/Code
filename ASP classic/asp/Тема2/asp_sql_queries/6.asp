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
    strSQL = "SELECT Abonent FROM phone WHERE LEFT(phone, 1) = RIGHT(phone, 1) OR RIGHT(LEFT(phone, 2), 1) = LEFT(RIGHT(phone, 2), 1) OR RIGHT(LEFT(phone, 3), 1) = LEFT(RIGHT(phone, 3), 1)"

    RS.Open strSQL, Conn
    RS.MoveFirst

    strOut = strOut & "Абоненти з симетричними номерами: "

    Do While Not RS.EOF
        strOut = strOut & RS.Fields("Abonent") & ", "
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