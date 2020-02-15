<?php
namespace app\admin\controller;
use app\admin\model\Jsy as JsyModel;
use app\admin\controller\Base;
/**
* 车辆管理
*/
class Jsy extends Base
{
 public function index(){
$jsy=array();
		$json=array();
$res['name'] = input('get.name');
$where = array();
		$res['name'] && $where = 'name like "%'.$res['name'].'%"';
$list = db('jsy')->alias('j')
      ->join('bus b','b.ch=j.bus','LEFT')
	->field('j.*,b.pic')->where($where)->order('status desc')->select();
$json['data']=$list;
$m=json_encode($json['data']);
$this->assign('json',$m);
$this->assign('jsy',$jsy);
$this->qx($controller="jsy");
        return view();
    }
// 添加驾驶员
	public function add(){
		$id = (int)input('get.id');
		// 加载部门
		$jsy['item']=db('jsy')->where(array('id'=>$id))->find();
		// 加载角色
		$bus['bm']=db('bm')->select();
		$this->assign('jsy',$jsy);
		return $this->fetch();
	}
// 保存驾驶员信息
	public function save(){
	return $this->sav($db="jsy");
	}
//驾驶员状态
    public function jsyState(){
         return $this->state($db="jsy");
     }
//驾驶员性别修改
    public function jsySex(){
         return $this->sex($db="jsy");
    }
// 删除驾驶员
	public function del(){
		$id = (int)input('post.id');
$res=db('jsy')->find($id);
		$fil = $this->db->table('jsy')->where(array('id'=>$id))->delete();
$jsz=ROOT_PATH ."public/".$res['jsz_pic'];
$zgz=ROOT_PATH ."public/".$res['zgz_pic'];
$sgz=ROOT_PATH ."public/".$res['sgz_pic'];
 $jsz=urldecode($jsz);
 $zgz=urldecode($zgz);
 $sgz=urldecode($sgz);
        $jsz=iconv('UTF-8',"GB2312",$jsz);
        $zgz=iconv('UTF-8',"GB2312",$zgz);
        $sgz=iconv('UTF-8',"GB2312",$sgz);
		if(!$fil){
			exit(json_encode(array('code'=>1,'msg'=>'删除失败')));
		}
@unlink($jsz);
@unlink($zgz);
@unlink($sgz);
		exit(json_encode(array('code'=>0,'msg'=>'删除成功')));
}
	//驾驶员简历
public function jianli(){
$id = input('get.id');
$res=db('jsy')->alias('j')
      ->join('bus b','b.ch=j.bus')
	->field('j.*,b.pic')
	->where(array('j.id'=>$id))->find();
$y=$res['jszh'];
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
	//上传驾驶证，资格证，上岗证
public function jsz(){
      return $this->upload($wjj="jsy",$zwjj="jsz");
    }
public function zgz(){
        return $this->upload($wjj="jsy",$zwjj="zgz");
    }
public function sgz(){
        return $this->upload($wjj="jsy",$zwjj="sgz");
    }
}