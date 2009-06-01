<?php 
session_start(); 
session_register("login_check_number"); 
$img_height=50;    
$img_width=20; 
if($HTTP_GET_VARS["act"]== "ejew"){ 
    srand(microtime() * 100000);//PHP420后，srand不是必须的 
    for($Tmpa=0;$Tmpa<4;$Tmpa++){ 
        $nmsg.=dechex(rand(0,15)); 
    }

    $HTTP_SESSION_VARS[login_check_number] = $nmsg; 

    //$HTTP_SESSION_VARS[login_check_number] = strval(mt_rand("1111","9999"));    

    $aimg = imageCreate($img_height,$img_width);     
    ImageColorAllocate($aimg, 200,200,200);            
    $black = ImageColorAllocate($aimg, 0,0,0);       
    
    for ($i=1; $i<=100; $i++) {     
        imageString($aimg,0,mt_rand(1,$img_height),mt_rand(1,$img_width),"*",imageColorAllocate($aimg,mt_rand(200,255),mt_rand(200,255),mt_rand(200,255))); 
         
    } 
ImageRectangle($aimg,0,0,$img_height-1,$img_width-1,$black);

    for ($i=0;$i<strlen($HTTP_SESSION_VARS[login_check_number]);$i++){ 
        imageString($aimg, mt_rand(5,5),$i*$img_height/5+mt_rand(6,6),mt_rand(1,$img_width/10), $HTTP_SESSION_VARS[login_check_number][$i],imageColorAllocate($aimg,mt_rand(0,100),mt_rand(0,150),mt_rand(0,200))); 
    } 
    Header("Content-type: image/png");    
    ImagePng($aimg);                    
    ImageDestroy($aimg); 
} 

?> 
