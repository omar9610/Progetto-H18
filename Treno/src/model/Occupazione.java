package model;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * classe che permette di istanziare una riservazione di un posto
 *
 * @author laurence
 */
class Occupazione {
    
    private String stazionepartenza;
    private String stazionearrivo;

    /**
     * costruttore
     * @param stazionepartenza
     * @param stazionearrivo
     */
    public Occupazione(String stazionepartenza, String stazionearrivo) {
        this.stazionepartenza = stazionepartenza;
        this.stazionearrivo = stazionearrivo;
    }

    public String getStazionepartenza() {
        return stazionepartenza;
    }

    public String getStazionearrivo() {
        return stazionearrivo;
    }
    
    
    
}
