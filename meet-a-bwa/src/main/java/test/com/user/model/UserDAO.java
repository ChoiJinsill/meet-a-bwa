package test.com.user.model;

public interface UserDAO {

	public int user_insert(UserVO uvo);
	public UserVO idCheck(UserVO uvo);
	public UserVO nickCheck(UserVO uvo);
	public UserVO emailCheck(UserVO uvo);
	public UserVO user_selectOne(UserVO uvo);
	public int user_update(UserVO uvo);
	public int user_delete(UserVO uvo);
	
//	public int interest_insert(InterestVO ivo);
}
