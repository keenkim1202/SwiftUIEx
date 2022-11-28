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
.fixedSize(horizontal: false, vertical: true) // 높이를 동일한 크기로
.fixedSize(horizontal: true, vertical: false) // 너비를 동일한 크기로
```
- SwiftUI 에서는 component의 길이에 맞게 사이즈가 자동으로 조절된다.
- frame()과 fixedSize() 를 함께 사용하여 동일한 높이/너비를 가진 뷰를 구성할 수 있다.
    - GeometryReader를 사용하지 않아도 됨!
