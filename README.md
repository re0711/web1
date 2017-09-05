## 简介
这是一个基于SSM架构的简易bbs论坛。
## 环境
开发环境：Eclipse_mars
数据库管理工具：mysql5.5
Jdk版本：1.7
服务器:tomcat 7
## 已实现的主要功能
登录 登出 注册  
加载首页（查看分类，帖子）   
查看帖子详情（查看帖子详情和评论）  
添加、删除评论（登录的用户可以操作、只能删自己的评论）  
板块切换  
判断是否登录（使用某些功能如果未登录，跳转到登录页面）  
发帖 删帖（只能删自己的帖子）  
个人中心（查看个人信息和发的帖子）  
个人信息编辑（包括上传图片 用户名重复校验以及其他校验）  
按条件搜索帖子(标题，板块，作者)  
消息中心（查看别人对你的帖子的回复，有新消息时提醒）  
后台管理（删除帖子）  
关注或取消关注其他用户  

### 添加评论（未完成消息提醒前）
```
@RequestMapping(value="/addComment.action")
	public String addComment(HttpSession session,Comment comment){
		User loginUser = (User) session.getAttribute("loginUser");
		
		//从当前登录用户获取id和用户名
		Integer id = loginUser.getId();
		String username = loginUser.getUsername();
		comment.setUserid(id);
		comment.setUsername(username);
		
		bbsService.insertComment(comment);
		
		//评论+1
		Integer bbsid = comment.getBbsid();//获取评论的帖子id
		bbsService.addCommentCount(bbsid);
		//返回帖子详情
		return "redirect:/bbs_detail.action?id="+bbsid;
	}
```
### 板块切换
需求：可以切换不同的板块，显示属于板块的所有帖子
@RequestMapping(value="/switchCategory.action")
	public String switchCategory(Model model, Integer cid){
		List<Bbs> bbsList = bbsService.selectBbsByCid(cid);
		model.addAttribute("bbsList", bbsList);
		model.addAttribute("cid",cid); //板块切换class判断
		return "index";
  }

Jsp页面
<c:forEach items="${ sessionScope.categoryList}" var="category">             
               <c:choose>
               <c:when test="${cid eq category.id}">
               <li class="active">
               <a href="${pageContext.request.contextPath }/switchCategory.action?cid=${category.id }">${category.name }</a>
                     </li>
               </c:when>
               <c:otherwise>
               		
               <li class="">
              <a href="${pageContext.request.contextPath }/switchCategory.action?cid=${category.id }">${category.name }</a>
                </li>
               </c:otherwise>
               </c:choose>
                 
                </c:forEach>  

### 发帖
header.Jsp：到发帖页面
<c:if test="${ cid gt 0}">
<a href="${pageContext.request.contextPath }/toCreateBbs.action?cid=${cid}">发帖</a>
</c:if>

bbsSub.jsp:

<form method="post" action='${pageContext.request.contextPath }/bbsSub.action'>
	title:&nbsp;&nbsp;<input type="text" size="64" name="title"><br/><br/>
    <textarea name='content'></textarea>
    <input type="hidden" name="categoryid" value="${cid} ">
    <input type='submit' value='submit' />
</form>


### 未登录不能到发帖页面
需求：未登录的用户不能到发帖页面
public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
	
			User user = (User) request.getSession().getAttribute("loginUser");

			if(null == user){
				String msg = "请登录后在发帖！";
				request.setAttribute("msg", msg);
				response.sendRedirect(request.getContextPath() + "/toLogin.action"); 
				return false;
			}
		
		return true;
	}
### 删除帖子
需求：用户只能删除自己的帖子

BbsDetail.jsp
判断是否显示删除按钮
<c:if test="${bbs.authorid eq sessionScope.loginUser.id}">
    <a href="${pageContext.request.contextPath }/deleteBbs.action?bid=${bbs.id}">delete</a>
</c:if>


删除帖子需要先删除该帖子的所有评论，所以需要配置事务
(我在mysql中设置了级联 删除帖子的同时删除该帖子的评论)
### 个人中心
需求：显示用户的基本信息以及发帖量和已发送的帖子标题

bbsController接收用户的id，查询用户信息，发的帖子，发帖量

Bbs模块的pojo类创建一个bbsqueryvo类
public class BbsQueryVo {
	private List<Bbs> bbsList;
	
	private Integer userBbsCount;

	private User user;
	set…
get…
}

Bbs模块的Service层查询发的帖子，和发帖量

user模块的Service层查询用户的信息

最后将查询到的信息封装到bbsqueryvo中，设置回显
### 个人信息编辑
userEdit.jsp通过ajax校验填写的用户名是否被注册以及年龄是否为正整数，且用户名和年龄不能为空

Controller接收用户信息以及图片，若图片不为空则保存图片
### 按条件搜索帖子（附加分页）
需求：输入（bbs标题，板块名称，作者名字），至少一个条件 
查询结果分页显示（显示包括bbs标题，板块名称，作者名字）

分页操作：引入分页标签和page类（总条数，页数，每页条数，结果集）
          分页标签会传page值

控制层：封装bbsqueryvo 接收数据
         回显Page<Bbs>
业务层：Page<Bbs> page = new Page<>();
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

持久层：
<select id="selectBbsByUid" parameterType="integer" resultType="bbs">
	select bbs.id,title,createdAt
	from bbs
	where authorId=#{id} order by createdAt desc
	</select>
	
	<select id="selectBbsByQueryVo" parameterType="BbsQueryVo" resultType="bbs">
	select id,title,authorId,categoryId,createdAt from bbs 
	<where>
	
	<if test="bbs.category.name !=null and bbs.category.name!='' ">
	and categoryId = (select id from category where name=#{bbs.category.name}) 
	</if>
	
	<if test="bbs.user.username !=null and bbs.user.username!=''">
	and authorId = (select id from user where username=#{bbs.user.username})
	</if>
	<if test="bbs.title !=null and bbs.title != ''">
		 and title like '%${bbs.title}%'
	</if>

	</where> 
	limit #{startRow},#{size}
	</select>
### 消息中心
每当其他人评论你时，可以在消息中心看到。
2.9.1.	消息提醒
创建message模块，
封装messagevo ：
public Message message;
	public String username;
	public String categoryName;
	public String title;

sql语句：
<resultMap type="messagequeryvo" id="messagequeryvo">
  <id property="message.id" column="id" />
  <result property="message.content" column="content"/>
  <result property="message.recipientid" column="recipientid"/>
  <result property="message.sponsorid" column="sponsorid"/>
  <result property="message.categoryid" column="categoryid"/>
  <result property="message.bbsid" column="bbsid"/>
  <result property="message.date" column="date"/>
  <result property="message.type" column="type"/>
  </resultMap>
  
  <select id="selectMessageByUid" parameterType="integer" resultMap="messagequeryvo">
  select m.* ,c.name categoryName,u.username,b.title 
from message m,category c,`user` u,bbs b
where c.id = m.categoryId and u.id = m.sponsorId and b.id=m.bbsId
and m.recipientId=#{id}
  </select>

效果：如果不是自己回复自己的帖子，将收到提醒（如下图所示）
 
2.9.2.	消息数量显示
 需求：header.jsp通过ajax查询未读信息数量
设置标记已读按钮

### 关注功能
需求：点击关注按钮关注用户，可以在关注栏看到，对方可以在粉丝栏看到。
同时显示每个用户的关注量和粉丝量。
 

方案：
当你登录后并且未关注某人时 显示 按钮，关注某人后，显示 按钮，再次点击取消关注 

实现：
1.页面加载时发送ajax请求判断登录用户是否已关注该页面的用户，若已关注，显示“已关注”按钮，否则显示“关注”按钮，
2.当点击“关注”时，更新登录用户的关注量和被关注用户的粉丝量，将同时将两个用户的id添加到关联表中。
### 后台用easyui的datagrid显示所有帖子
1.	封装easyUIresult 包括列表和总行数total
2.	Controller层接收page 和 rows(当前页数和每页行数)
3.	Service层利用分页插件获取总行数total 和 列表
## 遇到的问题以及解决
### 转移模块
所有功能都写在了abc.bbs模块中，耦合度较高。
1.新建一个user模块
包结构如下：abc.bbs.bbs  和
            abc.bbs.user

2.建立新模块后修改包扫描:
例如：applicationContext-service.xml
原先<context:component-scan base-package="abc.bbs.service" />
现在<context:component-scan base-package="abc.bbs.*.service" />

3.SqlMapConfig.xml的别名再新建一个包
<typeAliases>
		<package name="abc.bbs.user.pojo"/>
		<package name="abc.bbs.bbs.pojo"/>
	</typeAliases>

4.把和用户有关的功能移到user模块中
### 分类切换的样式切换问题
先前写了一段js，但是点击分类后会刷新页面，无效。

El表达式由于写成了<c:when test="${cid eq category.id} ">，后面多了个空格，导致el表达式无法识别。找了很长时间才找到。
### 拦截器无法给页面传值
if(null == user){
				String msg = "请登录后在发帖！";
				request.setAttribute("msg", msg);
				response.sendRedirect(request.getContextPath() + "/toLogin.action");
				return false;
			}
### mybatis属性重名问题
<id property="id" column="id1"/>
	…
	<association property="user" javaType="user">
	<id property="id" column="id"/>
…

Sql语句起别名：
select bbs.id id1,bbs.title,bbs.createdAt,bbs.authorId,
	u.id,u.username,u.signature,u.age

### 一些截图
首页：

 

个人中心
 






查看粉丝以及关注：
 
