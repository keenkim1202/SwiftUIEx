# SwiftUI View Modifiers Tutorial for iOS

----

[ref](https://www.kodeco.com/34699757-swiftui-view-modifiers-tutorial-for-ios)

----

SwiftUI 에서 modifier를 사용하여 당신의 view들을 스타일할 수 있다.
당신은 `built-in modifier`(기본으로 제공하는 modifier)를 사용할 수 있다, 하지만 당신만의 `SwiftUI view modifier`를 만들 수도 있다.
당신은 아마 몇몇 built-in modifier들과 이미 친숙할 것이다.
- `font()` : Text 뷰의 글씨체 속성을 설정하는 modifier
- `frame()` : 뷰의 크기를 설정하는 modifier
- `padding()` : 뷰의 모서리 주변에 여백을 추가하는 modifier

만약 자신만의 SwiftUI view modifier를 생성하고 싶다면, 두 가지 방법이 있다.
당신은 View`Modifier` 프로토콜을 준수하여 `custom modifier`를 생성하거나, `View`를 확장(extend) 할 수 있다.
첫번째 방법은 하나의 장점이 있다. - 당신이 `custom stored properties`를 정의할 수 있다는 점이다.

이 튜토리얼에서, 당신은 'AdoptAPet' 이라는 앱을 사용할 것이다. 간단한 master-detail view 앱이다.
입양가능한 털복숭이 친구들의 사진과 이름이 있는 리스트를 보여주고, 사용자가 리스트의 row를 탭했을 때 상세 뷰를 보여준다.

아래와 같은 방법으로 refatoring하면서 ViewModifier 프로토콜을 사용하는 법을 배울 것이다:
- `custom view modfiier` 생성
- 새로운 `button style` 만들기
- `conditional parameter`들로 modifier 만들기
- 재사용 가능한 components를 생성하여 view들을 확장

## Getting Started
AdpotAPet은 입양 가능한 동물들의 리스트를 보여주고 선택한 강아지 혹은 고양이의 자세한 정보를 보여주는 앱이다.

앱안의 View들은 많은 styling modifier를 가지고 있고, 몇몇은 여러번 반복적으로 사용되었다.
이것은 코드를 읽고 유지보수하기 힘들게 만든다.

SwiftUI view modifier를 생성하여 뷰를 만듦으로써 코드는 읽기 쉬워질 것이다.
하지만 그 전에, 일반적인 SwiftUI view modifier에 대해 배워보자.

## View Modifiers in SwiftUI
View modifier들은 당신의 뷰의 생김새(appearance)와 행위(behavior)를 커스텀하기 위해 부르는 메서드들이다.
View와 modifier는 UI를 정의할 때 함께 움직인다.

당신은 view modifier를 아래와 같이 사용할 수 있다:
- 접근성 기능을 추가하기
- `color`, `font`와 같은 스타일링을 추가하여 디자인을 커스텀하기
- `action`과 `event`에 대한 반응 추가하기
- `toolbar`, `navigation bar`와 같은 다른 components들 설정하기
- `sheets`, `alerts`와 다른 뷰 보여주기

당신은 `View`를 준수하는 어떤 타입도 수정(modify)이 가능하다.
이것은 다수의 modifier를 연결하여 연쇄적으로 사용하여 하나 이후 바로 다음 것이 즉각적으로 이루어지도록 할 수 있다.

SwiftUI는 `predefined standard modifiers`(미리 정의한 modifier)들의 모임으로 당신의 UI를 디자인할 때 사용할 수 있다.
예를 들어, `Text`에 색깔을 추가하고자 할 떄 당신은 `.foregroundColor()` modifier를 통해 적용할 수 있다.

당신은 또한 ViewModifier 프로토콜을 사용하여 당신만의 custom mdoifier를 생성할 수 있다.
custom view modifier를 생성하는데 사용되는 가장 흔한 방법은 당신의 코드에서 여러번 재사용되는 녀석을 modifier들의 모임으로 bundling해서 사용하는 것이다.

현재 앺에서 사용되는 button style을 생성할 때를 생각해보자.
당신은 여러 곳에서 같은 코드를 반복적으로 사용하고 있다.

하나의 component를 위해 당신만의 modifier를 만들어보라.
당신이 이 component를 생성하여 사용함으로써 DRY 원칙을 지켜라. (= Don't Repeat Youtself)

이것은 코드 수정을 더 쉽게 만들고 신뢰가능한 하나의 소스를 준다.
작은 변화는 큰 차이를 만든다. 상상해봐라. 다음번에 디자이너들이 패딩값을 20에서 18로 줄이겠다고 결정한다면 어떻게 될까.
댕신은 반복적으로 수정하는 작업을 할 필요가 없어진다.
한번에 쉽게 바로 업데이트가 가능해진다.

당신만의 view modifier들을 만듦으로써 이 시간을 아끼는 마법이 일어나는 법을 배울 수 있다.



