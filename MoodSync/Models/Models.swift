import Foundation
import SwiftUI

enum MoodLevel: String, CaseIterable, Identifiable {
    case low = "Low"
    case anxious = "Anxious"
    case calm = "Calm"
    case radiant = "Radiant"

    var id: String { self.rawValue }

    var emoji: String {
        switch self {
        case .low: return "😔"
        case .anxious: return "😰"
        case .calm: return "😌"
        case .radiant: return "✨"
        }
    }
}

struct MoodEntry: Identifiable {
    let id = UUID()
    let date: Date
    let level: MoodLevel
    let activities: [String]
    let reflection: String
}

struct ResourceItem: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let category: String
    let iconName: String
    let imageUrl: String
}

struct FriendMood: Identifiable {
    let id = UUID()
    let name: String
    let moodEmoji: String
    let status: String
    let imageUrl: String
    let color: Color
}

struct Trigger: Identifiable {
    let id = UUID()
    let name: String
    let iconName: String
    let count: String
    let label: String
    let impact: String
}
