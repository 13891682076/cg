<?php
/**
 * Created by PhpStorm.
 * User: yifeng
 * Date: 2017/10/8
 * Time: 23:54
 */

namespace app\admin\validate;


use think\Validate;

class Spy extends Validate
{
    protected $rule =   [
        'sfz'  => 'unique:spy',
    ];
    protected $message  =   [
        
        'sfz.unique'     => '身份证已存在',
       
    ];
    protected $scene = [
        'add'   =>['sfz'],
       
    ];
}