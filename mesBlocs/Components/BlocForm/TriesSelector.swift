import SwiftUI

struct TriesSelector: View {
    @Binding var tries: Int
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                HStack(spacing: 8) {
                    Image(systemName: "arrow.clockwise")
                        .font(.title3)
                        .foregroundColor(.blue)
                    
                    Text("Essais")
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
                
                Spacer()
                
                Text("\(tries)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .frame(minWidth: 30)
            }
            
            Stepper(
                "",
                value: $tries,
                in: 1...100
            )
        }
    }
}

#Preview {
    @State var tries = 3
    
    return FormSection {
        TriesSelector(tries: $tries)
    }
    .padding()
}