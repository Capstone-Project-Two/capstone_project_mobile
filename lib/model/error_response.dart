class ErrorResponse {
  final int statusCode;
  final String timeStamp;
  final String path;
  final String errorType;
  final dynamic messages;
  final dynamic validationMessage;

  ErrorResponse({
    required this.statusCode,
    required this.timeStamp,
    required this.path,
    required this.errorType,
    required this.messages,
    required this.validationMessage,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'statusCode': int statusCode,
        'timestamp': String timeStamp,
        'path': String path,
        'errorType': String errorType,
      } =>
        ErrorResponse(
          statusCode: statusCode,
          timeStamp: timeStamp,
          path: path,
          errorType: errorType,
          messages: json['messages'],
          validationMessage: json['validationMessages'],
        ),
      _ => throw const FormatException('Failed to load error')
    };
  }
}
