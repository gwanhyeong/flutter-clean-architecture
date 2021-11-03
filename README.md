# flutter-clean-architecture

```
main.dart (entry point)
- src/
  - core/
    - error/
      - exceptions.dart
    - util/ (공용 코드 / 재사용되는 globalKey, 정규식 등)
      - keys.dart
      - usecase.dart
    - extension/
    - theme/ (앱 테마, 위젯별 테마, 색상 값)
      - colors.dart
      - app_theme.dart
      - buttons.dart
    - translation/ (다국어 지원 / 위치 고민중)
  - data/
    - enum/
    - source/ (데이터 소스를 가져오는 역할, 네트워크 여부에 따라 로컬 데이터 활용)
      - local/
      - remote/
    - repository/ (interface 구현체)
  - domain/ (비즈니스 로직, 의존성X)
    - repository/ (interface)
    - usecase/
    - model/
  - presentation/ (모듈로 불러도 무방, 1화면-1모듈)
    - home/
      - widget/ (이 화면에서만 쓰는 위젯)
      - home.dart
      - home_view_model.dart
  - global_widget/ (다른 화면에서도 재사용되는 위젯)
  - route/ (라우팅 정보들, route/page)
  - device/ (플랫폼 맞춤 코드)
```
