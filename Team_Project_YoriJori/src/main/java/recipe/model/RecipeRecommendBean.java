package recipe.model;

import java.util.List;
	//recipeBean으로도 에러가 안뜨는지 확인해보기
public class RecipeRecommendBean {
	private int recipenum;
	private String recipename;
	private String recipecategory;
	private String servings;
	private String cookimage;
	private int readcount; 
	private int cnt;
	private int rec;
	
	
	public int getRec() {
		return rec;
	}
	public void setRec(int rec) {
		this.rec = rec;
	}
	public int getRecipenum() {
		return recipenum;
	}
	public void setRecipenum(int recipenum) {
		this.recipenum = recipenum;
	}
	public String getRecipename() {
		return recipename;
	}
	public void setRecipename(String recipename) {
		this.recipename = recipename;
	}
	public String getRecipecategory() {
		return recipecategory;
	}
	public void setRecipecategory(String recipecategory) {
		this.recipecategory = recipecategory;
	}
	public String getServings() {
		return servings;
	}
	public void setServings(String servings) {
		this.servings = servings;
	}
	public String getCookimage() {
		return cookimage;
	}
	public void setCookimage(String cookimage) {
		this.cookimage = cookimage;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
	
}
