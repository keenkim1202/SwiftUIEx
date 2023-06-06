# .aspectRatio

```swift
func aspectRatio(_ aspectRatio: CGFloat?, contentMode: ContentMode) -> some View { }
```
- `aspectRatio` 인자
    -  인자에 "특정 값"을 지정해준다면, `사용자가 입력한 특정 값` 즉, `제안된 사이즈` 를 비율로 적용하게 된다.
    - `사용자가 제안한 사이즈`를 바탕으로 하위뷰에 `새로운 사이즈`를 제안한다.
- `contentMode` 인자
    - 예를 들어 사용자가 `100 * 100` 사이즈의 직사각형에 16/9를 `aspectRatio`로 제안했다고 생각해보자.
    - `.fit` : 주어진 직사각형을 넘치지 않도록, 그 안에서 최대의 `aspectRatio`를 유지하는 사이즈를 제안한다. (`100 * 56.2`)
    - `.fill` : 주어진 직사각형이 넘치더라도 여백이 남지 않는 최대의 `aspectRatio`를 유지하는 사이즈를 제안한다. (`177.8 * 100`)

- 가장 보편적인 사용법은 아래와 같다.
    - 우리가 직접 특정 비율을 지정해주는 것이 아니라, 주어진 이미지의 비율로 부터 파생된다.
    - 우리가 직접 특정 비율을 지정해주지 않으면 `aspectRatio`는 `nil`이 된다.
    - aspectRatio modifier가 주어진 뷰에 "이상적인 사이즈"를 제안한다.
```swift
Image("someImage")
    .resizable()
    .aspectRatio(contentMode: .fit)
```
