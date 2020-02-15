<?php
namespace app\admin\controller;
use think\Controller;
use Util\data\Sysdb;
use PHPMailer\PHPMailer\PHPMailer;
/**
* 
*/
class Base extends Controller
{
	public function __construct(){
		parent::__construct();
		$this->_admin = session('admin');
		// 未登录的用户不允许访问
		if(!$this->_admin){
			header('Location:/index.php/admin/Login/index');
			exit;
		}
		$this->assign('admin',$this->_admin);
		// 判断用户是否有权限
		$this->db = new Sysdb;
error_reporting(E_ERROR | E_WARNING | E_PARSE);
	}
	

 /**
     * 栏目图片上传
     *
     */
    public function uploadimg(){
        //获得上传文件对像
        $file = request()->file('imgfile');
        //判断$file是不是文件对像
        if($file){
            $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
            //$imgpath="uploads\\" . $info->getSaveName();
			$filename= $info->getSaveName();
			$exclePath = iconv("GB2312","UTF-8",  $filename);
            //$imgpath="uploads/" . $info->getSaveName();
            $imgpath="uploads/" . $exclePath;
            return json(['code'=>1,'msg'=>'上传成功','img'=>$imgpath]);
        }else{
            return json(['code'=>0,'msg'=>$file->getError()]);
        }

    }
	//文件上传类
static function upload($wjj="",$zwjj=""){
        //获得上传文件对像
        $file = request()->file('imgfile');
        //判断$file是不是文件对像
        if($file){
            $info = $file->move(ROOT_PATH . 'public' . DS ."$wjj".DS."$zwjj");
			$filename= $info->getSaveName();
			$path = iconv("GB2312","UTF-8",  $filename);
            $imgpath="$zwjj/" . $path;
            return json(['code'=>1,'msg'=>'上传成功','img'=>$imgpath]);
        }else{
            return json(['code'=>0,'msg'=>$file->getError()]);
        }
    }
    //单张图片删除

    /**
     * @param string $url  图片地址
     */
    public function delimg($url=""){
        if($url!=="" || !empty($url)){
            $file=ROOT_PATH."public\\".$url;
            if(file_exists($file)){
                $res=unlink($file);
                if($res){
                    //删除成功
                    $this->delpic($url);
                    return json(['code'=>1,'msg'=>"删除成功"]);
                }
                return json(['code'=>0,'msg'=>"删除失败"]);
            }
            $this->delpic($url);
            return json(['code'=>2,'msg'=>"文件不存在"]);
        }

    }

    //删除数据表中图片记录
    protected function delpic($url){
        $pic=db('gsyg')->where('pic',$url)->field('id')->find();
        if($pic){
            db('gsyg')->delete($pic['id']);
        }
    }
 public static function sendTextmail($toemial,$account,$url,$title="账号激活"){
 //$mail=new PHPMailer\PHPMailer\PHPMailer(true);
       $mail = new PHPMailer(true);
        try {
            //Server settings邮箱设置
            $mail->SMTPDebug = 2;                                 // Enable verbose debug output调试模式
            $mail->isSMTP();                                      // Set mailer to use SMTP
            $mail->Host = 'smtp.163.com';  // Specify main and backup SMTP servers
            $mail->SMTPAuth = true;                               // Enable SMTP authentication
            $mail->Username = '13891682076@163.com';                 // SMTP username
            $mail->Password = 'abc666888999';                           // SMTP password授权密码
            $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
            $mail->Port = 25;                                    // TCP port to connect to端口号
            $mail->CharSet = 'UTF-8';//邮件编码的设置
            //Recipients
            $mail->setFrom('13891682076@163.com', '易风博客');
            $mail->addAddress($toemial);               // Name is optional
            $mail->addReplyTo('13891682076@163.com', '易风课堂');

            //Content
            $mail->isHTML(true);                              // Set email format to HTML
            $mail->Subject = $title;
            $mail->Body    = "你好!<br>感谢你注册易风博客系统。 <br>你的登录用户名为：{$account}。请点击以下链接激活帐号：
<a href='{$url}' target='_blank'>{$url}</a><br>如果以上链接无法点击，请将上面的地址复制到你的浏览器(如IE)的地址栏进入易风博客系统激活账号。 （该链接在24小时内有效，24小时后需要重新注册）";

            $mail->send();

        } catch (Exception $e) {

        }
    }
//状态改变
   static function state($db=""){
        $id=input('post.id');
        $status=input('post.status');
        if(db("$db")->where('id='.$id)->update(['status'=>$status])!==false){
            return ['status'=>1,'msg'=>'设置成功!'];
        }else{
            return ['status'=>0,'msg'=>'设置失败!'];
        }
    }
//性别修改
    static function sex($db=""){
        $id=input('post.id');
        $sex=input('post.sex');
        if(db("$db")->where('id='.$id)->update(['sex'=>$sex])!==false){
            return ['sex'=>1,'msg'=>'设置成功!'];
        }else{
            return ['sex'=>0,'msg'=>'设置失败!'];
        }
    }
	//保存信息
	static function sav($db=""){
		if(request()->isPost()){
		$data=input('post.');
 $validate=validate($db);//实例化验证器
            //数据验证
            if(!$validate->scene('add')->check($data)){
                $this->error($validate->getError(),'add','',1);
                return;
            }
		}
		
	if($data['id']){
			model("$db")->allowField(true)->save($data,['id' => $data['id']]);
		}else{
				model("$db")->allowField(true)->save($data);
				}
return json(['code'=>0,'msg'=>"保存成功"]);
	}
	//权限管理
	public function qx($controller=""){
		//获取角色的所有权限
		$a=db('admin_groups') ->field('rights')->where(array('gid'=>$this->_admin['gid']))->find();
		//把json数据替换成数组
		$b=str_replace(array("[","]"),"",$a['rights']);
		//获取该控制器的删除权限id
		$m_del=db("admin_menus")->where(['controller' => "$controller",'method' => "del"])->field("mid")->find();
	//获取该控制器的添加，编辑权限id
		$m_add=db("admin_menus")->where(['controller' => "$controller",'method' => "add"])->field("mid")->find();
		//赋值给前台页面，如果角色有该权限，则显示。实现权限控制
	$this->assign(['b'=>$b,'m_del'=>$m_del,'m_add'=>$m_add]);
	}
}