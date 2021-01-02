package sist.com.orm;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import sist.com.dao.BasicDao;
import sist.com.dto.MemberBean;
import sist.com.dto.OfficeBean;
import sist.com.dto.QnaBean;
import sist.com.dto.RentCarBean;
import sist.com.dto.RentListBean;
import sist.com.dto.SelectCarList;

@Controller
@SessionAttributes(value = { "carList", "date1", "date2", "people", "car", "place" })
public class AppleController {
	@Autowired
	private BasicDao dao;
	/*
	 * @Resource private RentCarBean rentCarBean;
	 */

	// 예약
	@RequestMapping(value = "carseach.do")
	public String carSeach(HashMap<String, String> map, HttpServletRequest request, Model model, HttpSession session) {
		map.put("car", request.getParameter("car"));
		map.put("place", request.getParameter("place"));
		model.addAttribute("carList", dao.selectRentCar(map));
		model.addAttribute("date1", request.getParameter("date1"));
		model.addAttribute("date2", request.getParameter("date2"));
		model.addAttribute("car", request.getParameter("car"));
		model.addAttribute("place", request.getParameter("place"));
		model.addAttribute("people", request.getParameter("people"));
		return "SIST/sub/reserve2";
	}

	@RequestMapping(value = "statemod.do")
	public String carState(int no, Model model, HttpServletRequest request, HttpSession session, RentListBean bean,
			String userId) {
		model.addAttribute("no", request.getParameter("no"));

		dao.updateState(no);
		bean.setRentdate((String) session.getAttribute("date1"));
		bean.setReturndate((String) session.getAttribute("date2"));
		bean.setCarno(Integer.parseInt(request.getParameter("no")));
		bean.setMemberno(dao.findmemno((String) session.getAttribute("userId")));
		bean.setPsgnum(Integer.parseInt((String) session.getAttribute("people")));
		bean.setOfcno(dao.findOfcno(no));
		bean.setRcprice(dao.findRcprice(no));
		dao.insertRentList(bean);
		return "redirect:carseach.do";
	}

	@RequestMapping(value = "rentList.do")
	public String rentconfirm(Model model) {
		model.addAttribute("rentListView", dao.selectRentList());
		return "SIST/admin/rentmanage";
	}

	@RequestMapping(value = "rentListDelete.do")
	public String rentListDelPro(int rentno, int carno) {
		dao.rejectState(carno);
		dao.deleteRentList(rentno);
		return "redirect:rentList.do";
	}

	@RequestMapping(value = "rentSubmit.do")
	public String rentSubmit(int carno) {
		dao.rentSubmit(carno);
		return "redirect:rentList.do";
	}
	// 예약

	// 회원관리
	@RequestMapping(value = "loginPro.do")
	public String loginProcess(String userId, String userpassword, HttpSession session, Model model) {// 아이디 비밀번호가 정보와
																										// 일치하는지 확인

		if (dao.memberIdCheck(userId, userpassword)) {
			session.setAttribute("userId", userId);
			return "redirect:loginCheck.do";
		} else {

			/* model.addAttribute("loginFail","정보가 일치하지 않습니다"); */

			return "redirect:/SIST/sub/login.jsp";
		}
	}

	@RequestMapping(value = "loginCheck.do")
	public String loginChecksession(String userId, HttpSession session, Model model) {// 레벨 확인 후 관리자,회원 구분

		MemberBean bean = dao.findlevel((String) session.getAttribute("userId"));
		if (Integer.parseInt(bean.getMlevel()) == 0) {
			return "/SIST/adminIndex";

		} else if (Integer.parseInt(bean.getMlevel()) == 1) {
			return "/SIST/index";

		}
		return null;
	}

	@ResponseBody
	@RequestMapping(value = "idCheck.do")
	public boolean idCheckPro(HttpSession session, String memid) {
		return dao.IdCheck(memid);

	}

	@RequestMapping(value = "logoutPro.do")
	public String logoutPro(HttpServletRequest request) {// 로그아웃 = 로그인 후 생성된 세션 제거

		HttpSession session = request.getSession();
		session.invalidate();
		return "/SIST/index";
	}

	@RequestMapping(value = "indexlogin.do")
	public String login() {
		return "redirect:/SIST/sub/login.jsp";
	}

	@RequestMapping(value = "joinRentcar.do")
	public String joinmember() {

		return "redirect:/SIST/sub/joinRentcar.jsp";
	}

	@RequestMapping(value = "memberInsert.do")
	public String insertMember(MemberBean bean, HttpSession session, Model model, String userId, ModelAndView mav) {

		bean.setMlevel("1");
		dao.insertMember(bean);
		model.addAttribute("userId", bean.getMemid());

		return "SIST/sub/memberSuccess";
	}
	
	
	/* 200721 서현 추가 */
	@RequestMapping(value="memberUpdate.do")
	public String memberUpdate(MemberBean bean,HttpSession session,Model model,String userID,ModelAndView mav) {
		dao.memberUpdate(bean);
		return "/SIST/index";
	}
	
	
	
	
	

	@RequestMapping(value = "searchAdress.do")
	public String serarchAdress(String dong, Model model) {
		/* List<ZipBean>list=dong!=null?MemberDao.selectZipCode(dong):null; */
		// dao.selectZipCode(dong);
		model.addAttribute("dongList", dao.selectZipCode(dong));
		return "SIST/sub/address";
	}

	@RequestMapping(value = "myPage.do")
	public String goMypage(HttpServletRequest request, Model model, MemberBean bean) {
		HttpSession session = request.getSession();

		String idsession = session.getAttribute("userId").toString();
		MemberBean memInfo = new MemberBean();
		memInfo = dao.memberInfo(idsession);

		model.addAttribute("mypageId", memInfo.getMemid());
		model.addAttribute("mypagePw", memInfo.getMempw());
		model.addAttribute("mypageName", memInfo.getMname());
		model.addAttribute("mypageMail", memInfo.getMemail());

		String data = memInfo.getMadress();
		String[] adress = data.split("/");
		String adress1 = adress[0];
		String adress2 = adress[1];
		String adress3 = adress[2];
		model.addAttribute("mypageAdress1", adress1);
		model.addAttribute("mypageAdress2", adress2);
		model.addAttribute("mypageAdress3", adress3);

		model.addAttribute("mypageTel", memInfo.getMemtel());

		return "SIST/sub/myPage";

	}
	
	
	/*회원수정*/
	@RequestMapping(value="myPageMod.do")
	public String myPageMod(HttpServletRequest request,MemberBean bean,Model model) {
		
		System.out.println(bean);
		return "redirect:SIST/sub/myPageMod.jsp";
	}
	
	
	
	
	
	

	@RequestMapping(value = "myPageReserve.do")
	public String goMyPageReserve(HttpSession session, Model model, String userId) {
		MemberBean mem = dao.findNo((String) session.getAttribute("userId"));
		List<RentListBean> list = dao.myPage_reserve(mem);
		model.addAttribute("myPageReserveList", list);

		return "SIST/sub/myPage_Reserve";
	}
	
	
	
	
	

	@RequestMapping(value = "myQna.do")
	public String myQnaPro(Model model, HttpSession session, String userId) {
		MemberBean mem = dao.findNo((String) session.getAttribute("userId"));
		List<QnaBean> list = dao.myQnAselect(mem);
		model.addAttribute("myQnaList", list);

		return "SIST/sub/myQnA";
	}

	
	
	
	
	@RequestMapping(value = "memberList.do")
	public String memberListPro(Model model) {
		List<MemberBean> list = null;
		HashMap<String, Object> map = new HashMap<String, Object>();
		list = dao.selectmember(map);
		model.addAttribute("selectMember", list);
		return "SIST/admin/member";
	}

	@RequestMapping(value = "memberListDelete.do")
	public String memberListDelPro(int memno) {
		dao.deleteMemberList(memno);
		return "redirect:memberList.do";
	}

	@RequestMapping(value = "goOffice.do")
	public String rentCarOffice(Model model) {
		List<OfficeBean> list = null;
		HashMap<String, Object> map = new HashMap<String, Object>();
		dao.selectOffice(map);

		list = dao.selectOffice(map);
		model.addAttribute("officeList", list);

		return "/SIST/admin/office";
	}

	@RequestMapping(value = "goRentCarList.do")
	public String adminRentCarList(RentCarBean bean, SelectCarList selectcarlist, Model model,
			@RequestParam(value = "file", required = false) MultipartFile file) {
		List<SelectCarList> list = dao.AdminRentCarList();
		SelectCarList carlist = new SelectCarList();

		model.addAttribute("adminRentCarList", list);

		return "/SIST/admin/rentCarList";
	}

	@RequestMapping(value = "insertRentCar.do")
	public String goInsertRentCar(RentCarBean bean, SelectCarList selectcarlist,
			@RequestParam(value = "file", required = false) MultipartFile file) {
		String locations = "C:\\Javaworkspace\\SistRentCar\\web\\src\\main\\webapp\\SIST\\images\\";
		FileOutputStream fos = null;
		String fileName = file.getOriginalFilename().trim();
		System.out.println(fileName);

		if (fileName.length() > 0) {
			try {
				fos = new FileOutputStream(locations.concat(fileName).trim());
				fos.write(file.getBytes());
				System.out.println("FOS: " + fos);
				selectcarlist.setRcimg(fileName.trim());
				bean.setRcimg(fileName.trim());

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				try {
					if (fos != null)
						fos.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		System.out.println(bean);

		if (fileName.length() == 0) {
			bean.setRcimg("noimage.gif");
		}

		dao.insertRentCar(bean);
		return "redirect:goRentCarList.do";
	}

	@RequestMapping(value = "goinsertcar.do")
	public String ss() {
		return "/SIST/admin/insertCar";
	}

	// 추가

	@RequestMapping(value = "modCar.do")
	public String modRentCar(int rcno, RentCarBean bean) {
		System.out.println("rcno        " + rcno);
		dao.modRentCar(bean);
		return "insertRentCar.do";
	}

	@RequestMapping(value = "rentCarInfo.do")
	public String rentCarInfo(Model model, int rcno) {
		// List<RentCarBean> infoList = dao.rentCarInfo(rcno);
		List<SelectCarList> infoList = dao.rentCarInfo(rcno);

		model.addAttribute("rentCarInfoList", infoList);
		return "/SIST/admin/rentCarInfo";
	}

	@RequestMapping(value = "retncarDel.do", method = RequestMethod.POST)
	@ResponseBody
	public String delRentCarList(@RequestParam(value = "valueArrTest[]") List<String> valueArr, RentCarBean bean) {

		int result = 0;
		int cartNum = 0;

		for (String i : valueArr) {
			cartNum = Integer.parseInt(i);
			bean.setRcno(cartNum);
			dao.deleterentCar(bean);
			System.out.println("valueArr: " + valueArr);

		}

		return "redirect:goRentCarList.do";
	}

	@RequestMapping(value = "modRcState.do", method = RequestMethod.POST)
	@ResponseBody
	public String modRcState(@RequestParam(value = "valueArrTest[]") List<String> valueArr, RentCarBean bean) {

		int result = 0;
		int cartNum = 0;

		for (String i : valueArr) {
			cartNum = Integer.parseInt(i);
			bean.setRcno(cartNum);
			dao.modRcState(bean);
			System.out.println("valueArr: " + valueArr);

		}

		return "redirect:goRentCarList.do";
	}
	// 회원관리
	
	
	/* 20.08.07 서현 추가 */
	@RequestMapping(value="rewiewWrite.do")
	public String reviewWrite(HttpServletRequest request, MemberBean bean, Model model) {
		
		return "SIST/sub/rewiew";
	}
	
	
	/* 20.08.07 서현 추가 끝 */
	
}
