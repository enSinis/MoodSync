import SwiftUI
import UIKit

struct MainTabView: View {
    @State private var selectedTab = 0

    init() {
        // Customize tab bar appearance
        UITabBar.appearance().backgroundColor = UIColor(Theme.backgroundDark.opacity(0.8))
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            InsightsView()
                .tabItem {
                    Label("Today", systemImage: "house.fill")
                }
                .tag(0)

            LibraryView()
                .tabItem {
                    Label("Library", systemImage: "book.fill")
                }
                .tag(1)

            CheckInView()
                .tabItem {
                    Label("Sync", systemImage: "plus.circle.fill")
                }
                .tag(2)

            SyncCircleView()
                .tabItem {
                    Label("Circle", systemImage: "circle.grid.3x3.fill")
                }
                .tag(3)

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(4)
        }
        .accentColor(Theme.primary)
    }
}
