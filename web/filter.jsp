<%-- 
    Document   : filter
    Created on : Jul 20, 2010, 10:58:45 AM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.net.*, java.io.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%

            String context = new com.websniffer.Context(request.getContextPath()).getShortContext();
            
            try {                
                String[] categories = new com.websniffer.ConnectWithFilter(context).getCategories(request.getParameter("categorie"), response.getWriter());
                int length = categories.length -1;
                int other = 0;

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filter</title>
    </head>
    <body>

        <div style="background-color: #cacaca">
            <b>Numero de categorias <%= length %></b>
        </div>

        <div class="categories" id="categories" >

            <table border="0" cellpadding="3" cellspacing="1" align="center">
                <tbody>
                    <% do { %>
                    <tr>
                        <% for(int r = 0; (r < 5 && other < length); r++){ %>
                        <td align="left">
                            <a href="javascript:categorias('<%=categories[other]%>');">
                                <img src='images/folder.png' align='absmiddle' border="0" alt="">
                                <%=categories[other]%>
                            </a>
                        </td>
                        <% other++; %>                        
                        <% } %>
                    </tr>
                    <% } while(other < length);  %>
                </tbody>
            </table>          
        </div>

    </body>
</html>

<%
                categories = null;

             }catch(ConnectException ce){
                 out.print("ERROR: El servicio de filtrado probablemente este detenido, favor de reportarlo al administrador<br>" +ce);
            } catch (Exception e) {
                out.print("ERROR: hubo un error con el sistema de filtrado. Favor de reportarlo con el administrador del sistema<br>" +e);
            }
%>
