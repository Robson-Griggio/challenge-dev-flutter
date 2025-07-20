sealed class Result<T> {
  const Result();
}

/// Represents a successful result containing a value of type [T].
final class Ok<T> extends Result<T> {
  final T value;
  const Ok(this.value);
}

/// Represents an error result containing an error message or exception.
final class Error<T> extends Result<T> {
  final Object error;
  final StackTrace? stackTrace;
  const Error(this.error, [this.stackTrace]);
}
