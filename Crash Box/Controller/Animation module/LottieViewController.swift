//
//  LottieViewController.swift
//  Crash Box
//
//  Created by Sarvad shetty on 3/28/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import UIKit
import Lottie

class LottieViewController: UIViewController {

    //NARK: - Variables
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //MARK: - IBOutlets
    @IBOutlet weak var animationView: LOTAnimationView!

    //MARK: - Main functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setup()
    }
    
    func setup(){
        animationView.setAnimation(named: "crash box")
        animationView.play { (val) in
                print(val)
            if UserDefaults.standard.bool(forKey: "KFIRSTSTATE") == true{
                self.goToApp()
            }else{
                self.goToForm()
            }
        }
    }
    
    func goToForm(){
        guard let formVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FormViewController") as? FormViewController else{
            fatalError("couldnt init form vc")
        }
        //making root view controller
        self.appDelegate.window?.rootViewController = formVC
    }
    
    func goToApp(){
        guard let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CustomTabBarController") as? CustomTabBarController else{
            fatalError("couldnt init")
        }
        self.appDelegate.window?.rootViewController = vc
    }
}
