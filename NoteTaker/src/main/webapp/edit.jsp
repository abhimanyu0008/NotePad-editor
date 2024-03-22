<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*" %>

<html>
<head>
<title>edit page</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
    <div class="container">
        <%@include file="navbar.jsp" %>
        <h1>This is edit page</h1>

        <%
        int noteId=Integer.parseInt(request.getParameter("note_id").trim());
        Session s = FactoryProvider.getFactory().openSession();
        Note note= (Note)s.get(Note.class,noteId);
        %>

        <form action="UpdateServlet" method="post">
        <input value="<%=note.getId()%>" name="noteId" type="hidden"/>
                  <div class="form-group">
                    <label for="title">Edit your note</label> <br>
                    <input type="text" name="title" class="form-control" required
                     id="title" aria-describedby="emailHelp" placeholder="Enter here"
                      value="<%=note.getTitle()%>"/>
                  </div>
                  <div class="form-group">
                    <label for="content">Edit your content</label>
                    <textarea
                    id="content" name="content"
                     placeholder="enter your content"
                     class="form-control"
                     style="height:250px">
                     <%=note.getContent()%>
                     </textarea>
                  </div>
                 <div class="container text-center">
                  <button type="submit" class="btn btn-success">Update and save</button>
                 </div>
                </form>

    </div>
</body>
</html>
