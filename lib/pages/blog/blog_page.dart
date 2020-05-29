import 'package:cactus_app/di/app_module.dart';
import 'package:cactus_app/domain/entities/blog_top.dart';
import 'package:cactus_app/pages/blog/bloc/blog_top_bloc.dart';
import 'package:cactus_app/pages/blog/bloc/blog_top_event.dart';
import 'package:cactus_app/pages/blog/bloc/blog_top_state.dart';
import 'package:cactus_app/pages/blog/widgets/item_list_row.dart';
import 'package:cactus_app/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<BlogBloc>(),
      child: BlocBuilder<BlogBloc, BlogState>(
        builder: (context, state) {
          if (state is Empty) {
            BlocProvider.of<BlogBloc>(context).add(GetBlogTopListEvent());
          } else if (state is LoadingBlog) {
            return LoadingWidget();
          } else if (state is LoadedBlog) {
            return _buildListViewWidget(state.blogs);
          } else if (state is ErrorLoadBlog) {
            return Center(child: Text("Error ${state.msg}"));
          }
          return LoadingWidget();
        },
      ),
    );
  }

  Widget _buildListViewWidget(List<BlogTop> blogs) {
    return ListView.builder(
      itemCount: blogs.length,
      itemBuilder: (BuildContext context, int index) {
        final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: animationController, curve: Interval((1 / 10) * index, 1.0, curve: Curves.fastOutSlowIn)));
        animationController.forward();
        return CactusListView(
          callback: () {},
          blogData: blogs[index],
          animation: animation,
          animationController: animationController,
        );
      },
    );
  }
}
