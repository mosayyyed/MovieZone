import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/src/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:movie_app/src/features/home/data/repositories/movie_repo/movie_repo_impl.dart';
import 'package:movie_app/src/features/profile/data/repositories/user_repo_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/explore/data/repositories/search_repo/search_movies_repo_impl.dart';
import '../../features/home/data/repositories/movie_details_repo/movie_details_repo_impl.dart';
import '../data_sources/remote/api_service/http_api_service.dart';
import '../data_sources/remote/firebase_service.dart';
import 'package:movie_app/src/features/bookmark/data/repositories/bookmark_repository_impl.dart';
import 'package:movie_app/src/features/bookmark/domain/repositories/bookmark_repository.dart';
import 'package:movie_app/src/features/bookmark/presentation/controller/bookmark_cubit.dart';

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

  // Bookmark
  getIt.registerLazySingleton<BookmarkRepository>(
    () => BookmarkRepositoryImpl(
      FirebaseFirestore.instance,
      FirebaseAuth.instance,
    ),
  );

  getIt.registerFactory(
    () => BookmarkCubit(getIt<BookmarkRepository>()),
  );
}
