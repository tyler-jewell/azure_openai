/// Dart package for Azure Open AI Service.
library azure_openai;

import 'dart:convert';
import 'package:azure_openai/azure_open_ai_exception.dart';
import 'package:azure_openai/chat_completion_response.dart';
import 'package:http/http.dart' as http;

/// Base class for Azure OpenAI clients.
sealed class AzureOpenAI {
  /// Creates a chat completion based on the provided messages.
  ///
  /// [messages] A list of messages that make up the conversation history.
  /// Each message should be a map containing 'role' and 'content' keys.
  /// [deployment] The deployment name or ID of the AI model to use.
  ///
  /// Returns a [Future] that resolves to a map representing the chat
  /// completion response.
  ///
  /// Throws an `AzureOpenAIException` if the request fails.
  Future<ChatCompletionResponse> createChatCompletion({
    required List<Map<String, String>> messages,
    required String deployment,
  });
}

/// Local Azure OpenAI client for local development and testing.
class LocalAzureOpenAIClient implements AzureOpenAI {
  @override
  Future<ChatCompletionResponse> createChatCompletion({
    required List<Map<String, String>> messages,
    required String deployment,
  }) async {
    return ChatCompletionResponse(content: 'Local response');
  }
}

/// Azure OpenAI client for interacting with the Azure OpenAI API.
class AzureOpenAIClient implements AzureOpenAI {
  /// Creates an instance of [AzureOpenAIClient].
  AzureOpenAIClient({required this.endpoint, required this.apiKey});

  /// The endpoint URL for the Azure OpenAI API.
  final Uri endpoint;

  /// The API key for authentication.
  final String apiKey;

  @override
  Future<ChatCompletionResponse> createChatCompletion({
    required List<Map<String, String>> messages,
    required String deployment,
    int? maxTokens,
    double? temperature,
    int? n,
    List<String>? stop,
  }) async {
    final url = endpoint.replace(
      path: '${endpoint.path}/openai/deployments/$deployment/chat/completions',
      queryParameters: {
        'api-version': '2024-08-01-preview',
      },
    );

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'api-key': apiKey,
      },
      body: jsonEncode({
        'messages': messages,
        'max_tokens': maxTokens,
        'temperature': temperature,
        'n': n,
        'stop': stop,
      }),
    );

    if (response.statusCode == 200) {
      final chatCompletionResponse = ChatCompletionResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
      return chatCompletionResponse;
    } else {
      throw AzureOpenAIException(
        'Failed to create chat completion: ${response.body}',
        statusCode: response.statusCode,
      );
    }
  }
}
