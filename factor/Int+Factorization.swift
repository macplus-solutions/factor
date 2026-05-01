//
//  Int+Factorization.swift
//  factor
//
//  Created by Jayson Kish on 5/30/23.
//

extension Int {
    // Factorization helpers for positive integers.
    
    public var factors: Set<Int> {
        var factors = Set<Int>()
        for number in 1...self where self.isMultiple(of: number) {
            factors.insert(number)
        }
        return factors
    }

    public func commonFactors(with number: Int) -> Set<Int> {
        Set(self.factors).intersection(number.factors)
    }
    
    public func greatestCommonFactor(with number: Int) -> Int {
        commonFactors(with: number).max()!
    }
    
    public func leastCommonMultiple(with number: Int) -> Int {
        (self * number) / greatestCommonFactor(with: number)
    }
}
