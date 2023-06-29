package admin.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import board.model.BoardBean;
import board.model.CommentReportBean;
import ingredient.model.IngBean;
import order.model.GroupBean;
import order.model.OrderBean;
import orderdetail.model.DetailGroupBean;
import orderdetail.model.OrderDetailBean;
import product.model.ProductBean;
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

	public int getMemberCount() {
		int totalMember = sqlSessionTemplate.selectOne(namespace + ".CountAllMember");
		return totalMember;
	}

	public int getRegisterCount(Map<String, String> map) {
		int monthRegister = sqlSessionTemplate.selectOne(namespace + ".CountRegister", map);
		return monthRegister;
	}

	public List<CommentReportBean> getReportlist() {
		List<CommentReportBean> lists = new ArrayList<CommentReportBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".GetReportCount");
		return lists;
	}

	public List<RecipeReviewReportBean> getRecipeReportlist() {
		List<RecipeReviewReportBean> list = sqlSessionTemplate.selectList(namespace + ".GetRecipeReportlist");
		return list;
	}

	public List<CommentReportBean> getAllReport(String id) {
		List<CommentReportBean> lists = new ArrayList<CommentReportBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".GetAllReport", id);
		return lists;
	}

	public List<RecipeReviewReportBean> getAllRecipeReport(String id) {
		List<RecipeReviewReportBean> list = sqlSessionTemplate.selectList(namespace + ".GetAllRecipeReport", id);
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

	public int deleteReviewReport(String id) {
		int cnt = sqlSessionTemplate.delete(namespace + ".DeleteReviewReport", id);
		return cnt;
	}
	public void deleteCommentReport(String repNum) {
		sqlSessionTemplate.delete(namespace + ".DeleteCommentReport", repNum);
	}
	public int deleteReviewReportByRerepnum(String rerepnum) {
		int cnt= sqlSessionTemplate.delete(namespace+".DeleteReviewReportByRerepnum",rerepnum);
		return cnt;
	}
	
	public void updateReview(Map<String, String> map) {
		sqlSessionTemplate.update(namespace+".UpdateReview",map);
	}
	public void deleteReview(String rerepnum) {
		sqlSessionTemplate.delete(namespace+".DeleteReview",rerepnum);
	}
	public void deleteComments(String repNum) {
		int result= sqlSessionTemplate.delete(namespace+".DeleteComments", repNum);
		System.out.println(result);
	}
	public boolean checkReport(String rerepnum) {
		boolean flag = false;
		int cnt = sqlSessionTemplate.selectOne(namespace+".CheckReport",rerepnum);
		if(cnt>0) {
			flag = true;
		}
		return flag;
	}
	public boolean checkComment(String repnum) {
		boolean flag = false;
		int cnt = sqlSessionTemplate.selectOne(namespace+".CheckComment",repnum);
		if(cnt>0) {
			flag = true;
		}
		return flag;
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

	public List<BoardBean> getRecentBoard() {
		List<BoardBean> list = sqlSessionTemplate.selectList(namespace + ".RecentBoard");
		return list;
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

	public int getOrderCount(Map<String, String> map) {
		int ordernum = sqlSessionTemplate.selectOne(namespace + ".CountOrder", map);
		return ordernum;
	}

	public int getOrderSales(Map<String, String> map) {
		int sales = sqlSessionTemplate.selectOne(namespace + ".GetSales", map);
		return sales;
	}

	public List<GroupBean> getTopSeller() {
		List<GroupBean> lists = new ArrayList<GroupBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".TopSeller");
		return lists;
	}
	public List<DetailGroupBean> getDetailTopSeller() {
		List<DetailGroupBean> lists = new ArrayList<DetailGroupBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".DetailTopSeller");
		return lists;
	}

	public List<OrderBean> getAllOrder() {
		List<OrderBean> lists = new ArrayList<OrderBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".GetAllOrder");
		return lists;
	}

	public List<OrderDetailBean> getAllOrderDetail(String ordnum) {
		List<OrderDetailBean> lists = new ArrayList<OrderDetailBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".GetAllOrderDetail", ordnum);
		return lists;
	}

	public int ApproveCancelpay(String merchantuid) {
		OrderBean ord = new OrderBean();
		ord.setOrdnum(merchantuid);
		ord.setOrdtel("환불 승인");
		int cnt = 0;
		cnt = sqlSessionTemplate.update(namespace + ".ApproveCancelpay", ord);
		return cnt;
	}

	public List<OrderBean> getOrderCancelList() {
		String paystate = "환불 요청";
		List<OrderBean> lists = new ArrayList<OrderBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getOrderCancel", paystate);
		return lists;
	}

	public int blindReport(Map<String, String> map) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace + ".UpdateCommentReport", map);
		return cnt;
	}

}
