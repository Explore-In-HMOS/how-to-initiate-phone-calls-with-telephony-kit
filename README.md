> **Note:** To access all shared projects, get information about environment setup, and view other guides, please visit [Explore-In-HMOS Index](https://github.com/Explore-In-HMOS/hmos-index).

# How to Initiate Phone Calls with Telephony Kit
This sample shows how to implement Telephony Kit to make calls. It implements the makeCall() API to navigate to the built-in call dial of the device.

# Preview
<div>
  <img src="screenshots/1.png" width="24%" />
  <img src="screenshots/2.png" width="24%" />
</div>

# Use Cases
- Use device's built-in call capabilities
- Implement a call capability without in-app call management and permissions

# Tech Stack
- **Language:** ArkTS
- **Framework**: HarmonyOS SDK 6.0.0(20)
- **Tools** DevEco Studio 6.1.1 Release
- **Libraries**:
  - **Telephony Kit:** `call, sim` used to make calls and to check for a sim card.
  - **Basic Services Kit:** `BusinessError` used as error handling interface

# Directory Structure
```
entry/src/main/
├── ets/
│   ├── services/
│   │   └── TelephonyService.ets  # Service file to make calls
│   └── pages/
│       └── Index.ets             # Demo showcase
```

# Constraints and Restrictions
## Supported Devices
- Huawei Watch 5/6
- Huawei Watch Ultimate 2
- Huawei Watch Kids X1

# License

**How to Initiate Phone Calls with Telephony Kit** is distributed under the terms of the MIT License. See the [LICENSE](LICENSE) for more information.
