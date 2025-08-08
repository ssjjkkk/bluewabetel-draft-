package com.bluewavetel.dto.common;

public class TypeDto {
	
	/** 주제 */
	private String Category;
	/** 유형 */
	private String TypeCd;
	/** 유형명 */
	private String TypeName;
	/** 유형명 */
	private String TypeEngName;
	/** 서열 */
	private String TypeRank;
	/** 사용여부 */
	private String useYn;

	public String getCategory() {
		return Category;
	}
	public void setCategory(String category) {
		Category = category + "_TYPE";
	}
	public String getTypeCd() {
		return TypeCd;
	}
	public void setTypeCd(String typeCd) {
		TypeCd = typeCd;
	}
	public String getTypeName() {
		return TypeName;
	}
	public void setTypeName(String typeName) {
		TypeName = typeName;
	}
	public String getTypeEngName() {
		return TypeEngName;
	}
	public void setTypeEngName(String typeEngName) {
		TypeEngName = typeEngName;
	}
	public String getTypeRank() {
		return TypeRank;
	}
	public void setTypeRank(String typeRank) {
		TypeRank = typeRank;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	
}
