@Component
export struct NavigationButton {
  @Consume pageInfos: NavPathStack
  @Prop title: ResourceStr
  @Prop pathName: string

  build() {
    Button(this.title, { stateEffect: true, type: ButtonType.Capsule })
      .width($r('app.string.button_width'))
      .height($r('app.string.button_height'))
      .onClick(() => {
        if (this.pathName === undefined) {
          this.pageInfos.clear()
        } else {
          this.pageInfos.pushPathByName(this.pathName, null)
        }
      })
  }
}