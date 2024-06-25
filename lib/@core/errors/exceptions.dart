abstract class AppExceptions implements Exception {
  final String message;

  const AppExceptions({required this.message});

  @override
  String toString() => message;
}

class CacheException extends AppExceptions {
  const CacheException({required super.message});
}

class LocalDataSourceException extends AppExceptions {
  const LocalDataSourceException({required super.message});
}

class ServerException extends AppExceptions {
  const ServerException({required super.message});
}
