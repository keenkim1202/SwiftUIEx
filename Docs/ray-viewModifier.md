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

