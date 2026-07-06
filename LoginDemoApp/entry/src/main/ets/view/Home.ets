import MainViewModel from "../viewmodel/MainViewModel"
import ItemData from "../viewmodel/ItemData";

import { JSON } from "@kit.ArkTS"

@Component
export default struct Home {
  private swipeController: SwiperController = new SwiperController()

  build() {
    Column() {
      Text($r('app.string.mainPage_tabTitles_home'))
        .width('100%')
        .margin({ top: '48vp', bottom: '12vp' })
        .fontSize('28fp')
        .fontWeight(700)

      Scroll() {
        Column() {
          Swiper(this.swipeController) {
            ForEach(
              MainViewModel.getSwiperImages(),
              (img: Resource) => {
                Image(img)
                  .width('100%')
                  .borderRadius('16fp')
              },
              (img: Resource) => JSON.stringify(img.id))
          }
          .autoPlay(true)

          Grid() {
            ForEach(
              MainViewModel.getFirstGridData(),
              (item: ItemData) => {
                GridItem() {
                  Column() {
                    Image(item.img)
                      .width('40vp')
                      .height('40vp')
                    Text(item.title)
                      .fontSize('12fp')
                      .margin({ top: '4vp' })
                  }
                  .height('72vp')
                  .justifyContent(FlexAlign.Center)
                }
              },
              (item: ItemData) => JSON.stringify((item.id))
            )
          }
          .backgroundImage($r('app.media.backgroundImage'))
          .backgroundImageSize({
            width: '100%',
            height: '156vp'
          })
          .columnsTemplate('1fr 1fr 1fr 1fr')
          .columnsGap('8vp')
          .rowsGap('12vp')
          .margin({ top: '12vp' })
          .padding({ top: '12vp', bottom: '12vp' })
          .backgroundColor(Color.White)
          .borderRadius('16vp')
        }
      }
      .height('660vp')
      .align(Alignment.TopStart)
      .scrollBar(BarState.Off)
    }
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .height('100%')
  }
}