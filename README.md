# flutter_ume_kit_dio

Dio kit for flutter_ume.\
mainly change from the origin version:\
support share response data to ding talk robot
```dart
PluginManager.instance.register(DioInspector(
dio: dio,
dingToken: 'access_token',
));
```
