package name.ruslan.rating.dbentity;

import java.sql.Timestamp;

public class Movie extends Entity {

    /**
     * Id of the film (primary key)
     */
    private int filmId;

    /**
     * Film rating (from 0 to 10)
     */
    private double rating;

    /**
     * Number votes for the film
     */
    private int numVotes;

    /**
     * Film name
     */
    private String name;

    /**
     * Film release year
     */
    private Short releaseYear;

    /**
     * Film genres
     * (have to be separated by commas)
     */
    private String genres;

    /**
     * Film director name
     */
    private String directorName;

    /**
     * Main actors
     * (have to be separated by commas)
     */
    private String actors;

    /**
     * Film description
     */
    private String description;

    /**
     * Produced film countries
     */
    private String countries;

    /**
     * Film duration (in minutes)
     */
    private Short duration;

    /**
     * Vote of the current user for the film
     */
    private int currentUserVote;

	public int getFilmId() {
		return filmId;
	}

	public void setFilmId(int filmId) {
		this.filmId = filmId;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public int getNumVotes() {
		return numVotes;
	}

	public void setNumVotes(int numVotes) {
		this.numVotes = numVotes;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Short getReleaseYear() {
		return releaseYear;
	}

	public void setReleaseYear(Short releaseYear) {
		this.releaseYear = releaseYear;
	}

	public String getGenres() {
		return genres;
	}

	public void setGenres(String genres) {
		this.genres = genres;
	}

	public String getDirectorName() {
		return directorName;
	}

	public void setDirectorName(String directorName) {
		this.directorName = directorName;
	}

	public String getActors() {
		return actors;
	}

	public void setActors(String actors) {
		this.actors = actors;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCountries() {
		return countries;
	}

	public void setCountries(String countries) {
		this.countries = countries;
	}

	public Short getDuration() {
		return duration;
	}

	public void setDuration(Short duration) {
		this.duration = duration;
	}

	public int getCurrentUserVote() {
		return currentUserVote;
	}

	public void setCurrentUserVote(int currentUserVote) {
		this.currentUserVote = currentUserVote;
	}    
}