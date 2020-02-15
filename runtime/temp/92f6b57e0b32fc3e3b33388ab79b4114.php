<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:67:"C:\phpStudy\WWW\cg\public/../application/admin/view/jsy/jianli.html";i:1543935835;}*/ ?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="/static/plugins/layui/css/layui.css">
	<script type="text/javascript" src="/static/plugins/layui/layui.js"></script>
<style>
        
		.table{width:655px;height:955px;margin:auto;font-size:11px}

td{border:1px solid black;text-align:center;}
a{text-decoration:none;}
    </style>
</head>
<body style="padding: 10px;">
	<table class="layui-table table">
	<col width="50" />
   <col width="100"/>
   <col width="130"/>
   <col width="80"/>
   <col width="40"/>
   <col width="75"'/>
   <col width="65"/>
   <col width="100"/>
   
  <tr>
      <td colspan="8" style="font-weight:bold; font-size:16px;border:0;">城固县汽车运输公司</td>
    </tr>
    <tr>
      <td colspan="8"  style="font-weight:bold; font-size:20px;border:0;">驾驶员简历</td>
    </tr>
   <tr height="26">
    <td colspan="8"  style="border:0;text-align:left;">编号：<?php echo $res['id']; ?></td>
   </tr>
   <tr height="40"'>
    <td>姓名</td>
    <td ><?php echo $res['name']; ?></td>
    <td >性别</td>
    <td  colspan="2"><?php if($sex == 0): ?>男<?php else: ?>女<?php endif; ?></td>
    <td >民族</td>
    <td  colspan="2"><?php echo $res['rq']; ?></td>
   </tr>
   <tr height="40"'>
    <td colspan="2">驾驶证号码</td>
    <td  colspan="2"><?php echo $res['jsz']; ?></td>
    <td  colspan="2">资格证号</td>
    <td  colspan="2"><?php echo $res['zgz']; ?></td>
   </tr>
   <tr height="40"'>
    <td  colspan="2">驾驶车辆</td>
    <td ><?php echo $res['bus']; ?></td>
    <td >上岗证号</td>
    <td colspan="2"><?php echo $res['sgz']; ?></td>
    <td>年龄</td>
    <td ><?php echo $age; ?>岁</td>
   </tr>
   <tr height="50">
      <td colspan="2" width="50">住  址</td>
      <td colspan="6" width="415">陕西省城固县<?php echo $list['zhuzhi']; ?></td>
</tr>
 <tr height="50">
      <td >手机</td>
      <td colspan="2" width="144"><?php echo $res['tel']; ?></td>
      <td >qq</td>
      <td colspan="5"></td>
      
    </tr>
	<tr>
	<td>驾驶证</td>
      <td colspan="2"><img src="/jsy/<?php echo $res['jsz_pic']; ?>"height="30"alt=""onmouseover="layer.tips('<img src=/jsy/<?php echo $res['jsz_pic']; ?> width=200%>',this,{tips: [1, '#fff']});" onmouseout="layer.closeAll();"/></td>
<td>资格证</td>
      <td colspan="2"><img src="/jsy/<?php echo $res['zgz_pic']; ?>"height="30"alt=""onmouseover="layer.tips('<img src=/jsy/<?php echo $res['zgz_pic']; ?> width=200%>',this,{tips: [1, '#fff']});" onmouseout="layer.closeAll();"/></td>
<td>上岗证</td>
      <td  ><img src="/jsy/<?php echo $res['sgz_pic']; ?>"height="30"alt=""onmouseover="layer.tips('<img src=/jsy/<?php echo $res['sgz_pic']; ?> width=200%>',this,{tips: [1, '#fff']});" onmouseout="layer.closeAll();"/></td>
    </tr>
   
  
   <tr height="300"'>
    <td >个人履历</td>
    <td  colspan="7"style="text-align:left;"valign="top"><?php echo $res['jianli']; ?></td>
   </tr>
   <tr height="180">
    <td>奖惩情况</td>
    <td colspan="7">
	<img src="/bus/<?php echo $res['pic']; ?>"height="30"onmouseover="layer.tips('<img src=/bus/<?php echo $res['pic']; ?> width=200%>',this,{tips: [1, '#fff']});" onmouseout="layer.closeAll();"/>
	</td>
   </tr>
   <tr height="48"'>
    <td >备注</td>
    <td colspan="7"><?php echo $res['beizu']; ?></td>
   </tr>
  
	</table>
<script>
		layui.use(['layer','form'],function(){
			form = layui.form;
			layer = layui.layer;
			$ = layui.jquery;
		});
		</script>
</body>
</html>