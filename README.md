# flutter_ume_kit_dio

Dio kit for flutter_ume.\
mainly change from the origin version:\
support share response data or custom input text to dingTalk/feiShu/weChat robot
```dart
PluginManager.instance.register(DioInspector(
dio: dio,
webhookUrl: 'your webhookUrl',
));
```
