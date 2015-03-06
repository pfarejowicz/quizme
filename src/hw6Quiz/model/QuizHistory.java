package hw6Quiz.model;

public class QuizHistory {
	
	private int quizHistoryId;
	private int quizId;
	private int userId;
	private int score;
	private int rating;
	private String review;

	public QuizHistory(int quizHistoryId, int quizId, int userId, int score, int rating, String review) {
		this.quizHistoryId = quizHistoryId;
		this.quizId = quizId;
		this.userId = userId;
		this.score = score;
		this.rating = rating;
		this.review = review;
	}
	
	public int getQuizHistoryId(){
		return quizHistoryId;
	}
	
	public int getQuizId(){
		return quizId;
	}
	
	public int userId(){
		return userId;
	}
	
	public int getScore(){
		return score;
	}
	
	public int getRating(){
		return rating;
	}
	
	public String getReview(){
		return review;
	}

}
