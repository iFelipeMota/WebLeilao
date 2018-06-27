<%-- 
    Document   : usuario
    Created on : 26/06/2018, 00:57:10
    Author     : ivanf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
  if(request.getParameter("formDeleteUser")!=null){
      try{
          long id = Long.parseLong(request.getParameter("id"));
          User.removeUser(id);
          response.sendRedirect(request.getRequestURI());
      }catch(Exception e)
      {
          error = e.getMessage();
          
      }
           
  }  
    
  if(request.getParameter("formNewUser")!=null){
      
     String name = request.getParameter("name"); 
     String role = request.getParameter("role"); 
     String login = request.getParameter("login"); 
     long passwordHash = request.getParameter("pass").hashCode(); 
     try{
         User.addUser(name, role, login, passwordHash);
         response.sendRedirect(request.getRequestURI());
     }catch(Exception e)
     {
         error = e.getMessage();
         
     }
     
  }


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuários - Web Leilão</title>
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/cabecalho.jspf" %>
        <h1>Controle de Usuários</h1>
        
        <%if(session.getAttribute("user")==null){%>
        <h2>É preciso estar autenticado para usar este recurso</h2>
        <%}else{%>
          <%User user = (User) session.getAttribute("user");%>
          <%if(!user.getRole().equals("ADMIN")){%>
          <h2>Voce não tem permissão para usar este recurso</h2>
          <%}else{%>
          <h2>TODO: Tabela de Usuários</h2>
          <%if(error != null){%>
          <h3><%=error%></h3>
          <%}%>
          <fieldset>
              <legend>Novo Usuário</legend>
              <form>
                  Nome: <input type="text" name="name"/>
                  Papel:
                  <select name="role">
                         <option value="ADMIN">ADMIN</option>
                         <option value="USUARIO">USUARIO</option>     
                  </select>
                  Login: <input type="text" name="login"/>
                  Pass: <input type="password" name="pass"/>
                        <input type="submit" name="formNewUser" value="Add"/>
              </form>
          </fieldset>
          <table border="1">
              <tr>
                  <th>ID</th>
                  <th>Papel</th>
                  <th>Nome</th>
                  <th>Login</th>
                  <th>Saldo</th>
                  <th>Comando</th>
              </tr>
              <%for(User u:User.getUsers()){%>
              <Tr>
                  <td><%=u.getId()%></td>
                  <td><%=u.getRole()%></td>
                  <td><%=u.getName()%></td>
                  <td><%=u.getLogin()%></td>
                  <td><%=u.getVl_saldo()%></td>
                  <td>
                      <form>
                          <input type="hidden" name="id" value="<%=u.getId()%>"/>
                          <input type="submit" name="formDeleteUser" value="Remover"/>
                      </form>
                  </td>
              </Tr>
              <%}%>
          </table>              
          <%}%>
        
        <%}%>
    </body>
</html>
