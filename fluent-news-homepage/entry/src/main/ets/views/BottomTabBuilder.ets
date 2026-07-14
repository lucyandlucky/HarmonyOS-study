import { AnimationItem } from '@ohos/lottie';

export interface TabBarOption {
  index: number
  text: ResourceStr
  name: ResourceStr
  path: string
  canvasRenderingContext: CanvasRenderingContext2D
  lottieItem?: AnimationItem
  currentBottomIndex?: number
  currentBreakpoint?: string

}

@Builder
export function BottomTabBuilder(option: TabBarOption) {

}