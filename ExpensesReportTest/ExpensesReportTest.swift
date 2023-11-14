//
//  ExpensesReportTest.swift
//  ExpensesReportTest
//
//  Created by Ahmad medo on 14/11/2023.
//

import XCTest
//@testable import ExpensesReport

/*
 Expense Report 2023-11-14 21:02:59 +0000
 Breakfast 10000 X
 Dinner 20
 Car Rental 100
 Meal Expenses: 10040
 Total Expenses: 10140
 */

final class ExpensesReportTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /*
     Expense Report 2023-11-14 21:02:59 +0000
     Meal Expenses: 0
     Total Expenses: 0
     */
    func test_makePrint_whenNoExpenses_returnEmptyReport() throws {
        let expected = """
        Expense Report \(Date())
        Meal Expenses: 0
        Total Expenses: 0
        """
        // given
        let report = ExpenseReporter()
        let expenses: [Expense] = []

        // when
        let actualReport = report.makeReport(expenses: expenses)

        // then
        XCTAssertEqual(actualReport, expected)
    }

    /*
     Expense Report 2023-11-14 21:02:59 +0000
     Breakfast 10
     Dinner 20
     Car Rental 100
     Meal Expenses: 30
     Total Expenses: 130
     */
    func test_makePrint_whenhasExpenses_returnReportCorrectFullReport() throws {
        var expected = "Expense Report \(Date())\n"
        expected += "Breakfast\t10\t\n"
        expected += "Dinner\t20\t\n"
        expected += "Car Rental\t100\t\n"
        expected += "Meal Expenses: 30\n"
        expected += "Total Expenses: 130"

        // given
        let report = ExpenseReporter()
        let expenses: [Expense] = [
            .init(type: .breakfast, amount: 10),
            .init(type: .dinner, amount: 20),
            .init(type: .carRental, amount: 100)
        ]

        // when
        let actualReport = report.makeReport(expenses: expenses)

        // then
        XCTAssertEqual(actualReport, expected)
    }

    /*
     Expense Report 2023-11-14 21:02:59 +0000
     Breakfast 2000 X
     Meal Expenses: 2000
     Total Expenses: 2000
     */
    func test_makePrint_whenBreakfastIsExpensive_returnReportBreakfastMarked() throws {
        var expected = "Expense Report \(Date())\n"
        expected += "Breakfast\t2000\tX\n"
        expected += "Meal Expenses: 2000\n"
        expected += "Total Expenses: 2000"
        // given
        let report = ExpenseReporter()
        let expenses: [Expense] = [
            .init(type: .breakfast, amount: 2000)
        ]

        // when
        let actualReport = report.makeReport(expenses: expenses)

        // then
        XCTAssertEqual(actualReport, expected)
    }

    /*
     Expense Report 2023-11-14 21:02:59 +0000
     Dinner 2000 X
     Meal Expenses: 2000
     Total Expenses: 2000
     */
    func test_makePrint_whenDinnerIsExpensive_returnReportWithDinnerMarked() throws {
        var expected = "Expense Report \(Date())\n"
        expected += "Dinner\t7000\tX\n"
        expected += "Meal Expenses: 7000\n"
        expected += "Total Expenses: 7000"
        // given
        let report = ExpenseReporter()
        let expenses: [Expense] = [
            .init(type: .dinner, amount: 7000)
        ]

        // when
        let actualReport = report.makeReport(expenses: expenses)

        // then
        XCTAssertEqual(actualReport, expected)
    }

    /*
     Expense Report 2023-11-14 21:02:59 +0000
     Car Rental 100
     Meal Expenses: 0
     Total Expenses: 100
     */
    func test_makePrint_whenMealExpense_returnReportOnlyForNoneMealExpense() throws {
        var expected = "Expense Report \(Date())\n"
        expected += "Car Rental\t100\t\n"
        expected += "Meal Expenses: 0\n"
        expected += "Total Expenses: 100"
        // given
        let report = ExpenseReporter()
        let expenses: [Expense] = [
            .init(type: .carRental, amount: 100)
        ]

        // when
        let actualReport = report.makeReport(expenses: expenses)

        // then
        XCTAssertEqual(actualReport, expected)
    }
}
