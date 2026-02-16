import SwiftUI

struct InsightsView: View {
    var body: some View {
        ZStack {
            Theme.backgroundDark.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Insights")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.white)
                            Text("May 12 — May 19")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(Theme.primary.opacity(0.6))
                        }
                        Spacer()
                        HStack(spacing: 12) {
                            Button(action: {}) {
                                Image(systemName: "calendar")
                                    .foregroundColor(Theme.primary)
                                    .frame(width: 40, height: 40)
                                    .background(Theme.primary.opacity(0.1))
                                    .clipShape(Circle())
                            }
                            Image("user_profile") // Placeholder
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Theme.primary.opacity(0.2), lineWidth: 2))
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)

                    // Summary Note
                    HStack(spacing: 12) {
                        Circle()
                            .fill(Theme.primary.opacity(0.2))
                            .frame(width: 32, height: 32)
                            .overlay(Image(systemName: "sparkles").foregroundColor(Theme.primary).font(.system(size: 14)))

                        Text("You've felt ") +
                        Text("15% more 'Calm'").bold().foregroundColor(Theme.primary) +
                        Text(" this week compared to last. Keep it up!")
                    }
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Theme.primary.opacity(0.05))
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Theme.primary.opacity(0.1), lineWidth: 1))
                    .padding(.horizontal)

                    // Weekly Trend
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Weekly Trend")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.white)
                            Spacer()
                            Text("STABLE")
                                .font(.system(size: 10, weight: .bold))
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Theme.primary.opacity(0.1))
                                .foregroundColor(Theme.primary)
                                .cornerRadius(4)
                        }

                        TrendChartView()
                            .frame(height: 150)

                        HStack {
                            ForEach(["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"], id: \.self) { day in
                                Text(day)
                                    .font(.system(size: 10, weight: .semibold))
                                    .foregroundColor(Theme.primary.opacity(0.4))
                                    .frame(maxWidth: .infinity)
                            }
                        }
                    }
                    .padding(.horizontal)

                    // Mood Distribution
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Mood Distribution")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)

                        VStack(spacing: 16) {
                            MoodProgressView(title: "Joyful", percentage: 0.4, color: Theme.primary)
                            MoodProgressView(title: "Calm", percentage: 0.35, color: Theme.primary.opacity(0.6))
                            MoodProgressView(title: "Productive", percentage: 0.15, color: Theme.primary.opacity(0.3))
                            MoodProgressView(title: "Restless", percentage: 0.1, color: Color.gray.opacity(0.4))
                        }
                    }
                    .padding(.horizontal)

                    // Top Triggers
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Top Triggers")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)

                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(MockData.triggers) { trigger in
                                TriggerCard(trigger: trigger)
                            }
                        }
                    }
                    .padding(.horizontal)

                    // Reflection CTA
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("Daily Reflection")
                                .font(.system(size: 20, weight: .heavy))
                            Spacer()
                            Image(systemName: "pencil.and.outline")
                        }

                        Text("You've had a consistent mood for 3 days. What's been driving your peace of mind?")
                            .font(.system(size: 14, weight: .medium))
                            .opacity(0.8)

                        Button(action: {}) {
                            Text("Reflect Now")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(Theme.primary)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 14)
                                .background(Color.black)
                                .cornerRadius(12)
                        }
                    }
                    .padding(24)
                    .background(LinearGradient(gradient: Gradient(colors: [Theme.primary, Color(red: 0.1, green: 0.6, blue: 0.2)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .foregroundColor(.black)
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .padding(.bottom, 100)
                }
            }
        }
    }
}

struct TrendChartView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                // Grid lines
                VStack {
                    Divider().background(Color.white.opacity(0.1))
                    Spacer()
                    Divider().background(Color.white.opacity(0.1))
                    Spacer()
                    Divider().background(Color.white.opacity(0.1))
                }

                // Path
                Path { path in
                    path.move(to: CGPoint(x: 0, y: geo.size.height * 0.7))
                    path.addCurve(to: CGPoint(x: geo.size.width * 0.3, y: geo.size.height * 0.4),
                                 control1: CGPoint(x: geo.size.width * 0.1, y: geo.size.height * 0.6),
                                 control2: CGPoint(x: geo.size.width * 0.2, y: geo.size.height * 0.8))
                    path.addCurve(to: CGPoint(x: geo.size.width * 0.6, y: geo.size.height * 0.5),
                                 control1: CGPoint(x: geo.size.width * 0.4, y: geo.size.height * 0.1),
                                 control2: CGPoint(x: geo.size.width * 0.5, y: geo.size.height * 0.6))
                    path.addCurve(to: CGPoint(x: geo.size.width, y: geo.size.height * 0.3),
                                 control1: CGPoint(x: geo.size.width * 0.8, y: geo.size.height * 0.4),
                                 control2: CGPoint(x: geo.size.width * 0.9, y: geo.size.height * 0.2))
                }
                .stroke(Theme.primary, lineWidth: 3)

                // Area fill
                Path { path in
                    path.move(to: CGPoint(x: 0, y: geo.size.height))
                    path.addLine(to: CGPoint(x: 0, y: geo.size.height * 0.7))
                    path.addCurve(to: CGPoint(x: geo.size.width * 0.3, y: geo.size.height * 0.4),
                                 control1: CGPoint(x: geo.size.width * 0.1, y: geo.size.height * 0.6),
                                 control2: CGPoint(x: geo.size.width * 0.2, y: geo.size.height * 0.8))
                    path.addCurve(to: CGPoint(x: geo.size.width * 0.6, y: geo.size.height * 0.5),
                                 control1: CGPoint(x: geo.size.width * 0.4, y: geo.size.height * 0.1),
                                 control2: CGPoint(x: geo.size.width * 0.5, y: geo.size.height * 0.6))
                    path.addCurve(to: CGPoint(x: geo.size.width, y: geo.size.height * 0.3),
                                 control1: CGPoint(x: geo.size.width * 0.8, y: geo.size.height * 0.4),
                                 control2: CGPoint(x: geo.size.width * 0.9, y: geo.size.height * 0.2))
                    path.addLine(to: CGPoint(x: geo.size.width, y: geo.size.height))
                    path.closeSubpath()
                }
                .fill(LinearGradient(gradient: Gradient(colors: [Theme.primary.opacity(0.3), Theme.primary.opacity(0)]), startPoint: .top, endPoint: .bottom))

                // Current point
                Circle()
                    .fill(Theme.primary)
                    .frame(width: 8, height: 8)
                    .position(x: geo.size.width, y: geo.size.height * 0.3)
            }
        }
    }
}

struct MoodProgressView: View {
    let title: String
    let percentage: Double
    let color: Color

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text(title)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white)
                Spacer()
                Text("\(Int(percentage * 100))%")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Theme.primary)
            }

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.white.opacity(0.1))

                    RoundedRectangle(cornerRadius: 4)
                        .fill(color)
                        .frame(width: geo.size.width * percentage)
                        .shadow(color: color.opacity(0.5), radius: 5)
                }
            }
            .frame(height: 8)
        }
    }
}

struct TriggerCard: View {
    let trigger: Trigger

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Image(systemName: trigger.iconName)
                    .foregroundColor(Theme.primary)
                Text(trigger.name.uppercased())
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.white.opacity(0.6))
            }

            Text(trigger.count)
                .font(.system(size: 24, weight: .black))
                .foregroundColor(.white)
                .padding(.top, 4)

            Text(trigger.label)
                .font(.system(size: 10, weight: .medium))
                .foregroundColor(.gray)

            Text(trigger.impact)
                .font(.system(size: 10, weight: .bold))
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Theme.primary.opacity(0.1))
                .foregroundColor(Theme.primary)
                .cornerRadius(4)
                .padding(.top, 8)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white.opacity(0.05), lineWidth: 1))
    }
}
