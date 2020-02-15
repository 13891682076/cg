<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:67:"C:\phpStudy\WWW\cg\public/../application/admin/view/gsyg/index.html";i:1543848774;}*/ ?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="/static/plugins/layui/css/layui.css">
	<link rel="stylesheet" type="text/css" href="/static/plugins/bootstrap.min.css">
	<script type="text/javascript" src="/static/plugins/layui/layui.js"></script>
	<script type="text/javascript" src="/static/plugins/bootstrap.min.js"></script>
<script src="/static/admin/js/hs.js"></script>
	<style type="text/css">
		.header span{background: #009688;margin-left: 30px;padding: 10px;color:#ffffff;}
		.header div{border-bottom: solid 2px #009688;margin-top: 8px;}
		.header button{float: right;margin-top: -5px;}
	
		table{border-radius:5px;}
		td,th{border:1px solid #cec;text-align:center;padding:4px;}
		</style>
</head>
<body style="padding: 10px;">
	<div class="header">
		<span>人员列表</span>
<?php if(in_array(($m_add['mid']), is_array($b)?$b:explode(',',$b))): ?>
		<button class="layui-btn layui-btn-sm" onclick="show('添加','add/','980px','820px')">添加</button>
		<?php endif; ?>
		<div></div>

	</div>
   <div class="layui-form-item" style="margin-top: 10px;">
		<div class="layui-input-inline">
			<input type="text" class="layui-input" value="<?php echo $data['name']; ?>" id="name" placeholder="请输入员工姓名">
		</div>
		<button class="layui-btn layui-btn-primary" onclick="searchs()"><i class="layui-icon">&#xe615;</i>搜索</button>
	</div>
<form class="layui-form"  >
   <table >
    <thead>
    <tr style="height: 40px" pid="0">
        
        <th style="width:60px">ID</th>
        <th style="width:90px">姓名</th>
        <th style="width:60px">性别</th>
        <th style="width:160px">身份证</th>
        <th style="width:100px">身份证图片</th>
        <th style="width:100px">照片</th>
        <th style="width:100px">工作时间</th>
        <th style="width:80px">工作岗位</th>
        <th style="width:200px">简历</th>
        <th style="width:100px">职务</th>
        <th style="width:80px">在岗情况</th>
        <th style="width:80px">电话</th>
        <th style="width:auto">操作</th>
    </tr>
    </thead>
    <tbody>

    <?php if(is_array($data['list']) || $data['list'] instanceof \think\Collection || $data['list'] instanceof \think\Paginator): $i = 0; $__LIST__ = $data['list'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
    <tr>
       
        <td style=""><a href='jianli/?id=<?php echo $vo['id']; ?>'target="_blank" ><?php echo $vo['id']; ?></a></td>
        <!-- <td><a href='jianli'target="_blank" ><?php echo $vo['name']; ?></a></td> -->
        <td><a onclick="jianli(<?php echo $vo['id']; ?>)"><?php echo $vo['name']; ?></a></td>
        <td><input type="checkbox" name="sex" lay-filter="sex" lay-skin="switch" lay-text="男|女" value="<?php echo $vo['id']; ?>" <?php echo $vo['sex']==1?'checked' : ''; ?>></td>
        <td><?php echo $vo['sfz']; ?></td>
        <td style="">
                        <img src="/gsyg/<?php echo $vo['pic']; ?>" alt="" height="25" onclick="tClick(id)" id='<?php echo $vo['id']; ?>'></td>
        <td><img src="/gsyg/<?php echo $vo['zp']; ?>" alt=""height="25"onclick="layer.tips('<img src=/gsyg/<?php echo $vo['zp']; ?> width=200%>',this,{time:12000,tips: [1, '#fff']});" onmouseout="layer.closeAll();"></td>
        <td><?php echo substr($vo['gzsj'],0,10); ?></td>
        <td style=""><?php echo $vo['gw']; ?></td>
        <td  onclick="show('<?php echo $vo['name']; ?>简介','desc/?id=<?php echo $vo['id']; ?>','600px','500px')"><?php echo subtext($vo['desc'],16); ?></td>
        <td style=""><?php echo $vo['zw']; ?></td>
        <td style=""><input type="checkbox" name="status" lay-filter="status" lay-skin="switch" lay-text="在岗|离岗" value="<?php echo $vo['id']; ?>" <?php echo $vo['status']==1?'checked' : ''; ?>></td>
		<td style=""><?php echo $vo['tel']; ?></td>
        <td>
            <botton class="layui-btn layui-btn-xs <?php if($vo['pic'] == ''): ?>layui-btn-disabled<?php endif; ?> tupian" id="<?php echo $vo['id']; ?>"><i class="layui-icon">&#xe64a;</i>图片</botton>
<?php if(in_array(($m_add['mid']), is_array($b)?$b:explode(',',$b))): ?>
            <a class="layui-btn layui-btn-xs" onclick="show('编辑<?php echo $vo['name']; ?>','add/?id=<?php echo $vo['id']; ?>','980px','820px')">编辑</a>
			<?php endif; if(in_array(($m_del['mid']), is_array($b)?$b:explode(',',$b))): ?>
			<botton class="layui-btn layui-btn-danger layui-btn-xs" onclick="del(<?php echo $vo['id']; ?>)">删除</botton>
			<?php endif; ?>
        </td>
    </tr>
    <?php endforeach; endif; else: echo "" ;endif; ?>
	
    </tbody>
</table>
</form>
    <div style="padding-top:10px;">
                    <?php echo $data['list']->render(); ?>
                </div>
</div>



<script type="text/javascript">
		layui.use(['layer','form'],function(){
			$=layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
 //图片按钮点击事件
        $('.tupian').on('click',function () {
            var aid=$(this).attr("id");
            if($(this).hasClass('layui-btn-disabled')){
                return false;
            }
            layer.open({
                type: 2,
                title:'图片',
                area: ['700px', '450px'],
                fixed: false, //不固定
                maxmin: true,
                content: '<?php echo url("admin/article/pics"); ?>?aid='+aid
            });
        });
//性别改变
form.on('switch(sex)', function(obj){
            loading =layer.load(1, {shade: [0.1,'#fff']});
            var id = this.value;
            var sex = obj.elem.checked===true?1:0;
            $.post('<?php echo url("sexs"); ?>',{'id':id,'sex':sex},function (res) {
                layer.close(loading);
                if (res.status==1) {
                    tableIn.reload();
                }else{
                    layer.msg(res.msg,{time:1000,icon:2});
                    return false;
                }
            })
        });
//状态改变
form.on('switch(status)', function(obj){
            loading =layer.load(1, {shade: [0.1,'#fff']});
            var id = this.value;
            var status = obj.elem.checked===true?1:0;
            $.post('<?php echo url("ygState"); ?>',{'id':id,'status':status},function (res) {
                layer.close(loading);
                if (res.status==1) {
                    tableIn.reload();
                }else{
                    layer.msg(res.msg,{time:1000,icon:2});
                    return false;
                }
            })
        });
    });


	

		
//图片预览
  $('.thumb').hover(function(){
    $(this).append('<img  src="'+$(this).attr('/<?php echo $vo['pic']; ?>')+'" >');
  },function(){
    $(this).find('img').remove();
  });
 function tClick(id){
         // var url = $('#'+id).children('td').children('img').attr('src');
          var url = $('#'+id).attr('src');
          //页面层
          layer.open({
            type: 1,
			title:'图片',
            skin: '', //加上边框
            area: ['700', ''], //宽高
			maxmin: true,
            content: "<center style='margin:20px;'><img  width='100%' src="+url+"></center>"
          });
      }

function jianli(id){
            layer.open({
            type: 2,
			title:'简历表',
            skin: '', //加上边框
            area: ['210mm', '230mm'], //宽高
			maxmin: true,
            content: '<?php echo url("jianli"); ?>?id='+id
          });
      }
// 搜索
		function searchs(curpage){
			var name = $.trim($('#name').val());
			var url = "<?php echo url('index'); ?>?page="+curpage;
			if(name){
				url += '&name='+name;
			}
			window.location.href = url;
		}

	</script>
</body>
</html>