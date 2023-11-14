//
//  main.swift
//  ExpensesReport
//
//  Created by Ahmad medo on 14/11/2023.
//

import Foundation

enum ExpenseType {
    case breakfast
    case dinner
    case carRental
}

struct Expense {
    var type: ExpenseType
    var amount: Int
}

class ExpenseReport {
    func printReport(expenses: [Expense]) {
        var mealExpenses = 0
        var total = 0
        print("Expense Report \(Date())")
        for expense in expenses {
            if (expense.type == .dinner || expense.type == .breakfast) {
                mealExpenses += expense.amount
            }

            var expenseName = ""
            switch expense.type {
            case .breakfast: expenseName = "Breakfast"
            case .dinner: expenseName = "Dinner"
            case .carRental: expenseName = "Car Rental"
            }

            let mealOverExpensesMarker = expense.type == .dinner && expense.amount > 5000 || expense.type == .breakfast && expense.amount > 1000 ? "X" : " "
            print("\(expenseName)\t\(expense.amount)\t\(mealOverExpensesMarker)")

            total += expense.amount
        }
        print("Meal Expenses: \(mealExpenses)")
        print("Total Expenses: \(total)")
    }
}

let report = ExpenseReport()
report.printReport(
    expenses: [
        .init(type: .breakfast, amount: 10),
        .init(type: .dinner, amount: 20),
        .init(type: .dinner, amount: 20),
        .init(type: .carRental, amount: 100)
    ]
)
/*
 1 - long method
 2 - OCP voilation
 3 - primitive obsession
 */
