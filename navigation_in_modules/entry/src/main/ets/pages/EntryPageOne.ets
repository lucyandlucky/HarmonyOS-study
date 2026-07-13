import { CommonColumn, NavigationButton } from "common"

interface PageOneRouteData {
  description: string
}

@Builder
export function PageOneBuilder() {
  EntryPageOne()
}

@Component
export struct EntryPageOne {
  @State description: string = ''

  build() {
    NavDestination() {
      CommonColumn() {
        Text(this.description)
        NavigationButton({ title: $r('app.string.entry_index') })
        NavigationButton({ title: $r('app.string.entry_pageTwo'), pathName: 'PageTwo' })
        NavigationButton({ title: $r('app.string.harA_pageOne'), pathName: 'harAPageOne' })
      }
    }
    .title('entry-page-one')
    .onReady((context: NavDestinationContext) => {
      const config = context.getConfigInRouteMap()
      const data = config?.data as PageOneRouteData | undefined
      this.description = data?.description ?? ''
    })
  }
}