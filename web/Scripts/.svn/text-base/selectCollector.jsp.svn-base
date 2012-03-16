<%

    java.sql.ResultSet rs1 = null;

    rs1 = new com.websniffer.ConnectPool(new com.websniffer.Context(request.getContextPath()).getShortContext()).select("select * from collectors");
    int leng = new com.websniffer.ConnectPool(new com.websniffer.Context(request.getContextPath()).getShortContext()).getNumFilas(rs1);

    if(leng > 0){

%>
<select name="selectCollector" id="selectCollector" onchange="javascript:changeCollector(this.value);">

    <option value="0">recolectores</option>
    <% while (rs1.next()) { %>        
        <option title="<%= rs1.getString("collector_ip") %>" value="<%= rs1.getString("collector_ip") %>"><%= rs1.getString("collector_site") %></option>
    <% } %>
    </select>
<%

    }else{

%>
<select name="selectCollector" onchange="javascript:changeCollector(this.value);">
    </select>

<%
    }
    try{
        rs1.close();
    }finally{
        rs1 = null;
    }
%>