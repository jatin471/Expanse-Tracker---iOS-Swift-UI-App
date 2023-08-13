//
//  Extension.swift
//  ExpenseTrack
//
//  Created by JATIN YADAV on 15/06/23.
//

import Foundation
import SwiftUI

extension Color{
    static let background = Color("Background")
    static let icon = Color("Icon")
    static let text  = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter {
    static let dateFormatter: DateFormatter = {
        print("initialising Date Formatter")
          let formatter = DateFormatter()
          formatter.dateFormat = "dd/MM/yyyy"
          return formatter
      }()
}

extension String {
    func dateParsed() -> Date {
        guard let parsedDate  = DateFormatter.dateFormatter.date(from: self) else { return Date() }
        return parsedDate
    }
}

extension Date : Strideable {
    func formatted() -> String {
        return self.formatted(.dateTime.year().month().day())
    }
}
