package com.udnl.pds.dto;

public class PdsContent {
	private String SEQ;	           //����
	private String BIZ_CODE;       //�����ڵ�
	private String BIZ_ITEM;       //�����׸�
	private String TARGET_RESULT;  //��ǥ���
	private String TARGET_TIME;    //��ǥ���Խð�
	private String REAL_TIME;      //�������Խð�
	private String PROG_RATE;      //�����
	private String PLAN_DO;        //��ȹ�׼���
	private String GAB_ANAL;       //Gab�м�����������
	private String SCHEDULE_DT;    //������
	private String REG_DT;         //�ۼ���
	private String REG_USER;       //�ۼ���
	private String UPDATE_DT;      //������
	private String UPDATE_USER;    //������
	public String getSEQ() {
		return SEQ;
	}
	public void setSEQ(String sEQ) {
		SEQ = sEQ;
	}
	public String getBIZ_CODE() {
		return BIZ_CODE;
	}
	public void setBIZ_CODE(String bIZ_CODE) {
		BIZ_CODE = bIZ_CODE;
	}
	public String getBIZ_ITEM() {
		return BIZ_ITEM;
	}
	public void setBIZ_ITEM(String bIZ_ITEM) {
		BIZ_ITEM = bIZ_ITEM;
	}
	public String getTARGET_RESULT() {
		return TARGET_RESULT;
	}
	public void setTARGET_RESULT(String tARGET_RESULT) {
		TARGET_RESULT = tARGET_RESULT;
	}
	public String getTARGET_TIME() {
		return TARGET_TIME;
	}
	public void setTARGET_TIME(String tARGET_TIME) {
		TARGET_TIME = tARGET_TIME;
	}
	public String getREAL_TIME() {
		return REAL_TIME;
	}
	public void setREAL_TIME(String rEAL_TIME) {
		REAL_TIME = rEAL_TIME;
	}
	public String getPROG_RATE() {
		return PROG_RATE;
	}
	public void setPROG_RATE(String pROG_RATE) {
		PROG_RATE = pROG_RATE;
	}
	public String getPLAN_DO() {
		return PLAN_DO;
	}
	public void setPLAN_DO(String pLAN_DO) {
		PLAN_DO = pLAN_DO;
	}
	public String getGAB_ANAL() {
		return GAB_ANAL;
	}
	public void setGAB_ANAL(String gAB_ANAL) {
		GAB_ANAL = gAB_ANAL;
	}
	public String getSCHEDULE_DT() {
		return SCHEDULE_DT;
	}
	public void setSCHEDULE_DT(String sCHEDULE_DT) {
		SCHEDULE_DT = sCHEDULE_DT;
	}
	public String getREG_DT() {
		return REG_DT;
	}
	public void setREG_DT(String rEG_DT) {
		REG_DT = rEG_DT;
	}
	public String getREG_USER() {
		return REG_USER;
	}
	public void setREG_USER(String rEG_USER) {
		REG_USER = rEG_USER;
	}
	public String getUPDATE_DT() {
		return UPDATE_DT;
	}
	public void setUPDATE_DT(String uPDATE_DT) {
		UPDATE_DT = uPDATE_DT;
	}
	public String getUPDATE_USER() {
		return UPDATE_USER;
	}
	public void setUPDATE_USER(String uPDATE_USER) {
		UPDATE_USER = uPDATE_USER;
	}
	@Override
	public String toString() {
		return "PdsContent [SEQ=" + SEQ + ", BIZ_CODE=" + BIZ_CODE
				+ ", BIZ_ITEM=" + BIZ_ITEM + ", TARGET_RESULT=" + TARGET_RESULT
				+ ", TARGET_TIME=" + TARGET_TIME + ", REAL_TIME=" + REAL_TIME
				+ ", PROG_RATE=" + PROG_RATE + ", PLAN_DO=" + PLAN_DO
				+ ", GAB_ANAL=" + GAB_ANAL + ", SCHEDULE_DT=" + SCHEDULE_DT
				+ ", REG_DT=" + REG_DT + ", REG_USER=" + REG_USER
				+ ", UPDATE_DT=" + UPDATE_DT + ", UPDATE_USER=" + UPDATE_USER
				+ "]";
	}
}
