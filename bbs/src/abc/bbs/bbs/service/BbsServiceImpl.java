package abc.bbs.bbs.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import abc.bbs.bbs.mapper.BbsMapper;
import abc.bbs.bbs.pojo.Bbs;
import abc.bbs.bbs.pojo.BbsQueryVo;
import abc.bbs.category.mapper.CategoryMapper;
import abc.bbs.category.pojo.Category;
import abc.bbs.message.mapper.MessageMapper;
import abc.bbs.message.pojo.Message;
import abc.bbs.bbs.pojo.Comment;
import abc.bbs.user.mapper.UserMapper;
import abc.bbs.user.pojo.User;
import abc.common.utils.Page;
@Service
@Transactional
public class BbsServiceImpl implements BbsService {
	
	@Autowired
	BbsMapper bbsMapper;
	
	@Autowired
	CategoryMapper categoryMapper;
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	MessageMapper messageMapper;
	

	public List<Bbs> selectAllBbs() {
		return bbsMapper.selectAllBbs();
	}

	public Bbs selectBbsById(Integer id) {
		return bbsMapper.selectBbsById(id);
	}

	public void insertComment(Comment comment) {
		
		comment.setDate(new Date());
		bbsMapper.insertComment(comment);
	}

	public List<Comment> selectCommentBybid(Integer id) {
		
		return bbsMapper.selectCommentBybid(id);
	}

	public void addCommentCount(Integer id) {
		bbsMapper.addCommentCount(id);
	}

	public void delectCommentByCid(Integer id) {
		bbsMapper.delectCommentByCid(id);
	}
	
	public void reduceCommentCount(Integer id){
		bbsMapper.reduceCommentCount(id);
	}

	public List<Bbs> selectBbsByCid(Integer cid) {
		return bbsMapper.selectBbsByCid(cid);
	}
	
	public void saveBbs(Bbs bbs){
		bbs.setCreatedat(new Date());
		bbs.setSummary("请看详细内容");
		bbsMapper.saveBbs(bbs);
	}

	public void deleteBbsAndComment(Integer id) {
		//bbsMapper.deleteCommentByBid(id);
		bbsMapper.deleteBbsByid(id);
	}

	public BbsQueryVo selectUserBbs(Integer id) {
		 List<Bbs> list = bbsMapper.selectBbsByUid(id);
		 Integer count = bbsMapper.selectCountByUid(id);
		 BbsQueryVo vo = new BbsQueryVo();
		 vo.setBbsList(list);
		 vo.setUserBbsCount(count);
		 
		return vo;
	}

	public Page<Bbs> selectBbsByQueryVo(BbsQueryVo vo) {
		
		Page<Bbs> page = new Page<>();
		//每页数
		page.setSize(5);
		vo.setSize(5);
				
		if (null != vo) {
			//计算当前页
			if (null != vo.getPage()) {
				page.setPage(vo.getPage());
				vo.setStartRow((vo.getPage() -1)*vo.getSize());
			}

		}
		if(null != vo.getBbs().getUser() && null != vo.getBbs().getUser().getUsername()){
			vo.getBbs().getUser().setUsername((vo.getBbs().getUser().getUsername().trim()));
		}
		if(null != vo.getBbs().getCategory() && null != vo.getBbs().getCategory().getName()){
			vo.getBbs().getCategory().setName((vo.getBbs().getCategory().getName().trim()));
		}
		if(null != vo.getBbs() && null != vo.getBbs().getTitle()){
			vo.getBbs().setTitle((vo.getBbs().getTitle().trim()));
		}
        
		List<Bbs> list = bbsMapper.selectBbsByQueryVo(vo);
		Integer total =  bbsMapper.selectTotalCount(vo);
		
		for (Bbs bbs : list) {
			//通过Categoryid和getAuthorid()查询
			Category category = new Category();
			category.setName(categoryMapper.selectCategoryById(bbs.getCategoryid()).getName());
			bbs.setCategory(category);
			User user = new User();
			user.setUsername(userMapper.selectUserById(bbs.getAuthorid()).getUsername());
			bbs.setUser(user);
		}
		page.setTotal(total);
		page.setRows(list);
		return page;
	}

	//添加信息
	public void addMessage(Bbs bbs, Comment comment,Integer id) {
		Message message = new Message();
		message.setType(1);
		message.setBbsid(comment.getBbsid());
		message.setContent(comment.getContent());
		message.setDate(new Date());
		message.setSponsorid(id);
		message.setReadtype(0);
		//获取接收人
		message.setRecipientid(bbs.getAuthorid());
		
		//获取论坛
		message.setCategoryid(bbs.getCategoryid());
		messageMapper.insert(message);
	}
}
