<?php
namespace app\admin\controller;
use Util\data\Sysdb;

/**
* 后台首页
*/
class Index extends Base
{
	public function index(){

		$menus = false;
		$role = $this->db->table('admin_groups')->where(array('gid'=>$this->_admin['gid']))->item();
		if($role){
			$role['rights'] = (isset($role['rights']) && $role['rights']) ? json_decode($role['rights'],true) : [];
		}
		if($role['rights']){
			$where = 'mid in('.implode(',',$role['rights']).') and ishidden=0 and status=0';
			$menus = $this->db->table('admin_menus')->where($where)->cates('mid');
			$menus && $menus = $this->gettreeitems($menus);
		}
		$site = $this->db->table('sites')->where(array('names'=>'site'))->item();
		$site && $site['values'] = json_decode($site['values']);

		$this->assign('site',$site);
		$this->assign('role',$role);
		$this->assign('menus',$menus);
		return view();
	}

	private function gettreeitems($items){
		$tree = array();
		foreach ($items as $item) {
			if(isset($items[$item['pid']])){
				$items[$item['pid']]['children'][] = &$items[$item['mid']];
			}else{
				$tree[] = &$items[$item['mid']];
			}
		}
		return $tree;
	}

	// 欢迎页面
	public function welcome(){
		$result=self::sendTextmail('13891682076@163.com','','用户账号','http://cg.com');
		dump($result);die;
		return view();
	}
}