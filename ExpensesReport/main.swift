//
//  main.swift
//  ExpensesReport
//
//  Created by Ahmad medo on 14/11/2023.
//

import Foundation

// New Feature: Add Lunch with an expense limit of 2000.

// Change
enum ExpenseType {
    case breakfast
    case dinner
    case carRental
}

struct Expense {
    var type: ExpenseType
    var amount: Int
}

// Change
final class ExpenseReporter {
    // Change
    func makeReport(expenses: [Expense]) -> String {
        var mealExpenses = 0
        var total = 0
        var report = ""
        report += "Expense Report \(Date())\n"
        for expense in expenses {
            // Change
            if (expense.type == .dinner || expense.type == .breakfast) {
                mealExpenses += expense.amount
            }

            let expenseName = getExpenseName(expense)
            let mealOverExpensesMarker = getMealOverExpensesMarker(expense)

            report += "\(expenseName)\t\(expense.amount)\t\(mealOverExpensesMarker)\n"

            total += expense.amount
        }
        report += "Meal Expenses: \(mealExpenses)\n"
        report += "Total Expenses: \(total)"

        return report
    }

    func getExpenseName(_ expense: Expense) -> String {
        switch expense.type {
        case .breakfast: return "Breakfast"
        case .dinner: return "Dinner"
        case .carRental: return "Car Rental"
        }
    }

    func getMealOverExpensesMarker(_ expense: Expense)->String{
        // Change
        let isDinnerExpensive = expense.type == .dinner && expense.amount > 5000
        let isBreakfastExpensive = expense.type == .breakfast && expense.amount > 1000
        return isDinnerExpensive || isBreakfastExpensive ? "X" : ""
    }
}

let reporter = ExpenseReporter()
let report = reporter.makeReport(
    expenses: [
        .init(type: .breakfast, amount: 10000),
        .init(type: .dinner, amount: 20),
        .init(type: .carRental, amount: 100)
    ]
)
print(report)
/*
 1 - long method
 2 - OCP voilation
 3 - primitive obsession
 4 - long one line if conditions
 5 - cannot be tested
 */
