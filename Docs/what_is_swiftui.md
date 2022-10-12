# What is SwiftUI?

> SwiftUI 는 무엇인가  
> (Xcode14.0 beta 1 기준)

SwiftUI는 선언적으로 앱을 디자인하게 해주는 user interface toolkit 이다.  
이것은 멋진말이다.  
우리는 SwiftUI에게 user interface가 어떻게 보이고 동작하길 원하는지 말한다. 그리고 SwiftUI는 user interact 로써 어떻게 그것을 발생하게 할지 알아낸다.  

</br>

선언적 UI는 iOS 개발자들이 iOS13 이전까지 해왔던 명령형 UI와 비교를 해보면 이해하기 쉽다.  
명령형 user interface에서 우리는 버튼을 눌렀을 때 불리도록 함수를 만들어야 했고, 함수 안에 값을 읽고 label을 보여준다. 
```
우리는 보통 user interface의 생김새를 수정하고 무엇이 일어나는가를 바탕으로 작동하도록 한다.
```

</br>

명령형 UI는 상태(state)와 연관된 대부분의 문제를 야기한다.   
이것을 또 다른 있어보니는 용어로 "values we store in our code.(우리가 코드 속에 저장한 값들)" 을 의미한다.  
우리는 우리의 코드 안에서 어떤 상태(state) 인지 추적할 필요가 있고, user interface가 그 상태를 올바르게 반영하고 있는지 확인해야 한다.

</br>

만약 UI에 영향을 미치는 boolean 프로퍼티 하나를 하나의 화면에 가지고 있다면, 우리는 2개의 상태를 가진다.   
boolean값이 on 이거나 off 이거나.  
우리가 A,B라는 boolean값을 2개 가지고 있다면 4개의 상태를 가지게 된다 :  
- A: off, B: off  
- A: on, B: off 
- A: off, B: on
- A: on, B: on

</br>

만약 우리가 3개의 boolean 값을 가지게 된다면? 혹은 5개를 가지게 된다면? 혹은 int, string, date 등의 타입을 더 가지고 있다면?  
더 복잡해질 것이다.  

</br>

만약 당신이 몇번을 확인해도 1개의 읽지 않은 매세지를 당신이 가지고 있다고 말하는 앱을 한번이라도 사용해본적이 있다면, 그것은 상태(state) 문제이다 
```
그것은 명령형 UI의 문제 하다.  
```

</br>

반대로, 선언형 UI는 한번에 iOS에게 우리 앱이 가질 수 있는 모든 상태에 대해 말한다.  
우리가 만약 로그인했을 때 환영 매세지를 보여주고자 한다고 하자.  
하지만 만약 로그아웃을 하면 로그인 버튼을 보여줄 것이다.   
우리는 손수 두 상태 사이를 왔다갔다할 코드를 작성할 필요가 없다. 
```
그것 못난 명령형으로 작동하는 것이다!  
```

</br>

대신 우리는 SwiftUI 에게 상태가 바뀌었을 때 우리를 위해 user interface 사이를 움직이도록 한다.  
우리는 이미 사용자가 로그인, 로그아웃했을 때 무엇을 보여줘야 할지 말해주었다.  
그래서 우리가 인증 상태를 변경하면 SwiftUI는 우리를 대신해 UI를 업데이트할 수 있다.  

</br>

이것이 선언적인 것의 의미이다 : 우리는 SwiftUI 요소들을 손수 보여주고 숨기고 하지 않는다.  
우리는 그저 그것에게 모든 규칙들을 말해줄 뿐이다.  
우리는 그것이 SwiftUI를 따르길 원하고 SwiftUI가 이 규칙들을 강행하도록 한다.

</br>

하지만 SwiftUI는 여기서 멈추지 않는다.
```
그것은 또한 iOS, macOS, tvOS, watchOS를 넘나들며 cross-paltform user interface layer 처럼 행동한다.   
```
이것은 당신이 하나의 언어, 하나의 레이아웃 프레임워크를 배우면, 당신의 코드를 어디에든 배포할 수 있다.

----

[원문보기](https://www.hackingwithswift.com/quick-start/swiftui/what-is-swiftui)

----
