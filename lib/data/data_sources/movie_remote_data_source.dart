import 'package:movieapp/data/core/api_client.dart';
import 'package:movieapp/data/models/movie_model.dart';
import 'package:movieapp/data/models/movies_result_model.dart';

//4e étape
abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  //next 2 methods for home screen
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();


}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  //final Client _client;
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    /* final response = await _client.get(
      '${ApiConstants.BASE_URL}trending/movie/day?api_key=${ApiConstants.API_KEY}',
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final movies = MoviesResultModel.fromJson(responseBody).movies;
      print(movies);
      return movies;
    } else {
      throw Exception(response.reasonPhrase);
    } */
    final response = await _client.get('trending/movie/day');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    //   final response = await _client.get(
    //     '${ApiConstants.BASE_URL}movie/popular?api_key=${ApiConstants.API_KEY}',
    //     headers: {
    //       'Content-Type': 'application/json',
    //     },
    //   );

    //   if (response.statusCode == 200) {
    //     final responseBody = json.decode(response.body);
    //     final movies = MoviesResultModel.fromJson(responseBody).movies;
    //     print(movies);
    //     return movies;
    //   } else {
    //     throw Exception(response.reasonPhrase);
    //   }
    // }
    final response = await _client.get('movie/popular');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final response = await _client.get('movie/upcoming');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _client.get('movie/now_playing');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }
}
