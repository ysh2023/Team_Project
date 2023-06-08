package recipe.model;

public class RecipeReviewBean {
	private int Reviewnum;
	private String review;
	private String id;
	private int recipenum;
	 
	public int getReviewnum() {
		return Reviewnum;
	}
	public void setReviewnum(int reviewnum) {
		Reviewnum = reviewnum;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getRecipenum() {
		return recipenum;
	}
	public void setRecipenum(int recipenum) {
		this.recipenum = recipenum;
	}
	
	
}
