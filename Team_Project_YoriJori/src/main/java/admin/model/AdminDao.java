package admin.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import board.model.BoardBean;
import board.model.CommentReportBean;
import ingredient.model.IngBean;
import product.model.ProductBean;
import recipe.model.RecipeReviewBean;
import recipe.model.RecipeReviewReportBean;

@Component("myAdminDao")
public class AdminDao {
	private String namespace = "admin.model.Admin";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<ProductBean> getAllProduct() {

		List<ProductBean> lists = new ArrayList<ProductBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".GetAllProduct");
		return lists;
	}

	public int deleteProduct(int pdnum) {

		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace + ".DeleteProduct", pdnum);

		return cnt;
	}

	public int insertProduct(ProductBean product) {
		int cnt = -1;

		cnt = sqlSessionTemplate.insert(namespace + ".InsertProduct", product);

		return cnt;

	}

	public ProductBean getByNum(int pdnum) {
		ProductBean pd = sqlSessionTemplate.selectOne(namespace + ".GetByNum", pdnum);

		return pd;
	}

	public int updateProduct(ProductBean productBean) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace + ".UpdateProduct", productBean);

		System.out.println("pd_num:" + productBean.getPdnum());
		System.out.println("pd_cate:" + productBean.getPdcategory());
		System.out.println("pd_image:" + productBean.getPdimage());
		return cnt;

	}

	public List<ProductBean> getAllMember() {
		List<ProductBean> lists = new ArrayList<ProductBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".GetAllMember");
		return lists;
	}

	public List<CommentReportBean> getReportlist() {
		List<CommentReportBean> lists = new ArrayList<CommentReportBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".GetReportCount");
		return lists;
	}
	public List<RecipeReviewReportBean> getRecipeReportlist(){
		List<RecipeReviewReportBean> list = sqlSessionTemplate.selectList(namespace+".GetRecipeReportlist");
		return list;
	}
	
	public List<CommentReportBean> getAllReport(String id) {
		List<CommentReportBean> lists = new ArrayList<CommentReportBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".GetAllReport", id);
		return lists;
	}
	
	public List<RecipeReviewReportBean> getAllRecipeReport(String id){
		List<RecipeReviewReportBean> list = sqlSessionTemplate.selectList(namespace+".GetAllRecipeReport", id);
		return list;
	}
	
	public int getCountReportById(String id) {

		int cnt = -1;

		cnt = sqlSessionTemplate.selectOne(namespace + ".GetCountReportById", id);

		return cnt;
	}

	public void deleteReport(String id) {

		sqlSessionTemplate.delete(namespace + ".DeleteReport", id);
	}
	
	public void deleteReviewReport(String id) {
		sqlSessionTemplate.delete(namespace+".DeleteReviewReport", id);
	}
	public void deleteComment(String comNum) {
		sqlSessionTemplate.delete(namespace + ".DeleteComment", comNum);
	}
	public void deleteReview(String reviewnum) {
		sqlSessionTemplate.delete(namespace+".DeleteReview",reviewnum);
	}
	
	/* 식재료 */
	public List<IngBean> getAllIng() {
		List<IngBean> allList = sqlSessionTemplate.selectList(namespace + ".GetAllIng");
		return allList;
	}

	public IngBean getIngDetail(int ingnum) {
		IngBean ingbean = sqlSessionTemplate.selectOne(namespace + ".GetIngDetail", ingnum);
		return ingbean;
	}

	public int checkIng(String ingname) {
		int dupl = sqlSessionTemplate.selectOne(namespace + ".CheckIng", ingname);
		return dupl;
	}

	public int insertIng(IngBean ingbean) {
		int cnt = sqlSessionTemplate.insert(namespace + ".InsertIng", ingbean);
		return cnt;
	}

	public int updateIng(IngBean ingbean) {
		int cnt = sqlSessionTemplate.update(namespace + ".UpdateIng", ingbean);
		return cnt;
	}

	public int checkRef(int ingnum) {
		int used = sqlSessionTemplate.selectOne(namespace + ".CheckRef", ingnum);
		return used;
	}

	public int deleteIng(int ingnum) {
		int cnt = sqlSessionTemplate.delete(namespace + ".DeleteIng", ingnum);
		return cnt;
	}

	public List<BoardBean> getAllBoardAm() {
		List<BoardBean> list = sqlSessionTemplate.selectList(namespace + ".GetAllBoardAm");
		return list;
	}

	public int deleteBoard(String bodNum) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace + ".DeleteBoard", bodNum);
		return cnt;
	}
	
}
