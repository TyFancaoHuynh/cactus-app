import 'package:cactus_app/data/providersimpl/blog_provider_impl.dart';
import 'package:cactus_app/domain/repository/blog_repository.dart';
import 'package:cactus_app/domain/usecases/get_blog_top_list.dart';
import 'package:cactus_app/pages/blog/bloc/blog_top_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Providers
  sl.registerLazySingleton(() => BlogProviderImpl());

  //Repositories
  sl.registerLazySingleton(() => BlogRepository(blogProviderImpl: sl()));

  //Bloc
  sl.registerFactory(() => BlogBloc(getBlogTopList: sl()));

  //Use case
  sl.registerLazySingleton(() => GetBlogTopList(sl()));
}
