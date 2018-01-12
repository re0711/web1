package abc.bbs.bbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import abc.bbs.bbs.pojo.Bbs;
import abc.bbs.bbs.pojo.BbsQueryVo;
import abc.bbs.category.pojo.Category;
import abc.bbs.bbs.pojo.Comment;
import abc.bbs.user.pojo.User;
import abc.common.utils.Page;

public interface BbsMapper {
	
	//加载首页的时候显示所有文章
	public List<Bbs> selectAllBbs();
	
	public Bbs selectBbsById(Integer id);
	
	public void insertComment(Comment comment);
	
	List<Comment> selectCommentBybid(Integer id);
	
	public void addCommentCount(Integer id);
	
	public void delectCommentByCid(Integer id);
	
	public void reduceCommentCount(Integer id);
	
	public List<Bbs> selectBbsByCid(Integer cid);
	
	public void saveBbs(Bbs bbs);
	
	//public void deleteCommentByBid(Integer id);
	
	public void deleteBbsByid(Integer id);
	
	public Integer selectCountByUid(Integer id);
	
	public List<Bbs> selectBbsByUid(Integer id);

	public List<Bbs> selectBbsByQueryVo(BbsQueryVo vo);

	public Integer selectTotalCount(BbsQueryVo vo);
	
	public List<Bbs> adminGetAllBbs();

}
