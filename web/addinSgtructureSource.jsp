<%-- 
    Document   : addinSgtructureSource.jsp
    Created on : Sep 2, 2010, 1:11:21 PM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String shortContext = new com.websniffer.Context(request.getContextPath()).getShortContext();%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
            String[] categories = new com.websniffer.ConnectWithFilter(shortContext).getCategories("", response.getWriter());
            int i = 0;
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/default.css?id=939" >
        <script language="javascript" type="text/javascript" src="Scripts/ajax.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/blockIP.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/blockSubred.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/blockRango.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/validaIp.js"></script>
        <script language="javascript" type="text/javascript" src="Scripts/ajaxBlockInStructure.js"></script>

        <title>agregar contenido al bloqueo</title>
    </head>
    <body>

        <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(shortContext).getHeaderColor()%>; width: 550px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(shortContext).getBorderColorHeader()%>;"></div>

        <center>
            Bloqueo: <b><%=request.getParameter("nameOfStructure")%></b>
        </center>

        <form action="" method="post" id="formAddBlockeo" name="formAddBlockeo">

            <center>

                <br>
                selecciona la categoria(s) a bloquear

                <br>
                <br>

                <select name="categories" multiple style=" width: 500px; height: 150px; overflow: auto">

                    <% while (i < categories.length - 1) {%>

                    <option value="!<%=categories[i]%>">!<%=categories[i]%>

                        <% i++;
                                        if (i == 200) {
                                            i = 0;
                                            break;
                                        }
                                    } //end while
%>
                </select>            

                <br>
                <br>

                Introduce IP,subred o rango a  bloquear

                <br>
                <br>
            </center>

                
            <table border="0" align="center">
                <tbody>
                    <tr>
                        <td>ip </td>
                        <td><input type="text" maxlength="15" id="ip"></td>
                        <td><input type="button" value="bloquear"  onclick="blockIP(document.formAddBlockeo.ip.value,document.formAddBlockeo.categories,'<%=request.getParameter("nameOfStructure")%>')"></td>
                        <td><div class="ejemplo">ejemplo: 192.168.252.0</div></td>
                    </tr>
                    <tr>
                        <td>Subred</td>
                        <td><input type="text" maxlength="18" id="subred"></td>
                        <td><input type="button" value="bloquear" onclick="blockSubred(document.formAddBlockeo.subred.value,document.formAddBlockeo.categories,'<%=request.getParameter("nameOfStructure")%>')"></td>
                        <td><div class="ejemplo">ejemplo: 192.168.252.0/26</div></td>
                    </tr>
                    <tr>
                        <td>Rango</td>
                        <td><input type="text" maxlength="31" id="rango"></td>
                        <td><input type="button" value="bloquear" onclick="blockRango(document.formAddBlockeo.rango.value,document.formAddBlockeo.categories,'<%=request.getParameter("nameOfStructure")%>')"></td>
                        <td><div class="ejemplo">ejemplo: 192.168.252.0-192.168.252.10</div></td>
                    </tr>                    
                </tbody>
            </table>





        </form>



        <div id="header" align="center" style="background-color: <%= new com.websniffer.Theme(shortContext).getHeaderColor()%>; width: 550px; height: 15px; margin:0 auto 0 auto; border:1px solid <%= new com.websniffer.Theme(shortContext).getBorderColorHeader()%>;"></div>

    </body>
</html>
