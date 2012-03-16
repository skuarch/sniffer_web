package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import com.websniffer.Tools;

/**
 *
 * @author skuarch
 */
public class Upload extends HttpServlet {

    static final Logger logger = Logger.getLogger(Upload.class);

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


        try {

            String name = request.getHeader("filename");
            String pathToSave = request.getHeader("pathToSave");
            int tamArray = name.split("/").length;
            String[] nameArray = null;
            String aux = null;
            String context = new com.websniffer.Context(request.getContextPath()).getShortContext();
            java.io.InputStream in = null;
            String fileName = null;
            java.io.BufferedInputStream bufferedInput = null;
            java.io.FileOutputStream fileOutput = null;
            java.io.BufferedOutputStream bufferedOutput = null;
            byte[] array = null;
            int leidos = 0;
            java.io.File f = null;


            //quitando ruta
            if (tamArray > 0) {

                nameArray = new String[tamArray];
                nameArray = name.split("/");
                aux = nameArray[tamArray - 1];

            } else {
                aux = name;
            }

            try {

                in = request.getInputStream();
                fileName = pathToSave + aux;

                bufferedInput = new java.io.BufferedInputStream(in);

                // Se abre el fichero donde se hará la copia
                fileOutput = new java.io.FileOutputStream(fileName);
                bufferedOutput = new java.io.BufferedOutputStream(fileOutput);

                // Bucle para leer de un fichero y escribir en el otro.
                array = new byte[2048];
                leidos = bufferedInput.read(array);

                while (leidos > 0) {
                    bufferedOutput.write(array, 0, leidos);
                    leidos = bufferedInput.read(array);
                }


                //se crea un objeto file para optener informacion del archivo
                f = new java.io.File(fileName);

                // Cierre de los ficheros
                try {

                    bufferedInput.close();
                    bufferedOutput.close();
                    fileOutput.close();

                } finally {

                    bufferedInput = null;
                    bufferedOutput = null;
                    fileOutput = null;

                }

                //validamos que el archivo contenga algo
                if (f.length() == 0) {
                    out.println("ERROR: file is null or empty");
                    logger.error("ERROR: file is null or empty");
                    f = null;
                    //return;
                } else {

                    //print output
                    out.println("SERVER RESPONCE: successfully exchange data, file name: " + f.getAbsolutePath() + " in server " + new Tools().getLocalHostName());

                }


                try {

                    com.websniffer.CheckFile cf = new com.websniffer.CheckFile();

                    if (cf.exists(fileName)) {
                        com.websniffer.StartSniffer ss = new com.websniffer.StartSniffer(f, context);
                        ss.run();
                    } else {
                        out.println("ERROR: Upload().filename\n " + fileName + "cant read or is null");
                        logger.error("ERROR: Upload().filename\n " + fileName + "cant read or is null");
                    }


                } catch (Exception es) {
                    logger.error("ERROR Upload()" + es.getMessage());
                }


                try {
                    in.close();
                } finally {
                    in = null;
                    f = null;
                    bufferedInput = null;
                    bufferedOutput = null;
                    fileOutput = null;
                }


            } catch (Exception e) {
                out.println("ERROR: servlet upload" + e + "\n file name = " + name);
                logger.error("ERROR: servlet upload" + e);
            }

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
