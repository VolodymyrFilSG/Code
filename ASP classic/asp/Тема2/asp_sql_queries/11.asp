<HTML>

<HEAD>

    <meta charset="CP1251">

    <META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">

</HEAD>

<BODY>

<Form name="Nickname" method="post" action="11.asp">

 <table width= 400 border = 1>

  <tr>
   <td>Фамилия</td>
   <td><input type=text name="surname" value=""><input type=submit name="okbtnsur" value="Искать"></td>
  </tr>
  <tr>
   <td>Улица</td>
   <td><input type=text name="streets" value=""><input type=submit name="okbtnstr" value="Искать"></td>
  </tr>

 </table>
 <br>
 <input type=submit name="okbtn" value="Искать по имени и фамилии">
</Form>



<%
    surname = Trim (Request.Form("surname"))
    streets = Trim (Request.Form("streets"))
    If Request("okbtnsur") = "Искать" Then
    strSQL = "SELECT Abonent, street, phone FROM phone WHERE Abonent like '" & surname & "%'"
    end if
    If Request("okbtnstr") = "Искать" Then
    strSQL = "SELECT Abonent, street, phone FROM phone WHERE street like '" & streets & "%'"
    end if
    If Request("okbtn") = "Искать по имени и фамилии" Then
    strSQL = "SELECT Abonent, street, phone FROM phone WHERE street like '" & streets & "%' and Abonent like '" & surname & "%'"
    end if



    Dim Conn, RS, strSQL, strOut
    strOut = ""

    Set Conn = Server.CreateObject("ADODB.Connection")
    Conn.Open "DSN=phone_unicode; UID=root;PWD=12345;database=phone"

    Set RS = Server.CreateObject("ADODB.Recordset")

    RS.Open strSQL, Conn
    RS.MoveFirst

    strOut = strOut & "<TABLE BORDER=""1"">"
    strOut = strOut & "<TR><TH>Абонент</TH><TH>Вулиця</TH><TH>Телефон</TH></TR>"

    Do While Not RS.EOF
        strOut = strOut & "<TR>"
        strOut = strOut & "<TD>" & RS.Fields("Abonent") & "</TD>"
        strOut = strOut & "<TD>" & RS.Fields("street") & "</TD>"
        strOut = strOut & "<TD>" & RS.Fields("phone") & "</TD>"
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