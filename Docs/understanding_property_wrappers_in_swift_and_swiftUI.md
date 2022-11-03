# Understanding property wrappers in Swift and SwiftUI

SwiftUI는 우리의 코드를 더 읽고, 쓰고, 유지하기 쉽게 만들기 위해 property wrapper에 크게 의존하 있지만,  
이전에 그들을 전혀 사용해본적이 없다면 모든 `@`와 `$` 기호가 어디서부터 왔는지 궁금할 수 있다. 처음에는 매우 낯설어 보일 수 있다. 

비록 property wrapper는 `Swift 5.1` 에서 소개된 이후 Swift의 일반적인 기능이지만, 특히 SwiftUI에서는 흔합니다.
당신은 `@Published`, `@ObservedObject`, `@EnvironmentObject` 그리고 다른 많은 것들을 보았을 것이다.
모두 우리의 코드 안에서 boilerplate의 양을 줄이는 데 도움이 된다.

> `boilerplate` (보일러플레이트)
> : 최소한의 변경으로 여러 곳에서 재사용되며, 반복적으로 비슷한 형태를 띄는 코드를 말한다.

우리는 다음 몇몇 챕터에서 SwiftUI의 property wrapper들 각각에 대해 자세히 알아볼 것이다.
하지만 그전에 간단히 기본적인 사항들을 요약해보자면 다음과 같다:

- 일부 property wrapper들은 불가능한 것을 가능하게 하는 효과를 얻게 해준다.
    - @State가 구조체 내부의 속성을 수정할 수 있게 해주는 방식과 같이.
- 일부 property wrapper들은 특히 다른 곳에서 추가 작업을 수행해야 하며, 작업이 완료되지 않으면 앱이 충돌할 수 있다.
    - 예를 들어 @FetchRequest는 미리 Core Data 관리 개체 컨텍스트를 환경에 배치해야 한다고 가정한다.
 



----

- [원문 링크](https://www.hackingwithswift.com/quick-start/swiftui/understanding-property-wrappers-in-swift-and-swiftui)

----
