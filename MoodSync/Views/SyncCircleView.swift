import SwiftUI

struct SyncCircleView: View {
    @State private var isAnimating = false

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
                    Text("Sync Circle")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "gearshape")
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.05))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)

                VStack(spacing: 8) {
                    HStack(spacing: 8) {
                        Image(systemName: "wifi.tethering")
                        Text("LIVE SYNCING")
                    }
                    .font(.system(size: 10, weight: .bold))
                    .kerning(1.5)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Theme.primary.opacity(0.1))
                    .foregroundColor(Theme.primary)
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Theme.primary.opacity(0.2), lineWidth: 1))

                    Text("Your circle is feeling")
                        .font(.system(size: 24, weight: .black))
                        .foregroundColor(.white)
                    Text("calm today")
                        .font(.system(size: 24, weight: .black))
                        .italic()
                        .foregroundColor(Theme.primary)
                }
                .padding(.top, 20)

                Spacer()

                // Orbiting Visualization
                ZStack {
                    // Rings
                    Circle()
                        .stroke(Theme.primary.opacity(0.1), lineWidth: 1)
                        .frame(width: 300, height: 300)
                    Circle()
                        .stroke(Theme.primary.opacity(0.05), lineWidth: 1)
                        .frame(width: 200, height: 200)

                    // Central User Node
                    VStack(spacing: 12) {
                        ZStack {
                            Circle()
                                .fill(Theme.primary)
                                .frame(width: 100, height: 100)
                                .opacity(0.3)
                                .scaleEffect(isAnimating ? 1.2 : 1.0)
                                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isAnimating)

                            Circle()
                                .fill(Theme.primary)
                                .frame(width: 90, height: 90)
                                .overlay(
                                    Image(systemName: "person.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 90, height: 90)
                                        .clipShape(Circle())
                                        .opacity(0.8)
                                )

                            Text("😌")
                                .font(.system(size: 40))
                        }

                        Text("You • Peaceful")
                            .font(.system(size: 10, weight: .bold))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(Color.white.opacity(0.05))
                            .cornerRadius(20)
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Theme.primary.opacity(0.1), lineWidth: 1))
                    }

                    // Orbiting Friends
                    FriendNode(friend: MockData.friends[0], angle: -45, radius: 130, delay: 0)
                    FriendNode(friend: MockData.friends[1], angle: 45, radius: 120, delay: 0.5)
                    FriendNode(friend: MockData.friends[2], angle: 135, radius: 140, delay: 1.0)
                    FriendNode(friend: MockData.friends[3], angle: 225, radius: 110, delay: 1.5)
                }
                .onAppear { isAnimating = true }

                Spacer()

                // Privacy Toggle
                Button(action: {}) {
                    HStack(spacing: 8) {
                        Image(systemName: "eye.fill")
                        Text("Active Presence: Visible")
                        Spacer()
                        Capsule()
                            .fill(Theme.primary.opacity(0.2))
                            .frame(width: 32, height: 16)
                            .overlay(Circle().fill(Theme.primary).frame(width: 12, height: 12).padding(.trailing, 2), alignment: .trailing)
                    }
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.gray)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white.opacity(0.1), lineWidth: 1))
                }
                .padding(.bottom, 20)

                // Footer
                VStack(spacing: 12) {
                    PrimaryButton(title: "Sync Now", icon: "arrow.clockwise") { }

                    Button(action: {}) {
                        HStack {
                            Image(systemName: "person.badge.plus")
                            Text("Invite to Circle")
                        }
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.white.opacity(0.05))
                        .cornerRadius(12)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.white.opacity(0.1), lineWidth: 1))
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 100)
            }
        }
    }
}

struct FriendNode: View {
    let friend: FriendMood
    let angle: Double
    let radius: CGFloat
    let delay: Double

    @State private var floatingOffset: CGFloat = 0

    var body: some View {
        VStack(spacing: 8) {
            ZStack(alignment: .topTrailing) {
                Circle()
                    .stroke(friend.color, lineWidth: 2)
                    .frame(width: 60, height: 60)
                    .background(Theme.backgroundDark)
                    .clipShape(Circle())
                    .overlay(
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .foregroundColor(.gray)
                            .opacity(0.5)
                    )

                Text(friend.moodEmoji)
                    .font(.system(size: 12))
                    .frame(width: 24, height: 24)
                    .background(Theme.backgroundDark)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white.opacity(0.1), lineWidth: 1))
                    .offset(x: 4, y: -4)
            }

            Text(friend.name)
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(friend.color)
        }
        .offset(x: cos(angle * .pi / 180) * radius, y: sin(angle * .pi / 180) * radius)
        .offset(y: floatingOffset)
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: true).delay(delay)) {
                floatingOffset = -10
            }
        }
    }
}
