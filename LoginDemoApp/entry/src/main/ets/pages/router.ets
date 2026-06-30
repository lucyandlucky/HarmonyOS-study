@Entry
@Component
struct Router {
  pathStack: NavPathStack = new NavPathStack()

  aboutToAppear(): void {
    this.pathStack.pushPathByName('LoginPage', null, false)
  }

  build() {
    Navigation(this.pathStack) {
    }.hideTitleBar(true)
  }
}
