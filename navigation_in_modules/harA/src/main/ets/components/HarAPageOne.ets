import { CommonColumn, NavigationButton } from "common"

interface HarAPageOneRouteData {
  description: string
}

@Builder
export function HarAPageBuilder() {
  HarAPageOne()
}

@Component
export struct HarAPageOne {
  @State description: string = ''

  build() {
    NavDestination() {
      CommonColumn() {
        Text(this.description)
        NavigationButton({ title: $r('app.string.entry_index') })
      }
    }
    .title("har-a-page-one")
    .onReady((context: NavDestinationContext) => {
      const config = context.getConfigInRouteMap()
      const data = config?.data as HarAPageOneRouteData | undefined
      this.description = data?.description ?? ''
    })
  }
}