package br.com.fatecpg.webleilao;

import java.util.Date;

/**
 *
 * @author ivanf
 */
public class Leilao {
    private long id;
    private long idLeiloeiro;
    private Date inicio;
    private Date fim;
    private String lote;
    private double vlInicial;

    public Leilao(long idLeiloeiro, Date inicio, Date fim, String lote, double vlInicial) {
        this.idLeiloeiro = idLeiloeiro;
        this.inicio = inicio;
        this.lote = lote;
        this.vlInicial = vlInicial;
    }
    
    public static void criarLeilao(long idLeiloeiro, Date fim, String lote, double vlInicial) throws Exception{
        String SQL = "INSERT INTO LEILAO VALUES (default, ?, null, ?, ?, ?)";
        Object parameters[] = {idLeiloeiro, fim, lote, vlInicial};
        DataBaseConnector.execute(SQL, parameters);
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

    public Date getInicio() {
        return inicio;
    }

    public void setInicio(Date inicio) {
        this.inicio = inicio;
    }

    public Date getFim() {
        return fim;
    }

    public void setFim(Date fim) {
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
