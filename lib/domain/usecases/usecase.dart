import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/app_error.dart';

//9e étape
//Type -> What does the UseCase return (Output);
//Params -> What is required to call API
abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
