class ResponseModel<T> {
  final bool success;
  final T data;

  ResponseModel.fromJson(Map<String, dynamic> response)
      : success = response['success'],
        data = response['data'];
}
