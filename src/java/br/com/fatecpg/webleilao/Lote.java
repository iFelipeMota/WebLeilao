package br.com.fatecpg.webleilao;

/**
 *
 * @author ivanf
 */
public class Lote {
    private long id;
    private long idLeilao;
    private long idBem;

    public static void addLote(long idLeilao, long idBem) throws Exception{
        String SQL = "INSERT INTO LOTE VALUES (default, ?, ?)";
        Object parameters[] = {idLeilao, idBem};
        DataBaseConnector.execute(SQL, parameters);
    }
    
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getIdLeilao() {
        return idLeilao;
    }

    public void setIdLeilao(long idLeilao) {
        this.idLeilao = idLeilao;
    }

    public long getIdBem() {
        return idBem;
    }

    public void setIdBem(long idBem) {
        this.idBem = idBem;
    }
    
}
