<!DOCTYPE html>
<html>
<head>
<title> Add Notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
    <div class="container">
        <%@include file="navbar.jsp"%>
        <br>
        <h3>please fill your note detail</h3>
        <br>

        <!--this is add form -->
        <form action="SaveNoteServlet" method="post">
          <div class="form-group">
            <label for="title">Note Title</label>
            <input type="text" name="title" class="form-control" required
             id="title" aria-describedby="emailHelp" placeholder="Enter here"/>
          </div>
          <div class="form-group">
            <label for="content">Note Content</label>
            <textarea
            id="content" name="content"
             placeholder="enter your content"
             class="form-control"
             style="height:250px">
             </textarea>
          </div>
         <div class="container text-center">
          <button type="submit" class="btn btn-primary">Add</button>
         </div>
        </form>
    </div>
</body>
</html>



