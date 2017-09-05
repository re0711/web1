/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : bbs

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2017-08-27 12:36:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bbs
-- ----------------------------
DROP TABLE IF EXISTS `bbs`;
CREATE TABLE `bbs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `summary` varchar(256) DEFAULT NULL,
  `content` longtext NOT NULL,
  `createdAt` datetime NOT NULL,
  `authorId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `commentCount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `app1_bbs_4f331e2f` (`authorId`),
  KEY `app1_bbs_b583a629` (`categoryId`),
  CONSTRAINT `bbs_ibfk_1` FOREIGN KEY (`authorId`) REFERENCES `user` (`id`),
  CONSTRAINT `bbs_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs
-- ----------------------------
INSERT INTO `bbs` VALUES ('2', '赵一鞭就是我', '赵一鞭就是我', '海客谈瀛洲，烟涛微茫信难求', '2017-03-24 14:02:12', '2', '2', '2');
INSERT INTO `bbs` VALUES ('7', '勇士PK开拓者:水花斗双枪 首轮最没悬念对决?', '请看详细内容', '<p>&ldquo;几周前他们像是进不了季后赛了，&rdquo;<a href=\"http://nba.sports.163.com/player/329525/\">杜兰特</a>说，&ldquo;但他们拼了过来，这值得称赞。&rdquo;系列赛开始前吹捧对方球队，当家球星，是NBA的潜规则。总不能一上来就表态：我们很强，你们还是洗洗睡吧。<a href=\"http://nba.sports.163.com/team/9/\">勇士</a>和<a href=\"http://nba.sports.163.com/team/22/\">开拓者</a>去年曾有交手，半决赛<a title=\"勇士\" href=\"http://sports.163.com/keywords/5/c/52c758eb/1.html\" target=\"_blank\">勇士</a>4-1轻松取胜，今年勇士多了<a title=\"杜兰特\" href=\"http://sports.163.com/keywords/6/5/675c51707279/1.html\" target=\"_blank\">杜兰特</a>，<a title=\"开拓者\" href=\"http://sports.163.com/keywords/5/0/5f0062d38005/1.html\" target=\"_blank\">开拓者</a>却没有提升，后场双枪对双枪可以有，杜兰特这个点谁去防？季中加盟的<a href=\"http://nba.sports.163.com/player/830642/\">努尔基奇</a>被寄予厚望，现在他的伤势不明，开拓者就像是金州海潮中的一叶孤舟。</p>\r\n<p><a class=\"f_center\" href=\"http://sports.163.com/photoview/0AI90005/154551.html\"><img src=\"http://img3.cache.netease.com/photo/0005/2017-04-13/CHTCVP0F0AI90005.jpg\" alt=\"勇士PK开拓者:水花斗双枪 首轮最没悬念对决?\" width=\"600px\" /></a></p>\r\n<p><strong>一、常规赛对阵回顾：</strong></p>\r\n<p>两队交手4次，勇士4战全胜，场均净胜19.5分。12月17日勇士45分上演屠杀，替补<a href=\"http://nba.sports.163.com/player/504523/\">克拉克</a>得分都比<a title=\"利拉德\" href=\"http://sports.163.com/keywords/5/2/522962c95fb7/1.html\" target=\"_blank\">利拉德</a>多。上季常规赛，开拓者还有利拉德爆砍51分7次助攻6次抢断蹂躏勇士的32分大胜，这季想少输一点都难。开拓者最接近胜利的一次是今年1月30日库里因伤休战，最后6秒开拓者落后2分，杜兰特进攻犯规给了他们创造奇迹的机会，可惜特纳三分打铁，普拉姆利补篮偏出，当时利拉德14投6中只得到19分。</p>\r\n<p>杜兰特是开拓者死穴，4次交手杜兰特命中率最低的一战也有50%，最夸张的一场13中11，三分5中4得到34分11个篮板，开拓者脆弱的锋线轮换根本拦不住他。唯一的好消息是：这4场比赛都发生在他们得到努尔基奇之前，如果加强了内线攻击力，开拓者并不是连在勇士面前赢1场都做不到。</p>\r\n<p><strong>二、实力对比：</strong></p>\r\n<p>连续3季至少65胜刷新NBA历史纪录，勇士强大到近乎无敌（小范甘迪说：&ldquo;还打什么季后赛，直接给勇士颁奖吧。&rdquo;），百回合得分联盟第1，失分联盟第2，三分出手、命中、命中率均排名联盟前5，助攻、抢断、封盖，逼迫对手失误，压制对方投篮命中率都是联盟第1，尤其场均超过30次助攻不仅本季第1，还创造NBA历史纪录。</p>\r\n<p>去年放走博格特、埃泽利、大卫-李让勇士内线出现了一些问题，进攻篮板率联盟第18位，对方进攻篮板率联盟倒数第2，但外线的强大，杜兰特、格林能随时换位到内线足以掩盖这些缺陷。</p>\r\n<p>开拓者打法则相对简单，利拉德、麦科勒姆凭个人能力冲击（面筐单打效率联盟第5），努尔基奇靠吨位给双星挡拆（挡拆持球进攻效率联盟第1），或到篮下背打。看起来开拓者5人场均得分上双，进攻点布平均，打的很合理，实际上他们的场均助攻只排联盟第23位，球员间呼应不多，谈不上什么丰富的进攻手段。</p>\r\n<p>几乎所有数据环节上，开拓者的表现都是中规中矩的10到20位，能挤掉掘金杀入季后赛确实不错，击败勇士上演黑八？这个玩笑开的可能有点大。</p>\r\n<p><strong>三、系列赛看点：</strong></p>\r\n<p><strong>NO1、水花兄弟PK双生玫瑰</strong></p>\r\n<p>库里场均25.3分4.5个篮板6.6次助攻，<a title=\"汤普森\" href=\"http://sports.163.com/keywords/6/6/6c64666e68ee/1.html\" target=\"_blank\">汤普森</a>场均22.3分3.7个篮板2.1次助攻；利拉德场均27分4.9个篮板5.9次助攻，麦科勒姆场均23分3.6个篮板3.6次助攻。若说哈登和维少是西部首轮最强1V1，那&ldquo;水花兄弟&rdquo;和开拓者双枪就是最强2V2。</p>\r\n<p>3年来关于水花兄弟的打法已经有过很多分析。汤普森可能是当下，甚至NBA历史上最好的无球三分手，三节砍下60分的夜晚他所有的运动战出手只运了11次球，杜兰特加盟时很多媒体分析汤普森将受到巨大的影响，如今汤普森的场均得分不降反升，大有和杜兰特两翼齐飞的意思。</p>\r\n<p>而库里，杜兰特加盟后他的各项数据确实在下滑，事实上他这季表现仍是联盟顶尖。数据上看，季库里单回合能拿到1.101分，在所有执行进攻回合超过1500次的球员里高居联盟第四（汤普森单回合1.091分排名联盟第6）。目前库里仍是勇士得分王，连杜兰特都感叹：&ldquo;看来我终究没有拖库里的后腿。&rdquo;</p>\r\n<p>库里和汤普森能得分，利拉德和麦科勒姆也不遑多让，尤其利拉德用杜兰特的糖衣炮弹来形容：&ldquo;利拉德是超级巨星，他是那种在任何时候都能连续砍分的球员。&rdquo;两人在球员单回合得分（进攻回合超过1500次）排行榜上一个排第9，一个排第11，联盟中只有三对组合在这份榜单上都跻身前20，剩下的一对是厄文（第10）和勒布朗（第12）。开拓者双枪的整体排位还要比骑士的总冠军组合高一些。</p>\r\n<p>具体到打法，利拉德和麦科勒姆就像玫瑰花园中的双生花，他们擅长的进攻方式都是挡拆持球，换言之这两人谁有球在手，谁就发起挡拆，然后是突破是投篮看心情。相对而言，身为老大的利拉德挡拆持球进攻得分效率更高，也执行了更多的面筐单打，而麦科勒姆作为小弟，定点投篮表现在所有进攻手段中效率最稳定，值得一提的是上赛季麦科勒姆获得了进步最快球员，这个NBA历史悠久的魔咒在他身上仿佛全无作用。</p>\r\n<p><strong>NO2、开拓者群锋围剿杜兰特</strong></p>\r\n<p>开拓者这赛季的常用的锋线球员有以下几名：阿米奴、哈克里斯、冯莱，特纳也能算半个。这3个半人绑一块儿能不能拖住杜兰特？</p>\r\n<p>2月28日打奇才受伤之前，杜兰特一度是常规赛MVP的有力竞争者，他和两位小兄弟哈登、维少长期霸占MVP权力榜，看得雷霆总经理满脸是泪。迎战鹈鹕复出后，杜兰特状态不错，除了三分手感还需要找找，中投、运动能力和防守都没受影响。</p>\r\n<p>去年西决勇士对阵雷霆，杜兰特场均拿到30分8个篮板打的金州人鸡飞狗跳，今年投诚后得分虽不如巅峰，篮板、封盖、命中率等多项关键数据都创生涯新高。这是一个出手减少，命中率提高，且篮板、防守加强的前得分王，经过常规赛磨合，他和&ldquo;水花兄弟&rdquo;之间的默契不是问题。因为受伤，杜兰特这赛季执行进攻回合没超过1500次，将范围扩大到1000次以上，杜兰特以单回合1.174分高居联盟榜首，足见进攻火力之强大。开拓者还能怎么办呢？常规赛4战就被杜兰特吃干抹净了，季后赛说不得又要做噩梦。</p>\r\n<p><strong>NO3、努尔基奇何时复出成X因素</strong></p>\r\n<p>和重金签下克拉比、特纳、埃泽利不同，开拓者中期交易得到努尔基奇是一笔巨大的收获，他在丹佛高原因为有约基奇郁郁不得志，来了玫瑰花园就迅速绽放，交出一份场均15.2分10.4个篮板3.2次助攻1.3次抢断1.9次封盖的完美成绩单，也是因为得到他，开拓者才能在冲刺阶段连战连胜，逆袭掘金拿到最后一张季后赛门票。</p>\r\n<p>努尔基奇是在3月31日迎战火箭拿到19分11个篮板3次封盖后被查出骨折的，据悉他有可能在首轮复出。如果有努尔基奇，他的身高、体重能为后场双枪提供更坚实的挡拆墙，也能尝试单打在勇士内线捣捣乱，至少格林、杜兰特这种假中锋很难挡住他肆虐三秒区，届时双枪在外线冲杀一阵，开拓者并非没有赢下一两场的可能。可一旦他无法顺利复出，开拓者账面上唯一谈得上优势的点也就没了。</p>', '2017-04-15 19:20:26', '1', '1', '1');
INSERT INTO `bbs` VALUES ('8', '戈贝尔伤退单打乔绝杀 爵士客场胜快船1-0', '请看详细内容', '<p>北京时间4月16日，NBA季后赛再战一场，爵士客场97-95险胜快船，西部首轮1-0领先。</p>\r\n<p>爵士队戈贝尔开场15秒扭伤左膝伤退，海沃德19分10篮板，乔治-希尔16分，乔-约翰逊21分命中抛投绝杀；快船队格里芬26分7篮板，保罗25分7篮板11助攻，小乔丹10分15篮板。</p>\r\n<p><a href=\"http://nbachina.qq.com/a/20170416/016229.htm#p=1\" target=\"_blank\"><strong>现场高清</strong></a> <a href=\"http://china.nba.com/boxscore/#!/0041600171\" target=\"_blank\"><strong>技术统计</strong></a></p>\r\n<p>这是两队历史上第三次在季后赛中相遇，前两次都是爵士晋级（1992年季后赛首轮爵士3-2，1997年季后赛首轮爵士3-0）。在两队常规赛的近20次交锋中，快船赢了18次，但是在今天这场比赛当中，快船并没能体现出近年来对爵士的统治性优势。</p>\r\n<p>本场比赛一上来爵士就遭受重大打击，戈贝尔在为海沃德做掩护时，与对手相撞导致左膝扭伤，并早早退出了比赛。但是戈贝尔的受伤却让爵士展现出了更强的斗志，或者说让快船显得没有欲望，在首节进行到8分15秒时，格里芬中投命中，快船打出7-2的开局。不过之后爵士连得5分将比分追平，并把比赛拖入僵持状态。在首节还剩6分03秒时，威西攻篮得手，爵士反而取得11-9的领先。首节格里芬拿了11分，但快船20投7中命中率只有35%，首节过后他们仅取得24-22的领先。本节爵士17投8中，命中率达到47.1%。</p>\r\n<p>戈贝尔的受伤，让爵士在篮板球上处于劣势，但是他们的老将们发挥了关键的作用。在次节进行到8分26秒时，克劳福德攻篮得手，快船取得36-30的领先。之后乔-约翰逊抢断保罗并助攻海沃德得分，引领爵士打出一波9-2的攻势将比分反超。在本节还剩3分49秒时，费沃斯扣篮得手，爵士已将比分拉开到44-38。不过在本节最后47秒里，爵士没能得分，保罗抢到2个进攻篮板，并分别助攻格里芬和克劳福德得分，快船才得以在半场结束时将比分追为52平。半场过后乔-约翰逊8投6中拿了14分，迪奥也有4中3的高效表现。</p>\r\n<p>保罗在上半场送出10次助攻，个人季后赛生涯总助攻数已达到659次，从而超越丹尼-安吉升至历史季后赛助攻榜的第31位。</p>\r\n<p>快船自从2011-12赛季以来就没有缺席过季后赛，他们至今没有摸到过西部决赛的地板，格里芬表示这增加了他们去赢得总冠军的欲望和激情。可是，快船显得太不专注了，在本场比赛第三节还剩3分28秒时，他们发边线球竟然出现回场这种低级失误。不过第三节后期爵士的进攻效率走低，在本节还剩1分16秒时，克劳福德跳投命中，快船打出一波8-0的攻势，将比分反超为70-68。可是在本节剩余时间里，快船2投不中未能得分，海沃德连罚带投连得6分，带领爵士带着74-70的领先进入第四节。</p>\r\n<p>比赛在第四节早早进入白热化阶段，在比赛还剩4分28秒时，小乔丹因抱怨裁判判罚被吹技术犯规，海沃德命中技术犯规罚球，爵士取得88-81的领先。关键时刻保罗连得8分，带领快船将分差缩小到1分。但是当保罗不能得分的时候，快船其他球员也不能得分，在比赛还剩1分08秒时，乔-约翰逊攻篮得手，爵士94-89又将比分拉开。</p>\r\n<p>不过快船并没有崩盘，在比赛还剩23秒时，格里芬两罚全中，他们顽强地将比分追至93-94。暂停后快船立即采取犯规战术，费沃斯两罚一中，保罗抛投命中后，快船将比分追平，比赛时间还剩13秒。此后爵士后场发球，乔-约翰逊接球一条龙杀到前场，面对克劳福德的防守，他强行杀到篮下抛投命中，爵士97-95绝杀快船。</p>', '2017-04-16 15:03:15', '2', '2', '0');
INSERT INTO `bbs` VALUES ('10', '阿杜若缺阵影响有多大？库里：我们要迎难而上', '请看详细内容', '<p>腾讯体育4月18日奥克兰讯 <a class=\"a-tips-Article-QQ\" href=\"http://nba.stats.qq.com/player/?id=4244\" target=\"_blank\">杜兰特</a>因左小腿肌肉拉伤突然缺席今日勇士队的训练，第二场比赛能否上场目前成疑。杜兰特刚刚伤愈不久，在季后赛第一场之后就再次出现伤病，而这一突发状况，到底会给<a class=\"a-tips-Article-QQ\" href=\"http://nba.stats.qq.com/team/?id=warriors\" target=\"_blank\">勇士</a>带来怎样的影响？</p>\r\n<p>今天的训练馆对媒体开放之前，记者们就收到了公关在推特上发送的信息，杜兰特确认小腿拉伤，有可能会缺席明天的比赛。而当训练馆的大门打开，记者们发现杜兰特甚至都没有出现在今天队内的训练之中。</p>\r\n<p>有消息说，杜兰特确实来到了训练馆，但是一直留在理疗室里处理自己左腿的伤势。</p>\r\n<p align=\"center\"><img src=\"http://img1.gtimg.com/sports/pics/hv1/151/2/2203/143250736.jpg\" alt=\"阿杜若缺阵影响有多大？库里：我们要迎难而上\" /></p>\r\n<p align=\"center\">杜兰特在一次急停跳投后感到小腿不适</p>\r\n<p><a class=\"a-tips-Article-QQ\" href=\"http://nba.stats.qq.com/team/?id=blazers\" target=\"_blank\">开拓者</a>后场双星麦科勒姆和<a class=\"a-tips-Article-QQ\" href=\"http://nba.stats.qq.com/player/?id=5012\" target=\"_blank\">利拉德</a>在上场比赛的双双爆发，让勇士队甚至一度相当被动。防守上吃力不说，他们的进攻更是一度停滞，半场结束时也只能靠杜兰特的个人能力支撑着全队，勉强与对方拼个平手。</p>\r\n<p>可是杜兰特的突然受伤，加之利文斯顿和防守大将巴恩斯的缺席，却让勇士队的阵容在第二场之前突然变得吃紧。如果三人最后确认全部缺席，那么在关键的第二场里，勇士队只能面临9人出战的局面。</p>\r\n<p>人们该不该开始担心起这支勇士队来？这突然到来的伤病情况有没有可能在某些程度上影响这一轮的走向，甚至会不会影响整个季后赛的格局？</p>\r\n<p><strong>杜兰特的伤到底重不重</strong></p>\r\n<p>杜兰特的受伤来自于上一场第三节的开始阶段，他一个顶角的带球突破然后急停投篮之后，突然摸了一下自己的左小腿。之后科尔教练并没有将其换下，换到防守端之后，站在篮下的杜兰特面对对方球员攻击篮筐时甚至都没有跳起，而是下意识的再看了看自己的左小腿。</p>\r\n<p>之后，科尔马上将其换下。队医<a class=\"a-tips-Article-QQ\" href=\"http://soccer.stats.qq.com/team.htm?t1=8&amp;from=yingchao\" target=\"_blank\">切尔西</a>立刻来到了杜兰特的旁边，然后对其左小腿进行了一些冰敷治疗。</p>\r\n<p>赛后，虽然有记者询问杜兰特的伤势，但是他马上否认，表示自己没有问题。</p>\r\n<p>据了解，杜兰特的伤势并不算特别严重。现在更多的是以冰敷治疗为主。队医需要在明天结合杜兰特的自身感觉以及一些其他检查来确定后者是否可以出战系列赛第二场。如果杜兰特需要更长的时间恢复，第三或者第四场也可以回归球场。</p>\r\n<p>如果在网上查询小腿拉伤的恢复时间，会得到不同的答案。最长的恢复时间要在1-3个月左右，最短的大概一周恢复。但是就目前情况来看，杜兰特的伤势显然算是比较轻的范围。</p>\r\n<p>虽然季后赛的勇士需要杜兰特，但是为了长远考虑，让他得到休息并且充分恢复是更好的选择。</p>\r\n<p><strong>杜兰特再次受伤对勇士影响有多大</strong></p>\r\n<p>杜兰特刚刚在4月初伤愈回归，如今立刻再次受伤无疑对勇士是一个不小的冲击。但也正是阿杜一个多月的休战，让如今的勇士拥有了迅速调整和应变的能力。</p>\r\n<p>&ldquo;是的，缺少KD当然是我们的损失，我们在季后赛中太需要他了。可是我们也因为有了之前他受伤的经历，让我们有经验和有打法去做出调整和改变。我们也可以去迅速适应不同的阵容变化。&rdquo;<a class=\"a-tips-Article-QQ\" href=\"http://nba.stats.qq.com/player/?id=3826\" target=\"_blank\">伊格达拉</a>告诉记者。</p>\r\n<p><a class=\"a-tips-Article-QQ\" href=\"http://nba.stats.qq.com/player/?id=4612\" target=\"_blank\">库里</a>也曾因伤缺席了去年季后赛第一轮第四场比赛，直到第二轮第五场才回归。杜兰特的缺席虽然会造成影响，但是库里相信球队其他的人，会像之前的每一场一样发挥出自己的作用。</p>\r\n<p>&ldquo;我们已经可以去适应当KD在场或者不在场的那些调整。虽然谁也不希望看到他受伤。但是我们要做的就是迎难而上。每一个球员都去发挥自己的作用。&rdquo;</p>\r\n<p>当有记者问库里，看到你们球队有那么多可以在关键时刻发挥作用的板凳球员是一件多么不寻常的事情时，库里马上纠正道：&ldquo;不，在我们这支球队里，这是一件非常寻常的事情，过去的四年里，我们每一个曾经待在这里的球员和那些仍然为球队效力的球员，都发挥了自己巨大的作用。而这也正是当我们有些球员受伤时，我们依然可以挺住的原因。&rdquo;</p>', '2017-04-19 21:43:32', '2', '1', '4');
INSERT INTO `bbs` VALUES ('11', '孙静宇王者龟来', '请看详细内容', '<p>特点：</p>\r\n<p>喜欢手把手的教</p>\r\n<p>课后一定要消化一下</p>\r\n<p>要挂80%</p>\r\n<p>还有，你是不是都会了</p>\r\n<p>&nbsp;</p>', '2017-04-20 10:38:37', '1', '1', '9');
INSERT INTO `bbs` VALUES ('12', '特发此贴', '请看详细内容', '<p>特发此贴</p>', '2017-07-10 10:12:01', '1', '1', '2');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `administratorId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `app1_category_a68d6894` (`administratorId`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`administratorId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '欧美', '2');
INSERT INTO `category` VALUES ('2', '日韩', '1');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `date` datetime NOT NULL,
  `bbsId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `replyId` int(11) DEFAULT '0',
  `username` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `b` (`userId`),
  KEY `c` (`replyId`),
  KEY `s` (`username`),
  KEY `a` (`bbsId`),
  CONSTRAINT `a` FOREIGN KEY (`bbsId`) REFERENCES `bbs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `b` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `s` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('2017-04-16 10:26:38', '2', '1', 'sdfsdf', '44', '0', 'lyx');
INSERT INTO `comment` VALUES ('2017-04-16 10:26:42', '2', '1', '莎啦啦上来看', '45', '0', 'lyx');
INSERT INTO `comment` VALUES ('2017-04-16 14:31:56', '7', '1', '水电费第三方', '46', '0', 'lyx');
INSERT INTO `comment` VALUES ('2017-04-21 10:17:27', '11', '1', 'ewffwewef', '55', '0', 'lyx');
INSERT INTO `comment` VALUES ('2017-04-21 11:54:13', '10', '1', '神特么', '56', '0', 'lyx');
INSERT INTO `comment` VALUES ('2017-04-22 17:56:15', '10', '1', 'wer', '67', '0', 'lyx');
INSERT INTO `comment` VALUES ('2017-04-22 18:01:32', '10', '1', 'ss', '68', '0', 'lyx');
INSERT INTO `comment` VALUES ('2017-05-01 16:49:00', '11', '2', 'asd', '69', '0', 'asd');
INSERT INTO `comment` VALUES ('2017-05-01 16:49:02', '11', '2', 'asdas', '70', '0', 'asd');
INSERT INTO `comment` VALUES ('2017-05-01 16:51:37', '11', '2', 'asd', '71', '0', 'asd');
INSERT INTO `comment` VALUES ('2017-05-01 16:51:41', '11', '2', 'asd', '72', '0', 'asd');
INSERT INTO `comment` VALUES ('2017-06-04 20:29:36', '11', '2', 'asd', '73', '0', 'asd');
INSERT INTO `comment` VALUES ('2017-06-04 20:33:33', '10', '1', 'sadasd', '74', '0', 'lyx');
INSERT INTO `comment` VALUES ('2017-06-04 20:57:36', '11', '2', 'asd', '75', '0', 'asd');
INSERT INTO `comment` VALUES ('2017-06-06 12:20:52', '11', '2', '234', '78', '0', 'asd');
INSERT INTO `comment` VALUES ('2017-07-10 10:19:30', '12', '2', '你好', '79', '0', 'asd');
INSERT INTO `comment` VALUES ('2017-07-10 10:19:43', '12', '2', '谢谢你', '80', '0', 'asd');

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `q` (`bid`),
  KEY `w` (`aid`),
  CONSTRAINT `q` FOREIGN KEY (`bid`) REFERENCES `user` (`id`),
  CONSTRAINT `w` FOREIGN KEY (`aid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of follow
-- ----------------------------
INSERT INTO `follow` VALUES ('14', '1', '2');
INSERT INTO `follow` VALUES ('15', '2', '3');
INSERT INTO `follow` VALUES ('16', '1', '3');
INSERT INTO `follow` VALUES ('20', '2', '1');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `url` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '系统菜单', '-', '0');
INSERT INTO `menu` VALUES ('100', '基础维护', '-', '1');
INSERT INTO `menu` VALUES ('101', '论坛管理', '-', '100');
INSERT INTO `menu` VALUES ('102', '帖子管理', '-', '100');
INSERT INTO `menu` VALUES ('103', '用户管理', '-', '100');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(2) NOT NULL,
  `recipientId` int(11) NOT NULL,
  `sponsorId` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `bbsId` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `readType` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `z` (`recipientId`),
  KEY `az` (`sponsorId`),
  KEY `za` (`categoryId`),
  KEY `sd` (`bbsId`),
  CONSTRAINT `az` FOREIGN KEY (`sponsorId`) REFERENCES `user` (`id`),
  CONSTRAINT `sd` FOREIGN KEY (`bbsId`) REFERENCES `bbs` (`id`),
  CONSTRAINT `z` FOREIGN KEY (`recipientId`) REFERENCES `user` (`id`),
  CONSTRAINT `za` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('12', '1', '1', '2', 'asd', '1', '11', '2017-06-04 20:29:36', '1');
INSERT INTO `message` VALUES ('13', '1', '2', '1', 'sadasd', '1', '10', '2017-06-04 20:33:33', '0');
INSERT INTO `message` VALUES ('14', '1', '1', '2', 'asd', '1', '11', '2017-06-04 20:57:36', '1');
INSERT INTO `message` VALUES ('16', '1', '1', '2', '234', '1', '11', '2017-06-06 12:20:52', '1');
INSERT INTO `message` VALUES ('17', '1', '1', '2', '你好', '1', '12', '2017-07-10 10:19:30', '1');
INSERT INTO `message` VALUES ('18', '1', '1', '2', '谢谢你', '1', '12', '2017-07-10 10:19:43', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(128) NOT NULL,
  `gender` int(2) NOT NULL DEFAULT '1',
  `age` int(4) DEFAULT NULL,
  `signature` varchar(128) DEFAULT 'This guy is too lazy to leave anything here',
  `photo` varchar(100) DEFAULT 'f.jpg',
  `fanCount` int(6) NOT NULL DEFAULT '0',
  `followCount` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'lyx', '123', '1', '66', '追求得到之日即其终止之时，寻觅的过程亦即失去的过程', '4567e8c2-133f-4da5-8472-5912892041e0.jpg', '2', '1');
INSERT INTO `user` VALUES ('2', 'asd', 'asd', '1', '55', '关山难越,谁悲失路之人；萍水相逢,尽是他乡之客', 'f.jpg', '2', '1');
INSERT INTO `user` VALUES ('3', 'qwe', 'qwe', '1', '22', 'This guy is too lazy to leave anything here', 'ea6fc191-0588-4b51-a241-9fe9c579a10c.jpg', '0', '2');
