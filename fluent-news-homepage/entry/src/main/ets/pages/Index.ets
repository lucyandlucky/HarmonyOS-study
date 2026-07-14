import { abilityAccessCtrl } from '@kit.AbilityKit';
import { geoLocationManager } from '@kit.LocationKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AsyncCallback } from '@kit.BasicServicesKit';

import { BreakPointConstants } from '../constants/BreakpointConstants';
import { CommonConstants } from '../constants/CommonConstants';
import { i18n } from '@kit.LocalizationKit';
import { JSON } from '@kit.ArkTS';

const locationChanger: AsyncCallback<geoLocationManager.Location> =
  (err, location) => {
    if (err) {
      hilog.error(0x0000, 'locationChanger: err=', JSON.stringify(err))
    }
    if (location) {
      hilog.info(0x0000, 'locationChanger: res=', JSON.stringify(location))
      const reverseGeoCodeReq: geoLocationManager.ReverseGeoCodeRequest = {
        latitude: location.latitude,
        longitude: location.longitude,
        maxItems: CommonConstants.MAX_ITEMS
      }
      const systemLanguage = i18n.System.getSystemLanguage()
      if (systemLanguage.startsWith('en')) {
        reverseGeoCodeReq.locale = 'en'
      }
      geoLocationManager.getAddressesFromLocation(reverseGeoCodeReq, (_, data) => {
        if (!data) {
          return
        }
        hilog.info(0x0000, 'getAddressesFromLocation: data=', JSON.stringify(data))
        const reverseData = data[0]
        if (!reverseData?.locality) {
          return
        }
        if (systemLanguage === 'zh-Hans') {
          AppStorage.setOrCreate('local', reverseData.locality.replace(/"/g, '').slice(0, -1))
          AppStorage.setOrCreate('currentLocal', reverseData.locality.replace(/"/g, '').slice(0, -1))
        } else {
          AppStorage.setOrCreate('local', reverseData.locality.replace(/"/g, ''))
          AppStorage.setOrCreate('currentLocal', reverseData.locality.replace(/"/g, ''))
        }
      })
    }
  }

@Entry
@Component
struct Index {
  @StorageLink('currentBreakpoint') currentBreakpoint: string = BreakPointConstants.BREAKPOINT_LG
  @State status: boolean = true

  onPageShow(): void {
    abilityAccessCtrl.createAtManager().requestPermissionsFromUser(
      this.getUIContext().getHostContext(),
      ['ohos.permission.LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION']
    ).then(() => {
      if (this.status) {
        geoLocationManager.getCurrentLocation(locationChanger)
        this.status = false
      }
    }).catch((err: BusinessError) => {
      hilog.error(0x0000, 'Index', `requestPermissionsFromUser fail, code: ${err.code}, message: ${err.message}`)
    })
  }

  build() {
    GridRow({
      columns: {
        sm: BreakPointConstants.GRID_ROW_COLUMNS[0],
        md: BreakPointConstants.GRID_ROW_COLUMNS[1],
        lg: BreakPointConstants.GRID_ROW_COLUMNS[2],
      }
    }) {
      GridCol({
        span: {
          sm: BreakPointConstants.GRID_COLUMN_SPANS[0],
          md: BreakPointConstants.GRID_COLUMN_SPANS[1],
          lg: BreakPointConstants.GRID_COLUMN_SPANS[4]
        }
      }) {
        Text('home')
      }
      .width(CommonConstants.FULL_PERCENT)
      .height(CommonConstants.FULL_PERCENT)
    }
    .onBreakpointChange((breakpoint) => {
      this.currentBreakpoint = breakpoint
    })
  }
}