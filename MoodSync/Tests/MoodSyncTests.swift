import XCTest
@testable import MoodSync

final class MoodSyncTests: XCTestCase {

    func testMoodLevelEmoji() {
        XCTAssertEqual(MoodLevel.calm.emoji, "😌")
        XCTAssertEqual(MoodLevel.radiant.emoji, "✨")
    }

    func testResourceItemInitialization() {
        let item = ResourceItem(title: "Test", description: "Desc", category: "Cat", iconName: "icon", imageUrl: "url")
        XCTAssertEqual(item.title, "Test")
        XCTAssertEqual(item.category, "Cat")
    }

    func testFriendMoodInitialization() {
        let friend = FriendMood(name: "Test", moodEmoji: "😊", status: "Status", imageUrl: "url", color: .green)
        XCTAssertEqual(friend.name, "Test")
        XCTAssertEqual(friend.moodEmoji, "😊")
    }

    func testTriggerInitialization() {
        let trigger = Trigger(name: "Work", iconName: "briefcase", count: "12", label: "label", impact: "impact")
        XCTAssertEqual(trigger.name, "Work")
        XCTAssertEqual(trigger.count, "12")
    }
}
