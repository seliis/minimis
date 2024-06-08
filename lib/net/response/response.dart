abstract class Response<T> {
  factory Response.success(T data) = SuccessResponse<T>;
  factory Response.failure(String message) = FailureResponse;
}

final class SuccessResponse<T> implements Response<T> {
  final T data;

  const SuccessResponse(this.data);
}

final class FailureResponse<T> implements Response<T> {
  final String message;

  const FailureResponse(this.message);
}
