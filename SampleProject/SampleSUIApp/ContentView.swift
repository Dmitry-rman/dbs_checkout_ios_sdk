//
//  ContentView.swift
//  SampleSUIApp
//
//  Created by Dmitry on 24.03.2023.
//

import SwiftUI
import DBSCheckout
import DBSCheckoutCore

struct ContentView: View {
    
    @State var checkoutType: CheckoutType?
    
    enum CheckoutType: Int, Identifiable {
        
        var id: Int { self.rawValue }
        
        case bindCard
        case pay
    }
    
    var body: some View {
        
        VStack(spacing: 24){
            
            Button("Оплатить картой"){
                checkoutType = .pay
            }
            Button("Привязать карту"){
                checkoutType = .bindCard
            }
        }
        .padding()
        .sheet(item: $checkoutType) { type in
            createSDKView(type)
        }
    }
    
    @ViewBuilder
    private func createSDKView(_ type: CheckoutType) -> some View {
        
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
        
        switch type {
            
        case .pay:
            sdk.createCheckoutView(dismissButtonType:  DBSCheckoutSdk.DismissButtonType.close,
                                   presentationType:  DBSCheckoutSdk.PresentationType.sheet,
                                   completionHandler: { result in
                
            })
        case .bindCard:
            sdk.createBindCardView(dismissButtonType:  DBSCheckoutSdk.DismissButtonType.close,
                                   presentationType:  DBSCheckoutSdk.PresentationType.sheet,
                                   completionHandler: { result in
                
            })
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
