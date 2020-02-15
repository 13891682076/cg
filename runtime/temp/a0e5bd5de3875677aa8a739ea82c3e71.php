<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:65:"C:\phpStudy\WWW\cg\public/../application/admin/view/gsyg/add.html";i:1543848256;}*/ ?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="/static/plugins/layui/css/layui.css">
	<script type="text/javascript" src="/static/plugins/layui/layui.js"></script>
<style>
        .layui-form-select dl{z-index: 2;}
        #thumb_list{padding-top: 8px;}
        #thumb_list img{border: 1px solid #DDD;padding: 3px;border-radius: 5px;}
        #thumb_list span{position: relative;display: inline-block;margin-right: 5px;}
        #thumb_list span .delimg{position: absolute;right:3px;top:3px;}
    </style>
</head>
<body style="padding: 10px;">
	<form class="layui-form">
		<input type="hidden" name="id" value="<?php echo $data['item']['id']; ?>">
		<div class="layui-form-item">
			<label class="layui-form-label">姓名</label>
			<div class="layui-input-inline">
				<input type="text" class="layui-input" name="name" value="<?php echo $data['item']['name']; ?>" <?php echo $data['item']['id']>0?'readonly':''; ?>>
			</div>
		
			<label class="layui-form-label">部&nbsp;&nbsp;&nbsp;&nbsp;门</label>
			<div class="layui-input-inline">
				<select name="pid">
					<option value=0></option>
					<?php if(is_array($data['groups']) || $data['groups'] instanceof \think\Collection || $data['groups'] instanceof \think\Paginator): $i = 0; $__LIST__ = $data['groups'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
					<option value="<?php echo $vo['pid']; ?>" <?php echo $vo['pid']==$data['item']['id']?'selected' : ''; ?>><?php echo $vo['name']; ?></option>
					<?php endforeach; endif; else: echo "" ;endif; ?>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">身份证</label>
			<div class="layui-input-inline">
				<input type="text" class="layui-input" name="sfz" value="<?php echo $data['item']['sfz']; ?>">
			</div>
<label class="layui-form-label">工作时间</label>
			<div class="layui-input-inline">
				<input type="text" class="layui-input" id="gzsj" name="gzsj" value="<?php echo $data['item']['gzsj']; ?>">
			</div>
		</div>
 <div class="layui-form-item">
            <label class="layui-form-label">身份证</label>
            <div class="layui-input-inline">
                <input type="text" name="pic" value="<?php echo $data['item']['pic']; ?>" placeholder="请上传身份证" autocomplete="off" class="layui-input">
                <button type="button" class="layui-btn" id="uploadimg"onclick="return false;">
                    <i class="layui-icon">&#xe67c;</i>上传身份证
                </button>
                <div id="thumb_list">

                    <?php if($data['item']['pic']  != ''): ?>
                    <span>
                        <img src="/gsyg/<?php echo $data['item']['pic']; ?>" alt="" height="80">
                        <button type="button" class="layui-btn layui-btn-danger layui-btn-xs delimg" onclick="delimg(this);"data="<?php echo $vo; ?>">
                        <i class="layui-icon">&#xe640;</i>
                        </button>
                    </span>
                    <?php endif; ?>
                   
                </div>
            </div>
<label class="layui-form-label">照片</label>
            <div class="layui-input-inline">
                <input type="text" name="zp" value="<?php echo $data['item']['zp']; ?>" placeholder="请上传照片" autocomplete="off" class="layui-input">
                <button type="button" class="layui-btn" id="uploadzp"onclick="return false;">
                    <i class="layui-icon">&#xe67c;</i>上传照片
                </button>
                <div id="thumb_list">

                    <?php if($data['item']['zp']  != ''): ?>
                    <span>
                        <img src="/gsyg/<?php echo $data['item']['zp']; ?>" alt="" height="80">
                        <button type="button" class="layui-btn layui-btn-danger layui-btn-xs delimg" onclick="delimg(this);"data="<?php echo $vo; ?>">
                        <i class="layui-icon">&#xe640;</i>
                        </button>
                    </span>
                    <?php endif; ?>
                  
                </div>
           
        </div>
</div>
<div class="layui-form-item">
			<label class="layui-form-label">岗位</label>
			<div class="layui-input-inline">
				<input type="text" class="layui-input" name="gw" value="<?php echo $data['item']['gw']; ?>">
			</div>
<label class="layui-form-label">职务</label>
			<div class="layui-input-inline">
				<input type="text" class="layui-input" name="zw" value="<?php echo $data['item']['zw']; ?>">
			</div>
<label class="layui-form-label">电话</label>
			<div class="layui-input-inline">
				<input type="text" class="layui-input" name="tel" value="<?php echo $data['item']['tel']; ?>">
			</div>
		</div>
<div class="layui-form-item">
            <label class="layui-form-label">简历</label>
            <div class="layui-input-block">
                <textarea id="desc" name="desc" type="text/plain" style="height:300px;"><?php echo $data['item']['desc']; ?></textarea>
            </div>
        </div>

			
	</form>
	<div class="layui-form-item">
		<div class="layui-input-block">
			<button class="layui-btn"  onclick="save()">保存</button>
		</div>
	</div>

	<!-- 配置文件 -->
<script type="text/javascript" src="/static/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="/static/ueditor/ueditor.all.js"></script>
<script>
    var ue = UE.getEditor('desc',{
        initialFrameWidth:null,
    });
    layui.use(['form','upload','laydate'], function(){
        var form = layui.form;
        var upload = layui.upload;
		laydate = layui.laydate;//日期插件
		    $ = layui.jquery;

 laydate.render({
    elem: '#gzsj' //指定元素
	,type: 'datetime'
  });

        //监听提交
        form.on('submit(formDemo)', function(data){
        });
        //监听栏目
        form.on('select(lanmu)', function(data){
            console.log(data.elem); //得到select原始DOM对象
            console.log(data.value); //得到被选中的值
            var lmtype=$(data.elem).find('option:selected').attr('data');
            switch (lmtype){
                case "6":
                    $('#team').fadeIn();
                    $('#model').hide();
                    break;
                case "3":
                    $('#model').fadeIn();
                    $('#team').hide();
                    break;
                default :
                    $('#model').hide();
                    $('#team').hide();
                    break;
            }
        });
        //创建一个身份证上传组件
        upload.render({
            elem: '#uploadimg'
            ,url: '<?php echo url("sfz"); ?>'
            ,accept: 'images' //允许上传的文件类型
            ,field:"imgfile"
            ,size: 2048 //最大允许上传的文件大小
            ,done: function(res, index, upload){ //上传后的回调
                layer.close(layer.index,{isOutAnim:true});
                setTimeout(function () {
                    layer.msg(res.msg);
                    if(res.code==1){
                        var pic=$('input[name=pic]').val();
                        if(pic==""){
                            $('input[name=pic]').val(res.img);
                        }else{
                            $('input[name=pic]').val(pic+","+res.img);
                        }
                        var str;
                        str="<span>";
                        str=str+'<img src="/gsyg/'+res.img+'" alt="" height="80">';
                        str=str+'<button type="button" class="layui-btn layui-btn-danger layui-btn-xs delimg" onclick="delimg(this);" data="'+res.img+'">';
                        str=str+'<i class="layui-icon">&#xe640;</i>';
                        str=str+'</button>';
                        str=str+'</span>';
                        $('#thumb_list').append(str);
                    }else{

                    }

                },500);
            }
            ,before:function () {
                var index = layer.load();
            }

            //,……
        })
//创建一个照片上传组件
        upload.render({
            elem: '#uploadzp'
            ,url: '<?php echo url("zp"); ?>'
            ,accept: 'images' //允许上传的文件类型
            ,field:"imgfile"
            ,size: 2048 //最大允许上传的文件大小
            ,done: function(res, index, upload){ //上传后的回调
                layer.close(layer.index,{isOutAnim:true});
                setTimeout(function () {
                    layer.msg(res.msg);
                    if(res.code==1){
                        var zp=$('input[name=zp]').val();
                        if(zp==""){
                            $('input[name=zp]').val(res.img);
                        }else{
                            $('input[name=zp]').val(zp+","+res.img);
                        }
                        var str;
                        str="<span>";
                        str=str+'<img src="/gsyg/'+res.img+'" alt="" height="80">';
                        str=str+'<button type="button" class="layui-btn layui-btn-danger layui-btn-xs delimg" onclick="delimg(this);" data="'+res.img+'">';
                        str=str+'<i class="layui-icon">&#xe640;</i>';
                        str=str+'</button>';
                        str=str+'</span>';
                        $('#thumb_list').append(str);
                    }else{

                    }

                },500);
            }
            ,before:function () {
                var index = layer.load();
            }

            //,……
        })
    });


    //删除栏目图片
    function delimg(obj) {
        var picurl=$(obj).attr('data');
        $.ajax({
            type:"post",
            url:"<?php echo url('Base/delimg'); ?>",
            data:{'url':picurl},
            success:function (res) {
                var picvalue=$('input[name=pic]').val();
                var str="";
                if(res.code==1 || res.code==2){
                    //栏目图片文本框中图片地址处理
                    if(picvalue==picurl){
                        $('input[name=pic]').val('');
                    }else{
                        str=picvalue.replace(picurl+",","");
                        str=str.replace(","+picurl,"");
                        $('input[name=pic]').val(str);
                    }
                    //删除/移除缩略图
                    $(obj).parent().remove();
                    layer.msg(res.msg);
                }
                if(res.code==0){
                    layer.msg(res.msg);
                }
            }
        });
    }
//保存员工
function save(){
			$.post('<?php echo url("save"); ?>',$('form').serialize(),function(res){
				if(res.code>0){
					layer.alert(res.msg,{'icon':2,'anim':6});
				}else{
					layer.msg(res.msg,{icon:1});
					setTimeout(function(){parent.window.location.reload();},1000);
				}
			},'json');
		}
</script>
</body>
</html>