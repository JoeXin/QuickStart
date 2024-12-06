import { TutorialView } from '../view/TutorialView';
import { Banner } from '../view/Banner';
import { EnablementView } from '../view/EnablementView';

import { Header } from '../view/Header';

@Component
export struct QuickStartPage {
  @State message: string = '欢迎来到你的世界';

  build() {
    Column() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(20)
        .fontWeight('500')
        .width('100%')
        .textAlign(TextAlign.Start)
        //.padding({left:16,top:16})
        .fontFamily('HarmonyHeiTi-Bold')
     //   .lineHeight(33)
      // Header()
      Scroll() {
        Column() {
          Banner()
          EnablementView()
          TutorialView()
        }
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
    .margin({ top: 18 })
    .alignItems(HorizontalAlign.Start)
  }
}




