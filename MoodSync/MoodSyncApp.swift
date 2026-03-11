import SwiftUI

@main
struct MoodSyncApp: App {
    @StateObject private var themeManager = ThemeManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(themeManager)
                .preferredColorScheme(themeManager.currentMood == .dark ? .dark : .light)
        }
    }
}
