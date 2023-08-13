//
//  PreviewData.swift
//  ExpenseTrack
//
//  Created by JATIN YADAV on 15/06/23.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: 1, date: "15/06/2023", institution: "IIITDMj", account: "IndianBank", merchant: "Apple", amount: 15, type: "debit", categoryId: 550,category: "Software", isPending: false, isTransfer: false, isEdited: false, isExpense: true)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
