package com.udnl.pds.dto;

public class User {
	private String ID;
	private String NAME;
	private String PASSWORD;
	private String EMAIL;
	private String AUTH;
	private String REG_USER;
	private String REG_DT;
	private String UPDATE_USER;
	private String UPDATE_DT;
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
	public String getAUTH() {
		return AUTH;
	}
	public void setAUTH(String aUTH) {
		AUTH = aUTH;
	}
	public String getREG_USER() {
		return REG_USER;
	}
	public void setREG_USER(String rEG_USER) {
		REG_USER = rEG_USER;
	}
	public String getREG_DT() {
		return REG_DT;
	}
	public void setREG_DT(String rEG_DT) {
		REG_DT = rEG_DT;
	}
	public String getUPDATE_USER() {
		return UPDATE_USER;
	}
	public void setUPDATE_USER(String uPDATE_USER) {
		UPDATE_USER = uPDATE_USER;
	}
	public String getUPDATE_DT() {
		return UPDATE_DT;
	}
	public void setUPDATE_DT(String uPDATE_DT) {
		UPDATE_DT = uPDATE_DT;
	}
	@Override
	public String toString() {
		return "User [ID=" + ID + ", NAME=" + NAME + ", PASSWORD=" + PASSWORD
				+ ", EMAIL=" + EMAIL + ", AUTH=" + AUTH + ", REG_USER="
				+ REG_USER + ", REG_DT=" + REG_DT + ", UPDATE_USER="
				+ UPDATE_USER + ", UPDATE_DT=" + UPDATE_DT + "]";
	}
}
