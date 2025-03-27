package bean;

import java.io.Serializable;

public class Question implements Serializable {
    private String id;
    private String question;
    private String time;

    // Constructors
    public Question() {
    }

    public Question(String id, String question, String time) {
        this.id = id;
        this.question = question;
        this.time = time;
    }

    // Getters and Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
