export default class PageResource {
  id: number
  title: string
  img: number
  others?: string

  constructor(id: number, title: string, img: number, others?: string) {
    this.id = id
    this.title = title
    this.img = img
    this.others = others
  }
}