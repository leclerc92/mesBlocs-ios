import SwiftUI

struct StatisticsSeparator: View {
    var body: some View {
        Rectangle()
            .fill(Color.gray.opacity(0.3))
            .frame(width: 1, height: 50)
    }
}

#Preview {
    HStack {
        Text("Left")
        StatisticsSeparator()
        Text("Right")
    }
    .padding()
}