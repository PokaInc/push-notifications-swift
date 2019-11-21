import XCTest
@testable import PushNotifications

class UserPersistableTests: XCTestCase {

    var deviceStateStore: DeviceStateStore!

    override func setUp() {
            super.setUp()
            UserDefaults.standard.removePersistentDomain(forName: PersistenceConstants.UserDefaults.suiteName)
            self.deviceStateStore = DeviceStateStore()
        }

    override func tearDown() {
            UserDefaults.standard.removePersistentDomain(forName: PersistenceConstants.UserDefaults.suiteName)
            super.tearDown()
    }

    func testPersistUserThatWasNotSavedYet() {
        let userIdNotSetYet = self.deviceStateStore.getUserId()
        XCTAssertNil(userIdNotSetYet)
        let persistenceOperation = self.deviceStateStore.setUserId(userId: "Johnny Cash")
        XCTAssertTrue(persistenceOperation)
        let userId = self.deviceStateStore.getUserId()
        XCTAssertNotNil(userId)
        XCTAssertEqual(userId, "Johnny Cash")
    }

    func testPersistUserThatIsAlreadySaved() {
        _ = self.deviceStateStore.setUserId(userId: "Johnny Cash")
        let persistenceOperation = self.deviceStateStore.setUserId(userId: "Johnny Cash")
        XCTAssertFalse(persistenceOperation)
    }

    func testPersistUserAndRemoveUser() {
        let persistenceOperation = self.deviceStateStore.setUserId(userId: "Johnny Cash")
        XCTAssertTrue(persistenceOperation)
        let userId = self.deviceStateStore.getUserId()
        XCTAssertNotNil(userId)
        XCTAssertEqual(userId, "Johnny Cash")
        self.deviceStateStore.removeUserId()
        XCTAssertNil(self.deviceStateStore.getUserId())
    }
}
