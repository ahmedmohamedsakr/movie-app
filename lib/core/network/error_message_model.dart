class ErrorMessageModel {
  bool success;
  final int statusCode;
  final String statusMessage;

  ErrorMessageModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        success: json['success'],
        statusCode: json['status_code'],
        statusMessage: json['status_message'],
      );

  List<Object> get props => [success, statusCode, statusMessage];
}
