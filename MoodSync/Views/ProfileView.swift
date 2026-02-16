import SwiftUI

struct ProfileView: View {
    @State private var incognitoMode = false
    @State private var dailyCheckins = true
    @State private var selectedTheme = "Dark"

    var body: some View {
        ZStack {
            Theme.backgroundDark.ignoresSafeArea()

            VStack(spacing: 0) {
                // Header
                HStack {
                    Button(action: {}) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.05))
                            .clipShape(Circle())
                    }
                    Spacer()
                    Text("Profile")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "pencil")
                            .foregroundColor(Theme.primary)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.05))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)

                ScrollView {
                    VStack(spacing: 30) {
                        // Profile Section
                        VStack(spacing: 16) {
                            ZStack(alignment: .bottomTrailing) {
                                Circle()
                                    .fill(LinearGradient(gradient: Gradient(colors: [Theme.primary, Color.emerald]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .frame(width: 110, height: 110)
                                    .padding(4)
                                    .background(Theme.backgroundDark)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Theme.backgroundDark, lineWidth: 4))

                                HStack(spacing: 4) {
                                    Image(systemName: "flame.fill")
                                    Text("12 Day Streak")
                                }
                                .font(.system(size: 10, weight: .bold))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(Theme.primary)
                                .foregroundColor(.black)
                                .cornerRadius(20)
                                .offset(x: 10, y: 5)
                            }

                            VStack(spacing: 4) {
                                Text("Alex Sterling")
                                    .font(.system(size: 24, weight: .black))
                                    .foregroundColor(.white)
                                Text("alex.sterling@moodsync.io")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.top, 20)

                        // Quick Stats
                        HStack(spacing: 16) {
                            StatCard(title: "Mood Syncs", value: "142")
                            StatCard(title: "Sync Circle", value: "8")
                            StatCard(title: "Level", value: "Gold")
                        }
                        .padding(.horizontal)

                        // Settings List
                        VStack(alignment: .leading, spacing: 20) {
                            SettingsSection(title: "Personal Information") {
                                SettingsRow(icon: "person", title: "Account Details")
                                Divider().padding(.leading, 44)
                                SettingsRow(icon: "shield", title: "Security & Password")
                            }

                            SettingsSection(title: "Privacy & Sharing") {
                                SettingsRow(icon: "person.2", title: "Sync Circle", subtitle: "8 People Connected")
                                Divider().padding(.leading, 44)
                                SettingsToggleRow(icon: "eye.slash", title: "Incognito Mode", isOn: $incognitoMode)
                            }

                            SettingsSection(title: "Notification Reminders") {
                                SettingsToggleRow(icon: "bell", title: "Daily Check-ins", isOn: $dailyCheckins)
                                Divider().padding(.leading, 44)
                                SettingsRow(icon: "clock", title: "Reminder Time", subtitle: "Every day at 08:30 PM")
                            }

                            SettingsSection(title: "App Settings") {
                                VStack(alignment: .leading, spacing: 16) {
                                    HStack(spacing: 12) {
                                        Image(systemName: "paintpalette")
                                            .foregroundColor(Theme.primary)
                                        Text("App Theme")
                                            .font(.system(size: 16, weight: .semibold))
                                            .foregroundColor(.white)
                                    }

                                    HStack(spacing: 12) {
                                        ThemeOption(title: "Light", isSelected: selectedTheme == "Light") { selectedTheme = "Light" }
                                        ThemeOption(title: "Dark", isSelected: selectedTheme == "Dark") { selectedTheme = "Dark" }
                                        ThemeOption(title: "System", isSelected: selectedTheme == "System") { selectedTheme = "System" }
                                    }
                                }
                                .padding()
                                .background(Color.white.opacity(0.05))
                                .cornerRadius(16)
                            }
                        }
                        .padding(.horizontal)

                        // Logout
                        Button(action: {}) {
                            HStack {
                                Image(systemName: "rectangle.portrait.and.arrow.right")
                                Text("Log Out")
                            }
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Color.white.opacity(0.05))
                            .cornerRadius(16)
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white.opacity(0.05), lineWidth: 1))
                        }
                        .padding(.horizontal)

                        Text("MoodSync v2.4.0")
                            .font(.system(size: 10, weight: .bold))
                            .kerning(2)
                            .foregroundColor(.gray)
                            .padding(.bottom, 100)
                    }
                }
            }
        }
    }
}

struct StatCard: View {
    let title: String
    let value: String

    var body: some View {
        VStack(spacing: 4) {
            Text(title.uppercased())
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.gray)
            Text(value)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Theme.primary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.white.opacity(0.05), lineWidth: 1))
    }
}

struct SettingsSection<Content: View>: View {
    let title: String
    let content: Content

    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title.uppercased())
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(.gray)
                .padding(.leading, 8)

            VStack(spacing: 0) {
                content
            }
            .background(Color.white.opacity(0.05))
            .cornerRadius(16)
        }
    }
}

struct SettingsRow: View {
    let icon: String
    let title: String
    var subtitle: String? = nil

    var body: some View {
        Button(action: {}) {
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .foregroundColor(Theme.primary)
                    .frame(width: 32, height: 32)
                    .background(Theme.primary.opacity(0.1))
                    .cornerRadius(8)

                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                    if let subtitle = subtitle {
                        Text(subtitle)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
            }
            .padding()
        }
    }
}

struct SettingsToggleRow: View {
    let icon: String
    let title: String
    @Binding var isOn: Bool

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .foregroundColor(Theme.primary)
                .frame(width: 32, height: 32)
                .background(Theme.primary.opacity(0.1))
                .cornerRadius(8)

            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)

            Spacer()

            Toggle("", isOn: $isOn)
                .toggleStyle(SwitchToggleStyle(tint: Theme.primary))
        }
        .padding()
    }
}

struct ThemeOption: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                RoundedRectangle(cornerRadius: 6)
                    .fill(title == "Light" ? .white : (title == "Dark" ? Color(red: 0.1, green: 0.1, blue: 0.1) : LinearGradient(colors: [.white, .black], startPoint: .leading, endPoint: .trailing)))
                    .frame(height: 32)
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(isSelected ? Theme.primary : Color.gray.opacity(0.3), lineWidth: 1))

                Text(title)
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(isSelected ? Theme.primary : .white)
            }
            .frame(maxWidth: .infinity)
            .padding(8)
            .background(isSelected ? Color.white.opacity(0.1) : Color.clear)
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(isSelected ? Theme.primary : Color.clear, lineWidth: 1))
        }
    }
}

extension Color {
    static let emerald = Color(red: 16/255, green: 185/255, blue: 129/255)
}
