package com.model2.mvc.service.domain;

//==>È¸¿øÁ¤º¸¸¦ ¸ðµ¨¸µ(Ãß»óÈ­/Ä¸½¶È­)ÇÑ Bean
public class Review {
	
	///Field
	private int reNo;
	public int getReNo() {
		return reNo;
	}


	public void setReNo(int reNo) {
		this.reNo = reNo;
	}


	private Product reprod;
	private User reid;
	private int score;
	private String epil;
	

	
	
	///Constructor
	public Review(){
	}
	

	@Override
	public String toString() {
		return "ReviewVO : [reprod] "+reprod+" [reid] "+reid+" [score] "+score+" [epil] "+ epil;
	}


	public Product getReprod() {
		return reprod;
	}


	public void setReprod(Product reprod) {
		this.reprod = reprod;
	}


	public User getReid() {
		return reid;
	}


	public void setReid(User reid) {
		this.reid = reid;
	}


	public int getScore() {
		return score;
	}


	public void setScore(int score) {
		this.score = score;
	}


	public String getEpil() {
		return epil;
	}


	public void setEpil(String epil) {
		this.epil = epil;
	}
	
}