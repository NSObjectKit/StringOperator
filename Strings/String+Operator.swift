//
//  String+Operator.swift
//  shandianji
//
//  Created by Dengzunli on 2019/2/26.
//  Copyright © 2019 shandianji. All rights reserved.
//

import Foundation


extension String {
    
    private static var defaultBehavior = NSDecimalNumberHandler.init(roundingMode: .plain, scale: 0, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
    
    public var decimalWrapper: NSDecimalNumber {
        get {
            return NSDecimalNumber(string: self)
        }
    }
    
    public func roundToPlain(_ scale: Int) -> String {
        
        if var origin = Decimal(string: self) {
            var result = Decimal()
            NSDecimalRound(&result, &origin, scale, .plain)
            return NSDecimalNumber(decimal: result).stringValue
        }
        return ""
    }
    
    public func roundToBankers(_ scale: Int) -> String {
        
        if var origin = Decimal(string: self) {
            var result = Decimal()
            NSDecimalRound(&result, &origin, scale, .bankers)
            return NSDecimalNumber(decimal: result).stringValue
        }
        return ""
    }
    
    public func roundToUp(_ scale: Int) -> String {
        
        if var origin = Decimal(string: self) {
            var result = Decimal()
            NSDecimalRound(&result, &origin, scale, .up)
            return NSDecimalNumber(decimal: result).stringValue
        }
        return ""
    }
    
    public func roundToDown(_ scale: Int) -> String {
        
        if var origin = Decimal(string: self) {
            var result = Decimal()
            NSDecimalRound(&result, &origin, scale, .down)
            return NSDecimalNumber(decimal: result).stringValue
        }
        return ""
    }
    
    
    public static func +(lhs: String, rhs: String) -> String {
        
        if lhs.decimalWrapper == .notANumber || rhs.decimalWrapper == .notANumber {
            return lhs.appending(rhs)
        }
        
        return lhs.decimalWrapper.adding(rhs.decimalWrapper, withBehavior: defaultBehavior).stringValue
    }

    public static func -(lhs: String, rhs: String) -> String {
        
        return lhs.decimalWrapper.subtracting(rhs.decimalWrapper, withBehavior: defaultBehavior).stringValue
    }
    
    public static func *(lhs: String, rhs: String) -> String {
        
        return lhs.decimalWrapper.multiplying(by: rhs.decimalWrapper, withBehavior: defaultBehavior).stringValue
    }
    
    public static func /(lhs: String, rhs: String) -> String {
        
        return lhs.decimalWrapper.dividing(by: rhs.decimalWrapper, withBehavior: defaultBehavior).stringValue
    }
    
    public static func <(lhs: String, rhs: String) -> Bool {
        return lhs.decimalWrapper.compare(rhs.decimalWrapper) == .orderedAscending
    }
    
    public static func <=(lhs: String, rhs: String) -> Bool {
        return lhs.decimalWrapper.compare(rhs.decimalWrapper) != .orderedDescending
    }
    
    public static func >(lhs: String, rhs: String) -> Bool {
        return lhs.decimalWrapper.compare(rhs.decimalWrapper) == .orderedDescending
    }
    
    public static func >=(lhs: String, rhs: String) -> Bool {
        return lhs.decimalWrapper.compare(rhs.decimalWrapper) != .orderedAscending
    }

}
