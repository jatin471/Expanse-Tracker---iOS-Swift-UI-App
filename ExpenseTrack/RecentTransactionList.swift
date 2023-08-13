//
//  ecentTransactionList.swift
//  ExpenseTrack
//
//  Created by JATIN YADAV on 16/06/23.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListVm : TransactionListViewModel
    var body: some View {
        VStack{
            HStack{
                //Header Title
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                
                NavigationLink{
                    TransactionList()
                }label: {
                    HStack (spacing: 4){
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }
            }
            .padding(.top)
            
            //Recent Transaction List
            ForEach(Array(transactionListVm.transactions.prefix(5).enumerated()),id: \.element){index , transaction in
                TransactionRow(transaction: transaction)
                
                Divider()
                    .opacity(index == 4 ? 0:1)
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20 ,style: .continuous))
        .shadow(color: Color.primary.opacity(0.2),radius:10,x:0,y:5)
    }
}

struct RecentTransactionList_Previews: PreviewProvider {
    static let transactionListVm : TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View {
        Group{
            RecentTransactionList()
            RecentTransactionList()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVm)
    }
}
