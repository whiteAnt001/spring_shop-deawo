package model;

public class StartEnd {
	private int state;//배송상태:0,1,2
	private int start;
	private int end;
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
}
