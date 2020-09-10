import 'package:dartz/dartz.dart';
import 'package:movieapp/data/data_sources/movie_remote_data_source.dart';
import 'package:movieapp/data/models/movie_model.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';

//6e étape
class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  // We can change MovieEntity by MovieModel in the implementation, let's call
  // the method in main.dart (for test)
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return Right(movies); // Rigth (from Dartz pkge) when Success 
    } on Exception {
      return Left(AppError('Something went wrong')); // Left when Error
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getComingSoon() async {
    try {
      final movies = await remoteDataSource.getComingSoon();
      return Right(movies); // Rigth (from Dartz pkge) when Success 
    } on Exception {
      return Left(AppError('Something went wrong')); // Left when Error
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
    try {
      final movies = await remoteDataSource.getPlayingNow();
      return Right(movies); // Rigth (from Dartz pkge) when Success 
    } on Exception {
      return Left(AppError('Something went wrong')); // Left when Error
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async {
    try {
      final movies = await remoteDataSource.getPopular();
      return Right(movies); // Rigth (from Dartz pkge) when Success 
    } on Exception {
      return Left(AppError('Something went wrong')); // Left when Error
    }
  }
}
