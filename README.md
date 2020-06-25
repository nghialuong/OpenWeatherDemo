# OpenWeatherNAB
### Author: Nghia Luong

a/ Project is using:
- Clean architrecture [here](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html), use this as high level guideline.
- RxSwift and its extensions are being used all over the places of project.
- Being devided in 3 layers:
    - Domain Layer = Entities + Use Cases + Platform Interfaces
    - Platform Layer = Repositories Implementations + API (Network) + Caching
    - Presentation Layer (MVVM) = ViewModels + Views
- SOLID principles [here](https://www.google.com/search?sxsrf=ALeKk01XtOekOpJvhSePYEwrjdVNe2ZNfw%3A1593035218071&ei=0snzXo7VA8i2kwXo66iQAw&q=solid+principles+origin&oq=solid+principles+origi&gs_lcp=CgZwc3ktYWIQAxgAMgIIADoECAAQRzoECAAQQzoGCAAQFhAeOgcIABAUEIcCOggIABAWEAoQHlC6UljoYWCuaGgCcAF4AIABYogBtASSAQE4mAEAoAEBqgEHZ3dzLXdpeg&sclient=psy-ab)
- Pods, frameworks and their version can be found in Podfile

b/ I have structured the project into 3 main layers:
```
    - Domain: this contains 2 main things:
        - Entities: represent for Enterprise business roles
        - Usecases: represent for Application roles
    - Presentation: View + ViewModel and its binding (RxSwift) by using MVVM
    - NetworkPlatform: using RxAlamofire + custom Caching files for handle requests.
```    
Beside that, there are `Common, Utility` folders, ...do what their names say.

Some key frameworks:
    
    - RxSwift: use for binding from View + ViewModel in MVVM architecture.
    - RxAlamofire: extension of RxSwift for cooporating with Alamofire.
    - RxTest, RxBlocking: use for writing unit tests in Reactive Programming way. 

c/ Run `pod install` in project directory, run project by `OpenWeatherNAB.xcworkspace` file. 

d/ Status of checklist:
```
    1. Done
    2. Done
    3. Done
    4. Done
    5. Not Done
    6. Done
    7. Done
    8. Not Done
    9. Not Needed
    10. Done
```

e/ Test Coverage: 75% (run test first, before running project, cus the Cache may lead the app not call API)