import 'package:fitness_app/config/constants.dart';
import 'package:fitness_app/model/stufe_model.dart';
import 'package:fitness_app/screens/softwarestufe/product_screen/components/product_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductsScreen extends StatelessWidget {
  final int index;

  const ProductsScreen({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(context),
      body: ProductContent(
        index: index
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(left: kDefaultPadding),
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: Text(
        'Back'.toUpperCase(),
        style: Theme.of(context).textTheme.bodyText2,
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset('assets/icons/cart_with_item.svg'),
          onPressed: () {},
        ),
      ],
    );
  }
}