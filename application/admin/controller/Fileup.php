<?php
namespace app\admin\controller;
use app\admin\model\Fileup as FileupModel;
use app\admin\model\Bm as BmModel;
/**
* 栏目管理
*/
class Fileup extends Base
{
	// 文件列表
	
		public function index(){
        $fileup=FileupModel::order('sort Desc,id Asc')->select();
        $json['data']=$fileup;
		$json=json_encode($json['data']);
		$this->assign('json',$json);
        return view();
    }
 public function uploads(){
        //获得上传文件对像
        $file = request()->file('files');
        //判断$file是不是文件对像
        if($file){
            $info = $file->move(ROOT_PATH . 'public' . DS . 'up');
			$filename= $info->getSaveName();//获取文件名
			$path = iconv("GB2312","UTF-8",  $filename);
			//$wj=substr($exclePath,  9);
			$wj=$path;
            $filepath="up/" . $path;//保存路径
            return json(['code'=>1,'msg'=>'上传成功','wj'=>$wj,'filename'=>$filepath]);
        }else{
            return json(['code'=>0,'msg'=>$file->getError()]);
        }

    }
	// 文件上传
	//栏目编辑
    public function up(){
	
        return view();
    }

	// 保存文件
	public function save(){
		if(request()->isPost()){
		$data=input('post.');
		$data['filename'] = trim(input('post.filename'));
	}
	if($id){
			$this->db->table('fileup')->where(array('filename'=>$data['filename']))->update($data);
		}else{
	
			$this->db->table('fileup')->where(array('filename'=>$data['filename']))->insert($data);
		}
		exit(json_encode(array('code'=>0,'msg'=>'保存成功')));
	}
	

	// 删除文件
	public function del($id){

		$id = (int)input('post.id');
 $fil=db('fileup')->find($id);

		$files=ROOT_PATH ."public/".$fil['filename'];
 $file=urldecode($files);
        $file=iconv('UTF-8',"GB2312",$file);
		$res = db('fileup')->where(array('id'=>$id))->delete();
		if(!$res){
			exit(json_encode(array('code'=>1,'msg'=>'删除失败')));
				}
 @unlink($file);
		exit(json_encode(array('code'=>0,'msg'=>'删除成功')));
	}

//    文件下载
    public function download($id){
	if(request()->isPost()){
        $id=input('get.id');
		}
	        $fil=db('fileup')->find($id);

		$files=ROOT_PATH ."public/".$fil['filename'];
        $file=urldecode($files);
        $file=iconv('UTF-8',"GB2312",$file);
        if(!file_exists($file)){
            $this->error("文件不存在");
        }
        $filename=basename(iconv('GB2312',"UTF-8",$file));
        header('Content-Disposition: attachment;filename='.$filename);
        readfile($file);
    }
}