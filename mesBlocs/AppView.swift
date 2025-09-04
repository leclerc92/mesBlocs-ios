import SwiftUI

@available(iOS 26.0, *)
struct AppView: View {
    var body: some View {
        TabView {
            Tab("SESSIONS", systemImage: "list.bullet.rectangle.portrait.fill") {
                SessionsTabView()
            }
            
            Tab("STATS", systemImage: "percent") {
                StatsTabView()
            }
            
            Tab("NEW", systemImage: "document.badge.plus.fill") {
                NewSessionTabView()
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}

// MARK: - Tab Views

@available(iOS 26.0, *)
private struct SessionsTabView: View {
    var body: some View {
        NavigationStack {
            SessionListView()
                .navigationTitle("Sessions")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

@available(iOS 26.0, *)
private struct StatsTabView: View {
    var body: some View {
        NavigationStack {
            StatsView()
                .navigationTitle("Stats")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

@available(iOS 26.0, *)
private struct NewSessionTabView: View {
    var body: some View {
        NavigationStack {
            NewSessionView()
                .navigationTitle("Nouvelle Session")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        AppView()
    } else {
        // Fallback on earlier versions
    }
}
