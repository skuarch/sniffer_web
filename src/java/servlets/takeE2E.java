package servlets;

import com.websniffer.SaveDataE2E;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

/**
 *
 * @author root
 */
public class takeE2E extends HttpServlet {

    static final Logger logger = Logger.getLogger(takeE2E.class);

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
        String type;
        String decodedString;
        BufferedReader in = null;
        String result = null;
        String shortContext = new com.websniffer.Context(request.getContextPath()).getShortContext();
        String ip_remoto = null;

        try {

            result = request.getHeader("ip") + " ";
            ip_remoto = request.getHeader("ip");


            //checar el error cuando se conecta
            type = request.getHeader("type");
            if (type == null) {
                return;
            }
            in = new BufferedReader(new InputStreamReader(request.getInputStream(), "UTF-8"));

            while ((decodedString = in.readLine()) != null) {
                result += decodedString;
            }

            SaveDataE2E sde2e = new SaveDataE2E(result, shortContext, ip_remoto);
            sde2e.run();

            try {
                in.close();
            } finally {
                in = null;
            }

            out.println("ok");

        } catch (Exception e) {
            out.println("error");
            logger.error("ERROR: takeE2E()\n" + e);
        } finally {
            out.close();
        }
    }

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
