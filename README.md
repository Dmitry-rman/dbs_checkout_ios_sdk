### SDK для работы с Inplat Checkout

SDK состоит из библиотеки ядра (IPTCheckoutCore) и SDK c UI формами (IPTCheckoutSDK)

### Требования

Для работы Inplat Checkout SDK необходим iOS версии 13.0 и выше.

### Подключение
Для подключения SDK мы рекомендуем использовать [Cocoa Pods][cocoapods]. Добавьте в файл Podfile зависимости
```c
pod 'InplatCheckout'
pod 'IPTCheckoutCore', :podspec =>  "https://github.com/Dmitry-rman/inplat_checkout_ios_sdk/main/IPTCheckoutCore.podspec"
pod 'IPTCheckoutSDK', :podspec =>  "https://github.com/Dmitry-rman/inplat_checkout_ios_sdk/main/IPTCheckoutSDK.podspec"
```
