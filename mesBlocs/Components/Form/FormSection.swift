import SwiftUI

struct FormSection<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
            )
    }
}

#Preview {
    VStack(spacing: 16) {
        FormSection {
            VStack {
                Text("Section 1")
                Text("Content here")
            }
        }
        
        FormSection {
            HStack {
                Text("Section 2")
                Spacer()
                Button("Action") { }
            }
        }
    }
    .padding()
}