package br.com.fatecpg.webleilao;

import java.util.ArrayList;

/**
 *
 * @author ivanf
 */
public class Bem {
    private long id;
    private String descricao;
    private String categoria;
    private String foto;

    public Bem(String descricao, String categoria, String foto) {
        this.descricao = descricao;
        this.categoria = categoria;
        this.foto = foto;
    }
    
    public Bem() {
    }
    
    public ArrayList<Long> salvarBens(ArrayList<Bem> listaBens) throws Exception{
        ArrayList<Long> listIdBens = new ArrayList();
        if(listaBens.size() > 0){
            for(Bem b : listaBens){
                String SQL = "INSERT INTO BEM VALUES (default, ?, null)";
                Object parameters[] = {b.descricao};
                DataBaseConnector.execute(SQL, parameters);
                long idBem = getLastBem();
                listIdBens.add(idBem);
            }
        }
        return listIdBens;
    }
    
    public static Long getLastBem() throws Exception{
        String SQL = "SELECT * FROM BEM ORDER BY ID DESC";
        ArrayList<Object[]> list = DataBaseConnector.getQuery(SQL, new Object[]{});
        if(list.isEmpty()){
            return null;
        }
        else{
            Object row[] = list.get(0);
            long id = (long) row[0];
            return id;
        }
    }
    
    public static ArrayList<Bem> getBensLeilao(long idLeilao) throws Exception{
        String SQL = "SELECT a.* FROM BEM a, LEILAO b, LOTE c WHERE a.ID=c.ID_BEM and c.ID_LEILAO=b.ID and b.ID=?";
        ArrayList<Bem> bens = new ArrayList<>();
        Object parameters[] = {idLeilao};
        ArrayList<Object[]> list = DataBaseConnector.getQuery(SQL, parameters);
        for(int i =0; i <list.size(); i++){
            Object row[] = list.get(i);
            Bem b = new Bem(
                    (String) row[1]
                    , (String)row[2]
                    , null);
            bens.add(b);
        }
        return bens;
    }
    
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
    
    
}
