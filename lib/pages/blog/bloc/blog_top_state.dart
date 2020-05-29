import 'package:cactus_app/domain/entities/blog_top.dart';
import 'package:flutter/cupertino.dart';

abstract class BlogState {}

class Empty extends BlogState {}

class LoadingBlog extends BlogState {}

class LoadedBlog extends BlogState {
  final List<BlogTop> blogs;

  LoadedBlog({@required this.blogs});
}

class ErrorLoadBlog extends BlogState {
  final String msg;

  ErrorLoadBlog({@required this.msg});
}
