# GeometryReader

- geometryReader get its size at runtime.
- this is useful when your layout depends on a particular view’s dimensions.
- so the trick is to embed a GeometryReader in the view’s background or overlay.
- the resulting GeometryProxy’s size will the that of the view itself.
- if you wish to store the size in a State var, there preferred way is to use view preferences.
