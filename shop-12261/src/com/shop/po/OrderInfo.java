package com.shop.po;

import java.math.BigDecimal;

public class OrderInfo {
	private String userName;
	private String telephone;
	private String userAdress;
	private Long orderNumber;
	private BigDecimal payAmount;
	private String name;
	private Integer buyNumber;
	//private Byte orderStatus;
	private String remarks;
	public OrderInfo() {
		super();
	}
	public OrderInfo(String userName, String telephone, String userAdress,
			Long orderNumber, BigDecimal payAmount, String name,
			Integer buyNumber, String remarks) {
		super();
		this.userName = userName;
		this.telephone = telephone;
		this.userAdress = userAdress;
		this.orderNumber = orderNumber;
		this.payAmount = payAmount;
		this.name = name;
		this.buyNumber = buyNumber;
		this.remarks = remarks;
	}
	@Override
	public String toString() {
		return "OrderInfo [userName=" + userName + ", telephone=" + telephone
				+ ", userAdress=" + userAdress + ", orderNumber=" + orderNumber
				+ ", payAmount=" + payAmount + ", name=" + name
				+ ", buyNumber=" + buyNumber + ", orderStatus=" + remarks
				+ "]";
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getUserAdress() {
		return userAdress;
	}
	public void setUserAdress(String userAdress) {
		this.userAdress = userAdress;
	}
	public Long getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(Long orderNumber) {
		this.orderNumber = orderNumber;
	}
	public BigDecimal getPayAmount() {
		return payAmount;
	}
	public void setPayAmount(BigDecimal payAmount) {
		this.payAmount = payAmount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getBuyNumber() {
		return buyNumber;
	}
	public void setBuyNumber(Integer buyNumber) {
		this.buyNumber = buyNumber;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	
}
