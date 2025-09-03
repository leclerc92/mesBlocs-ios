import SwiftUI

struct BlocFormHeader: View {
    let score: Double
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Bloc")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text("Configuration")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Spacer()
            
            Text(String(format: "%.1f", score))
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.orange)
            
            Image(systemName: "cube.fill")
                .font(.title2)
                .foregroundColor(.blue)
        }
    }
}

#Preview {
    BlocFormHeader(score: 120.5)
        .padding()
}