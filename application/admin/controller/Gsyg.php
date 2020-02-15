<?php
namespace app\admin\controller;

/**
* 员工管理
*/
class Gsyg extends Base
{
	// 员工列表
	public function index(){
	
$data['name'] = input('get.name');
$where = array();
		$data['name'] && $where = 'name like "%'.$data['name'].'%"';
		$data['list'] = db('gsyg')->where($where)->paginate(15);
		foreach($data['list'] as $v){

		$res['pic']=explode(",",$v['pic']);
	
		}
		
		$this->assign('res',$res);
		// 加载角色
		//$data['groups'] = $this->db->table('admin_groups')->cates('gid');
		
		$this->assign('data',$data);
$this->qx($controller="gsyg");
        return view();
	}
//获取简历
	public function desc(){
$id = (int)input('get.id');
	$desc=db('gsyg')->field('desc')->find($id);
	return $desc['desc'];
	}
	// 添加员工
	public function add(){

		$id = (int)input('get.id');
		// 加载员工
		$data['item'] = db('gsyg')->where(array('id'=>$id))->find();
		$res['pic']=explode(",",$data['item']['pic']);
		// 加载角色
		$data['groups'] = db('bm')->select();
		$this->assign('data',$data);
		$this->assign('res',$res);
		return $this->fetch();
	}

	// 保存员工
	public function save(){
		return $this->sav($db="gsyg");
	}
	//上传员工照片，身份证
	public function zp(){
       return $this->upload($wjj="gsyg",$zwjj="zp");
    }
public function sfz(){
        return $this->upload($wjj="gsyg",$zwjj="sfz");
    }
//员工状态
    public function ygState(){
         return $this->state($db="gsyg");
     }
	 //员工性别改变
 public function sexs(){
         return $this->sex($db="gsyg");
    }
	// 删除员工
	public function del(){

		$id = (int)input('post.id');
 $fil=db('gsyg')->find($id);
		$res = db('gsyg')->where(array('id'=>$id))->delete();
$pic=ROOT_PATH ."public/gsyg/".$fil['pic'];
$zp=ROOT_PATH ."public/gsyg/".$fil['zp'];
 $pic=urldecode($pic);
 $zp=urldecode($zp);
        $pic=iconv('UTF-8',"GB2312",$pic);
        $zp=iconv('UTF-8',"GB2312",$zp);
		if(!$res){
			exit(json_encode(array('code'=>1,'msg'=>'删除失败')));
		}
@unlink($pic);
@unlink($zp);
		exit(json_encode(array('code'=>0,'msg'=>'删除成功')));
	}
	//个人简历
public function jianli(){
$id = input('get.id');
$res=db('gsyg')->where(array('id'=>$id))->find();
$this->assign('res',$res);
		return view();
	}
public function delimg($url=""){
        if($url!=="" || !empty($url)){
            $file=ROOT_PATH."public/gsyg/".$url;
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
}