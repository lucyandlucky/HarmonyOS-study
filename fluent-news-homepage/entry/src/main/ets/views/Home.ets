import { BreakPointConstants } from '../constants/BreakpointConstants'
import { ConfigurationConstant } from '@kit.AbilityKit'
import { ComponentContent } from '@kit.ArkUI'
import { BottomTabBuilder, TabBarOption } from './BottomTabBuilder'
import { ResourceUtil } from '../utils/ResourceUtil'
import { CommonConstants } from '../constants/CommonConstants'

@Component
export struct Home {
  @StorageProp('currentBreakpoint') currentBreakpoint: string = BreakPointConstants.BREAKPOINT_LG
  @StorageProp('currentColorMode') @Watch('onColorModeChange')
  currentMode: number = ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT
  private renderingSetting1: RenderingContextSettings = new RenderingContextSettings(true)
  private canvasRenderingContext1: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.renderingSetting1)
  private renderingSetting2: RenderingContextSettings = new RenderingContextSettings(true)
  private canvasRenderingContext2: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.renderingSetting1)
  private renderingSetting3: RenderingContextSettings = new RenderingContextSettings(true)
  private canvasRenderingContext3: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.renderingSetting1)
  @State currentIndex: number = 0
  private tabOption1: TabBarOption = {
    index: 0,
    text: $r('app.string.tab_bar_option_one'),
    name: 'tab1',
    path: ResourceUtil.getLottiePath('tabbar1', this.currentMode),
    canvasRenderingContext: this.canvasRenderingContext1,
    currentBottomIndex: this.currentIndex,
    currentBreakpoint: this.currentBreakpoint
  }
  private tabBarOption1 = new ComponentContent(
    this.getUIContext(),
    wrapBuilder<[TabBarOption]>(BottomTabBuilder),
    this.tabOption1
  )

  onColorModeChange(): void {
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
      }
      .barWidth(CommonConstants.FULL_PERCENT)
      .barHeight('100vp')
    }
  }
}

