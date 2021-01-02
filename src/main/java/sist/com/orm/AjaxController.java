package sist.com.orm;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import sist.com.dao.BasicDao;
import sist.com.dto.AdminMainBean;

@RestController
public class AjaxController {
	
	//6.13 최혜진 수정 오토와이어 ->인젝트
	@Inject
	private BasicDao dao;
	
	//6.13 최혜진 추가 
	@RequestMapping(value="adminMainList.do")
	public List<AdminMainBean> adminMainList(){
		
		List<AdminMainBean>list=new ArrayList<AdminMainBean>();
		AdminMainBean bean=new AdminMainBean();
		
		bean.setTotalMember(dao.memberTotal());
		bean.setTodayJoin(dao.todayJoinMember());
		bean.setTotalReservation(dao.reservationTotal());
		bean.setGrossSales(dao.grossSales());
		
		bean.setThisMonthJoin(dao.thisMonthJoin());
		bean.setPreviousMonth1(dao.previousMonth1());
		bean.setPreviousMonth2(dao.previousMonth2());
		bean.setGangnamTotal(dao.gangnamTotal());
		list.add(bean);
		
		
/*		System.out.println(bean);
		System.out.println(list);*/
		return list;
	}
	//6.13 최혜진 추가 끝
}
