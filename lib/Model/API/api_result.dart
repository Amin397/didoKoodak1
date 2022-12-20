
class ApiResult {
  bool isDone;
  String requestedMethod;
  dynamic data;
  dynamic status;

  ApiResult({
    required this.isDone,
    required this.requestedMethod,
    this.data,
    this.status,
  });
}