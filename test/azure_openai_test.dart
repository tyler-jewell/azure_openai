import 'package:azure_openai/azure_openai.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('instantiation works', () {
   expect(AzureOpenAI(), isA<AzureOpenAI>());
  });
}
