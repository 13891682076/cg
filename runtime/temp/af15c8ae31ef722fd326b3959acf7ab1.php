<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:68:"C:\phpStudy\WWW\cg\public/../application/admin/view/login/index.html";i:1525958693;}*/ ?>
<!DOCTYPE html>
<html>
<head>
	<title>登录</title>
	<link rel="stylesheet" type="text/css" href="/static/plugins/layui/css/layui.css">
	<script type="text/javascript" src="/static/plugins/layui/layui.js"></script>
</head>
<body style="background: #1E9FFF">
	<div style="position: absolute; left:50%;top:50%;width: 500px;margin-left: -250px;margin-top: -200px;">
		<div style="background: #ffffff;padding: 20px;border-radius: 4px;box-shadow: 5px 5px 20px #444444;">
			<div class="layui-form">
				<div class="layui-form-item" style="color:gray;">
					<h2>城固县汽车运输公司后台管理系统</h2>
				</div>
				<hr>
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-block">
						<input type="text" id="username" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
					<div class="layui-input-block">
						<input type="password" id="password" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">验证码</label>
					<div class="layui-input-inline">
						<input type="text" id="verifycode" class="layui-input">
					</div>
					<img src="<?php echo captcha_src(); ?>" id="img" onclick="reloadImg()">
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" onclick="login()">登录</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		layui.use(['layer'],function(){
			$ = layui.jquery;
			layer = layui.layer;

			// 用户名控件获取焦点
			$('#username').focus();
			// 回车登录
			$('input').keydown(function(e){
				if(e.keyCode == 13){
					dologin();
				}
			});
		});

		// 重新生成验证码
		function reloadImg(){
			$('#img').attr('src','<?php echo captcha_src(); ?>?rand='+Math.random());
		}

		// 登录
		function login(){
			var username = $.trim($('#username').val());
			var pwd = $.trim($('#password').val());
			var verifycode = $.trim($('#verifycode').val());
			if(username == ''){
				layer.alert('请输入用户名',{icon:2});
				return;
			}
			if(pwd == ''){
				layer.alert('请输入密码',{icon:2});
				return;
			}
			if(verifycode==''){
				layer.alert('请输入验证码',{icon:2});
				return;
			}
			$.post('<?php echo url("login"); ?>',{'username':username,'pwd':pwd,'verifycode':verifycode},function(res){
				if(res.code>0){
					reloadImg();
					layer.alert(res.msg,{icon:2});
				}else{
					layer.msg(res.msg,{icon:1});
					setTimeout(function(){window.location.href = '<?php echo url("Index/index"); ?>'},1000);
				}
			},'json');
		}
	</script>
</body>
</html>