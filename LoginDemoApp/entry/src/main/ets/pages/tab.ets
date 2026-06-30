import { common } from "@kit.AbilityKit";

@Builder
export function MainTabBuilder() {
  MainTab()
}

@Component
struct MainTab {
  build() {
    NavDestination() {
      Text("MainTab")
    }
    .hideTitleBar(true)
    .onBackPressed(() => {
      let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
      context.terminateSelf().catch()
      return true
    })
  }
}