//
//  ContentView.swift
//  IPTSampleApp
//
//  Created by Dmitry on 24.03.2023.
//

import SwiftUI
import InplatCheckout
import InplatCheckoutCore

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
        let language = InplatCheckoutCoreSdkLanguage.ru
        
        ///ID платежа, подлежащего оплате
        let paymentID = "payment_id"
        
        ///Среда, используемая в SDK
        let environment = InplatCheckoutCoreSdkEnvironment.merch
        
        ///Создать конфигурацию и экземпляр SDK
        let configuration = InplatCheckoutCoreSdkConfiguration(paymentId: paymentID, environment: environment, language: language)
        let sdk = InplatCheckoutSdk(configuration: configuration)
        
        ///Создать SwiftUI View с флоу оплаты
        return sdk.createCheckoutView(dismissButtonType:  InplatCheckoutSdk.DismissButtonType.close,
                                      presentationType:  InplatCheckoutSdk.PresentationType.sheet)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
