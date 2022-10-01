package test.com.vote.model;
import java.util.List;

public interface VoteDAO {
	public int insert_meetVote(VoteVO vo);
	public int insert_voteContent(VoteContentVO vo);
	public int insert_result(VoteResultVO vo);
	public int update_result(VoteResultVO vo);
	public int delete_result(String vote_no); 
	public int delete_content(String vote_no); 
	public int delete_vote(String vote_no); 
	
	public String select_last_voteNO();
	
	public String myVr_selectOne(String vote_no, String user_no);
	public List<VoteJOIN_VO> vote_selectOne(VoteVO vvo);
	public List<VoteVO> vote_selectAll();
	public List<VoteResultVO> vr_selectOne(String vote_no);
}
