<?php
/**
 * Created by PhpStorm.
 * User: yifeng
 * Date: 2017/10/23
 * Time: 12:46
 */

namespace app\admin\model;


use think\Model;

class Bus extends Model
{
   protected static function init(){
      
       
        //删除之后
        self::afterDelete(function ($data) {
            $aid=$data['id'];
            $res=db('sfz')->where('aid',$aid)->select();
            if($res){//如果有对应的图片，图片文件的删除
                foreach ($res as $v){
                    $file=ROOT_PATH ."\\public\\".$v['pic'];
                    if(file_exists($file)){
                        @unlink($file);
                    }
                }
                db('sfz')->where('aid',$aid)->delete();
            }
        });
		}  

    //获取栏目列表-优化

    /**
     * @param $data 包含 所有栏目分类的数组
     * @param int $pid  上级栏目标识
     * @param int $level 层级数
     * @return array
     */
    public static function getbusall($data,$pid=0,$level=-1){
            //$res=self::where('pid',$pid)->select();
            static $arr=array();
            $level+=1;//$lelve=$level+1;
            if($level==0){
                $str="";
            }else{
                $str="|";
            }
            foreach ($data as $v){
                if($pid==$v['pid']){
                    $tmp_arr=array();
                    $tmp_arr['id']=$v['id'];
                    $tmp_arr['name']=$str.str_repeat("----",$level).$v['name'];
                    $tmp_arr['pid']=$v['pid'];
                    $tmp_arr['sort']=$v['sort'];
                   
                    $arr[]=$tmp_arr;
                    self::getbusall($data,$v['id'],$level);
                    unset($v);
                }

            }
            return $arr;
    }

//获取子栏目id,包含自身ID
    public static function getchildids($id){
        $res=self::where('pid',$id)->field('id')->select();
        static $arr=array();
        foreach ($res as $v){
            $arr[]=$v['id'];
            self::getchildids($v['id']);
        }
        return $arr;
    }
  
}