import SwiftUI

struct OptionToggle: View {
    let icon: String
    let activeIcon: String?
    let title: String
    let description: String
    let activeColor: Color
    @Binding var isOn: Bool
    
    init(
        icon: String,
        activeIcon: String? = nil,
        title: String,
        description: String,
        activeColor: Color,
        isOn: Binding<Bool>
    ) {
        self.icon = icon
        self.activeIcon = activeIcon
        self.title = title
        self.description = description
        self.activeColor = activeColor
        self._isOn = isOn
    }
    
    var body: some View {
        HStack {
            HStack(spacing: 12) {
                Image(systemName: displayIcon)
                    .font(.title3)
                    .foregroundColor(isOn ? activeColor : .gray)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    Text(description)
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
            
            Spacer()
            
            Toggle("", isOn: $isOn)
                .toggleStyle(SwitchToggleStyle(tint: activeColor))
        }
    }
    
    private var displayIcon: String {
        if let activeIcon = activeIcon {
            return isOn ? activeIcon : icon
        }
        return icon
    }
}

#Preview {
    @State var devers = true
    @State var terminate = false
    
    return VStack(spacing: 16) {
        FormSection {
            VStack(spacing: 16) {
                OptionToggle(
                    icon: "mountain.2",
                    activeIcon: "mountain.2.fill",
                    title: "Dévers",
                    description: "Bloc en surplomb",
                    activeColor: .orange,
                    isOn: $devers
                )
                
                Divider()
                
                OptionToggle(
                    icon: "checkmark.circle",
                    activeIcon: "checkmark.circle.fill",
                    title: "Terminé",
                    description: "Bloc réussi",
                    activeColor: .green,
                    isOn: $terminate
                )
            }
        }
    }
    .padding()
}