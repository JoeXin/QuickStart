
import { QuickStartPage } from '@ohs/quickstart'
import { CourseLearning} from '@ohs/learning'

import { KnowledgeMap, KnowledgeMapContent} from '@ohs/map'


@Entry
@Component
struct Index {

  build() {
    Column(){
      //QuickStartPage()
      //CourseLearning()
      // KnowledgeMap()
  KnowledgeMapContent()
    }
    .backgroundColor('#F1F3F5')
    .padding({top:36,bottom:28})
  }
}