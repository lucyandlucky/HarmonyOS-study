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

          }
        }
      }
    }
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .height('100%')
  }
}