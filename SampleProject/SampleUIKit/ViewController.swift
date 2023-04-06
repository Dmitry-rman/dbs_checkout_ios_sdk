//
//  ViewController.swift
//  SampleUIKit
//
//  Created by Dmitry on 05.04.2023.
//

import UIKit
import DBSCheckoutCore
import DBSCheckout

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func payButtonTap(_ sender: AnyObject){
        showPayViewController()
    }
    
    private func showPayViewController(){
        
        ///language по-умолчанию русский язык
        let language = DBSCheckoutCoreSdkLanguage.ru
        
        ///ID платежа, подлежащего оплате
        let paymentID = "payment_id"
        
        ///Среда, используемая в SDK
        let environment = DBSCheckoutCoreSdkEnvironment.merch
        
        ///Создать конфигурацию и экземпляр SDK
        let configuration = DBSCheckoutCoreSdkConfiguration(paymentId: paymentID, environment: environment, language: language)
        let sdk = DBSCheckoutSdk(configuration: configuration)
        
        sdk.presentCheckoutView(on: self,
                                dismissButtonType: .close,
                                presentationType: .sheet,
                                completionHandler: {})
    }

}

