/// Exception class for Azure OpenAI errors.
class AzureOpenAIException implements Exception {
  /// Creates an instance of [AzureOpenAIException].
  ///
  /// [message] The error message.
  /// [statusCode] The HTTP status code associated with the error.
  AzureOpenAIException(this.message, {this.statusCode});

  /// The error message.
  final String message;

  /// The HTTP status code associated with the error.
  final int? statusCode;

  @override
  String toString() =>
      'AzureOpenAIException: $message (statusCode: $statusCode)';
}
