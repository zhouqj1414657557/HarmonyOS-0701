import promptAction from '@ohos.promptAction';
import router from '@ohos.router'
@Entry
@Component
struct Login {
  @State verifyButtonText:string="获取验证码";
  @State loading:boolean=false;
  @State phoneNum:string=""; //手机号码
  @State codeNum:string=""; //验证码
  // 执行登录方法
  onSubmit(){
    if(!this.phoneNum){
      promptAction.showToast({
        message: '请输入手机号码',
        duration: 2000
      });
      return
    }
    if(!this.codeNum){
      promptAction.showToast({
        message: '请输入验证码',
        duration: 2000
      });
      return
    }
    console.log('跳转')
    router.pushUrl(
      {
        url:"pages/Index"
      }
    )
  }
  // 发送验证码
  onSendCode(){
    console.log('发送验证码')
    this.loading=true
    let count:number = 60;
    let intervalID = setInterval(() => {
        if (count > 0) {
          count--;
          this.verifyButtonText= count+'s后获取'
        } else {
          this.verifyButtonText = "获取验证码";
          clearInterval(intervalID);
          this.loading=false
        }
    }, 1000);
  }

  build() {
    Column(){
      Column(){
        Row(){
          Image($r('app.media.ic_logo'))
            .width(80)
            .fillColor('rgba(0,0,0,0.7)')
        }.justifyContent(FlexAlign.Center)
      }.padding({
        top:60,
        bottom:60
      })
      Column(){
        Flex({ justifyContent:FlexAlign.Start,alignItems:ItemAlign.Center }) {
          Image($r('app.media.ic_phone'))
            .width(30)
            .fillColor('rgba(0,0,0,0.7)')
          TextInput({ text:this.phoneNum,placeholder: '请输入手机号' })
            .showUnderline(false)
            .backgroundColor('#ffffff')
            .padding({left:10})
            .maxLength(11)
            .height(50)
            .flexGrow(1)
            .type(InputType.Number)
            .onChange((value: string) => {
              this.phoneNum = value
            })

        }.border({ width: 1, color: 'rgba(43,86,112,0.1)', radius: 50, style: BorderStyle.Solid })
        .padding({left:20})
        Flex({ justifyContent:FlexAlign.Start,alignItems:ItemAlign.Center }) {
          Image($r('app.media.ic_code'))
            .width(30)
            .fillColor('rgba(0,0,0,0.7)')
          TextInput({text:this.codeNum, placeholder: '请输入验证码' })
            .showUnderline(false)
            .backgroundColor('#ffffff')
            .padding({left:10})
            .maxLength(6)
            .height(50)
            .width(200)
            .type(InputType.Number)
            .onChange((value: string) => {
              this.codeNum = value
            })
          Text(this.verifyButtonText)
            .width(120)
            .fontSize(16)
            .textAlign(TextAlign.End)
            .fontColor('rgba(0,0,0,0.7)')
            .enabled(this.loading)
            .onClick(()=>{
              this.onSendCode();
            })

        }.border({ width: 1, color: 'rgba(43,86,112,0.1)', radius: 50, style: BorderStyle.Solid })
        .padding({left:20,right:20})
        .margin({top:30})
      }
      Column(){
        Button('登录')
          .width('100%')
          .height(50)
          .borderRadius(50)
          .backgroundColor('rgba(0,0,0,0.7)')
          .margin({top:50})
          .fontColor('#ffffff')
          .fontSize(18)
          .onClick(()=>{
            this.onSubmit()
          })

      }
      // 微信等快捷登录
      Column(){
        Flex({ justifyContent:FlexAlign.SpaceAround,alignItems:ItemAlign.Center }) {
            Image($r('app.media.ic_weixin'))
              .fillColor('rgba(0,0,0,0.7)')
              .width(40)
            Image($r('app.media.ic_qq'))
              .fillColor('rgba(0,0,0,0.7)')
              .width(40)
          Image($r('app.media.ic_weibo'))
            .fillColor('rgba(0,0,0,0.7)')
            .width(40)
        }
      }.padding({top:60,right:60,left:60})
      // 底部链接
      Column(){
         Row(){
           Text('找回密码')
             .fontColor('rgba(0,0,0,0.7)')
             .fontSize(16)
           Text('|')
             .fontColor('rgba(0,0,0,0.7)')
             .fontSize(16)
             .margin({left:5,right:5})
           Text('注册账号')
             .fontSize(16)
             .fontColor('rgba(0,0,0,0.7)')
         }

      }.margin({top:25})


    }
    .backgroundColor('#ffffff')
    .padding(15)
    .width('100%')
    .height('100%')
  }
}