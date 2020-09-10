import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:dartz/dartz.dart';

//5e étape
abstract class MovieRepository {
  // This MovieRepository will have a single method to return a Future, then
  // let's implement the repository
  // Either (form Dartz package) and AppError have been added after 7th stage
  // (1st usecase implementation); let's create AppError class and update
  // method's signature
  Future<Either<AppError, List<MovieEntity>>> getTrending();
  Future<Either<AppError, List<MovieEntity>>> getPopular();
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow();
  Future<Either<AppError, List<MovieEntity>>> getComingSoon();
}
