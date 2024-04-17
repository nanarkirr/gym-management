
package org.example.gymmanagement.model;
public class Batch {
    int bid;
    String bName;

    public Batch() {
    }

    public Batch(int bid, String bName) {
        this.bid = bid;
        this.bName = bName;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public String getbName() {
        return bName;
    }

    public void setbName(String bName) {
        this.bName = bName;
    }
    
}
