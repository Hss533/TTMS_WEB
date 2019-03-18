package com.ttms.entity;

/**
 * 座位
 * @author Administrator
 *
 */
public class Seat 
{
	private Integer id;				// 座位id
	private int row;				// 行数
	private int col;				// 列数
	
	private Studio studio;			// 演出厅id
	private SeatType seatType;		// 座位状态
	
	public Seat()
	{
		super();
	}
	public Seat(int row,int col,Studio studio)
	{
		this.row=row;
		this.col=col;
		this.studio=studio;
		
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Studio getStudio() {
		return studio;
	}
	public void setStudio(Studio studio) {
		this.studio = studio;
	}
	public int getRow() {
		return row;
	}
	public void setRow(int row) {
		this.row = row;
	}
	public int getCol() {
		return col;
	}
	public void setCol(int col) {
		this.col = col;
	}
	public SeatType getSeatType() {
		return seatType;
	}
	public void setSeatType(SeatType seatType) {
		this.seatType = seatType;
	}

}
