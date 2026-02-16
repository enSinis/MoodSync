import SwiftUI

struct ContentView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @State private var isPlaying = false

    var body: some View {
        ZStack {
            // Animated Gradient Background
            AnimatedBackgroundView(colors: themeManager.theme.gradientColors)
                .ignoresSafeArea()

            VStack(spacing: 40) {
                // Header
                Text("MOODSYNC")
                    .font(.system(size: 16, weight: .black, design: themeManager.theme.fontStyle))
                    .kerning(4)
                    .foregroundColor(themeManager.theme.primaryColor.opacity(0.8))
                    .padding(.top, 20)

                Spacer()

                // Central Player Card (Glassmorphism)
                PlayerCardView()
                    .padding(.horizontal, 30)

                // Music Controls
                MusicControlsView(isPlaying: $isPlaying)

                Spacer()

                // Mood Selector
                MoodSelectorView()
                    .padding(.bottom, 30)
            }
        }
        // Global animation for theme changes
        .animation(.spring(response: 0.6, dampingFraction: 0.7), value: themeManager.currentMood)
    }
}

struct AnimatedBackgroundView: View {
    let colors: [Color]
    @State private var start = UnitPoint(x: 0, y: -2)
    @State private var end = UnitPoint(x: 4, y: 0)

    var body: some View {
        LinearGradient(colors: colors, startPoint: start, endPoint: end)
            .onAppear {
                withAnimation(.easeInOut(duration: 10).repeatForever(autoreverses: true)) {
                    start = UnitPoint(x: 4, y: 4)
                    end = UnitPoint(x: -2, y: -2)
                }
            }
    }
}

struct PlayerCardView: View {
    @EnvironmentObject var themeManager: ThemeManager

    var body: some View {
        VStack(spacing: 25) {
            // Album Art Placeholder
            RoundedRectangle(cornerRadius: themeManager.theme.cornerRadius)
                .fill(themeManager.theme.primaryColor.opacity(0.2))
                .aspectRatio(1, contentMode: .fit)
                .overlay(
                    Image(systemName: "music.note")
                        .font(.system(size: 60))
                        .foregroundColor(themeManager.theme.primaryColor)
                )
                .shadow(color: themeManager.theme.primaryColor.opacity(0.3), radius: 20, x: 0, y: 10)

            VStack(spacing: 8) {
                Text("Hyper-Reactive Track")
                    .font(.system(size: 24, weight: .bold, design: themeManager.theme.fontStyle))
                    .foregroundColor(themeManager.currentMood == .dark ? .white : .black)

                Text("MoodSync Artist")
                    .font(.system(size: 18, weight: .medium, design: themeManager.theme.fontStyle))
                    .foregroundColor(themeManager.currentMood == .dark ? .white.opacity(0.6) : .black.opacity(0.6))
            }
        }
        .padding(30)
        .background(.ultraThinMaterial)
        .background(themeManager.theme.primaryColor.opacity(themeManager.theme.glassOpacity))
        .clipShape(RoundedRectangle(cornerRadius: themeManager.theme.cornerRadius * 1.5))
        .overlay(
            RoundedRectangle(cornerRadius: themeManager.theme.cornerRadius * 1.5)
                .stroke(Color.white.opacity(0.2), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.1), radius: 20, x: 0, y: 20)
    }
}

struct MusicControlsView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @Binding var isPlaying: Bool

    var body: some View {
        HStack(spacing: 40) {
            ControlButton(icon: "backward.fill") {
                // Skip back
            }

            PlayButton(isPlaying: $isPlaying) {
                isPlaying.toggle()
            }

            ControlButton(icon: "forward.fill") {
                // Skip forward
            }
        }
    }
}

struct ControlButton: View {
    @EnvironmentObject var themeManager: ThemeManager
    let icon: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: themeManager.theme.cornerRadius)
                    .fill(themeManager.theme.primaryColor.opacity(0.2))
                    .frame(width: 60, height: 60)

                Image(systemName: icon)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(themeManager.theme.primaryColor)
            }
        }
    }
}

struct PlayButton: View {
    @EnvironmentObject var themeManager: ThemeManager
    @Binding var isPlaying: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: themeManager.theme.cornerRadius)
                    .fill(themeManager.theme.primaryColor)
                    .frame(width: 90, height: 90)
                    .shadow(color: themeManager.theme.primaryColor.opacity(0.4), radius: 15, x: 0, y: 10)

                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(themeManager.currentMood == .dark ? .black : .white)
                    .offset(x: isPlaying ? 0 : 2)
            }
        }
    }
}

struct MoodSelectorView: View {
    @EnvironmentObject var themeManager: ThemeManager

    var body: some View {
        HStack(spacing: 15) {
            ForEach(Mood.allCases, id: \.self) { mood in
                Button(action: {
                    themeManager.currentMood = mood
                }) {
                    Text(mood.rawValue)
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .foregroundColor(themeManager.currentMood == mood ? .white : .primary)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                        .background(themeManager.currentMood == mood ? themeManager.theme.primaryColor : Color.clear)
                        .clipShape(Capsule())
                }
            }
        }
        .padding(8)
        .background(.ultraThinMaterial)
        .clipShape(Capsule())
        .shadow(color: Color.black.opacity(0.1), radius: 10)
    }
}
