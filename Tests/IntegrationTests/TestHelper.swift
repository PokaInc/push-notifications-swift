import Foundation
@testable import PushNotifications

struct TestHelper {
    
    static let instanceId = "1b880590-6301-4bb5-b34f-45db1c5f5644"
    static let instanceId2 = "1b880590-6301-4bb5-b34f-45db1c5f5645"

    func clearEverything(instanceId: String) {
        if let deviceId = InstanceDeviceStateStore(instanceId).getDeviceId() {
            TestAPIClientHelper().deleteDevice(instanceId: instanceId, deviceId: deviceId)
        }
        
        let url = try! FileManager.default.url(for: .libraryDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let filePath = url.appendingPathComponent("syncJobStore")
        try? FileManager.default.removeItem(atPath:  filePath.relativePath)
        
        InstanceDeviceStateStore(instanceId).clear()
        DeviceStateStore().removeAllInstanceIds()
    }
    
}
