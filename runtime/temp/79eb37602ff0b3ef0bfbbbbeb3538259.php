<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:67:"C:\phpStudy\WWW\cg\public/../application/index/view/index/show.html";i:1543629544;}*/ ?>
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
 <h2><?php echo $res['title']; ?></h2>
  <p>作者：<?php echo $res['author']; ?>有<?php echo $res['pic']; ?>张图片<?php echo date("Y-m-d",$res['addtime']); ?></p>
 <?php if(is_array($pics) || $pics instanceof \think\Collection || $pics instanceof \think\Paginator): $i = 0; $__LIST__ = $pics;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
  <img src="/<?php echo $vo['pic']; ?>" style="width:100px"/>
  <?php endforeach; endif; else: echo "" ;endif; ?>
  <p><?php echo $res['content']; ?></p>
  <p><a href="show/?id=<?php echo $res['id']-1; ?>">上一篇</a><a href="show/?id=<?php echo $res['id']+1; ?>">下一篇</a></p>
</div>
</div>
<!-- 右侧结束 -->
<!-- 第一栏结束 -->

<div style="clear:both"></div>
<style type="text/css">
 .gjbc{width:99%;height:160px;padding-left:4px;margin:8px auto;}
 .gjbc li{font-size:16px;color:black;
            width:12px;height:160px;margin:1px; 
            float:left;
           line-height:24px;}
 .gjbc li:hover{color:red;font-size:20px;font-weight:bold;text-decoration:none;}
/*.yinchang{display:none;}*/
</style>
 <div class="sec1200">
 <?php if(is_array($gj) || $gj instanceof \think\Collection || $gj instanceof \think\Paginator): $i = 0; $__LIST__ = $gj;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
	<h3><a href="" onclick="xiansi();return false;"><?php echo $vo['name']; ?></a>:<?php echo $vo['xl']; ?><?php echo $vo['bc']; ?></h3>

        <ul class="gjbc yinchang">
      <?php if(is_array($vo['tjzd']) || $vo['tjzd'] instanceof \think\Collection || $vo['tjzd'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vo['tjzd'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
        <li><?php echo $vo; ?><li>
      <?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
        </hr>
 <?php endforeach; endif; else: echo "" ;endif; ?>
      </div>
<!-- 第三栏结束 -->
<a href="javascript:window.opener=null;window.open('','_self');window.close();">关闭</a>
</body>
</html>
