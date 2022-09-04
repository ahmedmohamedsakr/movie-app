abstract class Failure {
  final String message;

  const Failure({required this.message});

  List<Object> get props => [message];
}

class ServerFailure extends Failure{
  ServerFailure({required super.message});
}
class DatabaseFailure extends Failure{
  DatabaseFailure({required super.message});
}