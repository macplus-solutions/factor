//
//  Factor.swift
//  factor
//
//  Created by Jayson Kish on 5/30/23.
//

import ArgumentParser

@main
struct Factor: ParsableCommand {
    
    static var configuration = CommandConfiguration(
        abstract: "Print factors for one or more integers.",
        version: "3.1")
    
    @Argument(
        help: "The integers to factorize.")
    var integers: [Int] = []
    
    private var uniqueIntegers: Set<Int> {
        Set(integers)
    }
    
    mutating func run() {
        printFactors(of: uniqueIntegers)
        printLeastCommonMultiple(of: uniqueIntegers)
    }
    
    private func printFactors(of numbers: Set<Int>) {
        for number in numbers.sorted() {
            print(number.factors.sorted())
        }
    }
    
    private func printLeastCommonMultiple(of numbers: Set<Int>) {
        guard let firstNumber = numbers.first else {
            return
        }
        print("lcm", numbers.dropFirst().reduce(firstNumber) { $0.leastCommonMultiple(with: $1) })
    }
}
