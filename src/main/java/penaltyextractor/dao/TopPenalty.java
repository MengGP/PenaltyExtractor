package penaltyextractor.dao;

// Класс для предствления ТОП-списка нарушений
public class TopPenalty {

    private int count;
    private String clause;

    public TopPenalty(int count, String clause) {
        this.count = count;
        this.clause = clause;
    } // end_constructor

    // setters and getters
    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getClause() {
        return clause;
    }

    public void setClause(String clause) {
        this.clause = clause;
    }
    // end_setters_and_getters

} // end_class
