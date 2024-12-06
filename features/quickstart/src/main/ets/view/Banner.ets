import { BannerClass } from '../model/BannerClass';
import { bufferToString } from '../util/BufferUtil';
import { BreakpointType, BreakpointTypeEnum } from '@ohs/utils';

// @Preview
@Component
export struct Banner {
  @State bannerList: BannerClass[] = [];
  @StorageProp('currentBreakpoint') currentBreakpoint: string = BreakpointTypeEnum.MD;
  aboutToAppear(): void {
    this.getBannerDataFromJSON();
  }

  getBannerDataFromJSON() {
    getContext(this).resourceManager.getRawFileContent('BannerData.json').then(value => {
      this.bannerList = JSON.parse(bufferToString(value.buffer)) as BannerClass[];
    })
  }

  build() {
    Swiper() {
      ForEach(this.bannerList, (item: BannerClass) => {

        Image($r(item.imageSrc))
          .objectFit(ImageFit.Contain)
          .width('100%')
          .borderRadius(16)
          .padding({ top: 11, left: 16, right: 16 })
      }, (item: BannerClass) => item.id)
    }
    .autoPlay(true)
    .loop(true)
    .displayCount(new BreakpointType({ sm: 1, md: 2, lg: 2 }).getValue(this.currentBreakpoint))
    .displayMode(SwiperDisplayMode.STRETCH)
    .indicator(this.currentBreakpoint === BreakpointTypeEnum.SM ?
    Indicator.dot().
    color('#1a000000').
    selectedColor('#0A59F7') :
      false)
    .nextMargin(new BreakpointType<Length>({ sm: 0, md: 12, lg: 266 }).getValue(this.currentBreakpoint))
    .indicator(
      new DotIndicator()
        .color('#1a000000')
        .selectedColor('#0A59F7'))
  }
}
