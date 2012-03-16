<%-- 
    Document   : showFilter
    Created on : Jul 20, 2010, 4:39:58 PM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.net.*, java.io.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>

        <div style="background-color: #cacaca;">
            <h2><%=request.getParameter("categoria")%></h2>
        </div>

        <%
                    String context = new com.websniffer.Context(request.getContextPath()).getShortContext();

                    try {

                        int i = 0;
                        int r = 0;
                        String[] categories = new com.websniffer.ConnectWithFilter(context).getDomains(request.getParameter("categoria"), response.getWriter());
                        String[] urls = new com.websniffer.ConnectWithFilter(context).getUrls(request.getParameter("categoria"), response.getWriter());
                        boolean continuesCategories = true;
                        boolean continuesUrls = true;

                        if (urls.length-1  < 1) {
                            continuesUrls = false;
                        }

                        if (categories.length-1 < 1) {
                            continuesCategories = false;
                        }
        %>

        <center>

            <table border="0" align="center" cellpadding="2" cellspacing="2">

                <thead>
                    <tr>
                        <th>Dominios bloqueados <%= categories.length%></th>
                        <th>Urls bloqueadas <%= urls.length%> </th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <!-- Domains -->
                        <td align="center">
                            <form action="" method="post" id="formBlockDomain" name="formBlockDomain">
                                <select name="domains" multiple style=" width: 350px; height: 300px; overflow: auto">
                                    <% if (continuesCategories) {%>
                                    <% while (i < categories.length) {%>
                                    <option value="<%=categories[i]%>"><%=categories[i]%>
                                        <% i++;
                                                                        if (i == 200) {
                                                                            i = 0;
                                                                            break;
                                                                        }
                                                                    } //end while
                                                                } //end if
                                        %>
                                </select>
                                <br>
                                <input  type="button" name="desblockearDominios" id="desblockearDominios" value="desblockear dominios" onclick="javascript:unblockDomains(document.formBlockDomain.domains) ">
                                <input  type="button" name="xlsDominios" id="xlsDominios" value="exportar dominios" onclick="javascript:openWindow('Scripts/xlsDomains.jsp?categorie=<%=request.getParameter("categoria")%>',50,50)">
                                <br>
                                <br>
                                dominio: <input type="text" id="blockDomain" name="blockDomain">
                                <input type="button" name="btnBlockDomain" id="btnBlockDomain" value="bloquear" onclick="blockDomains(document.formBlockDomain.blockDomain.value,'<%=request.getParameter("categoria")%>')">
                                <input type="hidden" value="<%=request.getParameter("categoria")%>" id="categorie">
                            </form>
                        </td>

                        <!-- Urls -->
                        <td align="center">
                            <form action="" method="post" id="formBlockUrls" name="formBlockUrls">
                                <select name="urls" multiple style=" width: 350px; height: 300px; overflow: auto" >
                                    <% if (continuesUrls) {%>
                                    <% do {%>
                                    <option value="<%=urls[r]%>"><%=urls[r]%>
                                        <% r++;
                                                 if (r == 200) {
                                                     r = 0;
                                                     break;
                                                 }
                                             } while (r < urls.length);
                                        %>
                                        <% }%>
                                </select>
                                <br>
                                <input  type="button" name="desblockearUrls" id="desblockearUrls" value="desbloquear urls" onclick="javascript:unBlockUrls('<%=request.getParameter("categoria")%>',document.formBlockUrls.urls)">
                                <input  type="button" name="xlsUrls" id="xlsUrls" value="exportar urls" onclick="javascript:openWindow('Scripts/xlsUrls.jsp?categorie=<%=request.getParameter("categoria")%>',50,50)">
                                <br>
                                <br>
                                url: <input type="text" id="blockUrl" name="blockUrl">
                                <input type="button" name="btnBlockUrl" id="btnBlockUrl" value="bloquear" onclick="javascript:blockUrls(document.formBlockUrls.blockUrl.value,'<%=request.getParameter("categoria")%>')">
                                <input type="hidden" value="<%=request.getParameter("categoria")%>" id="categorie">
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>

        </center>

        <%
                        categories = null;
                        urls = null;
                    } catch (Exception e) {
                        out.print("ERROR: hubo un error con el sistema de filtrado. Favor de reportarlo con el administrador del sistema <br>" + e);
                    }

        %>

    </body>
</html>
