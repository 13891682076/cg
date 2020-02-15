<?php
/**
 * Created by PhpStorm.
 * User: yifeng
 * Date: 2017/10/5
 * Time: 23:30
 */

namespace app\admin\controller;

class Banci extends Base
{
//    班次列表
    public function index(){
		$res['pageSize'] =10;
		$res['page'] = max(1,(int)input('get.page'));
       // $res=db('banci')->paginate(18);
		$res['wd'] = trim(input('get.wd'));
		$where = array();
		$res['wd'] && $where = 'qd or zd or tjd like "%'.$res['wd'].'%"';
        $res['data']=$this->db->table('banci')->where($where)->order('id asc')->pages($res['pageSize']);
		$this->assign('banci',$res);
		
        return view();
    }

//编辑班次
    public function add($id){//使用了方法的参数绑定
        //班次编辑的核心代码部分
           $data=input('post.');
                    
        $res=db('banci')->where('id',$id)->find();
        $this->assign('banci',$res);
        return view();
  

	}
// 保存班次
	public function save(){
		$data = input('post.');
		$validate=validate('banci');//实例化验证器
            //数据验证
            if(!$validate->scene('add')->check($data)){
                $this->error($validate->getError(),'add','',1);
                return;
			}
		if($data['id']>0){
			db('banci')->where(array('id'=>$data['id']))->update($data);
		}else{
	
			db('banci')->insert($data);
		}
		exit(json_encode(array('code'=>0,'msg'=>'保存成功')));
	}

// 删除班次
	public function del(){
	
		$id = (int)input('post.id');
		$res = db('banci')->where(array('id'=>$id))->delete();
		if(!$res){
			exit(json_encode(array('code'=>1,'msg'=>'删除失败')));
		}
		exit(json_encode(array('code'=>0,'msg'=>'删除成功')));
	}
 //循环班次
    public function dtbc(){
		
		//$res['wd'] && $where = 'zd  like "%'.$res['wd'].'%"';
        $res['xhbc']=db('xhbc')->select();
      // $res['xhch']=db('xhch')->select();
        $ch=db('ch')->where(array('id'=>1))->find();
//dump($ch);die;
		$res['ch']=explode(',',$ch[ch]);
	//dump($res['ch']);die;
		$this->assign('dt',$res);
		
        return view();
}

}