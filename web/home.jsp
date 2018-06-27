<%-- 
    Document   : home
    Created on : 26/06/2018, 00:48:18
    Author     : ivanf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Web Leilão - Home</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
        <h1>Bem Vindo Ao Leilão Web</h1>
        [<a href="<%=path%>/usuario/leiloar.jsp"> Leiloar </a>]
        [<a href="<%=path%>/usuario/arrematar.jsp"> Dar Lance </a>]
        [<a href="<%=path%>/usuario/central-ctrl.jsp"> Painel de Controle </a>]
    </body>
</html>
