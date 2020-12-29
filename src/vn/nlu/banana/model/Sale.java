package vn.nlu.banana.model;


public class Sale {
    private String code;
    private Date fromDate;
    private Date toDate;
    private int value;
    private int active;

    public Sale(String code, Date fromDate, Date toDate, int value, int active) {
        this.code = code;
        this.fromDate = fromDate;
        this.toDate = toDate;
        this.value = value;
        this.active = active;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getFromDate() {
        return fromDate;
    }

    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }

    public Date getToDate() {
        return toDate;
    }

    public void setToDate(Date toDate) {
        this.toDate = toDate;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }
}
