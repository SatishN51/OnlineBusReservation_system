package com.busReserve.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.busReserve.VO.ReservationVO;

public class DBfile {
    String lastName;
    String dbUserName = "ythangal";
    String password = "FL01641060";
    public Connection getConnection() throws ClassNotFoundException, SQLException
    {
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");   //Load the Oracle JDBC driver
          //Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:csdb",dbUserName,password);
            return conn;
        }
        catch (ClassNotFoundException  e)
        {
            e.printStackTrace();
            System.out.println("couldn't load database driver");
            return null;
        }
        
        
    }
    
    public List<ReservationVO> getDetails (ReservationVO reservationVO) throws SQLException
    {
        List<ReservationVO> busDetailsList = new ArrayList<ReservationVO>();
        String date = reservationVO.getFromDate();
        System.out.println("111\t"+date);
       // DateFormat df = new SimpleDateFormat("dd-MON-yy");
        Date oDate=null;
        /*try {
            oDate = df.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }*/
        try
        {     
             //Create a Statement
            Connection conn =getConnection();
            Statement stmt = conn.createStatement ();
    
            //Execute the query in quotes
            //SELECT ROUTEID,TRAVELTIME,BUSTYPE,AVAILABLESEATS,PRICE FROM BUSROUTE WHERE SOURCE='' AND DESTINATION='' AND DATE='';
            ResultSet rset = stmt.executeQuery ("select ROUTEID,TRAVELTIME,BUSTYPE,AVAILABLESEATS from BUSTABLE B INNER JOIN ROUTE R ON B.BUSID=R.RBUSID WHERE SOURCE='"+reservationVO.getSource().toUpperCase()+"' and DESTINATION='"+reservationVO.getDestination().toUpperCase()+"' and TRAVELDATE= TO_DATE('"+date+"','DD-MON-YY') "); //and R.TRAVELDATE='"+oDate+"'
            if (!rset.next() ) 
            {    
                System.out.println("No data"); 
            } 
            else
            {
                do
                {
                    String route = rset.getString("ROUTEID");
                    String time = rset.getString("TRAVELTIME");
                    String type = rset.getString("BUSTYPE");
                    String seats = rset.getString("AVAILABLESEATS");
                    int s =Integer.parseInt(seats);
                   // String price2 = rset.getString("PRICE");
                    if(s != 0)
                    {
                        ReservationVO reservationVO1 = new ReservationVO();
                        reservationVO1.setRoute(route);
                        reservationVO1.setTime(time);
                        reservationVO1.setBusType(type);
                        reservationVO1.setSeats(seats);
                        reservationVO1.setPrice("50");
                        busDetailsList.add(reservationVO1);
                    }
                    
                    
                }while (rset.next());        // Action on the result
            }    
            
        }
        catch (ClassNotFoundException  e)
        {
            e.printStackTrace();
            System.out.println("couldn't load database driver");
        }
        return busDetailsList;
    }
    public List<Integer> getSeatList(String route) throws SQLException, ClassNotFoundException
    {
        List<Integer> seatList = new ArrayList<Integer>();
        int route1=Integer.parseInt(route);
        int totalSeats=0;
        List<Integer> bookedSeats = new ArrayList<Integer>();
        
                
        try 
        {
            Connection conn =getConnection();
            CallableStatement cs = conn.prepareCall("{? = call get_capacity(?)}");
            Statement stmt = conn.createStatement ();
            cs.registerOutParameter(1, Types.INTEGER);                                  // Register the types of the return value and OUT parameter        
            cs.setInt(2, route1);
            cs.execute();       // Execute and retrieve the returned values
            totalSeats =cs.getInt(1);
            ResultSet rset = stmt.executeQuery ("select SEATNO from SEATS GROUP BY TROUTEID,SEATNO HAVING TROUTEID="+route1);
            if (!rset.next() ) 
            {    
                System.out.println("No data"); 
            } 
            else
            {
                do
                {
                    int bSeats = rset.getInt("SEATNO");
                    bookedSeats.add(bSeats);
                    
                }while (rset.next());        // Action on the result
            }
            for(int i=1;i<=totalSeats;i++)
            {
                seatList.add(i);
            }
            seatList.removeAll(bookedSeats);
            /*for(int i=1;i<=totalSeats;i++)
            {
                for(int j=0;j<bookedSeats.size();j++)
                {
                    if(i == bookedSeats.get(j))
                    {
                        seatList.removeAll(c)
                    }
                    seatList.add(i);
                }
                
            }*/
        }
        catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return seatList;
    }
    public boolean insertIntoTckt(ReservationVO reservationVO) throws SQLException
    {
       int route =Integer.parseInt(reservationVO.getRoute());
       int price = Integer.parseInt(reservationVO.getPrice());
       List<ReservationVO> passList = reservationVO.getPassList();
        try
        {     
            Connection conn =getConnection();
            for(int i=0;i<passList.size();i++)
            {
                String name= passList.get(i).getPassName();
                int age= Integer.parseInt(passList.get(i).getPassAge());
                int seat= Integer.parseInt(passList.get(i).getPassSeat());
                String tcktID = "T"+route+"00"+passList.get(i).getPassSeat();
            
              //Create a Statement
                CallableStatement cstmt = null;
                try {
                   conn.setAutoCommit(false);
                   String procName = "{call ADD_PASSENGER (?, ?, ?, ?, ?, ?, ?)}";
                   cstmt = conn.prepareCall (procName);
                 /*  System.out.println("1\t"+name);
                   System.out.println("2\t"+age);
                   System.out.println("3\t"+seat);
                   System.out.println("4\t"+tcktID);
                   System.out.println("5\t"+price);
                   System.out.println("6\t"+route);
                 */  
                   cstmt.setString(1, name);
                   cstmt.setInt(2, age);
                   cstmt.setInt(3, seat);
                   cstmt.setString(4, tcktID);
                   cstmt.setInt(5, price);
                   cstmt.setInt(6, route);
                   cstmt.setString(7, "satish1234@gmail.com");
                   cstmt.execute();
                   conn.commit();
                   conn.setAutoCommit(true);
                }
                
                catch (SQLException e) 
                {
                 System.out.println("insertion error");
                 e.printStackTrace(); 
                 return false;
                 
                }
                try
                {
                    conn.setAutoCommit(false);

                    String procName2 = "{call dec_seats (?)}";
                    cstmt = conn.prepareCall (procName2);
                    cstmt.setInt(1, route);
                    cstmt.execute();
                    conn.commit();
                    conn.setAutoCommit(true);
                }
                catch(SQLException e)
                {
                    System.out.println("seat updation error");
                    e.printStackTrace(); 
                    return false;
                    
                }
                finally 
                {
                   cstmt.close();
                }
                
            }
            
                        
            return true;
        }
        catch (ClassNotFoundException  e)
        {      
            e.printStackTrace();
            System.out.println("couldn't load database driver");
            return false;
        }
    }
}