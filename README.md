# DBS Checkout SDK for iOS

SDK состоит из библиотеки ядра (**DBSCheckoutCore**) и библиотеки UI форм (**DBSCheckoutSDK**) в виде раздельных xcframeworks.

## Возможности SDK

- Прием платежей карт **Visa**, **Mastercard**, **Humo**, **Uzum Bank** и **МИР**
- Отображение деталей заказа
- Прохождение оплат с использованием **3DS**
- Поддержка узбекской, русской и английской локализации
- Поддержка оплаты в сумах, рублях и долларах
- Отслеживание событий успешного проведения оплаты или ошибки с кодом
- Добавление новой карты (данные передаются зашифрованные с помощью ассиметричного шифрования) или использование добавленных ранее для проведения платежа
- Возможность кастомизации шрифтов и цветовой схемы (индивидуально для мерчанта)
- Поддержка приложений с циклом управление на **UIKit** и **SwiftUI**
- Поддержка светлой и темной цветовых схем

## Требования и ограничения

Для работы **DBS Checkout SDK** необходима iOS версии 13.0 или выше.
Библиотека UI форм **DBSCheckoutSDK** может быть использована только с ядром **DBSCheckoutCore**.

## Подключение
### Через XCode и xcframeworks
В настоящий момент SDK подключается с помощью непосредственного добавления DBSCheckoutCore.xcframework и DBSCheckoutSDK.xcframework в проект.
Это можно сделать, добавив ссылки на библиотеку в секцию **Frameworks, Libraries and Embedded Content**:

![img-xcode-xcframeworks]

## Подготовка к работе

Вначале вам понадобится получить от платжного сервиса идентификатор платежа (**paymentId**).
Подбробнее об этом можно узнать в документации к [DBS Checkout][inplattech-checkout-help], в личном кабинете или через почту checkout@inplattech.ru.

Для возможности работы с тестовым сервером **kube.inplatdev.ru** необходимо добавить в Info.plist свойство
"App Transport Security Settings" со следующими значениями:

```xml
    <key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsArbitraryLoadsInWebContent</key>
        <true/>
        <key>NSAllowsArbitraryLoads</key>
        <false/>
        <key>NSExceptionDomains</key>
        <dict>
            <key>kube.inplatdev.ru</key>
            <dict>
                <key>NSIncludesSubdomains</key>
                <true/>
                <key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
                <true/>
                <key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
                <true/>
            </dict>
        </dict>
    </dict>
```

## Начало работы

Для начала работы нужно создать конфигурацию **DBSCheckoutCoreSdkConfiguration**, используя следующие обязательные параметры:
- **paymentId**: Id платежа, полученного ранее от платежного сервиса.
- **environment**: режим работы SDK. Варианты **debug**(дев стенд), **merch**(бета-режим) и **prod**(релизный режим).

 Дополнительные (опциональные) параметры:
- **language**(опциональный, по-умолчанию **ru**): язык интерфейса платежных форм. Варианты **ru**(русский), **uz**(узбекский), **en**(английскй).

Для вызова платежной формы оплаты в **UIKit** используется метод **presentCheckoutView**, который вызывается у сконфигурированного экземпляра sdk. Метод принимает следующие параметры:
- **on** - ссылка на экземпляр UIViewController, с которого происходит показ.
- **dismissButtonType**: тип кнопки для закрытия формы. Варианты **close** (в виде крестика), **back** (в виде стрелки назад).
- **presentationType**: тип показа формы. Варианты **sheet**(пока в виде панели), **fullscreen**(показ на весь экран), **slide**(показ на весь экран, экран "приезжает" справа по аналогии с SFSafariViewController и может быть закрыт свайпом назад).
- **completionHandler**: замыкание, которое срабатывает после закрытия платежной формы.

Для создания View платежной формы в **SwiftUI** можно использовать метод **createCheckoutView** сконфигурированного экземпляра sdk. Метод имеет 2 параметра **dismissButtonType** и **presentationType** по аналогии с предыдущим методом.

## Пример создания экземпляра SDK

### Пример использования в UIKit приложении

```swift
        ///language по-умолчанию русский язык
        let language = DBSCheckoutCoreSdkLanguage.ru
        
        ///ID платежа, подлежащего оплате
        let paymentID = "payment_id"
        
        ///Среда, используемая в SDK
        let environment = DBSCheckoutCoreSdkEnvironment.merch

        ///Создать конфигурацию и экземпляр SDK
        let configuration = DBSCheckoutCoreSdkConfiguration(paymentId: paymentID,
                                                             environment: environment,
                                                                language: language)
        let sdk = DBSCheckoutSdk(configuration: configuration)
        
        ///Показать флоу оплаты, где self - это экземпляр UIViewController
        sdk.presentCheckoutView(on: self,
                                dismissButtonType: .close,
                                presentationType: .sheet,
                                completionHandler: {})
```

### Пример использования в SwiftUI приложении

```swift
struct ContentView: View {
    
    @State var isSDKPresented: Bool = false
    
    var body: some View {
        VStack {
            Button("Оплатить"){
                isSDKPresented = true
            }
        }
        .padding()
        .sheet(isPresented: $isSDKPresented) {
            paymentView
        }
    }
    
    /// View платежного флоу SDK
    private var paymentView: some View{
        
        ///language по-умолчанию русский язык
        let language = DBSCheckoutCoreSdkLanguage.ru
        
        ///ID платежа, подлежащего оплате
        let paymentID = "payment_id"
        
        ///Среда, используемая в SDK
        let environment = DBSCheckoutCoreSdkEnvironment.merch
        
        ///Создать конфигурацию и экземпляр SDK
        let configuration = DBSCheckoutCoreSdkConfiguration(paymentId: paymentID,
                                                             environment: environment,
                                                                language: language)
        let sdk = DBSCheckoutSdk(configuration: configuration)
        
        ///Создать и вернуть SwiftUI View с флоу оплаты SDK
        return sdk.createCheckoutView(dismissButtonType:  DBSCheckoutSdk.DismissButtonType.close,
                                       presentationType:  DBSCheckoutSdk.PresentationType.sheet)
    }
}
```

## Поддержка

По всем возникающим вопросам, доработкам и предложениям обращаться на почту checkout@inplattech.ru

[img-xcode-xcframeworks]: https://github.com/Dmitry-rman/dbs_checkout_ios_sdk/blob/main/images/xcode_xcframeworks.png?raw=true
[inplattech-checkout-help]: https://inplat-tech.ru/docs/merchantapi/
