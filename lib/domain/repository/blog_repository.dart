import 'package:cactus_app/core/error/failures.dart';
import 'package:cactus_app/core/state.dart' as state;
import 'package:cactus_app/data/provider/blog_provider.dart';
import 'package:cactus_app/data/providersimpl/blog_provider_impl.dart';
import 'package:cactus_app/domain/entities/blog_top.dart';
import 'package:flutter/cupertino.dart';

class BlogRepository implements BlogProvider {
  final BlogProviderImpl blogProviderImpl;

  BlogRepository({@required this.blogProviderImpl});

  @override
  Future<state.State<List<BlogTop>, FirebaseError>> getBlogTopData() async => blogProviderImpl.getBlogTopData();
}
