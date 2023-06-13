package orderdetail.map;

import java.util.HashMap;
import java.util.Map;

public class DetailList {
	private Map<Integer,Integer> orderlists = null;
	
	public DetailList() {
		orderlists = new HashMap<Integer,Integer>();
	}

	public void addOrder(int num, int orderqty) {
		orderlists.put(num, orderqty);
	}
	
	public Map<Integer,Integer> getAllorderLists() {
		
		return orderlists;
	}
	
	public void deleteOrder() {
		orderlists.clear();
	}
}
