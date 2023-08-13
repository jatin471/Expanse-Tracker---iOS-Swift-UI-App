//
//  ContentView.swift
//  ExpenseTrack
//
//  Created by JATIN YADAV on 15/06/23.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM : TransactionListViewModel
//    var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                    //MARK: Title 
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    //MARK Chart
                    let data = transactionListVM.accumulateTransaction()
                    let totalExpteses = data.last?.1 ?? 0
                    CardView{
                        VStack{
                            ChartLabel(totalExpteses.formatted(.currency(code:"INR")),type: .title)
                            LineChart()
                        }
                        .background(Color.systemBackground)
                    }
                        .data(data)
                        .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4),Color.icon)))
                        .frame(height: 300)
                        .background(Color.systemBackground)
                    
                    
                    //MARK: Transaction List
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                //MARK: Notification Icon
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let transactionListVm : TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        Group{
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }.environmentObject(transactionListVm)
       
    }
}
