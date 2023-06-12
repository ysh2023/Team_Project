package recipe.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import member.model.MemberBean;
import utility.Paging;
import utility.Paging2;

@Component
public class RecipeDao {
	private final String namespace="recipe.model.RecipeBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<RecipeBean> getAllRecipe(Map<String, String> map,Paging2 pageInfo){
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<RecipeBean> recipeList = sqlSessionTemplate.selectList(namespace+".GetAllRecipe",map,rowBounds);
		return recipeList;
	}
	
	public int getTotalCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		return cnt;
	}
	
	public RecipeBean getRecipe(int recipenum) {
		RecipeBean rbean = sqlSessionTemplate.selectOne(namespace+".GetRecipe", recipenum);
		return rbean;
	}
	
	public List<RecipeContentBean> getRecipeContent( int recipenum ){
		List<RecipeContentBean> recipeContentList = sqlSessionTemplate.selectList(namespace+".GetRecipeContent", recipenum);
		return recipeContentList;
	}
	
	public List<FoodBean> getFood (int recipenum){
		List<FoodBean> foodList = sqlSessionTemplate.selectList(namespace+".GetFood", recipenum);
		return foodList;
	}
	
	public List<RecipeReviewBean> getReviewbyRecipe (int recipenum){
		List<RecipeReviewBean> reviewList = sqlSessionTemplate.selectList(namespace+".GetReviewByRecipe", recipenum);
		return reviewList;
	}
	
	public List<Integer> getBookmarkById(String id){
		List<Integer> BookmarkList = sqlSessionTemplate.selectList(namespace+".GetBookmarkById", id);
		return BookmarkList;
	}
	
	public int deleteBookmark(MemberBean mb) {
		int cnt = sqlSessionTemplate.delete(namespace+".DeleteBookmark", mb);
		return cnt;
	}
	
	public int insertReview(RecipeReviewBean reviewbean) {
		int cnt = sqlSessionTemplate.insert(namespace+".InsertReview", reviewbean); 
		return cnt;
	}
	public int getBookmarkCount(int recipenum) {
		int count = sqlSessionTemplate.selectOne(namespace+".GetBookmarkCount", recipenum);
		return count;
	}
	public int insertBookMark(RecipeBookMarkBean BMBean) {
		int count = sqlSessionTemplate.insert(namespace+".InsertBookMark", BMBean);
		return count;
	}
	public int insertReport(RecipeReviewReportBean reportBean) {
		int count = sqlSessionTemplate.insert(namespace+".InsertReport", reportBean);
		return count;
	}
	
	public boolean checkBookMark(RecipeBookMarkBean BMBean) {
		boolean flag = false;
		int count = sqlSessionTemplate.selectOne(namespace+".CheckBookMark", BMBean);
		if(count>0) {
			flag = true;
		}
		return flag;
	}
	
	public int getingrecipeTotalCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".GetingrecipeTotalCount", map);
		return cnt;
	}
	public List<RecipeBean> getAllRecipeByIngre(Map<String, String> map,Paging2 pageInfo){
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<RecipeBean> recipeList = sqlSessionTemplate.selectList(namespace+".GetAllRecipeByIngre",map,rowBounds);
		return recipeList;
	}
	
	public int getFoodRecipeTotalCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".GetFoodRecipeTotalCount", map);
		return cnt;
	}
	public List<RecipeBean> getAllRecipeByFoodCate(Map<String, String> map,Paging2 pageInfo){
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<RecipeBean> recipeList = sqlSessionTemplate.selectList(namespace+".GetAllRecipeByFoodCate",map,rowBounds);
		return recipeList;
	}
	
	public int updateReadCount(int recipenum) {
		int cnt = sqlSessionTemplate.update(namespace+".UpdateReadCount", recipenum);
		return cnt;
	}
	public List<RecipeBean> getAllRecipeByReadCount(Map<String, String> map,Paging2 pageInfo){
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<RecipeBean> recipeList = sqlSessionTemplate.selectList(namespace+".GetAllRecipeByReadCount", pageInfo, rowBounds);
		return recipeList;
	}
	public List<RecipeBean> getAllRecipeByBookMark(Map<String, String> map,Paging2 pageInfo){
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<RecipeBean> recipeList = sqlSessionTemplate.selectList(namespace+".GetAllRecipeByBookMark", pageInfo, rowBounds);
		return recipeList;
	}
}
