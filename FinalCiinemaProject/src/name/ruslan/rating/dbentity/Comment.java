package name.ruslan.rating.dbentity;

import java.util.Calendar;

public class Comment extends Entity{
	
	private int commentId; 
	
	private int filmId; 
	
	private String login; 
	
	private Calendar creationTime; 
	
	private Calendar lastUpdate; 
	
	private String title; 
	
	private String text; 
	
	private int numLike; 
	
	private int numDislike;

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public int getFilmId() {
		return filmId;
	}

	public void setFilmId(int filmId) {
		this.filmId = filmId;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public Calendar getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(Calendar creationTime) {
		this.creationTime = creationTime;
	}

	public Calendar getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(Calendar lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getNumLike() {
		return numLike;
	}

	public void setNumLike(int numLike) {
		this.numLike = numLike;
	}

	public int getNumDislike() {
		return numDislike;
	}

	public void setNumDislike(int numDislike) {
		this.numDislike = numDislike;
	}	
}
