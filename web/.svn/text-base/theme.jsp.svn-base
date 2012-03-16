<%-- 
    Document   : customizeTheme
    Created on : 22/03/2010, 01:42:25 PM
    Author     : skuarch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.ResultSet"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%

            String shortContext = new com.websniffer.Context(request.getContextPath()).getShortContext();
            //update theme
            if (request.getParameter("update") != null) {

                String sql = "UPDATE customize_theme SET custom_header_color = '" + request.getParameter("custom_header_color") + "' , "
                        + "custom_border_color_header = '" + request.getParameter("custom_border_color_header") + "' , "
                        + "custom_footer_color = '" + request.getParameter("custom_footer_color") + "' , "
                        + "custom_border_footer_color = '" + request.getParameter("custom_border_footer_color") + "' , "
                        + "custom_project_name = '" + request.getParameter("custom_project_name") + "' , "
                        + "custom_application_name = '" + request.getParameter("custom_application_name") + "' , "
                        + "custom_window_title = '" + request.getParameter("custom_window_title") + "' , "
                        + "custom_title_chart_color = '" + request.getParameter("custom_title_chart_color") + "' , "
                        + "custom_background_color_chart = '" + request.getParameter("custom_background_color_chart") + "' , "
                        + "custom_color_status_bar = '" + request.getParameter("custom_color_status_bar") + "' , "
                        + "custom_border_color_status_bar = '" + request.getParameter("custom_border_color_status_bar") + "' , "
                        + "custom_name_theme = 'default' , "
                        + "custom_copyright = '" + request.getParameter("custom_copyright") + "'";
                new com.websniffer.ConnectPool(shortContext).update(sql);                
                out.println("<center>table was updated</center>");
            }


            //get theme
            ResultSet rs = null;
            rs = new com.websniffer.ConnectPool(shortContext).select("SELECT * FROM customize_theme;");
            rs.next();

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>cutomize theme</title>
    </head>
    <body>

        <center>
            <h1>cutomize theme</h1>

            <form action="" method="post" name="formTheme" id="formTheme">

                <table border="0">

                    <tbody>

                        <tr>
                            <td>name theme</td>
                            <td> <input type="text" name="custom_name_theme" id="custom_name_theme" value="<%= rs.getString("custom_name_theme")%>" readonly> default  </td>
                        </tr>

                        <tr>
                            <td>header color</td>
                            <td> <input type="text" name="custom_header_color" id="custom_header_color" value="<%= rs.getString("custom_header_color")%>"> #D3E3E6  </td>
                        </tr>

                        <tr>
                            <td>border color header</td>
                            <td> <input type="text" name="custom_border_color_header" id="custom_border_color_header" value="<%= rs.getString("custom_border_color_header")%>"> #01B1D0  </td>
                        </tr>

                        <tr>
                            <td>footer color</td>
                            <td> <input type="text" name="custom_footer_color" id="custom_footer_color" value="<%= rs.getString("custom_footer_color")%>"> #D3E3E6  </td>
                        </tr>

                        <tr>
                            <td>border footer color</td>
                            <td> <input type="text" name="custom_border_footer_color" id="custom_border_footer_color" value="<%= rs.getString("custom_border_footer_color")%>"> #01B1D0  </td>
                        </tr>

                        <tr>
                            <td>project name</td>
                            <td> <input type="text" name="custom_project_name" id="custom_project_name" value="<%= rs.getString("custom_project_name")%>">  </td>
                        </tr>

                        <tr>
                            <td>application name </td>
                            <td> <input type="text" name="custom_application_name" id="custom_application_name" value="<%= rs.getString("custom_application_name")%>">  </td>
                        </tr>

                        <tr>
                            <td>window title </td>
                            <td> <input type="text" name="custom_window_title" id="custom_window_title" value="<%= rs.getString("custom_window_title")%>">  </td>
                        </tr>

                        <tr>
                            <td>title chart color</td>
                            <td> <input type="text" name="custom_title_chart_color" id="custom_title_chart_color" value="<%= rs.getString("custom_title_chart_color")%>"> 0xC3D9E1  </td>
                        </tr>

                        <tr>
                            <td>background color chart</td>
                            <td> <input type="text" name="custom_background_color_chart" id="custom_background_color_chart" value="<%= rs.getString("custom_background_color_chart")%>"> #cccccc </td>
                        </tr>

                        <tr>
                            <td>color status bar</td>
                            <td> <input type="text" name="custom_color_status_bar" id="custom_color_status_bar" value="<%= rs.getString("custom_color_status_bar")%>"> #EAFBFE  </td>
                        </tr>

                        <tr>
                            <td>border color status bar</td>
                            <td> <input type="text" name="custom_border_color_status_bar" id="custom_border_color_status_bar" value="<%= rs.getString("custom_border_color_status_bar")%>"> #01B1D0  </td>
                        </tr>

                        <tr>
                            <td>copyright</td>
                            <td> <textarea name="custom_copyright" id="custom_copyright" cols="25" rows="2"><%= rs.getString("custom_copyright")%></textarea> </td>
                        </tr>

                    </tbody>
                </table>

                <input type="submit" value="update" name="update" id="update">

            </form>

        </center>

    </body>
</html>
<%
            try {
                rs.close();
            } finally {
                rs = null;
            }
%>