
import { QuickStartPage } from '@ohs/quickstart'
import { CourseLearning} from '@ohs/learning'

import { KnowledgeMap, KnowledgeMapContent} from '@ohs/map'

import { BreakpointSystem, BreakpointTypeEnum} from '@ohs/utils'

@Entry
@Component
struct Index {
  @State currentIndex:number=0;
  @StorageProp('currentBreakpoint') currentBreakpoint: string = BreakpointTypeEnum.MD;
  private tabsController : TabsController = new TabsController();
  private breakpointSystem: BreakpointSystem = new BreakpointSystem();


  aboutToAppear() {
    this.breakpointSystem.register();
  }

  aboutToDisappear() {
    this.breakpointSystem.unregister();
  }

  @Builder
  tabBarBuilder(title:string,targetIndex:number,selectedIcon:Resource,unselectIcon:Resource){
    Column(){
      Image(this.currentIndex==targetIndex? selectedIcon:unselectIcon)
        .width(24)
        .height(24)
      Text(title)
        .fontFamily('HarmonyHeiTi-Medium')
        .fontSize(10)
        .fontColor(this.currentIndex === targetIndex ? '#0A59F7' : 'rgba(0,0,0,0.60)')
        .textAlign(TextAlign.Center)
        .lineHeight(14)
        .fontWeight(500)
    }
    .onClick(()=>{
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(targetIndex);
    })
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)

  }

  build() {
    // Column(){
    //   QuickStartPage()
    //   CourseLearning()
    //   KnowledgeMap()
    //   KnowledgeMapContent()
    // }

    Tabs({barPosition:this.currentBreakpoint === BreakpointTypeEnum.LG  ?  BarPosition.Start: BarPosition.End ,controller:this.tabsController}) {
      TabContent(){
        QuickStartPage()
      }
      .tabBar(this.tabBarBuilder('快速入门',0,$r("app.media.ic_01_on"),$r("app.media.ic_01_off")))
      TabContent(){
        CourseLearning()
      }
      .tabBar(this.tabBarBuilder('课程学习',1,$r("app.media.ic_02_on"),$r("app.media.ic_02_off")))
      TabContent(){
        KnowledgeMap()
      }
      .tabBar(this.tabBarBuilder('知识地图',2,$r("app.media.ic_03_on"),$r("app.media.ic_03_off")))
    }
    .scrollable(false)
    .vertical(this.currentBreakpoint== BreakpointTypeEnum.LG?true: false)
    .divider({
      strokeWidth:0.5,
      color:"#0D182431'"
    })
    .backgroundColor('#F1F3F5')
    .padding({
      top:36,
      bottom:28
    })
  }
}