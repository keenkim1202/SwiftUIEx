# SwiftUIEx
SwiftUI 를 사용한 UI 그리기 연습 레포

## Memo

- 우선 내가 현재 필요로 하는 메서드, 프러퍼티 위주로 훑는 것을 목표로 한다. 

### SwiftUI에서의 CustomView
- 두 가지 구조체를 선언
    - 1) `View` 프로토콜을 준수하며 뷰의 컨텐츠나 레이아웃을 묘사
    - 2) 1에서 작성한 해당 뷰에 대한 `Preview`를 선언
 - 오른쪽 canvas의 요소를 누르면 나오는 `SwiftUI Inspector`를 통해 속성을 변경해줄 수 있음.
 - 변경 사항은 바로바로 코드에 반영됨.

 - `View`를 커스텀하려면 `modifiers` 메서드를 호출해야 함.
    - 뷰를 랩핑하여 디스플레이나 다른 속성들을 바꿔줌
 
 - 각 `modifiers`는 새로운 View를 반환 -> 여러 `modifier`를 수직으로 쌓듣이 연결하는 것이 일반적임.
```
ex. 
.font(.body)
.fontWeight(.medium) 

...
```

### 스택의 종류는 3가지
 - `HStack` : Horizontal StackView 랑 비슷
 - `VStack` : Vertical StackView 랑 비슷
 - `ZStack` : addSubview 하듯 제일 상위 뷰에 스택을 쌓는 느낌
 (preview에서도 추가 가능)
