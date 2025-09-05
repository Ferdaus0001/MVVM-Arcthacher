import 'package:mvvm/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.message, this.data);

  // Optional named constructors for convenience
  ApiResponse.loading([this.message]) : status = Status.LOADING;
  ApiResponse.completed([this.data]) : status = Status.COMPLETED;
  ApiResponse.error([this.message]) : status = Status.ERROR;

  @override
  String toString() {
    return 'Status: $status\nMessage: $message\nData: $data';
  }
}
