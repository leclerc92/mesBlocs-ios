import Foundation


func formatDate(_ date: Date) -> String {
    let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: "fr_FR")
        return formatter.string(from: date)
}

