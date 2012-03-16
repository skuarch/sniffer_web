<% String shortContext = new com.websniffer.Context(request.getContextPath()).getShortContext(); %>

<%= new com.websniffer.ConnectWithFilter(shortContext).deleteStructureSource(request.getParameter("nameOfStructure"), response.getWriter()) %>