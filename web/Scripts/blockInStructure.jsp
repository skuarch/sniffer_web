<%
    String context = new com.websniffer.Context(request.getContextPath()).getShortContext();
    String categorie = request.getParameter("categorie");
    String ip = request.getParameter("ip");
    String nameOfStructure = request.getParameter("nameOfStructure");
    String rtn = "";
%>

<% rtn = new com.websniffer.ConnectWithFilter(context).addInStructureSource(nameOfStructure,ip.trim(), response.getWriter()); %>
<% rtn +="\n" + new com.websniffer.ConnectWithFilter(context).addInAcl(nameOfStructure,categorie.trim(), response.getWriter()); %>
<%= rtn %>

