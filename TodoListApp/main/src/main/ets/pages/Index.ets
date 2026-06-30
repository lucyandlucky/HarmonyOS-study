interface ITodoItem {
  label: string
}

@Entry
@Component
struct Index {
  @State todoList: ITodoItem[] = [
    { label: 'demo1' },
    { label: 'demo2' },
    { label: 'demo3' },
    { label: 'demo4' },
    { label: 'demo5' },
  ]

  build() {
    Column() {
      Text("TodoList")
        .margin({ bottom: 20 })
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      Column({ space: 20 }) {
        ForEach(
          this.todoList,
          (item: ITodoItem) => {
            TodoList({ item })
          },
          (item: ITodoItem) => item.label
        )
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding({ top: 30, left: 20 })
  }
}

@Component
struct TodoList {
  @Prop item: ITodoItem
  @State done: boolean = false

  build() {
    Row() {
      if (this.done) {
        Blank()
          .width(20)
          .height(20)
          .backgroundColor(Color.Blue)
          .borderRadius(20)
          .margin({ right: 10 })
      } else {
        Blank()
          .width(20)
          .height(20)
          .backgroundColor(Color.Pink)
          .borderRadius(20)
          .margin({ right: 10 })
      }
      Text(this.item.label).decoration({ type: this.done ? TextDecorationType.LineThrough : TextDecorationType.None })
    }.onClick(() => {
      this.done = !this.done
    })

  }
}