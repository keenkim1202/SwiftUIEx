# TIP's
> 간단한 코드의 자주쓰이는 내용 정리


## ScrollView
- 스크롤뷰의 indicator 제거
```swift
ScrollView(showsIndicators: false) {
    // ...
}
```

## FixedSize
- instrinsic size가 아닌 화면의 safe area 혹은 상위 뷰(superview)에 딱 맞게 크기를 설정해주고 싶을 때 사용
```swift
.fixedSize(horizontal: false, vertical: true) // 동일한 높이 만들기
.fixedSize(horizontal: true, vertical: false) // 동일한 너비 만들기
```
- SwiftUI 에서는 component의 길이에 맞게 사이즈가 자동으로 조절된다.
- frame()과 fixedSize() 를 함께 사용하여 동일한 높이/너비를 가진 뷰를 구성할 수 있다.
    - GeometryReader를 사용하지 않아도 됨!

ex)
```swift
// 동일한 높이로 구성하기
HStack {
    Text("가나다라마바사아자차카타파하")
    Text("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
}
.fixedSize(horizontal: false, vertical: true)
.frame(maxHeight: 300)
```

```swift
// 동일한 너비로 구성하기
VStack {
    Text("가나다라마바사아자차카타파하")
    Text("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
}
.fixedSize(horizontal: true, vertical: false)
.frame(maxwidth: 300)
```

## Divider
- Divider()에 색깔을 입힐 때는 .overlay() 를 사용하자.
```swift
// 색깔 바꾸기
 Divider()
    .overlay(Color.red)
        
// 두께 바꾸기
Divider()
    .frame(height: 2)
```
- foregroundColor()를 사용하지 않는 이유는 
    - 그걸 사용하면 Divider의 두께를 증가시켰을 때 아래의 그림처럼 중간에 회색실선이 남기 때문이다.
<img width="530" alt="divider" src="https://user-images.githubusercontent.com/59866819/209164051-9f3115ad-69c0-48a1-9617-14eeb81c1f31.png">


## Image ratio
- 이미지 크기를 비율로 설정해주고 싶을 때
```swift
Image("someImageName", bundle: .module)
    .resizable()
    .aspectRatio(1.5, contentMode: .fit)
    .cornerRadius(8)
```
