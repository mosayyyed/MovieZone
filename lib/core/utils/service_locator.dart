import 'package:get_it/get_it.dart';
import 'package:movie_app/features/home/data/repositories/movie_repo/movie_repo_impl.dart';

import '../../features/home/data/repositories/movie_details_repo/movie_details_repo_impl.dart';
import '../data_sources/networking/api_service.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<MovieRepoImpl>(MovieRepoImpl(ApiService()));
  getIt.registerSingleton<MovieDetailsRepoImpl>(
      MovieDetailsRepoImpl(ApiService()));
}
