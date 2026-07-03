import ItemData from "./ItemData";

export class MainViewModel {
  getSwiperImages(): Array<number> {
    return [
      1, 2, 3, 4
    ]
  }

  getFirstGridData(): Array<ItemData> {
    const firstGridData: ItemData[] = [
      new ItemData(0, 'demo1', 0),
      new ItemData(1, 'demo1', 1),
      new ItemData(2, 'demo1', 2),
      new ItemData(3, 'demo1', 3),
      new ItemData(4, 'demo1', 4),
      new ItemData(6, 'demo1', 5),
      new ItemData(7, 'demo1', 6),
      new ItemData(8, 'demo1', 7),

    ]
    return firstGridData
  }
}
