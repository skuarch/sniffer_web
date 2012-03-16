package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

/**
 *
 * @author skuarch
 */
public class getListIps extends HttpServlet {

    static final Logger logger = Logger.getLogger(getListIps.class);

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String ip_remoto = null;
        String shortContext = new com.websniffer.Context(request.getContextPath()).getShortContext();
        int len = 0;

        try {

            //out.println("ip="+request.getParameter("ip"));
            //ip_remoto = "192.168.208.56";
            //ip_remoto = request.getRemoteAddr();
            ip_remoto = request.getParameter("ip");

            if (ip_remoto.isEmpty() || ip_remoto == null) {
                logger.error("getListIps().ip_remoto is null or empty");
                return;
            }

            ResultSet rs = new com.websniffer.ConnectCollector(shortContext).select("SELECT config_tracert_ips FROM configuracion;", ip_remoto);

            len = new com.websniffer.ConnectPool(shortContext).getNumFilas(rs);

            if (len > 0) {

                while (rs.next()) {

                    out.print(rs.getString("config_tracert_ips"));

                }

            }


            try {
                rs.close();
            } finally {
                rs = null;
                len = 0;
                ip_remoto = null;
            }

        } catch (Exception e) {
            logger.debug("ERROR: processRequest()\n", e);
        } finally {
            out.close();
        }

    } //end processRequest

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
