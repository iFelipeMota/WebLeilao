<%-- 
    Document   : central-ctrl
    Created on : 26/06/2018, 01:02:14
    Author     : ivanf
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="br.com.fatecpg.webleilao.Bem"%>
<%@page import="br.com.fatecpg.webleilao.Lance"%>
<%@page import="br.com.fatecpg.webleilao.Leilao"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  Long idUser = (long)10;
  if(request.getParameter("formDeleteLeilao")!=null){
        long idLeilao = Long.parseLong(request.getParameter("id"));
        Leilao.deleteLeilao(idLeilao);
        response.sendRedirect(request.getRequestURI());
   }  
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Painel de Controle</title>
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/cabecalho.jspf" %>
        <h1>Painel de Controle!</h1>
        
        <h3>Leilões Ganhos</h3>
        <%
            ArrayList<Leilao> listGanhos = new ArrayList<Leilao>();
            listGanhos = Leilao.getLeiloesGanhos(idUser);
            for (Leilao l : listGanhos){
                Double maiorLance = null;
                Lance lanceAtual= Lance.getMaiorLance(l.getId());
                if(lanceAtual==null){
                    maiorLance = 0.0;
                }else{
                    maiorLance = lanceAtual.getLance();
                }
        %>
        <fieldset>
        <legend>Lote: <%= l.getLote() %></legend> 
            Lance Mínimo: R$<%= l.getVlInicial() %>
            Lance Atual: R$<%= maiorLance%>
            <br/>
            <table border="1">
                <tr>
                    <th>Ind</th>
                    <th>Descrição</th>
                </tr>
                <%
                    ArrayList<Bem> listBens = new ArrayList<Bem>();
                    listBens = Bem.getBensLeilao(l.getId());
                    for(int i = 0; i < listBens.size(); i++){
                %>
                <tr>
                    <td><%=  i+1 %></td>
                    <td><%=  listBens.get(i).getDescricao() %></td>
                </tr>
                <%}%>
            </table>
        </fieldset>
        <%}%>
        
        <h3>Meus Leilões</h3>
        <%
            ArrayList<Leilao> listLeiloes = new ArrayList<Leilao>();
            listLeiloes = Leilao.getLeiloesDoUser(idUser);
            for (Leilao l : listLeiloes){
                Double maiorLance = null;
                Lance lanceAtual= Lance.getMaiorLance(l.getId());
                if(lanceAtual==null){
                    maiorLance = 0.0;
                }else{
                    maiorLance = lanceAtual.getLance();
                }
        %>
        <fieldset>
        <legend>Lote: <%= l.getLote() %></legend> 
            Lance Mínimo: R$<%= l.getVlInicial() %>
            Lance Atual: R$<%= maiorLance%>
            Fim: <%= l.getFim() %>
            <br/>
            <form>
                <input type="hidden" name="id" value="<%=l.getId()%>"/>
                <input type="submit" name="formDeleteLeilao" value="Excluir"/>
            </form>
            <table border="1">
                <tr>
                    <th>Ind</th>
                    <th>Descrição</th>
                </tr>
                <%
                    ArrayList<Bem> listBens = new ArrayList<Bem>();
                    listBens = Bem.getBensLeilao(l.getId());
                    for(int i = 0; i < listBens.size(); i++){
                %>
                <tr>
                    <td><%=  i+1 %></td>
                    <td><%=  listBens.get(i).getDescricao() %></td>
                </tr>
                <%}%>
            </table>
        </fieldset>
        <%}%>
        
        <h3>Meus Lances</h3>
        <%
            ArrayList<Lance> listLances = new ArrayList<Lance>();
            listLances = Lance.getLancesUser(idUser);
            for (Lance l : listLances){
                Leilao leilao = Leilao.getLeilaoPorId(l.getIdLeilao());
                Double maiorLance = null;
                Lance lanceAtual= Lance.getMaiorLance(l.getIdLeilao());
                if(lanceAtual==null){
                    maiorLance = 0.0;
                }else{
                    maiorLance = lanceAtual.getLance();
                }
        %>
        <fieldset>
        <legend>Lote: <%= leilao.getLote() %></legend> 
            Lance Mínimo: R$<%= leilao.getVlInicial() %>
            Seu Lance: R$<%= l.getLance() %>
            Maior Lance: R$<%=  maiorLance%>
            <br/>
            <h4>Lances não podem ser retirados</h4>
            <table border="1">
                <tr>
                    <th>Ind</th>
                    <th>Descrição</th>
                </tr>
                <%
                    ArrayList<Bem> listBens = new ArrayList<Bem>();
                    listBens = Bem.getBensLeilao(leilao.getId());
                    for(int i = 0; i < listBens.size(); i++){
                %>
                <tr>
                    <td><%=  i+1 %></td>
                    <td><%=  listBens.get(i).getDescricao() %></td>
                </tr>
                <%}%>
            </table>
        </fieldset>
        <%}%>
    </body>
</html>
