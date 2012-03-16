/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.sun.xml.wss.impl.misc.Base64;
import com.websniffer.Encriptador;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author skuarch
 */
public class Authenticate extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String usuario = null;
        String password = null;
        ResultSet r = null;

        try {

            //checando si me envian variables por url
            if (request.getParameter("u") != null && request.getParameter("p") != null) {
                //las variables son por la url
                //desencripto

                String u = request.getParameter("u");
                String p = request.getParameter("p");
                u = new String(Base64.decode(u), "utf-8");
                p = new String(Base64.decode(p), "utf-8");

                usuario = Encriptador.desencripta(u);
                password = Encriptador.desencripta(p);

            } else {
                //el proceso es normal
                usuario = request.getParameter("usuario");
                password = request.getParameter("password");
            }



            String shortContext = new com.websniffer.Context(request.getContextPath()).getShortContext();
            String sql = null;
            int numFilas = 0;

            sql = "SELECT * FROM users WHERE usr_name = ? AND usr_password = ?;";
            r = new com.websniffer.ConnectPool(shortContext).selectLogin(sql, usuario.trim(), password.trim());
            r.next();

            numFilas = new com.websniffer.ConnectPool(shortContext).getNumFilas(r);


            if (numFilas == 0 || numFilas < 1) {

                r.close();                
                out.print("<script languaje='javascript' type='text/javascript'>location.href='index.jsp?error=1'</script>");

            } else {

                //registrando la session                
                HttpSession ses = request.getSession();
                ses.setAttribute("user", usuario);
                out.print("<script languaje='javascript' type='text/javascript'>location.href='start.jsp'</script>");

            }




            try {
                r.close();
                numFilas = 0;
                sql = null;
            } finally {
                r = null;
            }

        } catch (Exception e) {
            out.print("<script languaje='javascript' type='text/javascript'>location.href='index.jsp?e=" + e + "'</script>");
            response.sendRedirect("error.jsp?error=" + e);
        } finally {
            out.close();
            r = null;
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

        //no puede haber peticiones get
        //response.setContentType("text/html;charset=UTF-8");
        //PrintWriter out = response.getWriter();
        //response.sendRedirect("index.jsp");

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
