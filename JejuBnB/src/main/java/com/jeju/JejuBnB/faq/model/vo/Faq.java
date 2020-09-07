package com.jeju.JejuBnB.faq.model.vo;

public class Faq implements java.io.Serializable{
	private static final long serialVersionUID = 2002L;
	
	private int faq_no;
	private String faq_title;
	private String faq_rcontent;
	private int faqcategory_no;
	
	public Faq() {}

	public Faq(int faq_no, String faq_title, String faq_rcontent, int faqcategory_no) {
		super();
		this.faq_no = faq_no;
		this.faq_title = faq_title;
		this.faq_rcontent = faq_rcontent;
		this.faqcategory_no = faqcategory_no;
	}

	public int getFaq_no() {
		return faq_no;
	}

	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_rcontent() {
		return faq_rcontent;
	}

	public void setFaq_rcontent(String faq_rcontent) {
		this.faq_rcontent = faq_rcontent;
	}

	public int getFaqcategory_no() {
		return faqcategory_no;
	}

	public void setFaqcategory_no(int faqcategory_no) {
		this.faqcategory_no = faqcategory_no;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Faq [faq_no=" + faq_no + ", faq_title=" + faq_title + ", faq_rcontent=" + faq_rcontent
				+ ", faqcategory_no=" + faqcategory_no + "]";
	}
	
	
}
 