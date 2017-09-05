package abc.bbs.bbs.service;

import java.util.List;

import abc.bbs.bbs.pojo.Bbs;
import abc.bbs.bbs.pojo.BbsQueryVo;
import abc.bbs.category.pojo.Category;
import abc.bbs.bbs.pojo.Comment;
import abc.bbs.user.pojo.User;
import abc.common.utils.Page;

public interface BbsService {
	public List<Bbs> selectAllBbs();
	
	public Bbs selectBbsById(Integer id);
	
	/**
	 * 只针对文章 不针对评论
	 * @param comment
	 */
	public void insertComment(Comment comment);
	
	/**
	 * 通过帖子的id查询评论
	 * @param id
	 * @return
	 */
	public List<Comment> selectCommentBybid(Integer id);
	
	//评论数量+1
	public void addCommentCount(Integer id);
	
	//删除评论
	public void delectCommentByCid(Integer id);
	
	//评论数量-1
	public void reduceCommentCount(Integer id);
	
	//通过分类查询bbs
	public List<Bbs> selectBbsByCid(Integer cid);
	
	//发帖
	public void saveBbs(Bbs bbs);
	
	//删帖
	public void deleteBbsAndComment(Integer id);
	
	//通过用户id查询帖子和数量
	public BbsQueryVo selectUserBbs(Integer id);
	
	public Page<Bbs> selectBbsByQueryVo(BbsQueryVo vo);

	public void addMessage(Bbs bbs, Comment comment,Integer id);
}
