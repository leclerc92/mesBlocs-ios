import SwiftUI

struct SessionHeader: View {
    let date: Date
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Session")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text(formatDate(date))
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Spacer()
            
            Image(systemName: "figure.climbing")
                .font(.title2)
                .foregroundColor(.orange)
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
        .padding(.bottom, 16)
    }
}

#Preview {
    SessionHeader(date: Date.now)
        .background(Color(.systemBackground))
}