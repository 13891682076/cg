<?php
namespace app\admin\controller;
use app\admin\model\Spy as spyModel;
use app\admin\controller\Base;
/**
* 售票员管理
*/
class spy extends Base
{
 public function index(){
$spy=array();
		$json=array();
$res['name'] = input('get.name');
$where = array();
		$res['name'] && $where = 'name like "%'.$res['name'].'%"';
$list = db('spy')->alias('s')
      ->join('bus b','b.ch=s.bus','LEFT')
	->field('s.*,b.pic')
	->where($where)
	->order('status desc')->select();
$json['data']=$list;
$m=json_encode($json['data']);
$this->assign('json',$m);
$this->assign('spy',$spy);
$this->qx($controller="spy");
        return view();
    }
// 添加售票员
	public function add(){
		$id = (int)input('get.id');
		// 加载部门
		$spy['item'] = db('spy')->where(array('id'=>$id))->find();
		// 加载角色
		$bus['bm'] = db('bm')->select();
		$this->assign('spy',$spy);
		return $this->fetch();
	}
// 保存售票员信息
	public function save(){
		 return $this->sav($db="spy");
	}
//售票员状态
    public function spyState(){
         return $this->state($db="spy");
     }
//售票员性别修改
    public function spySex(){
         return $this->sex($db="spy");
    }
// 删除售票员
	public function del(){
		$id = (int)input('post.id');
$res=db('spy')->find($id);
		$fil = $this->db->table('spy')->where(array('id'=>$id))->delete();
$sfz=ROOT_PATH ."public/spy/".$res['sfz_pic'];
$zp=ROOT_PATH ."public/spy/".$res['zp'];

 $sfz=urldecode($sfz);
 $zp=urldecode($zp);
        $sfz=iconv('UTF-8',"GB2312",$sfz);
        $zp=iconv('UTF-8',"GB2312",$zp);
       
		if(!$fil){
			exit(json_encode(array('code'=>1,'msg'=>'删除失败')));
		}
@unlink($sfz);
@unlink($zp);

		exit(json_encode(array('code'=>0,'msg'=>'删除成功')));
}
	//售票员简历
public function jianli(){
$id = input('get.id');
$res=db('spy')->where(array('id'=>$id))->find();
$y=$res['sfz'];
$date=strtotime(substr($y,6,8));//获得出生年月日的时间戳
$sex=(int)(substr($y,16,1));//获取性别
        $today=strtotime('today');//获得今日的时间戳
        $diff=floor(($today-$date)/86400/365);//得到两个日期相差的大体年数
        //strtotime加上这个年数后得到那日的时间戳后与今日的时间戳相比
        $age=strtotime(substr($y,6,8).' +'.$diff.'years')>$today?($diff+1):$diff;
       
$this->assign('res',$res);
$this->assign('age',$age);
$this->assign('sex',$sex);
		return view();
	}
//上传售票员照片
	public function zp(){
	return $this->upload($wjj="spy",$zwjj="zp");
		}
		//上传售票员身份证
public function sfz(){
       return $this->upload($wjj="spy",$zwjj="sfz");
        }
    }

