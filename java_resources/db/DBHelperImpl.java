package db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import db.DatabaseConnector;

public class DBHelperImpl implements DBHelper {

	private Connection DBConnection;
	private ResultSet result;
	private Map<Integer,Integer> bookings;
	private Map<String,String> subjectsByClass;
	private PreparedStatement statement;
	private String displayStatement = "Select " +
			DatabaseContract.Bookings.column_period + "," +
			DatabaseContract.Bookings.column_staff_id +" from " +
			DatabaseContract.Bookings.table_name + " where " +
		    DatabaseContract.Bookings.column_date + " = ? and " +
		    DatabaseContract.Bookings.column_hallNumber + " in (select " +
		    DatabaseContract.SeminarHall.column_hallNumber + " from " +
		    DatabaseContract.SeminarHall.table_name + " where " +
		    DatabaseContract.SeminarHall.column_branch + " = ? ) order by period";
	private String bookStatement = "insert into " +
		    DatabaseContract.Bookings.table_name +"(" +
		    DatabaseContract.Bookings.column_date + "," +
		    DatabaseContract.Bookings.column_period + "," +
		    DatabaseContract.Bookings.column_hallNumber + "," +
		    DatabaseContract.Bookings.column_staff_id + "," +
		    DatabaseContract.Bookings.column_year + "," +
		    DatabaseContract.Bookings.column_branch + "," +
		    DatabaseContract.Bookings.column_section + ") values(?,?,(select "+
		    DatabaseContract.SeminarHall.column_hallNumber + " from " +
		    DatabaseContract.SeminarHall.table_name + " where " +
		    DatabaseContract.SeminarHall.column_branch + " = ?),?,?,?,?)";
	private String getStaffStatement = "Select " +
		    DatabaseContract.StaffDetails.column_staffName + " from " +
		    DatabaseContract.StaffDetails.table_name + " where " +
		    DatabaseContract.StaffDetails.column_staffid + " = ? ";
	private String getSubjectAndClassStatement = "select " +
		    DatabaseContract.SubjectHandled.column_class + "," +
			DatabaseContract.SubjectHandled.column_subjectTitle + " from " +
		    DatabaseContract.SubjectHandled.table_name + " where " +
			DatabaseContract.SubjectHandled.column_staffid + " = ?";

	public DBHelperImpl() {
		try {
			DBConnection = DatabaseConnector.getConnection();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	public Map<Integer,Integer> getBookings(Date date,String hall) {
		try {
			statement = DBConnection.prepareStatement(displayStatement);
			SimpleDateFormat dateFormatter = new SimpleDateFormat("yy-MM-dd");
			String booking_date = dateFormatter.format(date);
			bookings = new HashMap<Integer,Integer>();
			System.out.println(booking_date);
			statement.setString(1, booking_date);
			statement.setString(2, hall);
			result = statement.executeQuery();
			while(result.next()) {
				bookings.put((Integer)result.getInt(1),Integer.parseInt(result.getString(2)));
			}
			return bookings;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bookings;
	}

	public Boolean book(Date date,int period,String hall,int staffId,String bookClass) {
		try {
			statement = DBConnection.prepareStatement(bookStatement);
			SimpleDateFormat dateFormatter = new SimpleDateFormat("yy-MM-dd");
			String booking_date = dateFormatter.format(date);
			System.out.println("Helo");
			String[] splitClass = bookClass.split(" ");
			int year = Integer.parseInt(splitClass[0]);
			String branch = splitClass[1];
			String section = splitClass[2];
			statement.setString(1, booking_date);
			statement.setInt(2, period);
			statement.setString(3, hall);
			statement.setInt(4, staffId);
			statement.setInt(5, year);
			statement.setString(6, branch);
			statement.setString(7, section);
			statement.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public String getStaffByName(int staffId) {
		try {
			statement = DBConnection.prepareStatement(getStaffStatement);
			statement.setInt(1, staffId);
			result = statement.executeQuery();
			result.next();
			return result.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public Map<String,String> getSubjectsAndClasses(int staffId) {
		try {
			statement = DBConnection.prepareStatement(getSubjectAndClassStatement);
			statement.setInt(1, staffId);
			result = statement.executeQuery();
			subjectsByClass = new HashMap<String,String>();
			while(result.next()) {
				subjectsByClass.put(result.getString(1),result.getString(2));
			}
			return subjectsByClass;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
