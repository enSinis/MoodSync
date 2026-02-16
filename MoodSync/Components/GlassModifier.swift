import SwiftUI

struct GlassModifier: ViewModifier {
    var opacity: Double = 0.05
    var blur: CGFloat = 8

    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(opacity))
                    .background(Blur(style: .systemThinMaterialDark))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.white.opacity(0.1), lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

// Since SwiftUI's native blur material might be restricted in some environments,
// we provide a fallback using a simple blur if needed, or stick to ultraThinMaterial.
struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

extension View {
    func glassCard(opacity: Double = 0.05, blur: CGFloat = 8) -> some View {
        self.modifier(GlassModifier(opacity: opacity, blur: blur))
    }
}
