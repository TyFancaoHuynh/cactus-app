import 'package:cactus_app/pages/cactusbranch/entities/cactus_type.dart';
import 'package:cactus_app/values/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BranchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BranchPageState();
}

class BranchPageState extends State<BranchPage> {
  List<Widget> cactusTypeWidgets = List();

  @override
  void initState() {
    super.initState();
    CactusType.values.forEach((element) {
      cactusTypeWidgets.add(_buildCactusType(cactusTxt[element], cactusImg[element]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildBranchPageDataWidget();
  }

  Widget _buildBranchPageDataWidget() {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30, left: 20, bottom: 35),
            child: Text(StringUtils.cactusType,
                style: TextStyle(color: Colors.black54, fontSize: 27, fontWeight: FontWeight.bold)),
          ),
          _buildGridLayoutType()
        ],
      ),
    );
  }

  Widget _buildGridLayoutType() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: cactusTypeWidgets,
    );
  }

  Widget _buildCactusType(String txt, String imgPath) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            child: Image.asset(imgPath),
          ),
          Text(
            txt,
            textAlign: TextAlign.center,
            maxLines: 2,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 10, color: Colors.black),
          )
        ],
      ),
    );
  }
}
