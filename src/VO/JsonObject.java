package VO;

import java.util.List;

public class JsonObject {
	public List<String> routes;
	public List<LatLng> points;
	
	public List<String> getRoutes() {
		return routes;
	}
	public void setRoutes(List<String> routes) {
		this.routes = routes;
	}
	public List<LatLng> getPoints() {
		return points;
	}
	public void setPoints(List<LatLng> points) {
		this.points = points;
	}
}
