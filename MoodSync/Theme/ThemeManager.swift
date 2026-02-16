import SwiftUI

enum Mood: String, CaseIterable {
    case chill = "Chill"
    case energetic = "Energetic"
    case dark = "Dark"
}

struct AppTheme {
    let primaryColor: Color
    let accentColor: Color
    let cornerRadius: CGFloat
    let fontStyle: Font.Design
    let glassOpacity: Double
    let gradientColors: [Color]
}

class ThemeManager: ObservableObject {
    @Published var currentMood: Mood = .chill

    var theme: AppTheme {
        switch currentMood {
        case .chill:
            return AppTheme(
                primaryColor: Color(hex: "A8E6CF"),
                accentColor: Color(hex: "DCEDC1"),
                cornerRadius: 25,
                fontStyle: .rounded,
                glassOpacity: 0.3,
                gradientColors: [Color(hex: "A8E6CF"), Color(hex: "DCEDC1"), Color(hex: "FFD3B6")]
            )
        case .energetic:
            return AppTheme(
                primaryColor: Color(hex: "FF8C94"),
                accentColor: Color(hex: "FFAAA5"),
                cornerRadius: 100, // Makes it a Circle
                fontStyle: .monospaced,
                glassOpacity: 0.1,
                gradientColors: [Color(hex: "FF8C94"), Color(hex: "FFD3B6"), Color(hex: "FFAAA5")]
            )
        case .dark:
            return AppTheme(
                primaryColor: Color(hex: "2D3436"),
                accentColor: Color(hex: "636E72"),
                cornerRadius: 8,
                fontStyle: .serif,
                glassOpacity: 0.5,
                gradientColors: [Color(hex: "2D3436"), Color(hex: "000000"), Color(hex: "636E72")]
            )
        }
    }
}

// Extension to support Hex colors in SwiftUI
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
