import { CommonColumn, NavigationButton } from "common"

interface PageTwoRouteData {
  description: string
}

@Builder
export function PageTwoBuilder() {
  EntryPageTwo()
}

@Component
export struct EntryPageTwo {
  @State description: string = ''

  build() {
    NavDestination() {
      CommonColumn() {
        Text(this.description)
        NavigationButton({ title: $r('app.string.entry_index') })
        NavigationButton({ title: $r('app.string.entry_pageOne'), pathName: 'PageOne' })
      }
    }
    .title('entry-page-two')
    .onReady((context: NavDestinationContext) => {
      const config = context.getConfigInRouteMap()
      const data = config?.data as PageTwoRouteData | undefined
      this.description = data?.description ?? ''
    })
  }
}