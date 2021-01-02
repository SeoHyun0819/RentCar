package sist.com.dto;
//6.13 ÃÖÇýÁø Ãß°¡
public class AdminMainBean {
	private int totalMember;
	private int totalReservation;
	private int grossSales;
	private int todayJoin;
	private int thisMonthJoin;
	private int previousMonth1;
	private int previousMonth2;
	private int gangnamTotal;
	
	public int getGangnamTotal() {
		return gangnamTotal;
	}

	public void setGangnamTotal(int gangnamTotal) {
		this.gangnamTotal = gangnamTotal;
	}

	public int getPreviousMonth2() {
		return previousMonth2;
	}

	public void setPreviousMonth2(int previousMonth2) {
		this.previousMonth2 = previousMonth2;
	}

	public int getPreviousMonth1() {
		return previousMonth1;
	}

	public void setPreviousMonth1(int previousMonth1) {
		this.previousMonth1 = previousMonth1;
	}

	public int getThisMonthJoin() {
		return thisMonthJoin;
	}

	public void setThisMonthJoin(int thisMonthJoin) {
		this.thisMonthJoin = thisMonthJoin;
	}

	public int getTodayJoin() {
		return todayJoin;
	}

	public void setTodayJoin(int todayJoin) {
		this.todayJoin = todayJoin;
	}

	public int getGrossSales() {
		return grossSales;
	}

	public void setGrossSales(int grossSales) {
		this.grossSales = grossSales;
	}

	public int getTotalReservation() {
		return totalReservation;
	}

	public void setTotalReservation(int totalReservation) {
		this.totalReservation = totalReservation;
	}

	public int getTotalMember() {
		return totalMember;
	}

	public void setTotalMember(int totalMember) {
		this.totalMember = totalMember;
	}

	@Override
	public String toString() {
		return "AdminMainBean [totalMember=" + totalMember + ", totalReservation=" + totalReservation + ", grossSales="
				+ grossSales + ", todayJoin=" + todayJoin + ", thisMonthJoin=" + thisMonthJoin + ", previousMonth1="
				+ previousMonth1 + ", previousMonth2=" + previousMonth2 + ", gangnamTotal=" + gangnamTotal + "]";
	}



	
	
}
