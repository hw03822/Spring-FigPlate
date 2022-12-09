package com.kosa.myapp.diner.model;

public class DinerUploadFileVO {
	private int fileId;
	private int dinerId;
	private String fileName;
	private long fileSize;
	private String fileContentType;
	private byte[] fileData;
	
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
	public int getDinerId() {
		return dinerId;
	}
	public void setDinerId(int dinerId) {
		this.dinerId = dinerId;
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
	public byte[] getFileData() {
		return fileData;
	}
	public void setFileData(byte[] fileData) {
		this.fileData = fileData;
	}
	
	@Override
	public String toString() {
		return "DinerUploadFileVO [fileId=" + fileId + ", dinerId=" + dinerId + ", fileName=" + fileName + ", fileSize="
				+ fileSize + ", fileContentType=" + fileContentType + "]";
	}
}
