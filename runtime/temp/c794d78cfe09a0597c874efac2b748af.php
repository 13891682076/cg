<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:72:"C:\phpStudy\WWW\cg\public/../application/index/view/index/gsyg_list.html";i:1543646750;}*/ ?>
<!doctype html>
<html lang="en">
 <head>
 <link rel="stylesheet" type="text/css" href="/static/index/css/main.css">
<script src="/static/index/js/main.js"></script>
<script src="/static/index/scripts/jquery-1.3.1.js" type="text/javascript"></script>
<script src="/static/index/scripts/jquery.cookie.js" type="text/javascript"></script>
<script src="/static/index/scripts/nav.js" type="text/javascript"></script>
<script src="/static/index/scripts/changeSkin.js" type="text/javascript"></script>
<script src="/static/index/scripts/slide.js" type="text/javascript"></script>
<script src="/static/index/scripts/scroll.js" type="text/javascript"></script>
<script src="/static/index/scripts/tooltip.js" type="text/javascript"></script>
<script src="/static/index/scripts/tree.js" type="text/javascript"></script>
<script src="/static/index/scripts/ad.js" type="text/javascript"></script>
<script src="/static/index/scripts/imgHover.js" type="text/javascript"></script>
<script src="/static/index/scripts/imgSlide.js" type="text/javascript"></script>
<script src="/static/index/scripts/tab.js" type="text/javascript"></script>

 <style>

</style>
<head>
<body>
<!--导航开始-->
<div id="nav" class="sec1200">
	<ul>
		 <li><a href="#">首 页</a></li>
		 <li><a href="#">公司概况</a>
				<ul>
					 <li><a href="#">短袖衬衫</a></li>
					 <li><a href="#">长袖衬衫</a></li>
					 <li><a href="#">无袖衬衫</a></li>
				</ul>
		</li>
		<li><a href="#">安全生产</a>
				<ul>
					 <li><a href="#">开襟卫衣</a></li>
					 <li><a href="#">套头卫衣</a></li>
				</ul>
		 </li>
		<li><a href="#">生产经营</a>
				<ul>
					 <li><a href="#">休闲裤</a></li>
					 <li><a href="#">卡其裤</a></li>
					 <li><a href="#">牛仔裤</a></li>
                     <li><a href="#">短裤</a></li>
                </ul>
         </li>
		 <li><a href="#">客服中心</a>
				<ul>
					 <li><a href="#">休闲裤</a></li>
					 <li><a href="#">卡其裤</a></li>
					 <li><a href="#">牛仔裤</a></li>
                     <li><a href="#">短裤</a></li>
                </ul>
         </li>
		 <li><a href="#">联系我们</a></li>
	</ul>
</div>
<!--导航结束-->
<!--主体开始-->
<!-- 第一栏开始 -->
<div class="sec1200">
<!-- 左侧开始 -->
<div class="left">
			<h3>最新动态</h3>
			<div class="scrollNews" >
				<ul>
					<li><a href="#" class="tooltip" title="甜美宽松毛衣今秋一定红.">甜美宽松毛衣今秋一定红.</a></li>
					<li><a href="#" class="tooltip" title="秋装百搭小马甲不到50元.">秋装百搭小马甲不到50元.</a></li>
					<li><a href="#" class="tooltip" title="修身韩版小西装万人疯抢.">修身韩版小西装万人疯抢.</a></li>
					<li><a href="#" class="tooltip" title="夏末雪纺店主含泪大甩卖.">夏末雪纺店主含泪大甩卖.</a></li>
					<li><a href="#" class="tooltip" title="瑞丽都疯狂推荐的秋装.">瑞丽都疯狂推荐的秋装.</a></li>
					<li><a href="#" class="tooltip" title="48元长款针织小开衫卖疯啦.">48元长款针织小开衫卖疯啦.</a></li>
					<li><a href="#" class="tooltip" title="长袖雪纺衫单穿内搭都超美.">长袖雪纺衫单穿内搭都超美.</a></li>
				</ul>
			</div>
			<p class="module_up_down"><img src="images/down.gif" alt="" /></p>
		</div>
<!-- 左侧结束 -->
<!-- 中间开始 -->
<div style="cent">
		<table>
		<tr><td>姓名</td><td>身份证号</td></tr>
		<?php if(is_array($gsyg) || $gsyg instanceof \think\Collection || $gsyg instanceof \think\Paginator): $i = 0; $__LIST__ = $gsyg;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
<tr><td><?php echo $vo['name']; ?></td><td><?php echo $vo['sfz']; ?></td></tr>
		<?php endforeach; endif; else: echo "" ;endif; ?>
		</table>
      </div>
<!-- 第三栏结束 -->
<a href="javascript:window.opener=null;window.open('','_self');window.close();">关闭</a>
</body>
</html>
