/// Represents the response from the Azure OpenAI chat completion API.
class ChatCompletionResponse {
  /// Creates a new instance of [ChatCompletionResponse].
  ///
  /// [content] The text generated by the chat completion.
  ChatCompletionResponse({required this.content});

  /// Creates a new instance of [ChatCompletionResponse] from a
  /// JSON representation.
  ///
  /// [json] The JSON representation of the chat completion response.
  factory ChatCompletionResponse.fromJson(Map<String, dynamic> json) {
    final choices =
        (json['choices'] as List<dynamic>).cast<Map<String, dynamic>>();
    final message = choices[0]['message'] as Map<String, dynamic>;
    final content = message['content'] as String;

    return ChatCompletionResponse(content: content);
  }

  /// The content generated by the chat completion.
  final String content;
}
