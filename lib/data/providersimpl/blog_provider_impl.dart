import 'package:cactus_app/core/error/failures.dart';
import 'package:cactus_app/core/state.dart';
import 'package:cactus_app/data/model/blog_top_model.dart';
import 'package:cactus_app/data/provider/blog_provider.dart';
import 'package:cactus_app/domain/entities/blog_top.dart';
import 'package:cactus_app/utils/filebase_utils.dart';
import 'package:firebase_database/firebase_database.dart';

class BlogProviderImpl implements BlogProvider {
  var _db = FirebaseDatabase.instance;

  @override
  // ignore: missing_return
  Future<State<List<BlogTop>, FirebaseError>> getBlogTopData() async {
    var results = List<BlogTop>();
    await _db.reference().child(FirebaseUtils.BLOG_TOP_DATA).once().then((DataSnapshot snap) {
      results = BlogTopModel.fromJsonToList(snap);
    }).catchError((error) {
      return Future.value(State.error(FirebaseError(msg: error.message)));
    });
    return Future.value(State.success(results));
  }
}
