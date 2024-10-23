# Azure OpenAI for Flutter & Dart

The `azure_openai` package is a Flutter and Dart library that provides convenient abstractions for interacting with Azure's OpenAI services. This package allows developers to utilize powerful language models like GPT-4, GPT-3.5, DALL-E, and more, without having to deal with the complexities of the REST API.

## Features

- Abstracts common Azure OpenAI models, such as GPT-4 and GPT-3.5 Turbo.
- Provides endpoints for text completions, chat completions, and embeddings.
- Easy integration with Flutter and Dart applications.

## Getting Started

### Installation

Add the `azure_openai` package to your `pubspec.yaml` file:

```yaml
dependencies:
  azure_openai: ^0.0.1
```

Then run:

```sh
flutter pub get
```

### Import the Library

```dart
import 'package:azure_openai/azure_openai.dart';
```

## Usage

### Initialize the Azure OpenAI Client

First, create an instance of the Azure OpenAI client by providing your API key and endpoint.

```dart
final azureConfig = AzureOpenAIConfig(
  apiKey: 'YOUR_API_KEY',
  endpoint: 'https://YOUR_ENDPOINT',
);

final azureOpenAI = AzureOpenAI(config: azureConfig);
```

### Create a Completion Request

```dart
void getCompletion() async {
  final completionRequest = azureOpenAI.createCompletionRequest(
    'Tell me about the Dart programming language.',
    maxTokens: 150,
  );

  // Send this request using an HTTP client of your choice
  // e.g., using the 'http' package or 'dio'
  print(completionRequest);
}
```

### Example App

See the `example/` directory for a complete example showing how to integrate this package with a Flutter app.

## Example Code

An example demonstrating how to use `azure_openai` to generate text completions:

```dart
import 'package:azure_openai/azure_openai.dart';

void main() {
  final azureConfig = AzureOpenAIConfig(
    apiKey: 'YOUR_API_KEY',
    endpoint: 'https://YOUR_ENDPOINT',
  );

  final azureOpenAI = AzureOpenAI(config: azureConfig);

  azureOpenAI.createCompletionRequest('What is Dart?').then((response) {
    print(response);
  });
}
```

## Contributing

Contributions are welcome! If you find a bug or have a feature request, feel free to open an issue or a pull request on GitHub.

## License

This package is licensed under the MIT License. See the `LICENSE` file for more information.

## Maintainers

- [Your Name](https://github.com/yourprofile)

## Resources

- [Azure OpenAI Documentation](https://learn.microsoft.com/en-us/azure/ai-services/openai/)
- [Azure OpenAI Pricing](https://azure.microsoft.com/pricing/details/cognitive-services/openai-service/)

