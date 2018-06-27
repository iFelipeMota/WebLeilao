<%-- 
    Document   : arrematar
    Created on : 26/06/2018, 01:04:45
    Author     : ivanf
--%>

<%@page import="br.com.fatecpg.webleilao.Lance"%>
<%@page import="br.com.fatecpg.webleilao.Bem"%>
<%@page import="br.com.fatecpg.webleilao.Leilao"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  if(request.getParameter("formDarLance")!=null){
        double lance = Double.parseDouble(request.getParameter("lance"));
        long idLeilao = Long.parseLong(request.getParameter("id"));
        Long idUser = (long)10;
        Lance.darLance(idLeilao, idUser, lance);
        response.sendRedirect(request.getRequestURI());
   }  
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dar Lance</title>
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/cabecalho.jspf" %>
        <h1>Arrematar</h1>
        <%
            ArrayList<Leilao> listLeiloes = new ArrayList<Leilao>();
            listLeiloes = Leilao.getLeiloes();
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
            <br/>
            <form>
                <input type="hidden" name="id" value="<%=l.getId()%>"/>
                R$<input type="text" name="lance"/>
                <input type="submit" name="formDarLance" value="Dar Lance"/>
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
    </body>
</html>
