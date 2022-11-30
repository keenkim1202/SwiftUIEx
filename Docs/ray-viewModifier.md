# SwiftUI View Modifiers Tutorial for iOS

----

[ref](https://www.kodeco.com/34699757-swiftui-view-modifiers-tutorial-for-ios)

----

</br>

SwiftUI 에서 modifier를 사용하여 당신의 view들을 스타일할 수 있다.  
당신은 `built-in modifier`(기본으로 제공하는 modifier)를 사용할 수 있다, 하지만 당신만의 `SwiftUI view modifier`를 만들 수도 있다.  
당신은 아마 몇몇 built-in modifier들과 이미 친숙할 것이다.
- `font()` : Text 뷰의 글씨체 속성을 설정하는 modifier
- `frame()` : 뷰의 크기를 설정하는 modifier
- `padding()` : 뷰의 모서리 주변에 여백을 추가하는 modifier

</br>

만약 자신만의 SwiftUI view modifier를 생성하고 싶다면, 두 가지 방법이 있다.  
당신은 View`Modifier` 프로토콜을 준수하여 `custom modifier`를 생성하거나, `View`를 확장(extend) 할 수 있다.  
첫번째 방법은 하나의 장점이 있다. - 당신이 `custom stored properties`를 정의할 수 있다는 점이다.  

</br>

이 튜토리얼에서, 당신은 'AdoptAPet' 이라는 앱을 사용할 것이다. 간단한 master-detail view 앱이다.  
입양가능한 털복숭이 친구들의 사진과 이름이 있는 리스트를 보여주고, 사용자가 리스트의 row를 탭했을 때 상세 뷰를 보여준다.

</br>

아래와 같은 방법으로 refatoring하면서 ViewModifier 프로토콜을 사용하는 법을 배울 것이다:  
- `custom view modfiier` 생성
- 새로운 `button style` 만들기
- `conditional parameter`들로 modifier 만들기
- 재사용 가능한 components를 생성하여 view들을 확장

</br>

## Getting Started
AdpotAPet은 입양 가능한 동물들의 리스트를 보여주고 선택한 강아지 혹은 고양이의 자세한 정보를 보여주는 앱이다.

</br>

앱안의 View들은 많은 styling modifier를 가지고 있고, 몇몇은 여러번 반복적으로 사용되었다.  
이것은 코드를 읽고 유지보수하기 힘들게 만든다.  

</br>

SwiftUI view modifier를 생성하여 뷰를 만듦으로써 코드는 읽기 쉬워질 것이다.  
하지만 그 전에, 일반적인 SwiftUI view modifier에 대해 배워보자.  

</br>

## View Modifiers in SwiftUI
View modifier들은 당신의 뷰의 생김새(appearance)와 행위(behavior)를 커스텀하기 위해 부르는 메서드들이다.  
View와 modifier는 UI를 정의할 때 함께 움직인다.  

</br>

당신은 view modifier를 아래와 같이 사용할 수 있다:
- 접근성 기능을 추가하기
- `color`, `font`와 같은 스타일링을 추가하여 디자인을 커스텀하기
- `action`과 `event`에 대한 반응 추가하기
- `toolbar`, `navigation bar`와 같은 다른 components들 설정하기
- `sheets`, `alerts`와 다른 뷰 보여주기

</br>

당신은 `View`를 준수하는 어떤 타입도 수정(modify)이 가능하다.  
이것은 다수의 modifier를 연결하여 연쇄적으로 사용하여 하나 이후 바로 다음 것이 즉각적으로 이루어지도록 할 수 있다.

</br>

SwiftUI는 `predefined standard modifiers`(미리 정의한 modifier)들의 모임으로 당신의 UI를 디자인할 때 사용할 수 있다.  
예를 들어, `Text`에 색깔을 추가하고자 할 떄 당신은 `.foregroundColor()` modifier를 통해 적용할 수 있다.

</br>

당신은 또한 ViewModifier 프로토콜을 사용하여 당신만의 custom mdoifier를 생성할 수 있다.  
custom view modifier를 생성하는데 사용되는 가장 흔한 방법은 당신의 코드에서 여러번 재사용되는 녀석을 modifier들의 모임으로 bundling해서 사용하는 것이다.

</br>

현재 앺에서 사용되는 button style을 생성할 때를 생각해보자.  
당신은 여러 곳에서 같은 코드를 반복적으로 사용하고 있다.

</br>

하나의 component를 위해 당신만의 modifier를 만들어보라.  
당신이 이 component를 생성하여 사용함으로써 DRY 원칙을 지켜라. (= Don't Repeat Youtself)

</br>

이것은 코드 수정을 더 쉽게 만들고 신뢰가능한 하나의 소스를 준다.  
작은 변화는 큰 차이를 만든다. 상상해봐라. 다음번에 디자이너들이 패딩값을 20에서 18로 줄이겠다고 결정한다면 어떻게 될까.  
댕신은 반복적으로 수정하는 작업을 할 필요가 없어진다.  
한번에 쉽게 바로 업데이트가 가능해진다.

</br>

당신만의 view modifier들을 만듦으로써 이 시간을 아끼는 마법이 일어나는 법을 배울 수 있다.

</br>

## Building a Title ViewModifier
당신은 코드를 작성할 때 최적화에 대한 생각을 하지 않는다. 우선 작동하게 만든다 그런 후 리팩토링을 한다.

</br>

UI component들을 스타일링할 때, 다른 파일에서 반복적으로 사용하는 modifier들의 코드 라인 수를 살펴보아라.  
Xcode를 열고 프로젝트의 `PetDetailedInformationView.swift` 파일을 보아라.  
`VStack` 안에 있는 각각의 `Text` 뷰들의 상단을 보아라:
```swift
.lineLimit(1)
.font(.title2)
.bold()
``` 
stack안에 있는 각각의 title은 동일한 스타일링이 반복적인 modifier들의 묶음을 사용하고 있다.  
이 반복을 피할 수 있는 다른 접근 방법을 선택할 수도 있다.

</br>

모든 `Text`와 `HStack` 짝은 동일하다.  
다른 부분은 title에 들어가는 글자와 `SFSymbol` 아이콘 그리고 그에 따른 상세 프로퍼티 이다.

</br>

`Text`와 `HStack`을 분리된 뷰로 추출하여 그들에게 위의 값들을 제공할 수 있다.  
하지만, 당신은 여전이 5개의 다른 파라미터들을 불러야 한다.

</br>

대신, 당신은 view modifier를 생성할 수 있다!

</br>

## Creating a Text ViewModifier
프로젝트의 ViewModifiers.swift 라는 파일을 보라.  
당신은 당신의 모든 modifier들을 이 파일 안에 작성하여 편리하게 한 곳에 보관할 수 있다.

</br>

모든 custom modifier를 하나의 파일에 보관하는 것은 유지보수가 편하게 한다.  
`application-wide style guide`를 만든다고 생각해바라.  
어느 누구도 이 view modifier 파일을 참조하여 그들이 원하는 UI compoenent가 있으면, app style과 맞게 생성하고, 과거에는 어떻게 생겼었는지 확인할 수 있다.

</br>

ViewModifiers.swift 파일에 다음과 같은 코드를 추가해보자.  
```swift
// 1
struct DetailedInfoTitleModifier: ViewModifier {
  // 2
  func body(content: Content) -> some View {
    content
      // 3
      .lineLimit(1)
      .font(.title2)
      .bold()
  }
}
```

</br>

다음과 같은 일이 일어난다:  
- 1) `ViewModifier` 프로토콜을 준수하는 `DetailedInfoTitleModifier` 라는 구조체를 생성한다.
    - 특히 당신이 추가적인 modifier를 생성할 때, 이런 서술적인 이름을 제공하는 것은 좋은 아이디어이다.
- 2) `ViewModifier`를 준수하기 위해, 당신은 `some View`를 리턴하는 `body(content:)` 메서드를 추가해야 한다.
    - `content` 파라미터는 당신의 modifier를 적용하는 `view` 이다.
- 3) 마무리로, 당신은 모든 당신의 modifier들을 추가한다.

이제, 다시 `PetDetailedInformationView.swift` 파일로 돌아가서   
`Text("Breed")` 밑의 3개의 modifier를 아래의 코드로 대체해보자.
```swift
.modifier(DetailedInfoTitleModifier())
```

</br>

앱을 빌드하고 실행해보라. 펫을 선택하면 아무것도 바뀐게 없음을 볼 수 있을 것이다. (= 이전과 같이 잘 작동한다는 것)

</br>

이것은 정확히 당신이 원하던 결과다. 모든 것이 의도된대로 정확히 보이고 있다.  
당신은 스타일링을 바꾸지 않았다. 그저 다른 파일에 modifier를 옮겼을 뿐.

</br>

이제, 같은 moditier를 아래의 나머지 title들에도 적용해보자.
- `Text("Characteristics")`
- `Text("Size")`
- `Text("Sex")`
- `Text("Age")`

</br>

이제 당신은 매번 당신의 modifier를 적용시키기 위해 `.modifier(DetailedInfoTitleModifier())`를 불러야한는 것을 알아챘을 것이다.  
그것은 불필요하다.

</br>

이것을 피하기 위해 당신은 `Text`를 확장하여 좀 더 편리하게 당신의 modifier에 접근할 수 있도록 만들 것이다.

</br>

## Extending the Text View
`ViewModifiers.swift` 파일을 열고 아래의 코드를 작성해보자.
```swift
extension Text {
  func detailedInfoTitle() -> some View {
    modifier(DetailedInfoTitleModifier())
  }
}
```

당신은 `Text`를 확장하여 `some View`를 리턴하는 `detailedInfoTitle()` 이라는 메서드를 만들었다.  
당신은 이제 이전 스탭에서 만든 modifier를 부르기 위해 한줄의 코드를 추가하면 된다.

</br>

메서드의 이름은 당신의 custom modifier의 이름이다.  
이제 당신은 `.modifier()`를 매번 불러 적용시킲 필요 없다.

</br>

`PetDetailedInformationView.swift` 파일을 열고 모든 5개의 title에 대해 `.modifier(DetailedInfoTitleModifier())`를 아래의 코드로 대체하자.
```swift
.detailedInfoTitle()
```

</br>

빌드하고 실행해보아라. 당신의 UI는 여전히 시각적으로 바뀐 것이 없을 것이다.  
당신은 당신의 첫 view modifier를 만들었다.

</br>

당신은 나에게 다음의 질문을 할것이다.
```
"왜 굳이 나의 코드를 다른 파일로 옮기게 만들었는가?"
```

</br>

당신 앞에 있는 코드는 간단한 UI를 가진 간단한 앱이다.   
당신이 modifier를 생성하고 몇개의 코드줄들을 다른 분리된 파일로 옮길 때, 당신의 뷰는 더 작아졌고 가독성이 올라갔다.  
이것은 큰 프로젝트에서는 수천개의 코드줄에 해당하는 눈에 띌 정도의 효과를 가져온다.

</br>

하지만 당신은 아직 다 한게 아니다!

</br>

다음으로, 당신은 `isPressed` 프로퍼티에 의존하여 변화하는 커스텀 스타일링을 하는 button modifier를 만드는 법을 배울 것이다.

## Building a Button Style
custom view modifier를 만드는 가장 흔한 방법은 여러 곳에서 반복적으로 사용되는 같은 코드를 재사용하는 것이다.  

</br>

`AdoptionFormView.swift`를 열아보자.  
당신은 `Text("Adopt Me")` 버튼이 보일 것이고 button의 label에 대한 스타일링 modifier들의 묶음을 볼 수 있을 것이다.
```swift
Text("Adopt Me")
    .font(.title2)
    .padding(.horizontal, 30)
    .padding(.vertical, 8)
    .foregroundColor(.pink)
    .overlay {
        RoundedRectangle(cornerRadius: 8)
            .stroke(.pink, lineWidth: 1.5)                                
    }
```

이제 위의 코드들에 대한 modifier를 만들어볼 것이다.

</br>

## Creating a Button ViewModifier
`ViewModifiers.swift` 파일을 열고 아래의 코드를 작성해보자.
```swift
struct ButtonLabelModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.title2)
      .padding(.horizontal, 30)
      .padding(.vertical, 8)
      .foregroundColor(Color.pink)
      .overlay(
        RoundedRectangle(corㅠnerRadius: 8)
          .stroke(Color.pink, lineWidth: 1.5)
      )
  }
}

func buttonLabel() -> some View {
  modifier(ButtonLabelModifier())
}
```

</br>

그리고 `AdoptionFormView.swift` 파일을 열고 `Text("Adopt Me")`밑에 아래의 modifier로 대체하자.
```swift
.buttonLabel()
```

빌드하고 실행해보면 이전과 같이 똑같은 UI로 잘 작동할 것이다.  

</br>

이 modifier가 잘 작동하는 동안 몇몇의 경우 당신은 버튼의 label뿐 아니라 모든 버튼에 대해 이 스타일링을 적용하고 싶을 수 있다.

</br>

다음으로 당신이 리팩토링해볼 내용이다.  
button의 label modifier를 수정하고 custom button style을 만들 것이다.
이것은 또한 button의 `isPressed` 프로퍼티에 의존하여 커스텀 스타일링을 적용할 수 있도록 해준다.

</br> 

## Refactoring ViewModifier Into a ButtonStyle
`ViewModifiers.swift` 파일을 열고 아래의 코드를 작성해보자.
```swift
// 1
struct PrimaryButtonStyle: ButtonStyle {
  // 2
  func makeBody(configuration: Configuration) -> some View {
    // 3
    configuration.label
      .font(.title2)
      .padding(.horizontal, 30)
      .padding(.vertical, 8)
      .foregroundColor(Color.pink)
      .overlay(
        RoundedRectangle(cornerRadius: 8)
          .stroke(Color.pink, lineWidth: 1.5)
      )
  }
}
```

설명을 해보면 다음과 같다:
- 1) `ButtonStyle`을 준수하는 `PrimaryButtonStyle` 구조체를 생성한다.
    - ButtonStyle 타입은 뷰 계층구조에서 모든 버튼들의 표준 생김새와 행동을 제공한다.
- 2) 그런 후, `some View`를 리턴하는 `makeBody(configuration:)` 메서드를 추가한다.
    - `configuration` 파라미터는 `Configuration` 타입이다.
    - 이것은 `ButtonStyleConfiguration` 구조체의 SwiftUI에서 사용하는 `typealias` 이다.
    - button style을 커스텀하는데 사용되는 몇몇 프로퍼티를 가지고 있다.
- 3) 몇몇 프로퍼티 중 하나는 버튼의 label 이다.
    - `configuration.label`을 호출함으로써 당신이 원하는 button의 label 스타일에 대한 modifier를 명시해줄 수 있다.

</br>

이제 이 버튼 스타일을 당신이 필요한 곳에 적용해보자.
당신이 마지막 modifier를 생성했을 때, 당신이 적용했던 그 버튼 label에 말이다.
이제 button style modifier를 생성하고, 버튼에 직접적으로 적용해보자.

</br>

`AdoptionFormView.swift` 파일을 열고 label에 대한 modifier를 제거하라.
그런 후 새로운 modifier를 `alert(_:isPresented:actions:)`의 후행 클로저(trailing closure)에 추가하라:
```swift
.buttonStyle(PrimaryButtonStyle())
```  

</br>

빌드하고 실행해봐라. 마찬가지로 이전과 똑같은 UI를 보여줄 것이다.

</br>

버튼의 label 스타일링을 추가하는것과 별개로, `ButtonStyleConfiguration`의 또다른 프로퍼티를 사용하는 방법을 다음에 배울 것이다.


