import {ArticleClass} from '../model/ArticleClass'
@Component
export struct ArticleDetailPage {
  @State articleDetail: ArticleClass | null = null;

  build() {
    Column() {
      Row() {

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
