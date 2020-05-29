import 'dart:async';

import 'package:cactus_app/core/usecases/use_case.dart';
import 'package:cactus_app/domain/entities/blog_top.dart';
import 'package:cactus_app/domain/usecases/get_blog_top_list.dart';
import 'package:cactus_app/pages/blog/bloc/blog_top_event.dart';
import 'package:cactus_app/pages/blog/bloc/blog_top_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogBloc extends Bloc<BlogTopEvent, BlogState> {
  final GetBlogTopList getBlogTopList;

  BlogBloc({@required this.getBlogTopList});

  List<BlogTop> _blogTops = List();

  @override
  BlogState get initialState => Empty();

  @override
  Stream<BlogState> mapEventToState(BlogTopEvent event) async* {
    if (event is GetBlogTopListEvent) {
      final result = await getBlogTopList(NoParams());
      yield result.fold(
        (blogs) {
          _blogTops.addAll(blogs);
          return LoadedBlog(blogs: blogs);
        },
        (error) => ErrorLoadBlog(msg: error.msg),
      );
    }
  }
}
