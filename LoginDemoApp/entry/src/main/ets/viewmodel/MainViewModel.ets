import ItemData from "./ItemData";

export class MainViewModel {
  getSwiperImages(): Array<Resource> {
    const swipeResource: Resource[] = [
      $r('app.media.fig1'),
      $r('app.media.fig2'),
      $r('app.media.fig3'),
      $r('app.media.fig4'),
    ]
    return swipeResource
  }


  getFirstGridData(): Array<ItemData> {
    const firstGridData: ItemData[] = [
      new ItemData(0, $r('app.string.my_love'), $r('app.media.love')),
      new ItemData(1, $r('app.string.history_record'), $r('app.media.record')),
      new ItemData(2, $r('app.string.message'), $r('app.media.message')),
      new ItemData(3, $r('app.string.shopping_cart'), $r('app.media.shopping')),
      new ItemData(4, $r('app.string.my_goal'), $r('app.media.target')),
      new ItemData(5, $r('app.string.group'), $r('app.media.circle')),
      new ItemData(6, $r('app.string.favorites'), $r('app.media.favorite')),
      new ItemData(7, $r('app.string.recycle_bin'), $r('app.media.recycle')),
    ]
    return firstGridData
  }
}
