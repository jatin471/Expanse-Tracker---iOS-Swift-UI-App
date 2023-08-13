//
//  TransactionRow.swift
//  ExpenseTrack
//
//  Created by JATIN YADAV on 15/06/23.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRow: View {
    var transaction : Transaction
    
    
    var body: some View {
        
        HStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 20,style: .continuous)
                .fill(Color.icon.opacity(0.3))
                .frame(width: 50,height : 50)
                .overlay{
                    FontIcon.text(.awesome5Solid(code: transaction.icon),fontsize: 30,color: Color.icon)
                }
            
            VStack(alignment: .leading, spacing: 6) {
                
                //MARK : Transaction Merchant
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                //MARK : Transaction Category
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.8)
                    .lineLimit(1)
                
                //MARK : Transaction Date
                Text(transaction.dateParsed , format:.dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
            }
            Spacer()
            
            // MARK: Transaction Amount
            Text(transaction.signedAmount, format : .currency(code: "INR"))
                .bold()
                .foregroundColor(transaction.type == TransactionType.credit.rawValue ?
                                 Color.text : .primary)
        }
        .padding([.top , .bottom], 8)
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            TransactionRow(transaction: transactionPreviewData)
            TransactionRow(transaction: transactionPreviewData)
                .preferredColorScheme(.dark)
        }
    }
}
