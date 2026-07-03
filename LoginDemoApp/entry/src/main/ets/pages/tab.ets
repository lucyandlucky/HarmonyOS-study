import { common } from "@kit.AbilityKit";

@Builder
export function MainTabBuilder() {
  MainTab()
}

@Component
struct MainTab {
  private tabsController: TabsController = new TabsController()
  @State currentIndex: number = 0

  @Builder
  TabBuilder(title: Resource, index: number, selectedImg: Resource) {
    Column() {
      SymbolGlyph(selectedImg)
        .fontSize('24vp')
        .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_OPACITY)
        .symbolEffect(new BounceSymbolEffect(
          EffectScope.WHOLE,
          EffectDirection.UP,
        ),
          this.currentIndex === index
        )
        .fontColor(this.currentIndex === index ? ['#0a59f7'] : ['#66000000'])
      Text(title)
        .margin({ top: '4vp' })
        .fontSize(10)
        .fontWeight(500)
        .fontColor(this.currentIndex === index ? '#0a59f7' : '#66000000')
    }
    .background('#f1f3f5')
    .justifyContent(FlexAlign.Center)
    .height('56vp')
    .width('100%')
    .onClick(() => {
      this.currentIndex = index
      this.tabsController.changeIndex(index)
    })
  }

  build() {
    NavDestination() {
      Tabs({
        barPosition: BarPosition.End,
        controller: this.tabsController
      }) {
        TabContent() {
          Text('home')
        }
        .padding({
          left: '12vp',
          right: '12vp'
        })
        .background('#F1F3F5')
        .tabBar(this.TabBuilder($r('app.string.Tab_Bar_One'), 0, $r('sys.symbol.house_fill')))

        TabContent() {
          Text('Person')
        }
        .padding({
          left: '12vp',
          right: '12vp'
        })
        .background('#F1F3F5')
        .tabBar(this.TabBuilder($r('app.string.Tab_Bar_Two'), 1, $r('sys.symbol.person_crop_circle_fill_1')))
      }.onChange((index: number) => {
        this.currentIndex = index
      })
    }
    .hideTitleBar(true)
    .onBackPressed(() => {
      let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
      context.terminateSelf().catch()
      return true
    })
  }
}
