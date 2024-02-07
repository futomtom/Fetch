// FetchApp.swift

import SwiftUI

@main
struct FetchApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ListViewModel(client: MockClient()))
        }
    }
}
