package com.smhrd.web.entity;

import org.hibernate.annotations.ColumnDefault;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
// 엔티티 클래스임을 나타내는 annotation
@Entity 
//(선택)해당하는 클래스가 datamembeer 테이블을 나타내는 클래스임을 표시
@Table(name="datamember") 
public class DataMember {
	// DB 테이블 자체를 의미하는 클래스
	
	
	// @id : primary key 의미
	@Id // 제공하는 package가 persistence 여야 한다. 다른 패키지랑 헷갈리면 ㄴㄴ
	// @Column : 해당하는 필드에 대응되는 테이블 컬럼의 디테일한 설정이 가능
	@Column(name="id", length = 100)
	private String id;
	@Column(nullable=false, length = 100)
	private String pw;
	// default값 설정 필요
	@ColumnDefault("'user'")
	@Column(nullable = false, insertable = false)
	private String roles;

}
