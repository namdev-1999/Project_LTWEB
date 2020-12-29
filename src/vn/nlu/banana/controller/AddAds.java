package vn.nlu.banana.controller;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import vn.nlu.banana.Util.DBConnection;
import vn.nlu.banana.model.Ads;
import vn.nlu.banana.model.ListProduct;
import vn.nlu.banana.model.ListSizeDetail;
import vn.nlu.banana.model.SizeDetail;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@WebServlet("/AddAds")

public class AddAds extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        //        Upload file

        File file;
        int maxFileSize = 1024 * 1024 * 50;
        int maxMemSize = 1024 * 1024 * 50;

        ServletContext context = getServletContext();
        String filePath ="D:\\Project Web\\ltw\\web\\imgs\\quang-cao\\";

        // Verify the content type
        String contentType = request.getContentType();
        String name = null;
        String images = null;
        String dateStart = null;
        String dateEnd = null;
        double saleUp = 0;
        int active = 0;
        if ((contentType.contains("multipart/form-data"))) {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            // maximum size that will be stored in memory
            factory.setSizeThreshold(maxMemSize);

            // Location to save data that is larger than maxMemSize.
            factory.setRepository(new File("F:\\temp"));

            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);

            // maximum file size to be uploaded.
            upload.setSizeMax(maxFileSize);

            try {
                // Parse the request to get file items.
                List fileItems = upload.parseRequest(request);

                // Process the uploaded file items
                Iterator i = fileItems.iterator();
                Iterator k = fileItems.iterator();

                //Add into database
                while (k.hasNext()) {
                    FileItem fi = (FileItem) k.next();
                    if (!fi.isFormField()) {
                        String e = null;
                        String fieldName = fi.getFieldName();
                        String fileName = fi.getName();
                        if (fileName.lastIndexOf("\\") >= 0 && !fileName.substring(fileName.lastIndexOf("\\")).equals("")) {
                            e = "imgs/quang-cao/" + fileName.substring(fileName.lastIndexOf("\\"));
                        } else if (fileName.lastIndexOf("\\") < 0 && !fileName.substring(fileName.lastIndexOf("\\") + 1).equals("")) {
                            e = "imgs/quang-cao/" + fileName.substring(fileName.lastIndexOf("\\") + 1);
                        }
                        if (fieldName.equals("ad") && e != null) {
                            images = e;
                        }
                    } else {
                        String fieldName = fi.getFieldName();
                        String fieldValue = fi.getString();
                        if (fieldName.equals("Sale-Name")) {
                            name = fieldValue;
                        } else if (fieldName.equals("from-date")) {
                            dateStart = fieldValue;
                        } else if (fieldName.equals("to-date")) {
                            dateEnd = fieldValue;
                        } else if (fieldName.equals("Sale-Up")) {
                            saleUp = Double.parseDouble(fieldValue);
                        } else if (fieldName.equals("active")) {
                            active = Integer.parseInt(fieldValue);
                            if (active != 1) {
                                active = 0;
                            }
                        }
                    }
                }
                try {
                    Ads.addAds(name, images, dateStart, dateEnd, saleUp, active);
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                }

                //Add file into dir
                while (i.hasNext()) {
                    FileItem fi = (FileItem) i.next();
                    if (!fi.isFormField()) {
                        // Get the uploaded file parameters
                        String fieldName = fi.getFieldName();
                        String fileName = fi.getName();

                        boolean isInMemory = fi.isInMemory();
                        long sizeInBytes = fi.getSize();

                        // Write the file
                        if (fileName.lastIndexOf("\\") >= 0) {
                            file = new File(filePath +
                                    fileName.substring(fileName.lastIndexOf("\\")));

                        } else {
                            file = new File(filePath +
                                    fileName.substring(fileName.lastIndexOf("\\") + 1));
                        }
                        fi.write(file);
                    }
                }
            } catch (Exception ex) {
                System.out.println(ex);
//                ex.printStackTrace();
            }
        }
        HttpSession session = request.getSession();
        HttpSession currentPage = request.getSession();
        response.sendRedirect("admin/sale-manage.jsp");

    }
}
