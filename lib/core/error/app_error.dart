abstract class AppError {
  const AppError();
}

class ServerError extends AppError {
  final String message;
  const ServerError({required this.message});
}

class NoInternet extends AppError {
  const NoInternet();
}
