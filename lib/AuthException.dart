class AuthException {
  final String message;
  final int statusCode;
  final String errorCode;

  AuthException({
    required this.message,
    required this.statusCode,
    required this.errorCode,
  });

  // Factory method to create an AuthException object from JSON
  factory AuthException.fromJson(Map<String, dynamic> json) {
    return AuthException(
      message: json['message'],
      statusCode: json['statusCode'],
      errorCode: json['errorCode'],
    );
  }

  // Method to convert an AuthException object to JSON
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'statusCode': statusCode,
      'errorCode': errorCode,
    };
  }
}
