//
//  GreetingViewModel.swift
//  MVVM-Demo
//
//  Created by Bink Wang on 7/10/18.
//  Copyright © 2018 Bink Wang. All rights reserved.
//

import Foundation

class GreetingViewModel: GreetingViewModelProtocol {
    var person: Person?
    
    var greeting: String? {
        didSet {
            self.greetingDidChange?(greeting)
        }
    }
    var greetingDidChange: ((String?) -> ())?
    
    required init() {}
    
    func fetchData() {
        let person = Person(firstName: "David", lastName: "Blaine")
        self.person = person
    }
    
    @objc func showGreeting() {
        guard let person = self.person else { return }
        self.greeting = "Hello" + " " + person.firstName + " " + person.lastName
    }
}

protocol GreetingViewModelProtocol: class { //class关键字,表示协议只能被类遵守,如果有枚举或结构体尝试遵守会报错
    var greeting: String? { get set }
    var greetingDidChange: ((String?) -> ())? { get set }

    init()  //定义遵循协议的类型需要实现的指定构造函数
    func fetchData()
    func showGreeting()
}

