@Component
export struct CommonColumn {
  @BuilderParam content: () => void

  build() {
    Column({ space: 12 }) {
      this.content()
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
}