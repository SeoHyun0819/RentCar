package sist.com.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import sist.com.dto.MemberBean;
import sist.com.dto.OfficeBean;
import sist.com.dto.QnaBean;
import sist.com.dto.RentCarBean;
import sist.com.dto.RentListBean;
import sist.com.dto.SelectCarList;
import sist.com.dto.SelectCarListBean;
import sist.com.dto.ZipBean;
import sist.com.dto.selectRentListBean;

@Component
public class BasicDao  extends SqlSessionDaoSupport{

	@Autowired
	protected void initDao(SqlSessionTemplate st) throws Exception {
		// TODO Auto-generated method stub
		this.setSqlSessionTemplate(st);
	}
	//예약
	public List<SelectCarListBean>selectRentCar(HashMap<String, String>map){
		return this.getSqlSession().selectList("selectRentCar",map);
	}
	public void updateState(int no) {
		this.getSqlSession().update("updateState", no);
	}
	public void insertRentList(RentListBean bean) {
		this.getSqlSession().insert("insertRentList", bean);
	}
	public int findOfcno(int no) {
		return this.getSqlSession().selectOne("findOfcno", no);
	}
	public int findRcprice(int no) {
		return this.getSqlSession().selectOne("findRcprice", no);
	}
	public int findmemno(String userId) {
		return this.getSqlSession().selectOne("findmemno", userId);
	}
	public List<selectRentListBean>selectRentList(){
		return this.getSqlSession().selectList("selectRentList");
	}
	public void deleteRentList(int rentno) {
		 this.getSqlSession().delete("deleteRentList",rentno);
	 }
	public void rejectState(int carno) {
		this.getSqlSession().update("rejectState", carno);
	}
	public void rentSubmit(int carno) {
		this.getSqlSession().update("rentSubmit",carno);
	}
	//예약
	
	//회원관리
	public boolean memberIdCheck(String userId, String userpassword) {
		String dbPass = this.getSqlSession().selectOne("memberIdCheck", userId);
		return dbPass != null && dbPass.equals(userpassword);
	}
	
	public boolean IdCheck(String memid) {
		String rsId = this.getSqlSession().selectOne("IdCheck", memid);
		return rsId == null || rsId.equals("") ? false : true;
	}
	

	public MemberBean findlevel(String userId){ //관리자 로그인을 위한 level찾기
		 return this.getSqlSession().selectOne("findlevel",userId );
		}
	
	public List<ZipBean> selectZipCode(String dong){
		return this.getSqlSession().selectList("selectZipCode",dong);
	}

	public  MemberBean memberInfo(String userId) {
		return this.getSqlSession().selectOne("memberInfo",userId);
	}

	public void insertMember(MemberBean bean) {
		this.getSqlSession().insert("insertMember", bean);
	}
	
	//----200721 서현추가 마이페이지 수정----//
	public void memberUpdate(MemberBean bean) {
		this.getSqlSession().update("memberUpdate",bean);
	}
	
	
	
	
	 
	
	public MemberBean findNo(String userId) {
	   return this.getSqlSession().selectOne("findNo",userId);	
	}
	public List<RentListBean>myPage_reserve(MemberBean mem){
		return this.getSqlSession().selectList("myPage_reserve",mem);
	}

	public List<MemberBean> selectmember(HashMap<String, Object> map) {
		return this.getSqlSession().selectList("selectmember", map);
	}
	
	 public void deleteMemberList(int memno) {
		 this.getSqlSession().delete("deleteMemberList",memno);
	 }
	 
	 public List<QnaBean> myQnAselect (MemberBean mem){
		 return this.getSqlSession().selectList("myQnAselect",mem);
	 }
	 
	 public List<OfficeBean> selectOffice(HashMap<String, Object> map){
		 return this.getSqlSession().selectList("selectOffice",map);
	 }
	 public List<SelectCarList> AdminRentCarList(){
		 return this.getSqlSession().selectList("AdminRentCarList");
	 }
	 
	 public void insertRentCar(RentCarBean bean) {
		 this.getSqlSession().insert("insertRentCar", bean);
	 }
	 
	 
	 public void modRentCar(RentCarBean bean) {
		 this.getSqlSession().update("modRentCar",bean);
	 }
	 
	 public void deleterentCar(RentCarBean bean) {
		 this.getSqlSession().delete("deleterentCar",bean);
	 }
	 
	 public List<SelectCarList> rentCarInfo(int rcno) {
			return this.getSqlSession().selectList("rentCarInfo",rcno);
		}
	 
	 public void modRcState(RentCarBean bean) {
		 this.getSqlSession().update("modRcState",bean);
	 }
	 //회원
	 
	//6.13,14 최혜진 추가
		 public int memberTotal(){
			 return this.getSqlSession().selectOne("memberTotal");
		 }
		 
		 public int todayJoinMember() {
			 return this.getSqlSession().selectOne("todayJoinMember");
		 }
		 
		 public int reservationTotal(){
			 return this.getSqlSession().selectOne("reservationTotal");
		 }
		 
		 public int grossSales() {
			 return this.getSqlSession().selectOne("grossSales");
		 }
		 
		 public int thisMonthJoin() {
			 return this.getSqlSession().selectOne("thisMonthJoin");
		 }
		 public int previousMonth1() {
			 return this.getSqlSession().selectOne("previousMonth1");
		 }
		 public int previousMonth2() {
			 return this.getSqlSession().selectOne("previousMonth2");
		 }
		 
		 public int gangnamTotal() {
			 return this.getSqlSession().selectOne("gangnamTotal");
		 }
		 
		//6.13,14 최혜진 추가 끝
		 
		 
		 
		 
		 
		 
		 
		 
}