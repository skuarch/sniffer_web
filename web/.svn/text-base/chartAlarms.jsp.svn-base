<%-- 
    Document   : chartAlarms
    Created on : 6/04/2010, 10:46:40 AM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="barCharAlarm.jsp" %>
<%@include  file="barChartVolumenAlarm.jsp" %>
<%@include  file="chartLineAlarm.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div class="bordes" style="width:783px; height:417px; margin:5px; overflow:auto" >

            <table border="0" cellpadding="1" cellspacing="0">
                <tbody>
                    <tr>
                        <td><img src='<%=response.encodeURL("getchart.jsp?" + chartBarrasConversaciones)%>' usemap="#map1" border="0" alt=""></td>                    
                        <td><img src='<%=response.encodeURL("getchart.jsp?" + chartBarrasConversaciones2)%>' usemap="#map0" border="0" alt=""></td>
                    </tr>
                </tbody>
            </table>
            
            <img src='<%=response.encodeURL("getchart.jsp?" + chart1URL3)%>' usemap="#map3" border="0" alt="">

            <map name="map0">
                <%=imageMap0%>                
            </map>

            <map name="map1">
                <%=imageMap1%>                
            </map>            

        </div>

    </body>
</html>


<%

            try {

                sql = null;
                data = null;
                labels = null;
                tam = 0;
                r.close();
                c = null;
                chartBarrasConversaciones = null;
                imageMap0 = null;
                //marca = 0;

            } finally {
                r = null;
            }



            try {

                sql0 = null;
                data2 = null;
                labels0 = null;
                tam0 = 0;
                r0.close();
                c0 = null;
                chartBarrasConversaciones2 = null;
                imageMap1=null;
                //marca = 0;

            } finally {
                r0 = null;
            }


            try {

                sql3 = null;
                data3 = null;
                labels3 = null;
                tam3 = 0;
                r3.close();
                c3 = null;
                chart1URL3 = null;
                //marca = 0;

            } finally {
                r3 = null;
            }

            System.gc();

%>