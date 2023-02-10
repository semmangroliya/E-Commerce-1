import 'package:get/get.dart';

class MaltiLanguage extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US': {'name':'Krish','surname': 'Kumbhani','age': '18'},
    'hi_US': {'name':'क्रिस','surname': 'कुंभणि','age': '१८ '},
    'guj_US': {'name':'ક્રિશ','surname': 'કુંભાણી ','age': '૧૮ '},
  };
}