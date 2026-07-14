import lottie, { AnimationItem } from '@ohos/lottie';
import { CommonConstants } from '../constants/CommonConstants';
import { ResourceUtil } from '../utils/ResourceUtil';
import { deviceInfo } from '@kit.BasicServicesKit';
import { BreakPointConstants } from '../constants/BreakpointConstants';


export interface TabBarOption {
  index: number
  text: ResourceStr
  name: string
  path: string
  canvasRenderingContext: CanvasRenderingContext2D
  lottieItem?: AnimationItem
  currentBottomIndex?: number
  currentBreakpoint?: string

}

function isActive(tab: TabBarOption) {
  return tab.currentBottomIndex === tab.index
}

@Builder
export function BottomTabBuilder(option: TabBarOption) {
  Column() {
    Canvas(option.canvasRenderingContext)
      .width($r('app.float.canvas_size'))
      .height($r('app.float.canvas_size'))
      .onReady(() => {
        option.canvasRenderingContext.imageSmoothingEnabled = true
        option.canvasRenderingContext.imageSmoothingQuality = 'medium'
        lottie.destroy(option.name)
        const item = lottie.loadAnimation({
          container: option.canvasRenderingContext,
          renderer: 'canvas',
          loop: false,
          autoplay: false,
          autoSkip: false,
          name: option.name,
          path: option.path
        })
        option.lottieItem = item
        item.addEventListener('DOMLoaded', () => {
          if (isActive(option)) {
            item.play()
          }
        })
      })
    Text(option.text)
      .fontSize($r('app.float.tab_font_size'))
      .fontWeight(CommonConstants.FONT_WEIGHT_500)
      .fontColor(isActive(option) ? $r('app.color.tab_sel_color') : ResourceUtil.getCommonBackgroundColor()[3]
      )
      .margin({ top: $r('app.float.tab_top_margin') })
      .opacity(isActive((option)) ? CommonConstants.TEXT_OPACITY[0] : CommonConstants.TEXT_OPACITY[1]
      )
  }
  .padding({
    bottom: deviceInfo.deviceType === CommonConstants.DEVICE_TYPES[0] ? 0 : CommonConstants.BOTTOM_RECT_HEIGHT
  })
  .height(option.currentBreakpoint === BreakPointConstants.BREAKPOINT_LG
    ? $r('app.float.side_tab_bar_height') : CommonConstants.FULL_PERCENT)
  .width(CommonConstants.FULL_PERCENT)
  .justifyContent(FlexAlign.Center)
}