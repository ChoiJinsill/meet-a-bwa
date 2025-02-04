/**
 * 
 * @author 김예은
 *
 */
package test.com.event.model;

public interface EventDB {
	String DRIVER_NAME = "oracle.jdbc.OracleDriver";
	String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	String USER = "mab_test_db";
	String PASSWORD = "test1234";
	
	String SQL_INSERT_EVENT
		= "insert into TEST_EVENT(EVENT_NO, EVENT_TITLE, EVENT_DESCRIPTION, EVENT_DATE, EVENT_D_DAY, ACTIVITY_NO, USER_NO) "
		+ "values ('E'||SEQ_TEST_EVENT.NEXTVAL, ? , ? , sysdate, ?, ?, ?)";
	String SQL_DELETE_EVENT
		= "DELETE FROM TEST_EVENT WHERE EVENT_NO = ?";
	String SQL_UPDATE_EVENT
	= "UPDATE TEST_EVENT SET EVENT_TITLE = ?, EVENT_DESCRIPTION = ?, EVENT_D_DAY = ?"
	+ "WHERE EVENT_NO = ?";
	
	String SQL_EVENT_SELECT_ALL_A = "SELECT EVENT_NO, EVENT_TITLE, EVENT_DESCRIPTION, EVENT_DATE , EVENT_D_DAY, ACTIVITY_NO, USER_NO FROM TEST_EVENT WHERE ACTIVITY_NO=? ORDER BY EVENT_NO DESC";
	String SQL_EVENT_SELECT_ONE = "SELECT * FROM TEST_EVENT WHERE EVENT_NO = ?";
}
