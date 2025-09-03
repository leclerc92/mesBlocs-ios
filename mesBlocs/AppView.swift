import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            // Onglet Sessions
            SessionListView()
                .tabItem {
                    Image(systemName: "list.bullet.clipboard")
                    Text("Sessions")
                }
            
            // Onglet Statistiques
            StatsView()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Statistiques")
                }
            
            // Onglet Nouvelle Session
            NewSessionView()
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("Nouvelle")
                }
        }
        .accentColor(.orange)
    }
}

#Preview {
    AppView()
}
