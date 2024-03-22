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
import java.io.PrintWriter;
import java.util.Date;

@WebServlet("/SaveNoteServlet")
public class SaveNoteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            String title=req.getParameter("title");
            String content=req.getParameter("content");
            PrintWriter out=resp.getWriter();
           Note note=new Note(title,content,new Date());
//            System.out.println(note.getId()+" "+note.getTitle());

            //hibernate save
            Session s= FactoryProvider.getFactory().openSession();
            Transaction tx=s.beginTransaction();  //permanent data save in database

            s.save(note);
            tx.commit();
            s.close();
            resp.setContentType("text/html");
            out.println("<h1 style='text-align:center;'>Note is add successfully</h1>");
            out.println("<h1 style='text-align:center'><a href='all_notes.jsp'> View all notes</a></h1>");

        }catch (Exception e){
            System.out.println(e);
        }
    }
}
