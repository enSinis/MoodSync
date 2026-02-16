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
            return .system(size: size, weight: weight, design: .rounded)
        }
    }
}
