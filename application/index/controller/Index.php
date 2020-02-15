<?php
namespace app\index\controller;

class Index extends Common
{
    public function index()
    { $fileup=db('fileup')->order('sort Desc,id Asc')->select();
        $article=db('article')->order('id Asc')->select();
	
		$this->assign('fileup', $fileup);
		$this->assign('article', $article);
		return view();
    }
   //文章内容
	public function show($id){
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
 $gj=db('gj')->select();
for($i=0; $i< count( $gj); $i++){
$gj[$i]['tjzd']=explode('、',$gj[$i]['tjzd']);
}

$this->assign([	'gj'=>$gj]);
	return view();
	}

 public function gsyg_list()
    { $gsyg=db('gsyg')->select();
	
		$this->assign('gsyg', $gsyg);
		return view();
    }
}
