<!doctype html>
<html lang="en">
  <head>
    <tile> Note Taker: Home Page</tile>
    <%@include file="all_js_css.jsp" %>
  </head>
  <body>

        <div class="container my-5">
        <%@include file="navbar.jsp" %>
        <h1>This is home page</h1>
        <br>
            <div class="card">
            <img alt="image" class="img-fluid mx-auto" style="max-width:400px; height:300px" src="img/notes.png">
            <h2 class="text-primary text-uppercase text-center mt-3">Start write notes here</h2>

            <div class="container text-center">
            <button class="btn btn-outline-primary text-center">Start here</>
            </div>
            </div>
        </div>
  </body>
</html>