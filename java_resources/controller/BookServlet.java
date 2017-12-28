package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBHelper;
import db.DBHelperImpl;

public class BookServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response) {
		DBHelper dbhelper = new DBHelperImpl();
		String date = request.getParameter("booking-date");
		String hall = request.getParameter("hall");
    int period = Integer.parseInt(request.getParameter("hour"));
    String bookClass = request.getParameter("class");
		int staffId = Integer.parseInt(request.getParameter("staffId"));
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yy");
		System.out.println("The period and class "+ period + bookClass);
		System.out.println(staffId);
		try {
			Date bookingDate = formatter.parse(date);
			Boolean status = dbhelper.book(bookingDate,period,hall,staffId,bookClass);
			if(status) {
				System.out.println("Successs");
			}
			else {
				System.out.println("Failure");
			}
		}
		catch (ParseException e) {
			e.printStackTrace();
		}
		//System.out.println("The period and class "+ period + bookClass);
	}

}
