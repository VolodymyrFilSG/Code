<HTML>

<HEAD>

    <meta charset="CP1251">

    <META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">

</HEAD>

<BODY>
<p> Сейчас онлайн: </p>


<%

    Dim Conn, RS, strSQL, strOut
    strOut = ""

    Set Conn = Server.CreateObject("ADODB.Connection")
    Conn.Open "DSN=chat; UID=root;PWD=12345;database=chat"

    Set RS = Server.CreateObject("ADODB.Recordset")
    strSQL = "SELECT nick, id FROM nicks WHERE db = '" & Session("room") & "' order by id desc"

    RS.Open strSQL, Conn
    RS.MoveFirst
    on error resume next
    users = -1
    Do While Not RS.EOF
        strOut = strOut & "<p>[" & RS.Fields("nick") & "]</p>"
        users = users + 1
        RS.MoveNext
    Loop
    Conn.Close

    x = len(strout) - 13
    strout = mid(strOut, 1, x)

    RS.Close
    Set RS = Nothing
    
    Set Conn = Nothing

    if x = 0 then
    Response.Write("Никого нету онлайн")
    else
    Response.Write(users & " пользоветелей")
    end if
    Response.Write strOut
 %>

 

</BODY>

</HTML>