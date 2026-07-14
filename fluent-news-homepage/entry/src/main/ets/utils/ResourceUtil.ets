import { ConfigurationConstant } from '@kit.AbilityKit';

export class ResourceUtil {
  private static commonBackgroundColor: Resource[] = [$r('app.color.common_background_1'),
    $r('app.color.common_background_2'), $r('app.color.common_background_3')];

  static getCommonBackgroundColor(): Resource[] {
    return ResourceUtil.commonBackgroundColor
  }

  static getLottiePath(name: string, currentMode: number) {
    return currentMode === ConfigurationConstant.ColorMode.COLOR_MODE_DARK
      ? `common/lottie/dark/${name}.json`
      : `common/lottie/light/${name}.json`
  }
}