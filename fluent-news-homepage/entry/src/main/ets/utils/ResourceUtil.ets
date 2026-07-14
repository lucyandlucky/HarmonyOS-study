import { ConfigurationConstant } from '@kit.AbilityKit';

export class ResourceUtil {
  static getLottiePath(name: string, currentMode: number) {
    return currentMode === ConfigurationConstant.ColorMode.COLOR_MODE_DARK
      ? `common/lottie/dark/${name}.json`
      : `common/lottie/light/${name}.json`
  }
}