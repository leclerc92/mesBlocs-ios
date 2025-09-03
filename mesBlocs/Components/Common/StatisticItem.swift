import SwiftUI

struct StatisticItem: View {
    let icon: String
    let iconColor: Color
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 8) {
            VStack(spacing: 2) {
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundColor(iconColor)
                
                Text(title)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    HStack {
        StatisticItem(
            icon: "trophy.fill",
            iconColor: .yellow,
            title: "Score",
            value: "120.5"
        )
        
        StatisticItem(
            icon: "cube.fill",
            iconColor: .blue,
            title: "Blocs",
            value: "8/10"
        )
        
        StatisticItem(
            icon: "plusminus",
            iconColor: .orange,
            title: "Niveau",
            value: "5.6"
        )
    }
    .padding()
}