import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:movie_app/features/home/data/repositories/movie_repo/movie_repo_impl.dart';

import '../../features/explore/data/repositories/search_repo/search_movies_repo_impl.dart';
import '../../features/home/data/repositories/movie_details_repo/movie_details_repo_impl.dart';
import '../data_sources/networking/api_service.dart';
import '../data_sources/networking/firebase_service.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(
      FirebaseService(FirebaseAuth.instance, FirebaseFirestore.instance)));
  getIt.registerSingleton<MovieRepoImpl>(MovieRepoImpl(ApiService()));
  getIt.registerSingleton<MovieDetailsRepoImpl>(
      MovieDetailsRepoImpl(ApiService()));
  getIt.registerSingleton<SearchMoviesRepoImpl>(
      SearchMoviesRepoImpl(ApiService()));
}
