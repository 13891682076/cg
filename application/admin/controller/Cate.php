<?php
namespace app\admin\controller;
use app\admin\model\Cate as CateModel;

/**
* 栏目管理
*/
class Cate extends Base
{
	// 栏目列表
	
		public function index(){
        $cateall=CateModel::order('sort Desc,id Asc')->select();
        $cate=CateModel::getcateall($cateall,0,-1);
        $this->assign('cate',$cate);
        return view();
    }

	// 添加栏目
	//栏目编辑
    public function add(){
	$id = input('get.id');
        //获取栏目列表
        $cateall=CateModel::order('sort Desc,id Asc')->select();
        $res=CateModel::getcateall($cateall,0,-1);
        //获取当前栏目信息
        $result=CateModel::get($id);

	        //拆分图片地址到数组
		if( $result){
        $result->pics=explode(",",$result->pic);}
        $this->assign([
            'cate'=>$res,
            'curcate'=>$result
        ]);
        return view();
    }

	// 保存栏目
	public function save(){
		$id = (int)input('post.id');
		$data['name'] = trim(input('post.name'));
		$data['pid'] = (int)input('post.pid');
		$data['type'] = trim(input('post.type'));
	
		$data['sort'] = trim(input('post.sort'));
		$data['pic'] = trim(input('post.pic'));
		$data['keyword'] = trim(input('post.keyword'));
		$data['desc'] = trim(input('post.desc'));
	
		$data['content'] = trim(input('post.content'));
	if($id){
			$this->db->table('cate')->where(array('id'=>$id))->update($data);
		}else{
	
			$this->db->table('cate')->where(array('name'=>$data['name']))->insert($data);
		}
		exit(json_encode(array('code'=>0,'msg'=>'保存成功')));
	}
	

	// 删除栏目
	public function del(){

		$id = (int)input('post.id');
		$res = $this->db->table('cate')->where(array('id'=>$id))->delete();
		if(!$res){
			exit(json_encode(array('code'=>1,'msg'=>'删除失败')));
				}
		exit(json_encode(array('code'=>0,'msg'=>'删除成功')));
	}

}