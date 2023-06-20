package product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import member.model.MemberBean;
import product.model.ProductBean;
import product.model.ProductDao;
import refrigerator.model.RefDao;
import shopmemo.model.MemoBean;
import shopmemo.model.MemoDao;
import utility.Paging;

@Controller
public class ProductListController {

	private final String command = "/shop.prd";
	private final String getPage = "allShop";

	@Autowired
	@Qualifier("myProductDao")
	ProductDao pdao;

	@Autowired
	@Qualifier("memo")
	MemoDao memodao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "whatColumn", required = false) String whatColumn,
			@RequestParam(value = "pageNumber", required = false) String pageNumber,
			@RequestParam(value = "searchName", required = false) String searchName,
			@RequestParam(value = "ck", required = false) String ck,
			@RequestParam(value="myscroll",required=false) String myscroll,
			HttpSession session, Model model,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		System.out.print("serachName:" + searchName);
		
		  
		  if(session.getAttribute("loginInfo")!=null) {
			  MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
			  
			  if(myscroll != null) {
					model.addAttribute("modelscroll", myscroll);
				}
		
		  
		  List<MemoBean> userMemo = memodao.getUserMemo(loginInfo.getId());
		  mav.addObject("userMemo",userMemo);
		   
		  }
		 

		Map<String, String> map = new HashMap<String, String>();

		map.put("whatColumn", whatColumn);
		map.put("keyword", keyword);
		if (searchName != null) {
			map.put("searchName", "%" + searchName + "%");
		} else {
			map.put("searchName", "");
		}
		String url = request.getContextPath() + command;

		List<ProductBean> prolists = pdao.getAllProducts();

		List<ProductBean> lists = new ArrayList<ProductBean>();
		Paging pageInfo = null;
		System.out.println("ck:" + ck);

		if (ck != null) { // 다른 창에서 검색해서 들어올때
			for (int i = 0; i < prolists.size(); i++) {

				/*System.out.println(
						prolists.get(i).getPdname() + "포함?" + searchName.contains(prolists.get(i).getPdname()));*/
				if (searchName.contains(prolists.get(i).getPdname()) == true) { // 포함되어있는냐? ex)다진마늘=> 마늘 contain
					ProductBean pb = new ProductBean();

					pb.setPdnum(prolists.get(i).getPdnum());
					pb.setPdcategory(prolists.get(i).getPdcategory());
					pb.setPdcontent(prolists.get(i).getPdcontent());
					pb.setPdname(prolists.get(i).getPdname());
					pb.setPdprice(prolists.get(i).getPdprice());
					pb.setPdstock(prolists.get(i).getPdstock());
					pb.setPdimage(prolists.get(i).getPdimage());

					/*
					 * System.out.print(prolists.get(i).getPdnum());
					 * System.out.print(prolists.get(i).getPdcategory());
					 * System.out.print(prolists.get(i).getPdname());
					 * System.out.print(prolists.get(i).getPdprice());
					 * System.out.print(prolists.get(i).getPdstock());
					 * System.out.print(prolists.get(i).getPdimage());
					 * 
					 */
					lists.add(pb);
					mav.addObject("lists", lists);
				}

			}
		} else { // allshop화면으로만 움직일때
			int totalCount = pdao.getTotalCount(map);

			pageInfo = new Paging(pageNumber, "8", totalCount, url, whatColumn, keyword, null);

			lists = pdao.getAllProduct(pageInfo, map);

			mav.addObject("lists", lists);
			mav.addObject("pageInfo", pageInfo);

		}

		mav.addObject("keyword", keyword);
		mav.addObject("whatColumn", whatColumn);

		mav.addObject("searchName", searchName);
		mav.setViewName(getPage);

		return mav;

	}

}