import 'package:azure_openai/azure_openai.dart';

import '../config/api_key.dart';
import '../config/endpoint.dart';

void main() async {
  final client = AzureOpenAIClient(
    apiKey: apiKey,
    endpoint: Uri.parse(endpoint),
  );
  final response = await client.createChatCompletion(
    messages: [
      {'role': 'user', 'content': 'Hello'},
    ],
    deployment: 'gpt-4o',
  );
  // ignore: avoid_print
  print(response.content);
}
