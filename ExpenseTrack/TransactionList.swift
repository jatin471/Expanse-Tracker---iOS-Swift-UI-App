//
//  TransactionList.swift
//  ExpenseTrack
//
//  Created by JATIN YADAV on 17/06/23.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM : TransactionListViewModel
    var body: some View {
        
        VStack{
            List{
                //MARL::Transaction Groups
                ForEach(Array(transactionListVM.groupTransactionsByMonth()),id:\.key){month,transactions in
                    Section{
                        ForEach(transactions){ transaction in
                            TransactionRow(transaction: transaction)
                        }
                    } header :{
                        //MARK:Transaction Month
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
                
            }
            .navigationTitle("Transactions")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
    
    struct TransactionList_Previews: PreviewProvider {
        static let transactionListVm : TransactionListViewModel = {
            let transactionListVM = TransactionListViewModel()
            transactionListVM.transactions = transactionListPreviewData
            return transactionListVM
        }()
        static var previews: some View {
            Group {
                NavigationView{
                    TransactionList()
                }
                NavigationView{
                    TransactionList()
                        .preferredColorScheme(.dark)
                }
            }
            .environmentObject(transactionListVm)
        }
    }

