import {ArticleClass} from '../model/ArticleClass'
import { webview } from '@kit.ArkWeb';
import { emitter } from '@kit.BasicServicesKit';
import { Speaker } from '@ohs/utils';


@Component
struct WebComponent {
  @Prop articleDetail:ArticleClass | null=null;
  build() {
    Column(){
      Row(){
        Row(){
          Image($r('app.media.ic_back'))
            .width(40)
            .height(40)
          Row(){
            Text(this.articleDetail?.title)
              .fontFamily('')
          }
        }
        .width('80%')
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .height(56)
    }
    .padding({ left: 16, right: 16 })
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

@Component
export struct ArticleDetailPage {

  @State isClicked: boolean = false;
  speaker: Speaker = new Speaker();

  @State articleDetail: ArticleClass | null = null;
  @Consume('articlePathStack') articlePathStack: NavPathStack;

  aboutToAppear(): void {
    this.articleDetail = this.articlePathStack.getParamByName('articleDetail')[0] as ArticleClass;
    emitter.on("eventId", () => {
      this.isClicked = false;
    });
  }

  aboutToDisappear(): void {
    this.speaker?.shutdownEngine();
  }

  build() {
    NavDestination() {
      Column() {
        Row() {
          Row() {
            Image($r('app.media.ic_back'))
              .width(40)
              .height(40)
              .onClick(() => {
                this.articlePathStack.pop()
              })
            Row() {
              Text(this.articleDetail?.title)
                .fontFamily('HarmonyHeiTi-Bold')
                .fontSize(20)
                .textAlign(TextAlign.Start)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .maxLines(1)
                .fontWeight(700)
                .margin({ left: 8 })
            }
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('100%')
          .height(56)
        }

        Image(this.isClicked ? $r('app.media.ic_AI_read_on') : $r('app.media.ic_AI_read_normal'))
          .width(40)
          .height(40)
          .onClick(() => {
            this.isClicked = !this.isClicked;
            if (this.isClicked === true) {
              this.speaker.startSpeak(this.articleDetail!.brief)
            } else {
              this.speaker.stopSpeak();
            }
          })


      }
      .padding({ left: 16, right: 16 })
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .hideTitleBar(true)
  }
}
