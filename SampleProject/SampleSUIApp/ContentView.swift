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
    
    @State var isSDKPresented: Bool = false
    
    var body: some View {
        VStack {
            Button("Оплатить из SwiftUI"){
                isSDKPresented = true
            }
        }
        .padding()
        .sheet(isPresented: $isSDKPresented) {
            paymentView
        }
    }
    
    private var paymentView: some View{
        
        ///language по-умолчанию русский язык
        let language = DBSCheckoutCoreSdkLanguage.ru
        
        ///ID заказа платежа
        let orderID = "order_id"
        
        ///Среда, используемая в SDK
        let environment = DBSCheckoutCoreSdkEnvironment.merch
        
        ///Создать конфигурацию и экземпляр SDK
        let configuration = DBSCheckoutCoreSdkConfiguration(orderId: orderID, environment: environment, language: language)
        let sdk = DBSCheckoutSdk(configuration: configuration)
        
        ///Создать SwiftUI View с флоу оплаты
        return sdk.createCheckoutView(dismissButtonType:  DBSCheckoutSdk.DismissButtonType.close,
                                      presentationType:  DBSCheckoutSdk.PresentationType.sheet,
                                      completionHandler: { result in
            debugPrint("Payment flow finished with \(result)")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
