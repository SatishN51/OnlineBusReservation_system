package com.busReserve.forms;

import java.util.List;

import org.apache.struts.action.ActionForm;

import com.busReserve.VO.ReservationVO;

public class ReservationForm extends ActionForm {
   
    private static final long serialVersionUID = 1L;

    private String source;
    private String destination;
    private String fromDate;
    private String toDate;
    List<ReservationVO> busDetailsList;
    private String route;
    private String time;
    private String busType;
    private String seats;
    private String price;
    private String passName1;
    private String passAge1;
    private String passMob1;
    private String passSeat1;
    private String passName2;
    private String passAge2;
    private String passMob2;
    private String passSeat2;
    private String passName3;
    private String passAge3;
    private String passMob3;
    private String passSeat3;
    private String passName4;
    private String passAge4;
    private String passMob4;
    private String passSeat4;
    
    public String getSource() {
        return source;
    }
    public void setSource(String source) {
        this.source = source;
    }
    public String getDestination() {
        return destination;
    }
    public void setDestination(String destination) {
        this.destination = destination;
    }
    public String getFromDate() {
        return fromDate;
    }
    public void setFromDate(String fromDate) {
        this.fromDate = fromDate;
    }
    public String getToDate() {
        return toDate;
    }
    public void setToDate(String toDate) {
        this.toDate = toDate;
    }
    
    
    public List<ReservationVO> getBusDetailsList() {
        return busDetailsList;
    }
    public void setBusDetailsList(List<ReservationVO> busDetailsList) {
        this.busDetailsList = busDetailsList;
    }
    
    public String getRoute() {
        return route;
    }
    public void setRoute(String route) {
        this.route = route;
    }
    public String getTime() {
        return time;
    }
    public void setTime(String time) {
        this.time = time;
    }
    public String getBusType() {
        return busType;
    }
    public void setBusType(String busType) {
        this.busType = busType;
    }
    public String getSeats() {
        return seats;
    }
    public void setSeats(String seats) {
        this.seats = seats;
    }
    public String getPrice() {
        return price;
    }
    public void setPrice(String price) {
        this.price = price;
    }
    
    
    public String getPassName1() {
        return passName1;
    }
    public void setPassName1(String passName1) {
        this.passName1 = passName1;
    }
    public String getPassAge1() {
        return passAge1;
    }
    public void setPassAge1(String passAge1) {
        this.passAge1 = passAge1;
    }
    public String getPassMob1() {
        return passMob1;
    }
    public void setPassMob1(String passMob1) {
        this.passMob1 = passMob1;
    }
    public String getPassSeat1() {
        return passSeat1;
    }
    public void setPassSeat1(String passSeat1) {
        this.passSeat1 = passSeat1;
    }
    public String getPassName2() {
        return passName2;
    }
    public void setPassName2(String passName2) {
        this.passName2 = passName2;
    }
    public String getPassAge2() {
        return passAge2;
    }
    public void setPassAge2(String passAge2) {
        this.passAge2 = passAge2;
    }
    public String getPassMob2() {
        return passMob2;
    }
    public void setPassMob2(String passMob2) {
        this.passMob2 = passMob2;
    }
    public String getPassSeat2() {
        return passSeat2;
    }
    public void setPassSeat2(String passSeat2) {
        this.passSeat2 = passSeat2;
    }
    public String getPassName3() {
        return passName3;
    }
    public void setPassName3(String passName3) {
        this.passName3 = passName3;
    }
    public String getPassAge3() {
        return passAge3;
    }
    public void setPassAge3(String passAge3) {
        this.passAge3 = passAge3;
    }
    public String getPassMob3() {
        return passMob3;
    }
    public void setPassMob3(String passMob3) {
        this.passMob3 = passMob3;
    }
    public String getPassSeat3() {
        return passSeat3;
    }
    public void setPassSeat3(String passSeat3) {
        this.passSeat3 = passSeat3;
    }
    public String getPassName4() {
        return passName4;
    }
    public void setPassName4(String passName4) {
        this.passName4 = passName4;
    }
    public String getPassAge4() {
        return passAge4;
    }
    public void setPassAge4(String passAge4) {
        this.passAge4 = passAge4;
    }
    public String getPassMob4() {
        return passMob4;
    }
    public void setPassMob4(String passMob4) {
        this.passMob4 = passMob4;
    }
    public String getPassSeat4() {
        return passSeat4;
    }
    public void setPassSeat4(String passSeat4) {
        this.passSeat4 = passSeat4;
    }
    public ReservationForm() {
        super();
        // TODO Auto-generated constructor stub
    }
    public ReservationForm(String source, String destination, String fromDate,
            String toDate) {
        super();
        this.source = source;
        this.destination = destination;
        this.fromDate = fromDate;
        this.toDate = toDate;
    }
    
   
    
}
