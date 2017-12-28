package db;

public final class DatabaseContract {
	private DatabaseContract() { }
	public static final String database_name = "seminar_hall_booking";
	public static final String password = "seminar";
	public static final String username = "root";
	
	public static final class Bookings {
		public static final String table_name = "bookings";
		public static final String column_date = "booking_date";
		public static final String column_period = "period";
		public static final String column_hallNumber = "hall_number";
		public static final String column_staff_id = "staff_id";
		public static final String column_year = "year";
		public static final String column_branch = "branch";
		public static final String column_section = "section";
	}
	
	public static final class SeminarHall {
		public static final String table_name = "seminar_hall";
		public static final String column_hallNumber = "hall_number";
		public static final String column_branch = "branch";
	}
	
	public static final class StaffDetails {
		public static final String table_name = "staff_details";
		public static final String column_staffid ="staff_id";
		public static final String column_staffName = "staff_name";
		public static final String column_branch = "branch";
	}
	
	public static final class SubjectHandled {
		public static final String table_name = "subject_handled";
		public static final String column_staffid = "staff_id";
		public static final String column_class = "class";
		public static final String column_subjecCode = "subject_code";
		public static final String column_subjectTitle = "subject_title";
	}
}
