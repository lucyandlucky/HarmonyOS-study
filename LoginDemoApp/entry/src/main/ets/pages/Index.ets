import { common } from "@kit.AbilityKit"

@Extend(TextInput)
function inputStyle() {
  .placeholderColor($r('app.color.line_color'))
  .height('45vp')
  .fontSize('15fp')
  .backgroundColor($r('app.color.background'))
  .width('328vp')
  .margin({ top: '12vp' })

}

@Extend(Line)
function lineStyle() {
  .width('328vp')
  .height('1vp')
  .backgroundColor($r('app.color.line_color'))
}

@Extend(Text)
function blueTextStyle() {
  .fontColor($r('app.color.login_blue_text_color'))
  .fontSize("14fp")
  .fontWeight(FontWeight.Medium)
}

@Builder
export function LoginPageBuilder() {
  LoginPage()
}

@Component
export struct LoginPage {
  @State pathStack: NavPathStack = new NavPathStack()

  @Builder
  ImageButton(src: Resource) {
    Button({ type: ButtonType.Circle, stateEffect: true }) {
      Image(src)
    }
    .height('48vp')
    .width('48vp')
    .backgroundColor($r('app.color.background'))
  }

  build() {
    NavDestination() {
      Column() {
        Image($r('app.media.logo'))
          .width('78vp')
          .height('78vp')
          .margin({ top: '150vp', bottom: '8vp' })

        Text($r('app.string.login_page'))
          .fontSize('24fp')
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.title_text_color'))

        Text($r('app.string.login_more'))
          .fontSize('16fp')
          .fontColor($r('app.color.login_more_text_color'))
          .margin({
            top: '8vp',
            bottom: '30vp'
          })

        TextInput({ placeholder: $r('app.string.account') })
          .maxLength(11)
          .type(InputType.Number)
          .inputStyle()
        Line()
          .lineStyle()

        TextInput({ placeholder: $r('app.string.password') })
          .maxLength(11)
          .type(InputType.Password)
          .inputStyle()
        Line()
          .lineStyle()

        Row() {
          Text($r('app.string.message_login'))
            .blueTextStyle()
          Text($r('app.string.forgot_password'))
            .blueTextStyle()
        }
        .width('328vp')
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({ top: '8vp' })

        Button($r('app.string.login'))
          .width('328vp')
          .height('40vp')
          .fontSize('16fp')
          .fontWeight(FontWeight.Medium)
          .backgroundColor($r('app.color.login_button_color'))
          .margin({
            top: '48vp',
            bottom: '12vp'
          })
          .onClick((event: ClickEvent) => {
            this.pathStack.replacePathByName('MainTab', undefined, true)
          })

        Text($r('app.string.register_account'))
          .fontColor($r('app.color.login_blue_text_color'))
          .fontSize('16fp')
          .fontWeight(FontWeight.Medium)

        Blank()
        Text($r('app.string.other_login_method'))
          .fontColor($r('app.color.other_login_text_color'))
          .fontSize('12fp')
          .fontWeight(FontWeight.Medium)
          .margin({
            top: '50vp',
            bottom: '12vp'
          })

        Row({ space: 44 }) {
          this.ImageButton($r('app.media.login_method1'))
          this.ImageButton($r('app.media.login_method2'))
          this.ImageButton($r('app.media.login_method3'))
        }
      }
      .padding({
        left: '12vp',
        right: '12vp',
        bottom: '24vp'
      })
      .background($r('app.color.background'))
      .width('100%')
      .height('100%')
    }
    .hideTitleBar(true)
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
    .onBackPressed(() => {
      const context = this.getUIContext().getHostContext() as common.UIAbilityContext
      context.terminateSelf().catch()
      return true
    })
  }
}
