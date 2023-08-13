//
//  ExpenseTrackApp.swift
//  ExpenseTrack
//
//  Created by JATIN YADAV on 15/06/23.
//

import SwiftUI

@main
struct ExpenseTrackApp: App {
    @StateObject var transactionListVM  = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
