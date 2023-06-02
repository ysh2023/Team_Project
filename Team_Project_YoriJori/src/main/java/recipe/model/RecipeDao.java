package recipe.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component
public class RecipeDao {
	private final String namespace="recipe.model.RecipeBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<RecipeBean> getAllRecipe(Map<String, String> map,Paging pageInfo){
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
}
