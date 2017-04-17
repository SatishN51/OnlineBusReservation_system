package com.busReserve.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.busReserve.VO.ReservationVO;
import com.busReserve.forms.ReservationForm;
import com.busReserve.model.DBfile;

public class ReservationAction extends Action{
   
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) throws Exception 
    {
        ReservationForm reservationForm = (ReservationForm) form;
        ReservationVO reservationVO = new ReservationVO();
        DBfile dbfile = new DBfile();
        if(request.getParameter("path")!=null && request.getParameter("path").equalsIgnoreCase("selectedBus"))
        {
            String route=request.getParameter("route");
            String time=request.getParameter("time");
            String busType=request.getParameter("busType");
            String seats=request.getParameter("seats");
            String price=request.getParameter("price");
            reservationForm.setRoute(route);
            reservationForm.setTime(time);
            reservationForm.setBusType(busType);
            reservationForm.setSeats(seats);
            reservationForm.setPrice(price);
            reservationForm.setSource(reservationForm.getSource());
            reservationForm.setDestination(reservationForm.getDestination());
            List<Integer> sList = new ArrayList<Integer>();
            List<ReservationVO> seatList =new ArrayList<ReservationVO>();
            sList = dbfile.getSeatList(route);
            for(int i=0;i<sList.size();i++)
            {
                ReservationVO r = new ReservationVO();
                System.out.println("check here\t"+sList.get(i));
                r.setsNo(sList.get(i));
                seatList.add(r);
            }
            
            
            request.setAttribute("seatList", seatList);
            
            
            return mapping.findForward("journeyDetails");
            
        }
        else if(request.getParameter("path")!=null && request.getParameter("path").equalsIgnoreCase("selectedPassengers"))
        {
            if(reservationForm.getPassName2()!= null && !reservationForm.getPassName2().equalsIgnoreCase(""))
            {
                request.setAttribute("p2", "2yes");
            }
            else
            {
                request.setAttribute("p2", "2no");
            }
            if(reservationForm.getPassName3()!= null && !reservationForm.getPassName3().equalsIgnoreCase(""))
            {
                request.setAttribute("p3", "3yes");
            }
            else
            {
                request.setAttribute("p3", "3no");
            }
            if(reservationForm.getPassName4()!= null && !reservationForm.getPassName4().equalsIgnoreCase(""))
            {
                request.setAttribute("p4", "4yes");
            }
            else
            {
                request.setAttribute("p4", "4no");
            }
            
            return mapping.findForward("confirmDetails");        
        }
        else if(request.getParameter("path")!=null && request.getParameter("path").equalsIgnoreCase("confirmTckt"))
        {
            List<ReservationVO> passList = new ArrayList<ReservationVO>();
            ReservationVO rVO1 = new ReservationVO();
            rVO1.setPassName(reservationForm.getPassName1());
            rVO1.setPassAge(reservationForm.getPassAge1());
            rVO1.setPassMob(reservationForm.getPassMob1());
            rVO1.setPassSeat(reservationForm.getPassSeat1());
            passList.add(rVO1);
            if(reservationForm.getPassName2() !=null && !reservationForm.getPassName2().equalsIgnoreCase(""))
            {
                ReservationVO rVO2 = new ReservationVO();
                rVO2.setPassName(reservationForm.getPassName2());
                rVO2.setPassAge(reservationForm.getPassAge2());
                rVO2.setPassMob(reservationForm.getPassMob2());
                rVO2.setPassSeat(reservationForm.getPassSeat2());
                passList.add(rVO2);
                
            }
            if(reservationForm.getPassName3() !=null && !reservationForm.getPassName3().equalsIgnoreCase(""))
            {
                ReservationVO rVO3 = new ReservationVO();
                rVO3.setPassName(reservationForm.getPassName3());
                rVO3.setPassAge(reservationForm.getPassAge3());
                rVO3.setPassMob(reservationForm.getPassMob3());
                rVO3.setPassSeat(reservationForm.getPassSeat3());
                passList.add(rVO3);
                
            }if(reservationForm.getPassName4() !=null && !reservationForm.getPassName4().equalsIgnoreCase(""))
            {
                ReservationVO rVO4 = new ReservationVO();
                rVO4.setPassName(reservationForm.getPassName4());
                rVO4.setPassAge(reservationForm.getPassAge4());
                rVO4.setPassMob(reservationForm.getPassMob4());
                rVO4.setPassSeat(reservationForm.getPassSeat4());
                passList.add(rVO4);
                
            }
            reservationVO.setPassList(passList);
            reservationVO.setFromDate(reservationForm.getFromDate());
            reservationVO.setToDate(reservationForm.getToDate());
            reservationVO.setSource(reservationForm.getSource());
            reservationVO.setDestination(reservationForm.getDestination());
            reservationVO.setRoute(reservationForm.getRoute());
            reservationVO.setTime(reservationForm.getTime());
            reservationVO.setBusType(reservationForm.getBusType());
            reservationVO.setSeats(reservationForm.getSeats());
            reservationVO.setPrice(reservationForm.getPrice());
            reservationVO.setPassName1(reservationForm.getPassName1());
            reservationVO.setPassName2(reservationForm.getPassName2());
            reservationVO.setPassName3(reservationForm.getPassName3());
            reservationVO.setPassName4(reservationForm.getPassName4());
            reservationVO.setPassAge1(reservationForm.getPassAge1());
            reservationVO.setPassAge2(reservationForm.getPassAge2());
            reservationVO.setPassAge3(reservationForm.getPassAge3());
            reservationVO.setPassAge4(reservationForm.getPassAge4());
            reservationVO.setPassMob1(reservationForm.getPassMob1());
            reservationVO.setPassMob2(reservationForm.getPassMob2());
            reservationVO.setPassMob3(reservationForm.getPassMob3());
            reservationVO.setPassMob4(reservationForm.getPassMob4());
            reservationVO.setPassSeat1(reservationForm.getPassSeat1());
            reservationVO.setPassSeat2(reservationForm.getPassSeat2());
            reservationVO.setPassSeat3(reservationForm.getPassSeat3());
            reservationVO.setPassSeat4(reservationForm.getPassSeat4());
           
            boolean result =dbfile.insertIntoTckt(reservationVO);
            if(result)
            {
                
                request.setAttribute("msg", "success");
            }
            else
            {
                request.setAttribute("msg", "fail");
            }
           return mapping.findForward("success");
            
        }
        
        else 
        {
            List<ReservationVO> busDetailsList = new ArrayList<ReservationVO>();
            
            
            System.out.println(reservationForm.getFromDate());
            System.out.println(reservationForm.getSource());
            System.out.println(reservationForm.getDestination());
            System.out.println(reservationForm.getToDate());
            reservationVO.setFromDate(reservationForm.getFromDate());
            reservationVO.setToDate(reservationForm.getToDate());
            reservationVO.setSource(reservationForm.getSource());
            reservationVO.setDestination(reservationForm.getDestination());
           
            
            busDetailsList=dbfile.getDetails(reservationVO);
            if(busDetailsList.size()==0)
            {
                request.setAttribute("list", "novalues");   
            }
            else
            {
                request.setAttribute("list", "notempty");
                reservationForm.setBusDetailsList(busDetailsList);
            }
            
            return mapping.findForward("busDetailsList");
        }
        
        
    }

}
