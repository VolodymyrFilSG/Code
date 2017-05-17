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
    strSQL = "SELECT left(phone,2) AS 'ATC', COUNT(left(phone,2)) as COUNTER FROM `phone` WHERE `Index` IS NOT NULL GROUP BY (left(phone,2))"

    RS.Open strSQL, Conn
    RS.MoveFirst

    strOut = strOut & "<p> Тернопільські АТС:</p>" & "<ul>" 
    Do While Not RS.EOF
        strOut = strOut & "<li>ATC " & RS.Fields("atc") & " обслуговує " & RS.Fields("counter") & " абонентів</li>"
        
        RS.MoveNext
    Loop
    strOut = strOut & "</ul>"

    RS.Close
    Set RS = Nothing
    Conn.Close
    Set Conn = Nothing
    Response.Write strOut

 %>

 

</BODY>

</HTML>