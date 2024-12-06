import { emitter } from '@kit.BasicServicesKit';
import { Speaker } from '@ohs/utils';


@Component
export struct Header {
  @State message: string = '快速入门';
  @State isPlaying:boolean= false;

  speaker:Speaker=new Speaker()

  content :string='你好呀可是大家雷锋精神动力';


  aboutToAppear(): void {
    emitter.on("eventId",()=>{
      this.isPlaying=false;
    })
  }





  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontFamily('HarmonyHeiTi-Bold')
          .fontSize(24)
          .textAlign(TextAlign.Start)
          .lineHeight(33)
          .fontWeight(700)
        Image(this.isPlaying? $r('app.media.ic_AI_read_on'):$r('app.media.ic_AI_read_on'))
          .width(40)
          .height(40)
          .onClick(()=>{
              this.isPlaying=!this.isPlaying;

              if(this.isPlaying){
                this.speaker.startSpeak(this.content)

              }else{
                this.speaker.stopSpeak()
              }
          })

      }
      .padding({
        left:16,
        right:16
      })
      .justifyContent(FlexAlign.SpaceBetween)
      .height(56)
      .margin({
        bottom:11
      })
      .width('100%')
    }

  }
}
