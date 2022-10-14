# All SwiftUI property wrappers explained and compared

SwiftUI는 앱을 위한 17개의 property wrapper를 제공한다. 각각은 다른 기능을 제공한다.  
언제 무엇을 사용할 지를 아는 것은 올바르게 동작하게 하는데에 중요하다.  
그래서 이 글을 통해 각각을 소개하고, 명확한 사용 가이드를 줄 것이다.  

## TL;DR
> "too long; didn't read"

자세하게 설명하기 전에 각각의 wrapper가 데이터를 소유하는지 여부(데이터가 그것에 속해있는 것인지, 그것에 의해 관리되는 것인지)와 관계없이 대략적인 역할을 설명하고자 한다.

- `@AppStorage`
  - UserDefaults 로부터 값을 읽고 쓴다. 
  - 자신의 데이터를 소유(자신의 데이터를 직접 소유하고 있는가): O
- `@Binding`
  - 다른 뷰가 소유한 값타입 데이터를 나타낸다. binding을 지역적으로(locally) 변경하면 remote 데이터도 변경된다. 
  - 자신의 데이터 소유: X
- `@Environment`
  - 시스템으로부터 데이터를 읽을 수 있도록 한다.
  - ex) color scheme, 옵션 접근가능성, collection 다루기
  - 나만의 커스텀 key를 추가하여 사용할 수 있다.
  - 자신의 데이터 소유: X
- `@EnvironmentObject`
  - environment 안에 넣은 공유 객체를 읽을 수 있다.
  - 자신의 데이터 소유: X
- `@FetchRequest`
  - 특정 entity를 위해 CoreData의 fetch 요청을 시작한다.
  - 자신의 데이터 소유: O
- `@FocusedBinding`
  - key window 안에 있는 값들을 감시하도록 설계되어 있다.
  - ex) 현재 선택된 textField가 무엇인지
  - 자신의 데이터 소유: X
- `@FocusedValue`
  - @FocusedBinding의 간단한 버전이다.
  - binding된 값을 unwrap하지 않는다.
  - 자신의 데이터 소유: X
- `@GestureState`
  - 현재 진행주인 gesture와 관련된 값을 저장한다.
  - ex) 얼마나 멀리까지 swipe 하였는지, gesture가 멈추었을 떄 기본값으로 reset되기를 기대되어 지는지
  - 자신의 데이터 소유: O
- `@Namespace`
  - 일치하는 geometry effect를 허용하는 namespace를 만들도록 허용한다.
  - 다른뷰에서 공유가 가능하다.
  - 자신의 데이터 소유: O
- `@NSApplicationDelegateAdaptor`
  - macOS 앱을 위한 app delegate로써 class를 생성하고 등록하는데 사용되곤 한다.
  - 자신의 데이터 소유: O
- `@ObservedObject`
  - ObservableObject 프로토콜을 준수하는 외부 클래스의 인스턴스를 나타낸다.
  - 자신의 데이터 소유: X
- `@Published`
  - ObservableObject 안에 있는 프로퍼티에 첨부(attach) 되어있다.
  - 그것은 이 프로퍼티가 변화할 때, 이 프로퍼티를 사용하고 있는 어떤 뷰들을 갱신해야 함을 SwiftUI에게 알린다.
- `@ScaledMetric`
  - 사용자의 Dynamic Type Setting을 읽고 사용자가 제공한 original값을 기준으로 숫자를 확대/축소한다.
  - 자신의 데이터 소유: O
- `@SceneStorage`
  - 상태를 저장하기 위한 작은 양의 데이터를 저장(save), 복원(restore)할 수 있게 해준다.
  - 자신의 데이터 소유: O
- `@State`
  - 뷰에 작은 양의 값타입 데이터를 지역적으로(locally) 조작할 수 있게 한다.
  - 자신의 데이터 소유: O
- `@StateObject`
  - ObervableObject 프로토콜을 준수하는 참조타입의 데이터의 새로운 인스턴스를 저장하는데 사용된다.
  - 자신의 데이터 소유: O
- `@UIApplicationDelegateAdaptor`
  - iOS 앱을 위한 app delegate 로써 class를 생성하고 등록하는데 사용된다.
  - 자신의 데이터 소유: O



----

[원문 링크](https://www.hackingwithswift.com/quick-start/swiftui/all-swiftui-property-wrappers-explained-and-compared)

----
