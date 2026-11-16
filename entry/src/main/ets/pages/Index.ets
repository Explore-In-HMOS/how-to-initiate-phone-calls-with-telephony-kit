import { TelephonyService } from '../services/TelephonyService';

@Entry
@Component
struct CallExample {
  @State phoneNumber: string = '+1234567890';
  @State status: string = '';
  private telephonyService: TelephonyService = new TelephonyService();

  private async makeCall(): Promise<void> {
    this.telephonyService.initiateCall(this.phoneNumber).catch((err:Error) => {
      this.status = err.message;
    });
  }

  build() {
    Column({space:8}) {
      Button(`Call ${this.phoneNumber}`)
        .onClick(() => this.makeCall())
      Text(this.status).fontColor(Color.Red)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}