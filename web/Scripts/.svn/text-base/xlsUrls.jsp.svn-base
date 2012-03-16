<%--
    Document   : xlsDomains
    Created on : Aug 3, 2010, 10:41:18 AM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <% response.setHeader("Content-Disposition", "attachment; filename=\"SisPro.xls\"");%>
        <meta http-equiv="application/vnd.ms-excel" content="application/vnd.ms-excel; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>

        <%
                    String context = new com.websniffer.Context(request.getContextPath()).getShortContext();
                    int i = 0;
                    String[] urls = new com.websniffer.ConnectWithFilter(context).getUrls(request.getParameter("categorie"), response.getWriter());

        %>

        <table border="0">
            <thead>
                <tr>
                    <th>Urls bloqueadas</th>
                </tr>
            </thead>
            <tbody>

                <% if (urls.length > 1) {%>
                    <% while (i < urls.length) {%>

                    <tr>
                        <td><%=urls[i]%></td>
                    </tr>

                    <% i++;
                         }%>

                <% } //end if %>
            </tbody>
        </table>

    </body>
</html>

