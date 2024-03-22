<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*" %>

<html>
<head>
<title>show notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
    <div class="container">
    <%@include file="navbar.jsp"%>
    <h2 class="text-uppercase">ALl notes:-</h2>

    <div class="row">
        <div class="col-12">
        <%
            Session s=FactoryProvider.getFactory().openSession();
            Query q=s.createQuery("from Note");
            List<Note>list=q.list();
            for(Note note:list){
        %>

        <div class="card" style="width: 18rem mt-5;">
          <img class="card-img-top pl-4 pt-4 mx-auto" src="img/notes.png" style="max-width:100px;" alt="Card image cap">
          <div class="card-body px-5">
            <h5 class="card-title"><%=note.getTitle()%></h5>
            <p class="card-text"><%=note.getContent()%>
            </p>
            <p class="text-primary"><b><%=note.getAddedDate() %></b></p>
            <div class="container text-center">
                <a href="DeleteServlet?note_id=<%=note.getId()%>" class="btn btn-danger">Delete</a>
                  <a href="edit.jsp?note_id=<%=note.getId()%>" class="btn btn-primary">update</a>
            </div>
          </div>
        </div>
        <%
                out.println(note.getId()+": "+note.getTitle()+"<br>");
            }
            s.close();
            %>
        </div>
    </div>


    </div>
</body>
</html>