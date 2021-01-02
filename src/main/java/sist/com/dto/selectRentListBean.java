package sist.com.dto;

public class selectRentListBean {
	private int rentno;
	private String rentdate;
	private String returndate;
	private String rcmodel;
	private String memid;
	private int psgnum;
	private String ofcname;
	private int rcprice;
	private int		carno;
	public int getRentno() {
		return rentno;
	}
	public void setRentno(int rentno) {
		this.rentno = rentno;
	}
	public String getRentdate() {
		return rentdate;
	}
	public void setRentdate(String rentdate) {
		this.rentdate = rentdate;
	}
	public String getReturndate() {
		return returndate;
	}
	public void setReturndate(String returndate) {
		this.returndate = returndate;
	}
	public String getRcmodel() {
		return rcmodel;
	}
	public void setRcmodel(String rcmodel) {
		this.rcmodel = rcmodel;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public int getPsgnum() {
		return psgnum;
	}
	public int getCarno() {
		return carno;
	}
	public void setCarno(int carno) {
		this.carno = carno;
	}
	public void setPsgnum(int psgnum) {
		this.psgnum = psgnum;
	}
	public String getOfcname() {
		return ofcname;
	}
	public void setOfcname(String ofcname) {
		this.ofcname = ofcname;
	}
	public int getRcprice() {
		return rcprice;
	}
	public void setRcprice(int rcprice) {
		this.rcprice = rcprice;
	}
	@Override
	public String toString() {
		return "selectRentListBean [rentno=" + rentno + ", rentdate=" + rentdate + ", returndate=" + returndate
				+ ", rcmodel=" + rcmodel + ", memid=" + memid + ", psgnum=" + psgnum + ", ofcname=" + ofcname
				+ ", rcprice=" + rcprice + ", carno=" + carno + "]";
	}
}

