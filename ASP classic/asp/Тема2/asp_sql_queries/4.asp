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
    strSQL = "Select Count(abonent) as utel FROM `phone` WHERE `Phone` LIKE '11%'"

    RS.Open strSQL, Conn
    RS.MoveFirst

    strOut = strOut & "<p> Utel обслуговує "
        strOut = strOut & RS.Fields("utel")

    strOut = strOut & " абонентів</p>"

    RS.Close
    Set RS = Nothing
    Conn.Close
    Set Conn = Nothing
    Response.Write strOut

 %>

 

</BODY>

</HTML>