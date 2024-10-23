
import { QuickStartPage } from '@ohs/quickstart'
import { CourseLearning} from '@ohs/learning'

import { KnowledgeMap} from '@ohs/map'

@Entry
@Component
struct Index {

  build() {
    Column(){
      //QuickStartPage()
      //CourseLearning()
      KnowledgeMap()
    }
    .backgroundColor('#F1F3F5')
    .padding({top:36,bottom:28})
  }
}