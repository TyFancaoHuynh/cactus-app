import 'package:cactus_app/core/error/failures.dart';
import 'package:cactus_app/core/state.dart';
import 'package:cactus_app/core/usecases/use_case.dart';
import 'package:cactus_app/domain/entities/blog_top.dart';
import 'package:cactus_app/domain/repository/blog_repository.dart';

class GetBlogTopList extends UseCase<List<BlogTop>, NoParams> {
  final BlogRepository _repository;

  GetBlogTopList(this._repository);

  @override
  Future<State<List<BlogTop>, FirebaseError>> call(NoParams params) {
    return _repository.getBlogTopData();
  }
}
