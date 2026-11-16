import { call, sim } from '@kit.TelephonyKit';
import { BusinessError } from '@kit.BasicServicesKit';

export class TelephonyService {
  /**
   * Initiates a phone call.
   *
   * Usage Example:
   * ```ts
   * this.telephonyService.initiateCall(this.phoneNumber).catch((err:Error) => {
   * this.status = err.message;
   * });
   * ```
   * **Note:** if the device must include a SIM card to make calls,
   * the following code snippet can be used to check for a SIM card before making a call.
   *
   * ```ts
   * const hasSim = await telephonyService.hasSimCard();
   * if (!hasSim) { throw new Error('No SIM card detected.'); }
   * ```
   * @async
   * @param {string} phoneNumber - Phone Number to call
   * @throws {Error} When the call fails
   */
  async initiateCall(phoneNumber: string): Promise<void> {
    try {
      if (canIUse('SystemCapability.Telephony.CallManager')) {
        const hasVoice = call.hasVoiceCapability();
        if (hasVoice) {
          await call.makeCall(phoneNumber);
        }
        return;
      } else {
        throw new Error('Voice calls are not supported on this device.');
      }
    } catch (err) {
      const e = err as BusinessError;
      throw new Error(`Call failed: ${e.code} - ${e.message}`);
    }
  }

  /**
   * Checks if the device has a SIM card.
   *
   * Usage Example:
   * ```ts
   * const hasSim = await this.telephonyService.hasSimCard();
   * if (!hasSim) {
   *   this.status = 'No SIM card detected.';
   * }
   * ```
   * @async
   * @returns {Promise<boolean>} True if the device has a SIM card, false otherwise
   * @throws {Error} When the SIM card check fails
   */
  async hasSimCard(): Promise<boolean> {
    try {
      if (canIUse('SystemCapability.Telephony.SimManager')) {
        return await sim.hasSimCard(0);
      } else {
        throw new Error('SIM card check is not supported on this device.');
      }
    } catch (err) {
      const e = err as BusinessError;
      throw new Error(`SIM card check failed: ${e.code} - ${e.message}`);
    }
  }
}