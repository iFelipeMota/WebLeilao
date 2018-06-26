<%-- 
    Document   : arrematar
    Created on : 26/06/2018, 01:04:45
    Author     : ivanf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Web Leilão | Arremates</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="css/clean-blog.min.css" rel="stylesheet">

  </head>
    <body>
      <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand" href="home.jsp">Web Leilão</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="home.jsp">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="usuario/arrematar.jsp">Arrematar</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="usuario/central-ctrl.jsp">Controle</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="usuario/comprar-saldo.jsp">Saldo</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="usuario/leiloar.jsp">Leiloar</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
      <header class="masthead" style="background-image: url('img/home-bg.jpg')">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="site-heading">
              <%@include file="WEB-INF/jspf/login.jspf" %>
            </div>
          </div>
        </div>
      </div>
      </header>
      <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="post-preview">
            <center>
            <h2 class="post-title">
                Arrematar
            </h2>
            <h3 class="post-subtitle">
                Controle seus arremates:
            </h3>
            </center>
          </div>
          <hr>
        </div>
      </div>
    </div>    
          
    </body>
</html>

