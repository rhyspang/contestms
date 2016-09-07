
 var SysSecond;
 var InterValObj;

 $(document).ready(function() {
  SysSecond = parseInt($("#remainSeconds").html()); //这里获取倒计时的起始时间
  InterValObj = window.setInterval(SetRemainTime, 1000); //间隔函数，1秒执行
 });

 //将时间减去1秒，计算天、时、分、秒
 function SetRemainTime() {
  if (SysSecond > 0) {
   SysSecond = SysSecond - 1;  //
   var second = Math.floor(SysSecond % 60);             // 计算秒
   var minite = Math.floor((SysSecond / 60) % 60);      //计算分
   var hour = Math.floor((SysSecond / 3600) % 24);      //计算小时
   var day = Math.floor((SysSecond / 3600) / 24);        //计算天

   $("#remainTime").html(day + "天" + hour + "小时" + minite + "分" + second + "秒");
   //$("#remainTime").html(SysSecond);
  } else {//剩余时间小于或等于0的时候，就停止间隔函数
   window.clearInterval(InterValObj);
   //这里可以添加倒计时时间为0后需要执行的事件
  }
 }
