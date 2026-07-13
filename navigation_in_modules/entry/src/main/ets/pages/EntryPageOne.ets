@Builder
export function PageOneBuilder() {
  EntryPageOne()
}

@Component
export struct EntryPageOne {
  build() {
    NavDestination() {

      Text('demo')
    }.title('entry-page-one')
  }
}