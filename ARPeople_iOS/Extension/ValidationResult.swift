//
//  isValid.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/18.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit

enum ValidationResult {
    case valid
    case invalid(errors: [String])
}

protocol Validator {
    func validate(_ value: String) -> ValidationResult
}

enum EmailValidationError: Error {
    case empty
    case invalidFormat
}

enum PasswordValidationError: Error {
    case empty
    case tooShort
    case tooLong
    case noUppercaseLetter
}

/// 空チェック
struct EmptyStringValidator: Validator {
    private let invalidError: String
    
    init(invalidError: String) {
        self.invalidError = invalidError
    }
    
    func validate(_ value: String) -> ValidationResult {
        if value.isEmpty {
            return .invalid(errors: [invalidError])
        } else {
            return .valid
        }
    }
}

/// メールアドレス形式か
struct EmailFormatValidator: Validator {
    func validate(_ value: String) -> ValidationResult {
        let magicEmailRegexStolenFromTheInternet = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", magicEmailRegexStolenFromTheInternet)
        if emailTest.evaluate(with: value) {
            return .valid
        } else {
            return .invalid(errors: ["メールアドレスの形式が間違っています。"])
        }
    }
}

/// パスワードの長さが適正か
struct PasswordLengthValidator: Validator {
    func validate(_ value: String) -> ValidationResult {
        if value.count <= 8 {
            return .invalid(errors: ["パスワードを8文字以上にしてください"])
        } else if value.count >= 30 {
            return .invalid(errors: ["パスワードを30文字以下にしてください"])
        } else {
            return .valid
        }
    }
}

/// 大文字があるか
struct UppercaseLetterValidator: Validator {
    func validate(_ value: String) -> ValidationResult {
        let uppercaseLetterRegex = ".*[A-Z]+.*"
        let uppercaseLetterTest = NSPredicate(format:"SELF MATCHES %@", uppercaseLetterRegex)
        if uppercaseLetterTest.evaluate(with: value) {
            return .valid
        } else {
            return .invalid(errors: ["パスワードに大文字の1文字以上含めてください"])
        }
    }
}

struct CompositeValidator: Validator {
    private let validators: [Validator]
    
    init(validators: Validator...) {
        self.validators = validators
    }
    
    func validate(_ value: String) -> ValidationResult {
        return validators.reduce(.valid) { (acc, validator) -> ValidationResult in
            switch validator.validate(value) {
            case .valid:
                return acc
            case .invalid(let errors):
                switch acc {
                case .valid:
                    return .invalid(errors: errors)
                case .invalid(let accErrors):
                    return .invalid(errors: accErrors + errors)
                }
            }
        }
    }
}
