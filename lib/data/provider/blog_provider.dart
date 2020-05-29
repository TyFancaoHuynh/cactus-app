import 'package:cactus_app/core/error/failures.dart';
import 'package:cactus_app/core/state.dart';
import 'package:cactus_app/domain/entities/blog_top.dart';

abstract class BlogProvider {
  Future<State<List<BlogTop>, FirebaseError>> getBlogTopData();
}
