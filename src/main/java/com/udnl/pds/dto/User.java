package com.udnl.pds.dto;

public class User {
	private String ID;
	private String NAME;
	private String PASSWORD;
	private String EMAIL;
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getPASSWORD() {
		return PASSWORD;
	}
	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	@Override
	public String toString() {
		return "User [ID=" + ID + ", NAME=" + NAME + ", PASSWORD=" + PASSWORD
				+ ", EMAIL=" + EMAIL + "]";
	}
}
