@Entry
@Component
struct Index {
  pageInfos: NavPathStack = new NavPathStack()

  build() {
    Navigation(this.pageInfos) {
      Column({ space: 12 }) {
        Button($r('app.string.entry_pageOne'), { stateEffect: true, type: ButtonType.Capsule })
          .width($r('app.string.button_width'))
          .height($r('app.string.button_height'))
          .onClick((event: ClickEvent) => {
            this.pageInfos.pushPathByName('pageOne', null)
          })
      }
      .width($r('app.string.navDestination_width'))
      .height($r('app.string.navDestination_height'))
      .justifyContent(FlexAlign.End)
      .padding({
        bottom: $r('app.string.column_padding'),
        left: $r('app.string.column_padding'),
        right: $r('app.string.column_padding'),
      })
    }
    .title($r('app.string.entry_index_title'))
  }
}