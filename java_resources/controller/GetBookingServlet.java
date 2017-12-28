package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBHelper;
import db.DBHelperImpl;

public class GetBookingServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws 
	ServletException,IOException {
		DBHelper dbhelper = new DBHelperImpl();
		String date = request.getParameter("booking-date");
		String hall = request.getParameter("hall");
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yy");
		try {
			Date bookingDate = formatter.parse(date); 
			Map <Integer,Integer> bookings = dbhelper.getBookings(bookingDate,hall);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/booking-form.jsp");
			request.setAttribute("bookingsData", bookings);
			dispatcher.forward(request, response);
		}
		catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
