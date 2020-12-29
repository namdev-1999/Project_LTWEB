package vn.nlu.banana.controller;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@WebServlet("/AddProduct")

public class AddProduct extends HttpServlet {
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
        String filePath = context.getInitParameter("file-upload");

        // Verify the content type
        String contentType = request.getContentType();
        String name = null;
        double price = 0;
        int idType = 0;
        String desc = null;
        ArrayList<String> images = new ArrayList<>();
        ArrayList<SizeDetail> listSD = new ArrayList<>();
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
                            e = "product\\" + fileName.substring(fileName.lastIndexOf("\\"));
                        } else if (fileName.lastIndexOf("\\") < 0 && !fileName.substring(fileName.lastIndexOf("\\") + 1).equals("")) {
                            e = "product\\" + fileName.substring(fileName.lastIndexOf("\\") + 1);
                        }
                        if (fieldName.equals("homeimg0") && e != null) {
                            images.add(e);
                        } else if (fieldName.equals("homeimg1") && e != null) {
                            images.add(e);
                        } else if (fieldName.equals("homeimg2") && e != null) {
                            images.add(e);
                        } else if (fieldName.equals("homeimg3") && e != null) {
                            images.add(e);
                        } else if (fieldName.equals("homeimg4") && e != null) {
                            images.add(e);
                        }
                    } else {
                        String fieldName = fi.getFieldName();
                        String fieldValue = fi.getString();
                        if (fieldName.equals("proName")) {
                            name = fieldValue;
                        } else if (fieldName.equals("price")) {
                            price = Double.parseDouble(fieldValue);
                        } else if (fieldName.equals("idType")) {
                            idType = Integer.parseInt(fieldValue);
                        } else if (fieldName.equals("desc")) {
                            desc = fieldValue;
                        } else if (fieldName.equals("size")) {
                            if (fieldValue != null) {
                                SizeDetail sd = new SizeDetail();
                                sd.setSize(Integer.parseInt(fieldValue));
                                sd.setRemain(20);
                                listSD.add(sd);
                            }
                        }
                    }
                }
                try {
                    ListProduct.addProduct(name, price, idType, desc, images);
                    ListSizeDetail.addListSizeDetail(listSD);
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
        response.sendRedirect("admin/product-manage.jsp?sorter=" + session.getAttribute("sort") + "&page=" + currentPage.getAttribute("currentPage"));
    }
}