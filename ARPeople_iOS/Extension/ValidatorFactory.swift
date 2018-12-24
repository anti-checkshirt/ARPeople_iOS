//
//  ValidatorFactory.swift
//  ARPeople_iOS
//
//  Created by 築山朋紀 on 2018/12/24.
//  Copyright © 2018 tomoki. All rights reserved.
//

import Foundation

struct ValidatorFactory {
    static let sharedInstance = ValidatorFactory()
    private init() {}
    
    func emailValidator() -> Validator {
        return CompositeValidator(validators: emptyEmailStringValidator(), EmailFormatValidator())
    }
    
    func passwordValidator() -> Validator {
        return CompositeValidator(validators: emptyPasswordStringValidator(), passwordStrengthValidator())
    }
    
    private func emptyEmailStringValidator() -> Validator {
        return EmptyStringValidator(invalidError: "メールアドレスを入力してください")
    }
    
    private func emptyPasswordStringValidator() -> Validator {
        return EmptyStringValidator(invalidError: "パスワードを入力してください")
    }
    
    private func passwordStrengthValidator() -> Validator {
        return CompositeValidator(validators: PasswordLengthValidator(), UppercaseLetterValidator())
    }
}
