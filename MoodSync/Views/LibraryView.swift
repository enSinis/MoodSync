import SwiftUI

struct LibraryView: View {
    @State private var searchText = ""
    @State private var selectedCategory = "All"

    let categories = ["All", "Meditation", "Sleep", "Anxiety", "Focus"]

    var body: some View {
        ZStack {
            Theme.backgroundDark.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Header
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("MOODSYNC")
                                .font(.system(size: 12, weight: .bold))
                                .kerning(2)
                                .foregroundColor(Theme.primary)
                            Text("Library")
                                .font(.system(size: 34, weight: .black))
                                .foregroundColor(.white)
                        }
                        Spacer()
                        Circle()
                            .fill(Theme.primary.opacity(0.2))
                            .frame(width: 40, height: 40)
                            .overlay(
                                Image(systemName: "person.fill")
                                    .foregroundColor(Theme.primary)
                            )
                            .overlay(
                                Circle().stroke(Theme.primary.opacity(0.3), lineWidth: 1)
                            )
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)

                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Find a resource...", text: $searchText)
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                    }
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(12)
                    .padding(.horizontal)

                    // Categories
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(categories, id: \.self) { category in
                                CategoryButton(title: category, isSelected: selectedCategory == category) {
                                    selectedCategory = category
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    // Resource Grid
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(MockData.resources.filter { selectedCategory == "All" || $0.category == selectedCategory }) { resource in
                            ResourceCard(resource: resource)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 100)
                }
            }
        }
    }
}

struct CategoryButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(isSelected ? Theme.primary : Color.white.opacity(0.05))
                .foregroundColor(isSelected ? .black : .white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(isSelected ? Color.clear : Color.white.opacity(0.1), lineWidth: 1)
                )
        }
    }
}

struct ResourceCard: View {
    let resource: ResourceItem

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .bottomLeading) {
                // Image placeholder with AsyncImage (mocking the behavior)
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .aspectRatio(4/5, contentMode: .fit)
                    .overlay(
                        // Since URLs might not work in some previews, we use a color
                        Color.black.opacity(0.4)
                    )

                VStack(alignment: .leading, spacing: 4) {
                    Image(systemName: resource.iconName)
                        .foregroundColor(Theme.primary)
                        .font(.title2)

                    Text(resource.title)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .lineLimit(1)

                    Text(resource.description)
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                        .lineLimit(2)
                        .padding(.bottom, 8)

                    Button(action: {}) {
                        Text("START")
                            .font(.system(size: 12, weight: .black))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .background(Theme.primary)
                            .cornerRadius(8)
                    }
                }
                .padding(12)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                )
            }
            .cornerRadius(16)
            .shadow(radius: 5)
        }
    }
}
