package br.com.fatecpg.webleilao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author ivanf
 */
public class Lance {
    long id;
    long idLeilao;
    long idArrematador;
    Date timestamp;
    double lance;

    public Lance(long id, long idLeilao, long idArrematador, Date timestamp, double lance) {
        this.id = id;
        this.idLeilao = idLeilao;
        this.idArrematador = idArrematador;
        this.timestamp = timestamp;
        this.lance = lance;
    }

    public static void darLance(long idLeilao, long idUser, double lance) throws Exception{
        String SQL = "INSERT INTO LANCE VALUES (default, ?, ?, ?, ?)";
        Object parameters[] = {idLeilao, idUser, new Timestamp(new Date().getTime()), lance};
        DataBaseConnector.execute(SQL, parameters);
    }
    
    public static Lance getMaiorLance(long idLeilao) throws Exception{
        String SQL = "select * from LANCE where lance = (select max(lance) from LANCE where id_leilao = ?)";
        Object parameters[] = {idLeilao};
        ArrayList<Object[]> list = DataBaseConnector.getQuery(SQL, parameters);
        if(!list.isEmpty()){
            Object row[] = list.get(0);
            Lance l = new Lance(
                  (long)row[0]
                , (long)row[1]
                , (long)row[2]
                , null
                , (Double)row[4]);
            return l;
        }else{
            return null;
        }
    }
    
    public static ArrayList<Lance> getLancesUser(long idUser) throws Exception{
        String SQL = "select a.* from LANCE a, LEILAO b where b.FIM > CURRENT_DATE and a.ID_ARREMATADOR = ? and a.ID_LEILAO=b.ID and a.LANCE = (select max(lance) from LANCE a, LEILAO b where a.ID_LEILAO = b.ID)";
        ArrayList<Lance> lances = new ArrayList<>();
        Object parameters[] = {idUser};
        ArrayList<Object[]> list = DataBaseConnector.getQuery(SQL, parameters);
        for(int i =0; i <list.size(); i++){
            Object row[] = list.get(i);
            Lance l = new Lance(
                  (long)row[0]
                , (long)row[1]
                , (long)row[2]
                , null
                , (Double)row[4]);
            lances.add(l);
        }
        return lances;
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

    public long getIdArrematador() {
        return idArrematador;
    }

    public void setIdArrematador(long idArrematador) {
        this.idArrematador = idArrematador;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    public double getLance() {
        return lance;
    }

    public void setLance(double lance) {
        this.lance = lance;
    }
    
    
}
