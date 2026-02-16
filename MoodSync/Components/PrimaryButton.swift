import SwiftUI

struct PrimaryButton: View {
    var title: String
    var icon: String? = nil
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                if let icon = icon {
                    Image(systemName: icon)
                }
                Text(title)
            }
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Theme.primary)
            .cornerRadius(12)
            .shadow(color: Theme.primary.opacity(0.3), radius: 10, x: 0, y: 5)
        }
    }
}
