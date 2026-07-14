import { BreakPointConstants } from '../constants/BreakpointConstants'
import { ConfigurationConstant } from '@kit.AbilityKit'
import { ComponentContent } from '@kit.ArkUI'
import { BottomTabBuilder, TabBarOption } from './BottomTabBuilder'
import { ResourceUtil } from '../utils/ResourceUtil'
import { CommonConstants } from '../constants/CommonConstants'
import { deviceInfo } from '@kit.BasicServicesKit'
import lottie from '@ohos/lottie'


@Component
export struct Home {
  @StorageProp('currentBreakpoint') currentBreakpoint: string = BreakPointConstants.BREAKPOINT_LG
  @StorageProp('currentColorMode') @Watch('onColorModeChange')
  currentMode: number = ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT
  @State currentIndex: number = 0
  private renderingSetting1: RenderingContextSettings = new RenderingContextSettings(true)
  private canvasRenderingContext1: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.renderingSetting1)
  private renderingSetting2: RenderingContextSettings = new RenderingContextSettings(true)
  private canvasRenderingContext2: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.renderingSetting2)
  private renderingSetting3: RenderingContextSettings = new RenderingContextSettings(true)
  private canvasRenderingContext3: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.renderingSetting3)
  private tabOption1: TabBarOption = {
    index: 0,
    text: $r('app.string.tab_bar_option_one'),
    name: 'tab1',
    path: ResourceUtil.getLottiePath('tabbar1', this.currentMode),
    canvasRenderingContext: this.canvasRenderingContext1,
    currentBottomIndex: this.currentIndex,
    currentBreakpoint: this.currentBreakpoint
  }
  private tabOption2: TabBarOption = {
    index: 1,
    text: $r('app.string.tab_bar_option_two'),
    name: 'tab2',
    path: ResourceUtil.getLottiePath('tabbar2', this.currentMode),
    canvasRenderingContext: this.canvasRenderingContext2,
    currentBottomIndex: this.currentIndex,
    currentBreakpoint: this.currentBreakpoint
  }
  private tabOption3: TabBarOption = {
    index: 2,
    text: $r('app.string.tab_bar_option_three'),
    name: 'tab3',
    path: ResourceUtil.getLottiePath('tabbar3', this.currentMode),
    canvasRenderingContext: this.canvasRenderingContext3,
    currentBottomIndex: this.currentIndex,
    currentBreakpoint: this.currentBreakpoint
  }
  private tabBarOption1 = new ComponentContent(
    this.getUIContext(),
    wrapBuilder<[TabBarOption]>(BottomTabBuilder),
    this.tabOption1
  )
  private tabBarOption2 = new ComponentContent(
    this.getUIContext(),
    wrapBuilder<[TabBarOption]>(BottomTabBuilder),
    this.tabOption2
  )
  private tabBarOption3 = new ComponentContent(
    this.getUIContext(),
    wrapBuilder<[TabBarOption]>(BottomTabBuilder),
    this.tabOption3
  )

  onColorModeChange(): void {
    this.destroyLottie()
    this.tabOption1.path = ResourceUtil.getLottiePath('tabbar1', this.currentMode)
    this.tabOption2.path = ResourceUtil.getLottiePath('tabbar2', this.currentMode)
    this.tabOption3.path = ResourceUtil.getLottiePath('tabbar3', this.currentMode)

    this.tabBarOption1 =
      new ComponentContent(this.getUIContext(), wrapBuilder<[TabBarOption]>(BottomTabBuilder), this.tabOption1)
    this.tabBarOption2 =
      new ComponentContent(this.getUIContext(), wrapBuilder<[TabBarOption]>(BottomTabBuilder), this.tabOption2)
    this.tabBarOption3 =
      new ComponentContent(this.getUIContext(), wrapBuilder<[TabBarOption]>(BottomTabBuilder), this.tabOption3)

    const indexBak = this.currentIndex
    this.currentIndex = -1
    setTimeout(() => {
      this.currentIndex = indexBak
    }, 0)
  }

  aboutToDisappear(): void {
    this.destroyLottie()
  }

  lottieController(): void {
    if (this.currentIndex === 0) {
      lottie.stop()
      lottie.play(this.tabOption1.name)
    }
    if (this.currentIndex === 1) {
      lottie.stop()
      lottie.play(this.tabOption2.name)
    }
    if (this.currentIndex === 2) {
      lottie.stop()
      lottie.play(this.tabOption3.name)
    }
  }

  destroyLottie(): void {
    this.tabOption1.lottieItem?.removeEventListener('DOMLoaded')
    this.tabOption2.lottieItem?.removeEventListener('DOMLoaded')
    this.tabOption3.lottieItem?.removeEventListener('DOMLoaded')
    lottie.destroy(this.tabOption1.name)
    lottie.destroy(this.tabOption2.name)
    lottie.destroy(this.tabOption3.name)
  }

  updateTabIndex(targetIndex: number): void {
    this.tabOption1.currentBottomIndex = targetIndex
    this.tabOption2.currentBottomIndex = targetIndex
    this.tabOption3.currentBottomIndex = targetIndex
    this.tabBarOption1.update(this.tabOption1)
    this.tabBarOption2.update(this.tabOption2)
    this.tabBarOption3.update(this.tabOption3)

  }

  build() {
    Column() {
      Tabs({
        barPosition: this.currentBreakpoint === BreakPointConstants.BREAKPOINT_LG
          ? BarPosition.Start : BarPosition.End
      }) {
        TabContent() {
          Text('home')
        }.tabBar(this.tabBarOption1)

        TabContent() {
          Text('Concerned')
        }.tabBar(this.tabBarOption2)

        TabContent() {
          Text('Mine')
        }.tabBar(this.tabBarOption3)

      }
      .barWidth(CommonConstants.FULL_PERCENT)
      .barHeight(this.currentBreakpoint === BreakPointConstants.BREAKPOINT_LG
        ? CommonConstants.FULL_PERCENT
        : deviceInfo.deviceType === CommonConstants.DEVICE_TYPES[0]
          ? CommonConstants.TAB_BAR_HEIGHT
          : CommonConstants.TAB_BAR_HEIGHT + CommonConstants.BOTTOM_RECT_HEIGHT
      )
      .barBackgroundColor($r('app.color.start_window_background'))
      .barMode(
        this.currentBreakpoint === BreakPointConstants.BREAKPOINT_LG
          ? BarMode.Scrollable : BarMode.Fixed,
        { nonScrollableLayoutStyle: LayoutStyle.ALWAYS_CENTER }
      )
      .vertical(this.currentBreakpoint === BreakPointConstants.BREAKPOINT_LG)
      .onAnimationStart((_, targetIndex: number) => {
        this.currentIndex = targetIndex
        this.lottieController()
        this.updateTabIndex(targetIndex)
      })
      .scrollable(false)
    }
  }
}

