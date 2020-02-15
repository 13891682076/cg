<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:66:"C:\phpStudy\WWW\cg\public/../application/admin/view/spy/index.html";i:1542374314;}*/ ?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="/static/plugins/layui/css/layui.css" media="all">
	<script src="/static/plugins/layui/layui.js"></script>
	<script src="/static/plugins/layui/hs.js"></script>
	<script src="/static/admin/js/hs.js"></script>
	<style type="text/css">
		.header span{background: #009688;margin-left: 30px;padding: 10px;color:#ffffff;}
		.header div{border-bottom: solid 2px #009688;margin-top: 8px;}
		.header button{float: right;margin-top: -5px;}
	</style>
</head>
<body style="padding: 10px;">
	<div class="header">
		<span>售票员列表</span>
<?php if(in_array(($m_add['mid']), is_array($b)?$b:explode(',',$b))): ?>
		<button class="layui-btn layui-btn-sm" onclick="show('添加','add/','1300px','780px')">添加</button>
		<?php endif; ?>
		<div></div>

	</div>
<div class="layui-form-item" style="margin-top: 10px;">
		<div class="layui-input-inline">
			<input type="text" class="layui-input" value="<?php echo $spy['name']; ?>" id="name" placeholder="请输入查找售票员姓名">
		</div>
		<button class="layui-btn layui-btn-primary" onclick="searchs()"><i class="layui-icon">&#xe615;</i>搜索</button>
	</div>
<table id="demo"class="layui-hide" lay-filter="demo"></table>

	<script>
		layui.use(['layer','table','form'],function(){
			layer = layui.layer;
			table = layui.table;
			form = layui.form;
			$ = layui.jquery;

//第一个实例
  table.render({
    elem: '#demo'
    ,height: 700
   // ,url: '<?php echo url(index); ?> //数据接口
    ,page: true //开启分页
	,id: 'demo'
	,data:<?php echo $json; ?>
    ,cols: [[ //表头
      {type:'numbers',sort: true}
 
      ,{field: 'name', title: '姓名', width:80, sort: true,toolbar: '#n'}
      ,{field: 'sex', title: '姓别', width:80, sort: true,toolbar: '#sex'}
     
      ,{field: 'sfz',title: '身份证', width:180, sort: true} 
     
      ,{field: 'sgz', title: '上岗证', width:120} 
      ,{field: 'sfz_pic', title: '身份证图片', width:100,toolbar:'#sfz'} 
      ,{field: 'zp', title: '照片', width:100,toolbar:'#zp'} 
       
      ,{field: 'jianli', title: '简历', width:150} 
      ,{field: 'status',align: 'center', title: '在岗状态', width:90,toolbar: '#status'} 
      ,{field: 'bus',align: 'center', title: '服务车辆', width:100} 
       ,{field: 'pic', title: '车辆图片', width:100,toolbar:'#pic'}
      ,{field: 'tel', title: '手机', width:120} 
      ,{field: 'beizu', title: '备注', width:60} 
      ,{title: '操作', width:'auto',toolbar:'#bar'} 
      
    ]],
limit: 15 
  });
 form.on('switch(status)', function(obj){
            loading =layer.load(1, {shade: [0.1,'#fff']});
            var id = this.value;
            var status = obj.elem.checked===true?1:0;
            $.post('<?php echo url("spyState"); ?>',{'id':id,'status':status},function (res) {
                layer.close(loading);
                if (res.status==1) {
                    tableIn.reload();
                }else{
                    layer.msg(res.msg,{time:1000,icon:2});
                    return false;
                }
            })
        });
form.on('switch(sex)', function(obj){
            loading =layer.load(1, {shade: [0.1,'#fff']});
            var id = this.value;
            var sex = obj.elem.checked===true?1:0;
            $.post('<?php echo url("spySex"); ?>',{'id':id,'sex':sex},function (res) {
                layer.close(loading);
                if (res.sex==1) {
                    tableIn.reload();
                }else{
                    layer.msg(res.msg,{time:1000,icon:2});
                    return false;
                }
            })
        });
		});
	</script>
<script id="n">
	<a  onclick="show('{{d.name}}简历','/admin/Spy/jianli/?id={{d.id}}','210mm','230mm')">{{d.name}}</a>
	

	</script>
	<script id="bar">
	<a href='jianli/?id={{d.id}}'class="layui-btn  layui-btn-xs"  target="_blank" >打印</a>
<?php if(in_array(($m_add['mid']), is_array($b)?$b:explode(',',$b))): ?>
	<button class="layui-btn  layui-btn-xs" onclick="show('编辑{{d.name}}','/admin/Spy/add/?id={{d.id}}','1300px','780px')">编辑</button>
	<?php endif; if(in_array(($m_del['mid']), is_array($b)?$b:explode(',',$b))): ?>
	<button class="layui-btn layui-btn-danger layui-btn-xs" onclick="del('{{d.id}}')">删除</button>
	<?php endif; ?>
	</script>
<script id="sfz">
 {{# if(d.sfz_pic){ }}<img src="/spy/{{d.sfz_pic}}" height="35" alt=""onmouseover="layer.tips('<img src=/spy/{{d.sfz_pic}} width=300%>',this,{tips: [2, '#fff']});" onmouseout="layer.closeAll();">{{# } }}
	</script>
</script>
<script id="zp">
 {{# if(d.zp){ }}<img src="/spy/{{d.zp}}" height="35"alt=""onmouseover="layer.tips('<img src=/spy/{{d.zp}} width=300%>',this,{tips: [2, '#fff']});" onmouseout="layer.closeAll();">{{# } }}
	</script>
<script id="pic">
 {{# if(d.pic){ }}<img src="/bus/{{d.pic}}" height="35"alt=""onmouseover="layer.tips('<img src=/bus/{{d.pic}} width=300%>',this,{tips: [2, '#fff']});" onmouseout="layer.closeAll();">{{# } }}
	</script>
<script type="text/html" id="status">
    <input type="checkbox" name="status" value="{{d.id}}" lay-skin="switch" lay-text="在岗|离岗" lay-filter="status" {{ d.status == 1 ? 'checked' : '' }}>
</script>
<script type="text/html" id="sex">
    <input type="checkbox" name="sex" value="{{d.id}}" lay-skin="switch" lay-text="男|女" lay-filter="sex" {{ d.sex == 1 ? 'checked' : '' }}>
</script>
<script>
//搜索
function searchs(curpage){
			var name = $.trim($('#name').val());
			var url = "index/?page="+curpage;
			if(name){
				url += '&name='+name;
			}
			window.location.href = url;
		}
</script>
</body>
</html>