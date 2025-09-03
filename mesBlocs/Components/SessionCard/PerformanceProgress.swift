import SwiftUI

struct PerformanceProgress: View {
    let completionRate: Double
    
    private var percentageText: String {
        String(format: "%.1f", completionRate * 100) + "%"
    }
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text("Performance")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Text(percentageText)
                    .font(.caption2)
                    .fontWeight(.medium)
                    .foregroundColor(.orange)
            }
            
            ProgressView(value: completionRate)
                .progressViewStyle(LinearProgressViewStyle(tint: .orange))
                .scaleEffect(x: 1, y: 1.2, anchor: .center)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
}

#Preview {
    VStack(spacing: 20) {
        PerformanceProgress(completionRate: 0.8)
        PerformanceProgress(completionRate: 0.6)
        PerformanceProgress(completionRate: 0.9)
    }
    .background(Color(.systemBackground))
}