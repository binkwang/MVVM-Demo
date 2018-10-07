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
    
    var viewModel: GreetingViewModel! {
        didSet {
            self.viewModel.greetingDidChange = { [unowned self] greeting in
                self.greetingLabel.text = greeting
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

