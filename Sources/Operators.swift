//
//  Operators.swift
//  P3Foundation
//
//  Created by Oscar Swanros on 6/15/16.
//  Copyright © 2016 Pacific3. All rights reserved.
//

infix operator >>>=
@discardableResult
public func >>>= <A, B> (optional: A?, f: (A) -> B?) -> B? {
    return flatten(x: optional.map(f))
}

precedencegroup Applicable {
    associativity: left
}

infix operator <*> : Applicable
@discardableResult
public func <*><A, B>(l: ((A) -> B)?, r: A?) -> B? {
    if
        let l1 = l,
        let r1 = r
    {
        return l1(r1)
    }
    
    return nil
}
