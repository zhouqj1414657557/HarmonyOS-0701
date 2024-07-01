import router from '@ohos.router';
interface MenuToType{
  title:string;
  url:Resource;
}
@Component
export struct TabHome {
  private swiperController: SwiperController = new SwiperController()
  private scroller: Scroller = new Scroller();
  @State SwiperList :Resource[] =[
    $r('app.media.ic_swiper_1'),
    $r('app.media.ic_swiper_2'),
    $r('app.media.ic_swiper_3'),
  ]
  @State MenuList:MenuToType[] = [
    {
      title:"商品分类",
      url:$r('app.media.ic_men_6')
    },
    {
      title:"优惠券",
      url:$r('app.media.ic_men_7')
    },
    {
      title:"今日爆款",
      url:$r('app.media.ic_men_8')
    },
    {
      title:"秒杀专区",
      url:$r('app.media.ic_men_9')
    }
  ];
  @State dataSource:number[] =[1,2,3,4,5,6]

  build() {
    Scroll(this.scroller) {
      Column() {
        // 轮播
        Swiper(this.swiperController) {
          ForEach(this.SwiperList, (item: string) => {
            Image(item)
              .width('100%')
              .height(200)
              .objectFit(ImageFit.Cover)
              .borderRadius(15)
          })
        }
        .cachedCount(2)
        .index(1)
        .autoPlay(true)
        .interval(4000)
        .indicator(true)
        .loop(true)
        .duration(1000)
        .itemSpace(0)
        .onChange((index: number) => {
          console.info(index.toString())
        })
        // 菜单
        GridRow({
          columns: 4,
          breakpoints: { value: ["400vp", "600vp", "800vp"],
            reference: BreakpointsReference.WindowSize },
          direction: GridRowDirection.Row
        }) {
          ForEach(this.MenuList, (item:MenuToType) => {
            GridCol({ span: 1 }) {
              Column(){
                Image(item.url)
                  .width(40)
                  .height(40)
                  .objectFit(ImageFit.Cover)
                Text(item.title)
                  .fontSize('14vp')
                  .margin({top:10})
              }.onClick(()=>{


              })
            }.padding({top:15})
          })
        }
        .width("100%")
        .backgroundColor('#ffffff')
        .padding({bottom:15})
        .borderRadius(10)
        .margin({top:10})
        // 最新待办
        Column(){
          // 标题
          Row(){
            Text('精品推荐')
            Row(){
              Text('查看更多').fontSize('14vp')
              Image($r('app.media.ic_more'))
                .width(14)
                .height(14)
            }
            .onClick(()=>{
              console.log('----dai')

            })
          }
          .width('100%')
          .margin({top:5})
          .padding({top:15,left:15,right:15})
          .justifyContent(FlexAlign.SpaceBetween)
          .backgroundColor('#ffffff')

          Column(){
            ForEach(this.dataSource, (item:MenuToType) => {
              Flex({justifyContent:FlexAlign.Start,alignItems:ItemAlign.Start}){
                Image('https://imgservice.suning.cn/uimg1/b2c/image/5Peu2kvxNOQrZBIzi91XZA.jpg_800w_800h_4e')
                  .width('40%')
                  .height(100)
                  .borderRadius(5)
                Column(){
                    Text('【新晋销冠】美的10KG全自动洗衣机')
                      .fontSize(14)
                      .width('100%')
                      .textAlign(TextAlign.Start)

                     Text('不锈钢|二级能效')
                       .fontSize(14)
                       .fontColor('#ff7c6969')
                       .width('100%')
                       .textAlign(TextAlign.Start)
                       .margin({top:5})
                      Row(){
                         Text('￥1987.40')
                           .fontSize(14)
                           .fontColor('red')
                         Text('￥2987.40')
                           .fontSize(12)
                           .margin({left:10})
                           .fontColor('#ff695a5a')
                      }
                      .width('100%')
                      .margin({top:5})
                  Row(){
                    Text('1000+条好评')
                      .fontSize(12)
                      .fontColor('#695a5a')
                    Text('98%好评')
                      .fontSize(12)
                      .margin({left:10})
                      .fontColor('#695a5a')
                  }
                  .width('100%')
                  .margin({top:5})



                }.width('60%')
                .padding({left:15})
              }.margin({bottom:15})
            })
          }.backgroundColor('#fff')
          .padding(10)

        }
        .margin({top:5})
      }
      .width('100%')
      .borderRadius(10)
    }
    .height('100%')
    .width('100%')
    .align(Alignment.TopStart)
    .scrollBar(BarState.Off)
    .padding(5)

  }
}