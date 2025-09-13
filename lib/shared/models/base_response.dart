class BaseResponse<T> {
  final T data;

  BaseResponse({required this.data});

  factory BaseResponse.fromJson(T data) => BaseResponse(data: data);
  @override
  String toString() {
    return 'BaseResponse(total:, s, )';
  }
}