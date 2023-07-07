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
    
    enum CheckoutType: Int {
        
        case bindCard
        case pay
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func payButtonTap(_ sender: AnyObject){
        showViewController(.pay)
    }
    
    @IBAction func bindButtonTap(_ sender: AnyObject){
        showViewController(.bindCard)
    }
    
    private func showViewController(_ type: CheckoutType){
        
        ///language по-умолчанию русский язык
        let language = DBSCheckoutCoreSdkLanguage.ru
        
        ///ID заказа платежа, подлежащего оплате
        let orderID = "order_id"
        
        ///Среда, используемая в SDK
        let environment = DBSCheckoutCoreSdkEnvironment.merch
        
        ///Создать конфигурацию и экземпляр SDK
        let configuration = DBSCheckoutCoreSdkConfiguration(orderId: orderID,
                                                            environment: environment,
                                                            language: language,
                                                            colorScheme: .systemDefined)
        let sdk = DBSCheckoutSdk(configuration: configuration)
        
        switch type{
        case .pay:
            sdk.presentCheckoutView(on: self,
                                    dismissButtonType: .close,
                                    presentationType: .sheet,
                                    completionHandler: { result in
                debugPrint("Payment flow finished with \(result)")
            })
        case .bindCard:
            sdk.presentBindCardView(on: self,
                                    dismissButtonType: .close,
                                    presentationType: .sheet,
                                    completionHandler: { result in
                debugPrint("Payment flow finished with \(result)")
            })
        }

    }

}

