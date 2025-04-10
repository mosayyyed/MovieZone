import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:movie_app/features/home/data/repositories/movie_repo/movie_repo_impl.dart';
import 'package:movie_app/features/profile/data/repositories/user_repo_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/explore/data/repositories/search_repo/search_movies_repo_impl.dart';
import '../../features/home/data/repositories/movie_details_repo/movie_details_repo_impl.dart';
import '../data_sources/remote/api_service/http_api_service.dart';
import '../data_sources/remote/firebase_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPreferences>(prefs);

  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      FirebaseService(FirebaseAuth.instance, FirebaseFirestore.instance),
    ),
  );
  getIt.registerSingleton<MovieRepoImpl>(
    MovieRepoImpl(
      HttpApiService(),
    ),
  );
  getIt.registerSingleton<MovieDetailsRepoImpl>(
    MovieDetailsRepoImpl(
      HttpApiService(),
    ),
  );
  getIt.registerSingleton<SearchMoviesRepoImpl>(
    SearchMoviesRepoImpl(
      HttpApiService(),
    ),
  );
  getIt.registerSingleton<UserRepoImpl>(
    UserRepoImpl(
      FirebaseFirestore.instance,
      FirebaseAuth.instance,
    ),
  );
}
