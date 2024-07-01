interface MenuToType{
  title:string;
  url:Resource;
}

@Component
export struct TabUser {
  @State nickname: string = '无言的对话';
  @State signature: string = '154787855677';

  @State menuTopList:MenuToType[] = [
    {
      title:"我的钱包",
      url:$r('app.media.ic_menu4')
    },
    {
      title:"我的收藏",
      url:$r('app.media.ic_menu1')
    },
    {
      title:"我的作品",
      url:$r('app.media.ic_menu3')
    },
    {
      title:"我的服务",
      url:$r('app.media.ic_menu2')
    }
  ];
  @State MenuList:MenuToType[] = [
    {
      title:"我的订单",
      url:$r('app.media.ic_user_1')
    },
    {
      title:"我的资料",
      url:$r('app.media.ic_user_2')
    },
    {
      title:"我的收藏",
      url:$r('app.media.ic_user_5')
    },
    {
      title:"联系客服",
      url:$r('app.media.ic_user_3')
    },
    {
      title:"系统设置",
      url:$r('app.media.ic_user_6')
    },
    {
      title:"检查更新",
      url:$r('app.media.ic_user_4')
    }
  ];

  build() {
    Column() {
      // 顶部
      Column(){
        Flex({justifyContent:FlexAlign.Start,alignItems:ItemAlign.Center}){
          Image('https://img1.baidu.com/it/u=1775314681,3148438664&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500')
            .width(50)
            .height(50)
            .borderRadius(60)
            .margin({right:10})
          Column(){
            Text(this.nickname)
              .fontSize(16)
              .width('100%')
              .textAlign(TextAlign.Start)
            Text('ID: '+this.signature)
              .fontSize(12)
              .margin({top:5})
              .textAlign(TextAlign.Start)
              .width('100%')
          }
        }
        .width('100%')
        Flex({justifyContent:FlexAlign.SpaceAround}){
          Column(){
            Text('10')
              .fontSize(16)
            Text('关注')
              .fontSize(14)
          }
          Column(){
            Text('100')
              .fontSize(16)
            Text('收藏')
              .fontSize(14)
          }
          Column(){
            Text('300')
              .fontSize(16)
            Text('访客')
              .fontSize(14)
          }
          Column(){
            Text('90')
              .fontSize(16)
            Text('点赞')
              .fontSize(14)
          }
        }.margin({top:30})

      }.width('100%')
      .padding(20)
      .height(200)
      .backgroundImage('https://img1.baidu.com/it/u=684770079,849342797&fm=253&fmt=auto&app=120&f=JPEG?w=1422&h=800')

      //主体内容
      Column(){
        Row(){
          ForEach(this.menuTopList, (item:MenuToType) => {
            Column()
            {
              Image(item.url)
                .width(40)
              Text(item.title)
                .width('100%')
                .fontSize(14)
                .margin({top:10})
                .textAlign(TextAlign.Center)
            }.width('25%')
          })
        }.width('100%')
        .backgroundColor('#ffffff')
        .borderRadius(15)
        .padding(15)

        Column(){
          ForEach(this.MenuList, (item:MenuToType) => {
            Row(){
              Row(){
                Image(item.url)
                  .width(20)
                  .margin({right:10})
                Text(item.title)
                  .fontSize(14)
              }
              Image($r('app.media.ic_more'))
                .width(15)

            }.width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
            .borderWidth({bottom:1})
            .borderColor('#f7f7f7')
            .padding({top:12,bottom:12})
          })
        }
        .backgroundColor('#ffffff')
        .borderRadius(15)
        .padding(15)
        .width('100%')
        .margin({top:10})
      }
      .width('100%')
      .padding(15)
      .margin({top:-40})


    }
    .backgroundColor('#f7f7f7')
    .height('100%')
    .width('100%')
  }
}