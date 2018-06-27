package br.com.fatecpg.webleilao;

import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author ivanf
 */
public class Leilao {

    public static ArrayList<Bem> getBens() {
        return bens;
    }
    private long id;
    private long idLeiloeiro;
    private String inicio;
    private String fim;
    private String lote;
    private double vlInicial;
    public static ArrayList<Bem> bens = new ArrayList<>();

    public Leilao(long idLeiloeiro, String inicio, String fim, String lote, double vlInicial) {
        this.idLeiloeiro = idLeiloeiro;
        this.inicio = inicio;
        this.lote = lote;
        this.vlInicial = vlInicial;
    }
    
    public Leilao(long id, long idLeiloeiro, String inicio, String fim, String lote, double vlInicial) {
        this.id = id;
        this.idLeiloeiro = idLeiloeiro;
        this.inicio = inicio;
        this.lote = lote;
        this.vlInicial = vlInicial;
    }
    
    public Leilao() {
    }
    
    public static void criarLeilao(long idLeiloeiro, Date comeco, String fim, String lote, double vlInicial) throws Exception{
        String SQL = null;
        if(comeco == null){
        SQL = "INSERT INTO LEILAO VALUES (default, ?, null, ?, ?, ?)";
        Object parameters[] = {idLeiloeiro, fim, lote, vlInicial};
        DataBaseConnector.execute(SQL, parameters);
        }else{
        SQL = "INSERT INTO LEILAO VALUES (default, ?, ?, ?, ?, ?)";   
        Object parameters[] = {idLeiloeiro, comeco, fim, lote, vlInicial}; 
        DataBaseConnector.execute(SQL, parameters);        
        }
        
        Bem bem = new Bem();
        ArrayList<Long> idBens = bem.salvarBens(bens);
        long idLastLeilao = getLastLeilao(idLeiloeiro);
        for(Long id : idBens){
            Lote.addLote(idLastLeilao, id);
        }
        
        bens.clear();
    }
    
    public static void deleteLeilao(long idLeilao) throws Exception{
        String SQL = "Delete from leilao where id = ?";
        Object parameters[] = {idLeilao};
        DataBaseConnector.execute(SQL, parameters);
    }
    
    public void addBem(String desc, String cat, String pic){
        Bem novoBem = new Bem(desc, cat, pic);
        bens.add(novoBem);
    }
    
    public static long getLastLeilao(long idUsuario) throws Exception{
        String SQL = "SELECT id FROM LEILAO WHERE id_leiloeiro = ? ORDER BY ID DESC";
        Object parameters[] = {idUsuario};
        ArrayList<Object[]> list = DataBaseConnector.getQuery(SQL, parameters);
        if(list.isEmpty()){
            return 0;
        }
        else{
            Object row[] = list.get(0);
            long id = (long) row[0];
            return id;
        }
    }
    
    public static ArrayList<Leilao> getLeiloesDoUser(long idUsuario) throws Exception{
        String SQL = "SELECT * FROM LEILAO WHERE id_leiloeiro = ?";
        Object parameters[] = {idUsuario};
        ArrayList<Leilao> leiloes = new ArrayList<>();
        ArrayList<Object[]> list = DataBaseConnector.getQuery(SQL, parameters);
        for(int i =0; i <list.size(); i++){
            Object row[] = list.get(i);
            Leilao l = new Leilao(
                    (long)row[0]
                    , (long)row[1]
                    , null
                    , (String)row[3]
                    , (String)row[4]
                    , (Double)row[5]);
            leiloes.add(l);
        }
        return leiloes;
    }
    
    public static Leilao getLeilaoPorId(long id) throws Exception{
        String SQL = "SELECT * FROM LEILAO WHERE id = ?";
        Object parameters[] = {id};
        ArrayList<Object[]> list = DataBaseConnector.getQuery(SQL, parameters);
        if(list.isEmpty()){
            return null;
        }
        else{
            Object row[] = list.get(0);
            Leilao l = new Leilao(
                    (long)row[0]
                    , (long)row[1]
                    , null
                    , (String)row[3]
                    , (String)row[4]
                    , (Double)row[5]);
            return l;
        }
    }
    
    public static ArrayList<Leilao> getLeiloes() throws Exception{
        String SQL = "select * from Leilao where fim > CURRENT_DATE and inicio is not null";
        ArrayList<Leilao> leiloes = new ArrayList<>();
        ArrayList<Object[]> list = DataBaseConnector.getQuery(SQL, new Object[]{});
        for(int i =0; i <list.size(); i++){
            Object row[] = list.get(i);
            //long idLeiloeiro, String inicio, String fim, String lote, double vlInicial
            Leilao l = new Leilao(
                    (long)row[0]
                    , (long)row[1]
                    , null
                    , (String)row[3]
                    , (String)row[4]
                    , (Double)row[5]);
            leiloes.add(l);
        }
        return leiloes;
    }
    
    public static ArrayList<Leilao> getLeiloesGanhos(long idUsuario) throws Exception{
        String SQL = "select a.* from Leilao a, Lance b where a.FIM < CURRENT_DATE and b.ID_LEILAO = a.ID and b.ID_ARREMATADOR = ?";
        Object parameters[] = {idUsuario};
        ArrayList<Leilao> leiloes = new ArrayList<>();
        ArrayList<Object[]> list = DataBaseConnector.getQuery(SQL, parameters);
        for(int i =0; i <list.size(); i++){
            Object row[] = list.get(i);
            Leilao l = new Leilao(
                    (long)row[0]
                    , (long)row[1]
                    , null
                    , (String)row[3]
                    , (String)row[4]
                    , (Double)row[5]);
            leiloes.add(l);
        }
        return leiloes;
    }
    
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getIdLeiloeiro() {
        return idLeiloeiro;
    }

    public void setIdLeiloeiro(long idLeiloeiro) {
        this.idLeiloeiro = idLeiloeiro;
    }

    public String getInicio() {
        return inicio;
    }

    public void setInicio(String inicio) {
        this.inicio = inicio;
    }

    public String getFim() {
        return fim;
    }

    public void setFim(String fim) {
        this.fim = fim;
    }

    public String getLote() {
        return lote;
    }

    public void setLote(String lote) {
        this.lote = lote;
    }

    public double getVlInicial() {
        return vlInicial;
    }

    public void setVlInicial(double vlInicial) {
        this.vlInicial = vlInicial;
    }
    
    
}
