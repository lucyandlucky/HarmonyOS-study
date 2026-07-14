import { abilityAccessCtrl } from "@kit.AbilityKit";
import { BreakPointConstants } from '../constants/BreakpointConstants'
import { geoLocationManager } from "@kit.LocationKit";
import { hilog } from "@kit.PerformanceAnalysisKit";
import { AsyncCallback } from "@kit.BasicServicesKit";

const locationChanger: AsyncCallback<geoLocationManager.Location> =
  (err, location) => {
    if (err) {
      hilog.error(0x0000, 'locationChanger: err=', JSON.stringify(err))
    }
    if (location) {
      hilog.info(0x0000, 'locationChanger: res=', JSON.stringify(location))
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
  }
}