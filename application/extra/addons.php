<?php
/**
 * Created by PhpStorm.
 * User: yifeng
 * Date: 2018/10/9
 * Time: 23:46
 */
return [
    // 是否自动读取取插件钩子配置信息（默认是关闭）
    'autoload' => true,
    // 当关闭自动获取配置时需要手动配置hooks信息
    'hooks' => [
        // 可以定义多个钩子
       'testhook'=>'test',
        'gghook'=>'guanggao'
    ],
    'fileflag'=>'config.php'
];