package VO;
public class SensorDetailsVO {
	private int sensor_id;
	private String sensor_name;
	private String sensor_desc;
	private String sensor_type;
	private int sensor_cluster;
	private String sensor_status;
	private int zipcode;
	private String address1;
	private String address2;
	private String city;
	private String state;
	private String country;
	private Double latitude;
	private Double longitude;
	
	public Double getLatitude() {
		return latitude;
	}
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	public Double getLongitude() {
		return longitude;
	}
	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}
	public int getSensor_id() {
		return sensor_id;
	}
	public void setSensor_id(int sensor_id) {
		this.sensor_id = sensor_id;
	}
	public String getSensor_name() {
		return sensor_name;
	}
	public void setSensor_name(String sensor_name) {
		this.sensor_name = sensor_name;
	}
	public String getSensor_desc() {
		return sensor_desc;
	}
	public void setSensor_desc(String sensor_desc) {
		this.sensor_desc = sensor_desc;
	}
	public String getSensor_type() {
		return sensor_type;
	}
	public void setSensor_type(String sensor_type) {
		this.sensor_type = sensor_type;
	}
	public int getSensor_cluster() {
		return sensor_cluster;
	}
	public void setSensor_cluster(int sensor_cluster) {
		this.sensor_cluster = sensor_cluster;
	}
	public String getSensor_status() {
		return sensor_status;
	}
	public void setSensor_status(String sensor_status) {
		this.sensor_status = sensor_status;
	}
	public int getZipcode() {
		return zipcode;
	}
	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}
	
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	
	
}
