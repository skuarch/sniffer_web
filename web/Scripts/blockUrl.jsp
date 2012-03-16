<%
    String context = new com.websniffer.Context(request.getContextPath()).getShortContext();
    String categorie = request.getParameter("categorie");
    String url = request.getParameter("url");
%>

<%= new com.websniffer.ConnectWithFilter(context).blockUrl(categorie.trim(),url.trim(), response.getWriter()) %>