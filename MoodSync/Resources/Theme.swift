import SwiftUI

struct Theme {
    static let primary = Color(red: 19/255, green: 236/255, blue: 91/255)
    static let backgroundDark = Color(red: 16/255, green: 34/255, blue: 22/255)
    static let backgroundLight = Color(red: 246/255, green: 248/255, blue: 246/255)
    static let slate900 = Color(red: 15/255, green: 23/255, blue: 42/255)
    static let slate400 = Color(red: 148/255, green: 163/255, blue: 184/255)
    static let slate300 = Color(red: 203/255, green: 213/255, blue: 225/255)

    struct Fonts {
        static func main(size: CGFloat, weight: Font.Weight = .regular) -> Font {
            // Using system font as Manrope might not be available, but specifying design
            return .system(size: size, weight: weight, design: .rounded)
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanUint64(&int)
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
