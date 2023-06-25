package board.model;

import org.springframework.web.multipart.MultipartFile;

public class BoardFormBean {
	private int bod_num;
	private String title;
	private String servings;
	private String time;
	private String category;
	private String tags;
	private String[] big_name;
	private String bod_image;
	private String[] big_amount;
	private String[] ing_num;
	private MultipartFile bod_image_upload;
	private String prev_bod_image;
	private String prev_bod_origin;
	private String[] contentIter;

	public String[] getContentIter() {
		return contentIter;
	}

	public void setContentIter(String[] contentIter) {
		this.contentIter = contentIter;
	}

	public String getPrev_bod_origin() {
		return prev_bod_origin;
	}

	public void setPrev_bod_origin(String prev_bod_origin) {
		this.prev_bod_origin = prev_bod_origin;
	}

	public String getPrev_bod_image() {
		return prev_bod_image;
	}

	public void setPrev_bod_image(String prev_bod_image) {
		this.prev_bod_image = prev_bod_image;
	}

	public String[] getBig_name() {
		return big_name;
	}

	public void setBig_name(String[] big_name) {
		this.big_name = big_name;
	}

	public String[] getBig_amount() {
		return big_amount;
	}

	public void setBig_amount(String[] big_amount) {
		this.big_amount = big_amount;
	}

	public String[] getIng_num() {
		return ing_num;
	}

	public void setIng_num(String[] ing_num) {
		this.ing_num = ing_num;
	}

	public String getBod_image() {
		return bod_image;
	}

	public void setBod_image(String bod_image) {
		this.bod_image = bod_image;
	}

	public MultipartFile getBod_image_upload() {
		return bod_image_upload;
	}

	public void setBod_image_upload(MultipartFile bod_image_upload) {
		this.bod_image_upload = bod_image_upload;
		this.bod_image = bod_image_upload.getOriginalFilename();
	}

	private String[] bod_content;

	private String[] image;
	private String[] prev_image;
	private String[] originImage;
	private MultipartFile[] upload;
	private String[] upload2;

	public String[] getOriginImage() {
		return originImage;
	}

	public void setOriginImage(String[] originImage) {
		this.originImage = originImage;
	}

	public String[] getImage() {
		return image;
	}

	public void setImage(String[] image) {
		this.image = image;
	}

	public String[] getPrev_image() {
		return prev_image;
	}

	public void setPrev_image(String[] prev_image) {
		this.prev_image = prev_image;
	}

	public MultipartFile[] getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile[] upload) {
		this.upload = upload;
		image = new String[upload.length];

		for (int i = 0; i < upload.length; i++) {
			this.image[i] = upload[i].getOriginalFilename();
		}

	}

	public String[] getUpload2() {
		return upload2;
	}

	public void setUpload2(String[] upload2) {
		this.upload2 = upload2;
	}

	public int getBod_num() {
		return bod_num;
	}

	public void setBod_num(int bod_num) {
		this.bod_num = bod_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getServings() {
		return servings;
	}

	public void setServings(String servings) {
		this.servings = servings;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String[] getBod_content() {
		return bod_content;
	}

	public void setBod_content(String[] bod_content) {
		this.bod_content = bod_content;
	}

}
