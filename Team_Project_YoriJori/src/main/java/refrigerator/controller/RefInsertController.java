package refrigerator.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ingredient.model.IngBean;
import ingredient.model.IngDao;
import member.model.MemberBean;
import refrigerator.model.RefBean;
import refrigerator.model.RefDao;


@Controller
public class RefInsertController {
	private final String command = "/insert.ref";
	private String getPage = "insertRefrigerator";
	private String gotoPage = "redirect:/list.ref";
	
	@Autowired
	IngDao ingdao;
	@Autowired
	RefDao refdao;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction(Model model, HttpSession session) {
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		List<RefBean> refList = refdao.getUserRef(loginInfo.getId());
		model.addAttribute("refList", refList);
		
		List<IngBean> ingList1 = ingdao.getIngbyCtg("���/��/�߰���");
		List<IngBean> ingList2 = ingdao.getIngbyCtg("���/����ǰ");
		List<IngBean> ingList3 = ingdao.getIngbyCtg("ä��");
		List<IngBean> ingList4 = ingdao.getIngbyCtg("����");
		List<IngBean> ingList5 = ingdao.getIngbyCtg("����/�ػ깰");
		List<IngBean> ingList6 = ingdao.getIngbyCtg("��/��/��");
		List<IngBean> ingList7 = ingdao.getIngbyCtg("�ҽ�/����");
		
		model.addAttribute("ingList1", ingList1);
		model.addAttribute("ingList2", ingList2);
		model.addAttribute("ingList3", ingList3);
		model.addAttribute("ingList4", ingList4);
		model.addAttribute("ingList5", ingList5);
		model.addAttribute("ingList6", ingList6);
		model.addAttribute("ingList7", ingList7);
		
		return getPage;
	}
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public String insert(HttpSession session, @RequestParam(value="ingnum", required=false) String str_ingnum) {
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		System.out.println("id: "+loginInfo.getId());
		
		System.out.println("str_ingnum: "+str_ingnum);
		String[] arr_str = str_ingnum.split(",");
		
		int[] arr_ingnum = new int[arr_str.length];
        for(int i=0; i<arr_str.length; i++) {
        	arr_ingnum[i] = Integer.parseInt(arr_str[i]);
        }
        
        int cnt = -1;
        for(int i=0; i<arr_ingnum.length; i++) {
        	IngBean ingbean = ingdao.getIngInfo(arr_ingnum[i]);
        	
        	RefBean refbean = new RefBean();
        	refbean.setId(loginInfo.getId());
        	refbean.setIngnum(arr_ingnum[i]);
        	
        	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
        	Date now = new Date();	//sysdate(��� �߰���)
        	Calendar cal = Calendar.getInstance();
        	cal.setTime(now);	
        	cal.add(Calendar.DATE, ingbean.getExpiry());	//���� ��¥�� �Һ��� ���ϱ�
        	String refdday = simpleDate.format(cal.getTime());
        	
        	refbean.setRefdday(refdday);
        	
        	cnt += refdao.insertRef(refbean);
        }
        
        if(cnt!=-1) {
        	System.out.println("����� insert ����");
        }else {
        	System.out.println("����� insert ����");
        }
		
		return gotoPage;
	}
	
	
}
