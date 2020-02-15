<?php
namespace app\admin\controller;
use app\admin\model\Bm;
use app\admin\controller\Base;
/**
* 部门管理
*/
class Bumen extends Base
{
	// 部门列表
	public function index(){
		$bmall=Bm::order('sort asc,id Asc')->select();
        $bm=Bm::getbmall($bmall,0,-1);
        //$this->assign('cate',$cate);
        //return view();
		//$bm = $this->db->table('bm')->lists();
		//$data['lists'] = $this->db->table('ky')->lists();
		// 加载角色
		//$data['groups'] = $this->db->table('admin_groups')->cates('gid');
		//$this->assign('bm',$bm);
//$bm['cz']='<button class="layui-btn layui-btn-xs" onclick="add({$vo.id})">编辑</button>	<button class="layui-btn layui-btn-danger layui-btn-xs" onclick="del({$vo.id})">删除</button>';

$json['data']=$bm;
$json=json_encode($json['data']);
$this->assign('json',$json);
$this->assign('bm',$bm);
$this->qx($controller="bumen");
return view();
	
	}
// 添加部门
	public function add(){
		$id = (int)input('get.id');
		// 加载部门
		$data['item'] = $this->db->table('bm')->where(array('id'=>$id))->item();
		// 加载角色
		//$data['groups'] = $this->db->table('bm')->cates('id');
		$bmall = Bm::select();
		$data['groups']=Bm::getbmall($bmall,0,-1);
		$this->assign('data',$data);
		return $this->fetch();
	}
// 保存部门
	public function save(){
		$id = (int)input('post.id');
		$data['name'] = trim(input('post.name'));
		$data['pid'] = (int)input('post.pid');
		$data['sort'] = (int)input('post.sort');
		

		if(!$data['name']){
			exit(json_encode(array('code'=>1,'msg'=>'部门名不能为空')));
		}
		 $cateids=Bm::getchildids($id);
            $cateids[]=$id;
            //判断更新条件,pid不在当前编辑栏目或者其子分类中
            if(!in_array($data['pid'],$cateids)){
                $this->error("上级栏目选择错误！");
            }
		
		
		$res = true;
		if($id==0){
			// 检查部门是否已存在
			$item = $this->db->table('bm')->where(array('name'=>$data['name']))->item();
			if($item){
				exit(json_encode(array('code'=>1,'msg'=>'该部门已存在,请重新设置')));
			}
		
			// 保存部门
			$res = $this->db->table('bm')->insert($data);
		}else{
			$this->db->table('bm')->where(array('id'=>$id))->update($data);
		}
		
		if(!$res){
			exit(json_encode(array('code'=>1,'msg'=>'保存失败')));
		}
		exit(json_encode(array('code'=>0,'msg'=>'保存成功')));
	}
// 删除管理员
	public function del(){
		$id = (int)input('post.id');
		$res = $this->db->table('bm')->where(array('id'=>$id))->delete();
		if(!$res){
			exit(json_encode(array('code'=>1,'msg'=>'删除失败')));
		}
		exit(json_encode(array('code'=>0,'msg'=>'删除成功')));
}
}