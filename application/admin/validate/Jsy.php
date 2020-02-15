<?php
/**
 * Created by PhpStorm.
 * User: yifeng
 * Date: 2017/10/8
 * Time: 23:54
 */

namespace app\admin\validate;


use think\Validate;

class Jsy extends Validate
{
    protected $rule =   [
        'jsz'  => 'unique:jsy',
    ];
    protected $message  =   [
        
        'jsz.unique'     => '驾驶证已存在',
       
    ];
    protected $scene = [
        'add'   =>['jsz'],
       
    ];
}