@Entry
@Component
struct Router {
  pathStack: NavPathStack = new NavPathStack()

  aboutToAppear(): void {
    // this.pathStack.replacePathByName('LoginPage', null, false)
    this.pathStack.pushPathByName('MainTab', null, false)
  }

  build() {
    Navigation(this.pathStack) {
    }
    .hideTitleBar(true)
  }
}
