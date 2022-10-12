# SwiftUI vs Interface Builder and storyboards

> iOS 개발자라면 누구나 `interface builder`와 `storyboard`가 친숙할 것이다. 아마 `XIB`와도 그럴 것이다.  
> 이들을 좋아하지 않을 순 있지만, 적어도 친숙할 것이다.  
> 만약 이것들은 이전에 사용해보지 않았다면 이 글을 그저 넘겨도 좋다.  

</br>

### 아직 여기에 있는가?  
그것은 너가 IB를 전에사용해보았고 SwiftUI는 무엇이 다른가 궁금해할지도 모른다는 이야기이다.  
당신에게 이런 질문을 해보겠다. 
```
" storyboard와 XIB를 직접 수정해본적이 있는가?? "
```

아마 아닐 것이다. 어쩌다 한번쯤은 그래봤을 순 있지만 대부분의 대답은 "No" 일 것이다 
- `storyboard`나 `XIB`는 읽고 수정하기 어려운 엄청난 양의 XML 파일을 포함하고 있다.  

</br>

### 더 최악인 것은 storyboard는 시간이 갈수록 점점 커지는 습관을 가지고 있다.  
물론 처음에는 그들도 작은 규모일 것이다.  
하지만 당신이 다른 화면의 viewcontroller를 추가하고, 또 추가하고 하다면   
갑자기 당신은 하나의 파일안에 10개의 화면에 대한 데이터를 가지고 있다는 사실을 깨닫게 될 것이다.  
그리고 어느 source control의 변화는 당신에게 갑작스러운 고통을 만들 것이다.  
하지만 하나의 실수는 좋지 않고, 어떤 사람의 storyboard 수정이 담긴 PR을 열었을 때 무엇이 바뀌었는지 알아보기는 거의 불가능하다는 점도 있지만,  
storyboard와 XIB는 더 큰 문제를 가지고 있다.

</br>

보다시피, interface builder는 swift코드에 대해 많이 알지 못한다.  
그리고 우리의 swift코드도 마찬가지로 interface builder에 대해 많이 알지 못한다.  
그 결과로 우리는 끝내 안전하지 못한 많은 기능을 갖게 된다. : 우리는 ctrl + drag를 통해 무언가의 action을 IB와 코드를 연결한다.  
하지만 만약 우리가 코드가 아직 complie하는 동안 그 액션을 지운다면 IB는 그것이 부르려던 그 코드가 더이상 존재하지 않는 다는 것을 신경쓰지 않는다.  

</br>

유사하게, 우리가 `storyboard`로부터 `viewcontroller`를 생성하거나 `tableViewCell`을 dequeue할 때, 우리는 우리코드에서 중요한 객체를 나타낼 문자열을 사용한다.(=`identifier`)  
- system은 만연하고, 그것은 심지어 자신만의 이름을 가지고 있다. : “strongly typed APIs”.  
심지어 그런 후에 swift는 `tableViewCell`이 실제로는 `MooncakeTableVeiwCell` 이라는 것을 알 수 없기 때문에 typecast를 사용해야 한다.   

</br>

이러한 문제점들은 `IB`와 `swift`가 매우 별개의 것이기 때문에 존재한다.  
이건 그렇게 놀랄 거리가 아니다 
- `interface builder`는 Mac OS X 이전의 것일 뿐만 아니라 Objective-C 에서 작동하던 방식으로 설계되어있다.  

</br>

### SwiftUI는 과거에서부터 지속된 문제점을 깨버린다.  
그것은 `Swift-only framework`이다.   
Apple이 Objective-C를 보낼 때가 됬다고 결정했기 때문이 아니라, SwiftUI 가 Swift의 기능의 전체 범위에 영향을 미치기 때문이다. 
- value types, opaque return types, protocol extension 등등.  

</br>

### 어째든, 우리는 곧 SwiftUI가 정확히 어떻게 작동하는지 알아볼 것이다.  
지금, 당신이 최소한 알아야 할 것은 SwiftUI는 오래된 `Swift + Interface Builder` 접근 법으로 발생한 많은 문제를 고친다는 것이다.  

- 우리는 더이상 programmatic 혹은 storyboard based 디자인에 대해 논증할 필요없다. 
  - 왜냐하면 SwiftUI는 두 가지를 동시에 제공하기 때문이다.
- 우리는 더이상 `user interface` 작업을 커밋할 때 source control 문제를 생성할 걱정을 할 필요 없다. 
  - 왜냐하면 코드는 `storyboard XML` 보다 훨씬 읽고 관리하기 편하기 때문이다.
- 우리는 더이상 `stringly typed APIs`에 대해 걱정할 필요 없다. 
  - 아직 몇몇이 존재하지만, 확실하게 줄어들었다.
- 우리는 더 이상 존재하지도 않는 기능을 부를 일이 없다. 
  - 왜냐하면 우리의 `user interface`는 `swift compiler`에 의해 검사되기 때문이다.

</br>
</br>

그래서, 나는 SwiftUI로 넘어가는 많은 이점들에 대해 당신도 동의하길 바란다!


----

[원문 링크](https://www.hackingwithswift.com/quick-start/swiftui/swiftui-vs-interface-builder-and-storyboards)

----
