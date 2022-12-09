package com.kosa.myapp.diner.model;

import java.sql.Timestamp;

import javax.validation.constraints.Pattern;

import org.springframework.web.multipart.MultipartFile;

public class DinerVO {
	
	private int dinerId;
	private String dinerWriterId;
	private String dinerTitle;
	private String dinerContent;
	private Timestamp dinerWriteDate;
	private int dinerReadCount;
	private int dinerLikeCount;
	private int dinerSeq;
	private int dinerPage;
	private double dinerStar;
	private int menuId; //�޴� ī�װ� ���̵�
	
	private MultipartFile file; //���� ������ ����
	private int fileId;
	private String fileName;
	private long fileSize;
	private String fileContentType;
	public int getDinerId() {
		return dinerId;
	}
	public void setDinerId(int dinerId) {
		this.dinerId = dinerId;
	}
	public String getDinerWriterId() {
		return dinerWriterId;
	}
	public void setDinerWriterId(String dinerWriterId) {
		this.dinerWriterId = dinerWriterId;
	}
	public String getDinerTitle() {
		return dinerTitle;
	}
	public void setDinerTitle(String dinerTitle) {
		this.dinerTitle = dinerTitle;
	}
	public String getDinerContent() {
		return dinerContent;
	}
	public void setDinerContent(String dinerContent) {
		this.dinerContent = dinerContent;
	}
	public Timestamp getDinerWriteDate() {
		return dinerWriteDate;
	}
	public void setDinerWriteDate(Timestamp dinerWriteDate) {
		this.dinerWriteDate = dinerWriteDate;
	}
	public int getDinerReadCount() {
		return dinerReadCount;
	}
	public void setDinerReadCount(int dinerReadCount) {
		this.dinerReadCount = dinerReadCount;
	}
	public int getDinerLikeCount() {
		return dinerLikeCount;
	}
	public void setDinerLikeCount(int dinerLikeCount) {
		this.dinerLikeCount = dinerLikeCount;
	}
	public int getDinerSeq() {
		return dinerSeq;
	}
	public void setDinerSeq(int dinerSeq) {
		this.dinerSeq = dinerSeq;
	}
	public int getDinerPage() {
		return dinerPage;
	}
	public void setDinerPage(int dinerPage) {
		this.dinerPage = dinerPage;
	}
	public double getDinerStar() {
		return dinerStar;
	}
	public void setDinerStar(double dinerStar) {
		this.dinerStar = dinerStar;
	}
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	@Override
	public String toString() {
		return "DinerVO [dinerId=" + dinerId + ", dinerWriterId=" + dinerWriterId + ", dinerTitle=" + dinerTitle
				+ ", dinerContent=" + dinerContent + ", dinerWriteDate=" + dinerWriteDate + ", dinerReadCount="
				+ dinerReadCount + ", dinerLikeCount=" + dinerLikeCount + ", dinerSeq=" + dinerSeq + ", dinerPage="
				+ dinerPage + ", dinerStar=" + dinerStar + ", menuId=" + menuId + ", file=" + file + ", fileId="
				+ fileId + ", fileName=" + fileName + ", fileSize=" + fileSize + ", fileContentType=" + fileContentType
				+ "]";
	}
	

	
}
