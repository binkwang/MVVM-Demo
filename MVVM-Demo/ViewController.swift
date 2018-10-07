//
//  ViewController.swift
//  MVVM-Demo
//
//  Created by Bink Wang on 7/10/18.
//  Copyright © 2018 Bink Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var showGreetingButton: UIButton!
    
    var viewModel: GreetingViewModelProtocol! { //协议可以作为一种类型。view拥有viewModel
        didSet {
            self.viewModel.greetingDidChange = { [unowned self] viewModel in // block变量的赋值，viewModel是传入的参数值, [unowned self]是避免循环引用
                self.greetingLabel.text = viewModel.greeting
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let model = Person(firstName: "David", lastName: "Blaine")
        let viewModel = GreetingViewModel(person: model)
        self.viewModel = viewModel
        
        self.showGreetingButton.addTarget(self.viewModel, action: #selector(GreetingViewModel.showGreeting), for: .touchUpInside)
    }
    
}

