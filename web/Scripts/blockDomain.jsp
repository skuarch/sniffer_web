<%
    String context = new com.websniffer.Context(request.getContextPath()).getShortContext();
    String categorie = request.getParameter("categorie");
    String domain = request.getParameter("domain");
%>

<%= new com.websniffer.ConnectWithFilter(context).blockDomain(categorie.trim(),domain.trim(), response.getWriter()) %>