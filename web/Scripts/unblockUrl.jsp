<%
    String context = new com.websniffer.Context(request.getContextPath()).getShortContext();
    String categorie = request.getParameter("categorie");
    String array = request.getParameter("array");
%>

<%= new com.websniffer.ConnectWithFilter(context).unblockUrl(categorie,array, response.getWriter()) %>

