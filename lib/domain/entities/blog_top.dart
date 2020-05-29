class BlogTop {
  String id;
  String imgPath;
  String subTitle;
  String title;

  BlogTop({this.id, this.imgPath, this.subTitle, this.title});

  @override
  String toString() {
    return 'BlogTop{id: $id, imgPath: $imgPath, subTitle: $subTitle, title: $title}';
  }
}
