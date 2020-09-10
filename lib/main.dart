import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart';
//import 'package:movieapp/data/core/api_client.dart';
//import 'package:movieapp/data/data_sources/movie_remote_data_source.dart';
//import 'package:movieapp/data/repositories/movie_repository_impl.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/entities/no_params.dart';
//import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecases/get_trending.dart';
// Added after 11th stage (DI)
import 'package:pedantic/pedantic.dart';
import 'di/get_it.dart' as getIt;

Future<void> main() async {
  unawaited(getIt.init()); // From pedantic package
  // Client apiClient = Client();
  // -> ApiClient apiClient = ApiClient(Client());
  // -> MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(apiClient);
  /** DataSource test from the 2nd videos before repository's creation */
  /** Tests pouvant etre exécutés apres la 4e étape */
  /** Calling directly from the datasource (not good) */
  // dataSource.getTrending();
  // dataSource.getPopular();
  // dataSource.getPlayingNow();
  // dataSource.getComingSoon();
  /** Test executé après les étapes 5 et 6 (Implmentation du repository) */
  // -> MovieRepository movieRepository = MovieRepositoryImpl(dataSource);
  /** Test effectué apres la 7e étape (creation de l'usecase) */
  // Instead of calling getTrending directly from repository, instantiate
  // getTrending() usecases class with movieRepository as his parameter
  // -> GetTrending getTrending = GetTrending(movieRepository);
  // The new call with the DI configuration (no more the above methods indicating
  // the arrow sign ->)
  GetTrending getTrending = getIt.getItInstance<GetTrending>();
  // then, simply call instance of getTrending() instead of
  // -> movieRepository.getTrending();
  final Either<AppError, List<MovieEntity>> eitherResponse =
      await getTrending(NoParams());
  eitherResponse.fold(// Use of fold Operator
      (l) {
    print('error');
    print(l);
  }, (r) {
    print('List of movies');
    print(r);
  });
  // Since Dartz plugin also contains State class, we'll have error using within
  // file statefull widget; let's delete statefull widget and call usecases from
  // BLoC only and not from any statefull widget
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container(),
    );
  }
}
