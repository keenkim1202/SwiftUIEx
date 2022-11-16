# SwiftUIEx
SwiftUI 를 사용한 UI 그리기 연습 레포

## Ref
- [SwiftUI by Example](https://www.hackingwithswift.com/quick-start/swiftui)

### Translate
- [What is SwiftUI?](Docs/what_is_swiftui.md)
- [SwiftUI vs Interface Builder and storyboards](Docs/SwiftUI_vs_Interface_Builder_and_storyboards.md)
- [Property Wrapper](Docs/property_wrapper.md)
- [understanding property wrappers in swift and swiftUI](Docs/understanding_property_wrappers_in_swift_and_swiftUI.md)

## Note
- [GeometryReader](Note/GeometryReader.md)

## Project
- [CustomSlider](https://github.com/keenkim1202/SwiftUIEx/tree/main/Projects/CustomSlider)
    - practice how to make custom slider
- ListEX
    - practice how to show list of data (similar with tableView in UIKit)
- [SwiftUIEx](https://github.com/keenkim1202/SwiftUIEx/tree/main/Projects/SwiftUIEx)
    - just my testing project. (It will be messy..)
- [ToastEx](https://github.com/keenkim1202/SwiftUIEx/tree/main/Projects/ToastEx)
    - practice how to make custom toast
- [WebviewEx](https://github.com/keenkim1202/SwiftUIEx/tree/main/Projects/WebviewEx)
    - practice how to use webview
    

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

- Sttack은 ViewBuilder에 하위뷰를 넣어두기만 하면 세세한 제약조건 설정없이도 적절한 배치를 알아서 해준다.
    - 상위뷰(parentView)가 하위뷰(childView) 의 위치와 크기를 제안해주기 때문에 가능
    - childView에 별다른 설정을 해주지 않는다면 parentView가 제안한 위치로 설정한다.
```
parentView는 제안을 할 뿐, 실제 크기/위치에 대한 결정권은 childView가 가지고 있다.
parentView가 제안해준 위치를 활용할 수도 있는데 이때 사용하는 것이 geometryReader이다.
```

- 'parentView가 제안한 위치'가 마음에 들지 않을 때(디테일한 조정을 해주고 싶을 때)는 parentView의 제안을 무시하고 직접 자신의 위치, 모양을 선언할 수 있다.

## GeometryReader
> A container view that defines its content as a function of its own size and coordinate space.

- geometryReader는 그 자체가 View 이다.
- container 안의 view 스스로의 크기와 위치를 함수로 정의한다.

### 쓰임
- Stack들을 적절히 이용하면 웬만하게 원하는 뷰는 그릴 수 있다.
- 부모뷰에 대하여 상대적으로 자식뷰들의 위치나 크기를 정할 때 사용한다.

### Ex
```swift
        VStack {
            // 부모뷰에 대하여 4 : 3 : 2 의 너비 비율을 갖도록 구성하고 싶을 때
            GeometryReader { geometry in
                let width = geometry.size.width
                
                HStack(spacing: 0) {
                    Spacer()
                    Text("menu A")
                        .multilineTextAlignment(.leading)
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .frame(width: width * 0.4)
                        .background(.yellow)
                    Spacer()
                    Text("menu B")
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .frame(width: width * 0.3)
                        .background(.orange)
                    Spacer()
                    Text("menu C")
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .frame(width: width * 0.2)
                        .background(.green)
                    Spacer()
                }
            }
            .background(.gray)
            .frame(maxHeight: 18)
```

## 이미지 비율 설정 (ratio)
```swift
            Image(systemName: "arrowtriangle.up.fill")
                .resizable()
                .aspectRatio(3/2, contentMode: .fit)
                .foregroundColor(.green)
            .frame(width: 30)
```

## HStack 안의 VStack 2개
<img width="300" src="https://user-images.githubusercontent.com/59866819/191177529-f9e99b83-cb8c-4b6b-acb6-844415c83fbf.png">

```swift
        HStack {
            VStack(alignment: .leading) {
                Text("elem A")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.black)
                    .background(.yellow)
                Text("elem B")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.black)
                    .background(.orange)
            }
            
            Spacer()
            
            VStack {
                HorizontalLabelView(label: "elem1", content: "test1")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.blue)
                HorizontalLabelView(label: "elem22", content: "test22")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.blue)
                HorizontalLabelView(label: "elem333", content: "test3333")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.blue)
            }
            .background(.white)
            .fixedSize(horizontal: true, vertical: false)
        }
        .frame(height: 60)
        .background(.cyan)
```

## 특정 높이의 뷰 안에 stack을 원하는 비율로 넣기
<img width="300" src="https://user-images.githubusercontent.com/59866819/191203716-89114f0b-4d7a-4530-84a6-5dcc200ba7ff.png">

```swift
        VStack(spacing: 10) {
            GeometryReader { geo in
                let width = geo.size.width
                
                HStack {
                    TextView(text: "view 1 view 1 view 1 view 1", color: .blue)
                        .frame(width: width * 0.3)
                    Spacer()
                    TextView(text: "view 2 view 2 view 2 view 2", color: .green)
                        .frame(width: width * 0.6)
                }
            }
            .frame(height: 300)
            .background(.yellow)
            
            TextView(text: "view 3", color: .orange)
        }
        .background(.gray)
```
