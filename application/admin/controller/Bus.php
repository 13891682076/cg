<?php
namespace app\admin\controller;
use app\admin\model\Bus as BusModel;
use app\admin\controller\Base;
/**
* 车辆管理
*/
class Bus extends Base
{
	// 车辆列表
	public function index(){
		$bus=array();
		$json=array();
$res['ch'] = trim(input('get.ch'));
$where = array();
		$res['ch'] && $where = 'ch like "%'.$res['ch'].'%"';
		$res['data']=BusModel::order('id Asc')->where($where)->select();
       
$count=db('bus')->count();
$json['code']=0;
$json['msg']="";
$json['count']=$count;
$json['data']=$res['data'];
$m=json_encode($json['data']);
$this->assign('json',$m);
$this->assign('bus',$bus);
$this->qx($controller="bus");
return view();
	
	}
// 添加车辆
	public function add(){
		$id = (int)input('get.id');
		// 加载部门
		$bus['item'] = db('bus')->where(array('id'=>$id))->find();
		// 加载角色
		$bus['bm'] = db('bm')->select();
if($id){
$sfzs=db('sfz')->where('aid',$id)->field('pic')->select();
}
		$this->assign('bus',$bus);
		$this->assign('sfzs',$sfzs);
		return $this->fetch();
	}
//上传公司员工照片，身份证
	public function xsz(){
       return $this->upload($wjj="bus",$zwjj="xsz");
    }
public function yyz(){
        return $this->upload($wjj="bus",$zwjj="yyz");
    }
public function pic(){
        return $this->upload($wjj="bus",$zwjj="pic");
    }
public function sfz(){
        return $this->upload($wjj="bus",$zwjj="sfz");
    }
// 保存车辆
	public function save(){
		if(request()->isPost()){
		$data=input('post.');
		}
		
	if($data['id']){
			model('bus')->allowField(true)->save($data,['id' => $data['id']]);
		}else{
				model('bus')->allowField(true)->save($data);
				}
	if($data['sfz']!=null){
		$arr_tmp=explode(',',$data['sfz']);
			$aid=model('bus')->id;
			$thum=[];
			foreach($arr_tmp as $v){
			$thum[]=['aid'=>$aid,'pic'=>$v];
			}
			db('sfz')->insertAll($thum);}
		return json(['code'=>0,'msg'=>"保存成功"]);
	}
// 删除车辆
	public function del(){
		$id = (int)input('post.id');
		$res = $this->db->table('bus')->where(array('id'=>$id))->delete();
		if(!$res){
			exit(json_encode(array('code'=>1,'msg'=>'删除失败')));
		}
		exit(json_encode(array('code'=>0,'msg'=>'删除成功')));
}
	//车辆概况
public function gaikuang(){
$id = input('get.id');
$res=db('bus')->where(array('id'=>$id))->find();
 $sfz=db('sfz')->where('aid',$id)->order('id asc')->select();
$this->assign('res',$res);
$this->assign('sfz',$sfz);
		return view();
	}
}