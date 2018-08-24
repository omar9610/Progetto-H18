package model;

/**
 * classe che permette di istanziare una nuova tratta  che potr� esser aggiunta ad un percorso
 * @author laurence
 *
 */

public class Tratta {
    
    private String Stazione1;
    private String Stazione2;
    private int durata;
    private double lunghezza;

    /**
     * costruttore
     * @param Stazione1
     * @param Stazione2
     * @param durata
     * @param lunghezza
     */
    public Tratta(String Stazione1, String Stazione2, int durata,double lunghezza) {
        this.Stazione1 = Stazione1;
        this.Stazione2 = Stazione2;
        this.durata = durata;
        this.lunghezza=lunghezza;
    }

    public String getStazione1() {
        return Stazione1;
    }

    public double getLunghezza() {
        return lunghezza;
    }

    
    public String getStazione2() {
        return Stazione2;
    }

    public int getDurata() {
        return durata;
    }

    @Override
    public String toString() {
        return Stazione1+"--"+Stazione2+" : "+durata;
    }
    
    
}
