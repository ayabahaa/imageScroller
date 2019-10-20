# TitleImageEdgeinsetsButton
一个轻便的调整button中title和image的间距的和位置的库

* 修改按钮和图片的相对的位置和间距

```
let button = CXSpacingButton()
button.imagePosition = .right
button.spacing = 10
```
  <img src="https://raw.githubusercontent.com/chunxige/TitleImageEdgeinsetsButton/master/gif/spacing.gif">

* 修改按钮和图片相对于各自最近一条边的距离

```
let button = CXSideButton()
button.imageSideAlignment = .left(10, titleRight: 10)
```
<img src="https://raw.githubusercontent.com/chunxige/TitleImageEdgeinsetsButton/master/gif/side.png">
