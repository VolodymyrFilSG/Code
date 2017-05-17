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
    strSQL = "SELECT Abonent FROM phone WHERE Abonent LIKE '%ий %'"

    RS.Open strSQL, Conn
    RS.MoveFirst

    strOut = strOut & "<ul><li>Абоненти, прізвища яких закінчуються на «ий»</li>"
    strOut = strOut & "<ol>"
    Do While Not RS.EOF
        strOut = strOut & "<li>" & RS.Fields("Abonent") & "</li>"
        RS.MoveNext
    Loop

    strOut = strOut & "</ol>"

    RS.Close
    
    strSQL = "SELECT Abonent FROM phone WHERE Abonent LIKE '%ко %'"
    RS.Open strSQL, Conn
    RS.MoveFirst

    strOut = strOut & "<li>Абоненти, прізвища яких закінчуються на «ко»</li>"
    strOut = strOut & "<ol>"
    Do While Not RS.EOF
        strOut = strOut & "<li>" & RS.Fields("Abonent") & "</li>"
        RS.MoveNext
    Loop

    strOut = strOut & "</ol></ul>"

    RS.Close
    Set RS = Nothing
    Conn.Close
    Set Conn = Nothing
    Response.Write strOut

 %>

 

</BODY>

</HTML>