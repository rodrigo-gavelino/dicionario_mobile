abstract class Failures {
  final String message;

  const Failures(this.message);

  @override
  String toString() => message;
}

class CacheFailure extends Failures {
  const CacheFailure(super.message);
}

class ServerFailure extends Failures {
  const ServerFailure(super.message);
}
