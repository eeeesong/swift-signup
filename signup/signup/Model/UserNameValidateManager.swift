//
//  UserNameValidateManager.swift
//  signup
//
//  Created by Song on 2021/03/31.
//

import Foundation

class UserNameValidateManager: ValidateManager, ValidReturnable {

    private var status: Status
    private let invalidMessages: [String]
    private let validMessage: String

    private var validUserName: String?
    
    init(status: Status, invalidMessages: [String], validMessage: String) {
        self.status = status
        self.invalidMessages = invalidMessages
        self.validMessage = validMessage
    }
    
    convenience init() {
        let noUserName = "이름은 필수 입력 값입니다"
        let userNameValid = "좋은 이름이네요 :)"
        
        self.init(status: Status(isValidated: false, message: ""),
                  invalidMessages: [noUserName],
                  validMessage: userNameValid)
    }
    
    func validatedInput() -> String? {
        return validUserName
    }
    
    func isValid(_ input: String, completionHandler: @escaping (Status) -> Void) {
        validUserName = nil
        status.isValidated = false
        
        let userName = input
        
        if !isCountValid(userName) {
            status.message = invalidMessages[0]
        } else {
            status.isValidated = true
            status.message = validMessage
            validUserName = userName
        }
        completionHandler(status)
    }

    private func isCountValid(_ userName: String) -> Bool {
        return userName.count >= 1 ? true : false
    }
}
