<?php
namespace app\admin\controller;
use app\admin\model\Article as ArticleModel;
use app\admin\model\Bm as BmModel;
/**
* 文章管理
*/
class Article extends Base
{
	// 文章列表
	 public function index($cid=null){
        if($cid){
            $map=['a.cid'=>$cid];
        }else{
            $map=[];
        }
        //获取内容列表信息
        $res=db('article')->alias('a')
            ->join('bm b','b.id=a.cid')
            ->join('pho c','c.aid=a.id','LEFT')
            ->order('a.status desc,a.toptime Desc,a.addtime Desc')
            ->field('a.*,b.name,count(c.pic) as pic')
            ->where($map)
            ->group('a.id')
            ->paginate(10,false,['query'=>['cid'=>$cid]]);
        $this->assign('list',$res);
        //栏目获取
        $bmall= BmModel::order('sort Desc,id Asc')->select();
        $res=BmModel::getbmall($bmall,0,-1);
        $this->assign('bm',$res);
        $this->assign('cid',$cid);
$this->qx($controller="article");
        return $this->fetch();
    }

	// 添加文章
	public function add($id=null){
		$id = (int)input('get.id');
		$data=db('article')->find($id);
		$bmall =db('bm')->select();
		$bm = BmModel::getbmall($bmall,0,-1);
		if($id){
$pics=db('pho')->where('aid',$id)->field('pic')->select();
       // $data['pic']=$pics;
		}
		
$this->assign([
            'article'=>$data,
            'bm'=>$bm,
			'pics'=>$pics
        ]);
		return $this->fetch();
	}

// 保存文章
	public function save(){
		if(request()->isPost()){
		$data=input('post.');
		$data['addtime'] = strtotime(trim(input('post.addtime')));
		}
		if($data['status']){
		$data['toptime'] = time();
		}
	if($data['id']){
			model('article')->allowField(true)->save($data,['id' => $id]);

		}else{
	
			model('article')->allowField(true)->save($data);
		$arr_tmp=explode(',',$data['pic']);
			$aid=model('article')->id;
			$thum=[];
			foreach($arr_tmp as $v){
			$thum[]=['aid'=>$aid,'pic'=>$v];
			}
			db('pho')->insertAll($thum);
		}
		exit(json_encode(array('code'=>0,'msg'=>'保存成功')));
	}
	// 删除文章
	public function delete(){

		$id = (int)input('post.id');
		$res = $this->db->table('article')->where(array('id'=>$id))->delete();
		if(!$res){
			exit(json_encode(array('code'=>1,'msg'=>'删除失败')));
		}
		exit(json_encode(array('code'=>0,'msg'=>'删除成功')));
	}
//置顶
    public function istop(){
        return $this->state($db="article");
    }
 //图片列表
    public function pics($aid){
        $res=db('pho')->where('aid',$aid)->order('sort Desc,id Desc')->select();
        $this->assign('pics',$res);
        return view('pic');
    }
   //删除单张图片

    /**
     * @param string $id 图片Id
     */
    public function delpic($id){
        $res=db('pho')->where('id',$id)->find();
        if($res){
            $pic=$res['pic'];
            $result=db('pho')->delete($id);
            if($result){
                $file=ROOT_PATH ."public/".$pic;
                if(file_exists($file)){
                    if(unlink($file)){
                        $this->success('删除成功');
                    }else{
                        $this->error('删除失败');
                    }
                }
            }
        }

    }
    //图片排序
    public function picsort(){
        if(request()->isAjax()){
            $data=input('post.');
            $result=db('pho')->update($data);
            if($result){
                return json(['code'=>1,'msg'=>"排序成功"]);
            }
            return json(['code'=>0,'msg'=>"排序失败"]);
        }
    }
    //删除内容
    public function del($id){
        $article = model('Article');
        if($article::destroy($id)){//删除成功
            //删除图片内容
            exit(json_encode(array('code'=>0,'msg'=>'删除成功')));
        }
        //删除失败
        exit(json_encode(array('code'=>1,'msg'=>'删除失败')));
    }
    //批量删除
    public function delall(){
        if(request()->isPost()){
            $data=input('post.');
	
             if(empty($data['id'])){
                $this->error("请选择要删除的内容");
            }
            $article = model('Article');
            if($article::destroy($data['id'][0])){//删除成功
                //删除图片内容
                $this->success("删除成功");
            }
            //删除失败
            $this->error("删除失败");
        }
    }
	//文章内容
	public function content($id){
$res=db('article')->alias('a')
            ->join('bm b','b.id=a.cid')
            ->join('pho c','c.aid=a.id','LEFT')
            ->field('a.*,b.name,count(c.pic) as pic')
			->find($id);
$pics=db('pho')->where('aid',$id)->field('pic')->select();
$this->assign(
	['res'=>$res,
	'pics'=>$pics
	]);
	return view();
	}
}