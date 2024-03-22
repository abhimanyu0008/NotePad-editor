package com.servlet;

import com.entities.Note;
import com.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            String title=req.getParameter("title");
            String content=req.getParameter("content");
            int noteId=Integer.parseInt(req.getParameter("noteId").trim());
            Session s= FactoryProvider.getFactory().openSession();
            Transaction tx=s.beginTransaction();

            Note notes=s.get(Note.class,noteId);
            notes.setContent(content);
            notes.setAddedDate(new Date());

            tx.commit();
            s.close();
            resp.sendRedirect("all_notes.jsp");
        }catch (Exception e){
            System.out.println(e);
        }
    }
}
