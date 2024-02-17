import 'package:fpdart/fpdart.dart';
import 'package:reddict1/core/failure.dart';


typedef FutureEither<T> = Future<Either<failure,T>>;
typedef FutureVoid = Future<void>;
