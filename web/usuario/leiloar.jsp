<%-- 
    Document   : criar-leilao
    Created on : 26/06/2018, 01:04:06
    Author     : ivanf
--%>

<%@page import="java.sql.Timestamp"%>
<%@page import="br.com.fatecpg.webleilao.Usuario"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.webleilao.Bem"%>
<%@page import="br.com.fatecpg.webleilao.Leilao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    User usuario = (User) session.getAttribute("user");
    
    String error = null; 
    Leilao l = new Leilao();
    if(request.getParameter("formDeleteBem")!=null){
        Leilao.bens.remove(Integer.parseInt(request.getParameter("i")));
        response.sendRedirect(request.getRequestURI());
    }
    
    if(request.getParameter("formSalvarLeilao")!=null){
       double vlInicial = Double.parseDouble(request.getParameter("vlInicial"));
       Long idLeiloeiro = usuario.getId() ;
       String fim = request.getParameter("fim");
       String lote = String.valueOf(idLeiloeiro.hashCode())+ String.valueOf(new Timestamp(new Date().getTime()).hashCode());
       try{
           Leilao.criarLeilao(idLeiloeiro, null /*new Timestamp(new Date().getTime())*/, fim, lote, vlInicial);
           response.sendRedirect(request.getRequestURI());
       }catch(Exception e){ 
           error = e.getMessage();
       }
    }
    
    if(request.getParameter("formIniciarLeilao")!=null){
       double vlInicial = Double.parseDouble(request.getParameter("vlInicial"));
       Long idLeiloeiro = usuario.getId();//alterar para user.getId
       String fim = request.getParameter("fim");
       String lote = String.valueOf(idLeiloeiro.hashCode())+ String.valueOf(new Timestamp(new Date().getTime()).hashCode());
       try{
           Leilao.criarLeilao(idLeiloeiro, new Timestamp(new Date().getTime()), fim, lote, vlInicial);
           response.sendRedirect(request.getRequestURI());
       }catch(Exception e){ 
           error = e.getMessage();
       }
    } 
            
    if(request.getParameter("formNewBem")!=null){
        
           String desc = request.getParameter("descricao");
           Bem bem = new Bem(desc, null, null);
           Leilao.bens.add(bem);
           response.sendRedirect(request.getRequestURI());
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Leiloar</title>
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/cabecalho.jspf" %>
        <h1>Leiloe Aqui</h1>
        <form>
            Lance Mínimo: <input type="text" name="vlInicial"/>
            Fim: <input type="date" name="fim"/>
            <input type="submit" name="formIniciarLeilao" value="Iniciar"/>
            <!--<input type="submit" name="formSalvarLeilao" value="Salvar"/> !-->
            <br/>
        </form>
            <fieldset>
                <legend>Bens</legend>
                <form>
                    Descrição: <input type="text" name="descricao"/>
                    <input type="submit" name="formNewBem" value="Add"/>            
                </form>
                
                <table border="1">
                <tr>
                    <th>Ind</th>
                    <th>Descrição</th>
                </tr>
                <%for(int i = 0; i < Leilao.bens.size(); i++){%>
                <tr>
                    <td><%=  i+1 %></td>
                    <td><%=  Leilao.bens.get(i).getDescricao() %></td>
                    <td>
                        <form>
                            <input type="hidden" name="i" value="<%=i%>"/>
                            <input type="submit" name="formDeleteBem" value="Remover"/>
                        </form>
                    </td>
                </tr>
                <%}%>
            </table>
            </fieldset>
    </body>
</html>
