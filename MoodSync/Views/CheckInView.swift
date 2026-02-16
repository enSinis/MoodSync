import SwiftUI

struct CheckInView: View {
    @State private var selectedMood: MoodLevel = .calm
    @State private var selectedTags: Set<String> = ["Family"]
    @State private var reflection: String = ""

    let tags = ["Family", "Work", "Exercise", "Sleep", "Hobbies", "Social"]

    var body: some View {
        ZStack {
            Theme.backgroundDark.ignoresSafeArea()

            VStack(spacing: 0) {
                // Header
                HStack {
                    Button(action: {}) {
                        Image(systemName: "xmark")
                            .foregroundColor(.gray)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.05))
                            .clipShape(Circle())
                    }
                    Spacer()
                    Text("MOODSYNC")
                        .font(.system(size: 12, weight: .bold))
                        .kerning(2)
                        .foregroundColor(.white.opacity(0.6))
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "questionmark.circle")
                            .foregroundColor(Theme.primary)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.05))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)

                ScrollView {
                    VStack(spacing: 40) {
                        // Prompt
                        VStack(spacing: 12) {
                            Text("How are you feeling\ntoday?")
                                .font(.system(size: 32, weight: .bold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            Text("Tap or slide to reflect your mood")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                        .padding(.top, 20)

                        // Mood Slider
                        MoodSlider(selectedMood: $selectedMood)

                        // Activity Tags
                        VStack(alignment: .leading, spacing: 16) {
                            Text("What's been on your mind?")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.white)

                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100, maximum: 150))], spacing: 12) {
                                ForEach(tags, id: \.self) { tag in
                                    TagButton(title: tag, isSelected: selectedTags.contains(tag)) {
                                        if selectedTags.contains(tag) {
                                            selectedTags.remove(tag)
                                        } else {
                                            selectedTags.insert(tag)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)

                        // Reflections
                        VStack(alignment: .leading, spacing: 16) {
                            HStack {
                                Text("Reflections")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(.white)
                                Spacer()
                                Text("Optional")
                                    .font(.system(size: 12, weight: .medium))
                                    .italic()
                                    .foregroundColor(.gray)
                            }

                            ZStack(alignment: .topLeading) {
                                if reflection.isEmpty {
                                    Text("Add a short note about your day...")
                                        .foregroundColor(.gray)
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 20)
                                }

                                TextEditor(text: $reflection)
                                    .frame(height: 130)
                                    .opacity(reflection.isEmpty ? 0.25 : 1)
                                    .padding()
                                    .background(Color.white.opacity(0.05))
                                    .cornerRadius(16)
                                    .foregroundColor(.white)
                            }
                            .overlay(
                                Image(systemName: "pencil")
                                    .foregroundColor(.gray)
                                    .padding(),
                                alignment: .bottomTrailing
                            )
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 150)
                }
            }

            // Footer Action
            VStack {
                Spacer()
                PrimaryButton(title: "Save Check-in", icon: "checkmark.circle.fill") {
                    // Save action
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 40)
            }
            .ignoresSafeArea()
        }
    }
}

struct MoodSlider: View {
    @Binding var selectedMood: MoodLevel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 24) {
                Spacer(minLength: 150)
                ForEach(MoodLevel.allCases) { mood in
                    VStack(spacing: 12) {
                        ZStack {
                            Circle()
                                .fill(selectedMood == mood ? Theme.primary.opacity(0.2) : Color.white.opacity(0.05))
                                .frame(width: selectedMood == mood ? 100 : 70, height: selectedMood == mood ? 100 : 70)

                            Text(mood.emoji)
                                .font(.system(size: selectedMood == mood ? 50 : 35))
                        }
                        .overlay(
                            Circle()
                                .stroke(selectedMood == mood ? Theme.primary : Color.clear, lineWidth: 4)
                        )
                        .shadow(color: selectedMood == mood ? Theme.primary.opacity(0.3) : Color.clear, radius: 15)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedMood = mood
                            }
                        }

                        Text(mood.rawValue)
                            .font(.system(size: 14, weight: selectedMood == mood ? .bold : .medium))
                            .foregroundColor(selectedMood == mood ? Theme.primary : .gray)
                            .opacity(selectedMood == mood ? 1 : 0.6)
                    }
                    .scaleEffect(selectedMood == mood ? 1.1 : 0.8)
                }
                Spacer(minLength: 150)
            }
        }
    }
}

struct TagButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(systemName: getIcon(for: title))
                Text(title)
            }
            .font(.system(size: 12, weight: isSelected ? .bold : .medium))
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(isSelected ? Theme.primary : Color.white.opacity(0.05))
            .foregroundColor(isSelected ? .black : .gray)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isSelected ? Color.clear : Color.white.opacity(0.1), lineWidth: 1)
            )
        }
    }

    func getIcon(for title: String) -> String {
        switch title {
        case "Family": return "house"
        case "Work": return "briefcase"
        case "Exercise": return "bolt.fill"
        case "Sleep": return "moon.fill"
        case "Hobbies": return "paintpalette"
        case "Social": return "person.2"
        default: return "star"
        }
    }
}
