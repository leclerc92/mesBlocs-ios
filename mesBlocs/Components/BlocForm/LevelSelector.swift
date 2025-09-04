import SwiftUI

@available(iOS 26.0, *)
struct LevelSelector: View {
    @Binding var level: Int
    
    var body: some View {
        GlassEffectContainer {
            VStack(spacing: 12) {
                HStack {
                    HStack(spacing: 8) {
                        Image(systemName: "chart.line.uptrend.xyaxis")
                            .font(.title3)
                            .foregroundColor(.orange)
                        
                        Text("Niveau")
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                    
                    Spacer()
                    
                    Text("\(level)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                        .frame(minWidth: 30)
                }
                
                Slider(
                    value: levelBinding,
                    in: 1...14,
                    step: 1,
                    minimumValueLabel: Text("1")
                        .font(.caption2)
                        .foregroundColor(.secondary),
                    maximumValueLabel: Text("14")
                        .font(.caption2)
                        .foregroundColor(.secondary),
                    label: { Text("Level") }
                )
                .tint(.orange)
            }
        }
    }
    
    private var levelBinding: Binding<Double> {
        Binding(
            get: { Double(level) },
            set: { level = Int($0) }
        )
    }
}

#Preview {
    @State var level = 7
    
    return FormSection {
        if #available(iOS 26.0, *) {
            LevelSelector(level: $level)
        } else {
            // Fallback on earlier versions
        }
    }
    .padding()
}
