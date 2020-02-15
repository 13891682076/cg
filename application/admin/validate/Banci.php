<?php
/**
 * Created by PhpStorm.
 * User: yifeng
 * Date: 2017/10/8
 * Time: 23:54
 */

namespace app\admin\validate;


use think\Validate;

class Banci extends Validate
{
    protected $rule =   [
        'zd'  => 'require|unique:banci',
       
    ];
    protected $message  =   [
       
        'zd.require'     => '线路不能为空',
        'zd.unique'     => '线路已存在',
       
    ];
    protected $scene = [
        'add'   =>['zd']
       
    ];
}