import 'package:translator/translator.dart';

final translator = GoogleTranslator();

Future<String> translateText(String text, String to) async {
  var translation = await translator.translate(text, to: to);
  return translation.text;
}
