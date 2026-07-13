import { NavigationButton, CommonColumn } from 'common'

@Entry
@Component
struct Index {
  @Provide pageInfos: NavPathStack = new NavPathStack()

  build() {
    Navigation(this.pageInfos) {
      CommonColumn() {
        NavigationButton({ title: $r('app.string.entry_pageOne'), pathName: 'PageOne' })
        NavigationButton({ title: $r('app.string.entry_pageTwo'), pathName: 'PageTwo' })
      }
    }
    .title($r('app.string.entry_index_title'))
  }
}