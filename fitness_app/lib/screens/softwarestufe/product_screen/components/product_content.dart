import 'package:fitness_app/config/constants.dart';
import 'package:fitness_app/model/stufe_model.dart';
import 'package:fitness_app/screens/softwarestufe/product_screen/components/add_cart.dart';
import 'package:fitness_app/screens/softwarestufe/product_screen/components/list_of_color.dart';
import 'package:fitness_app/screens/softwarestufe/product_screen/components/product_poster.dart';
import 'package:fitness_app/viewmodel/stufe_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductContent extends StatefulWidget {
  final int index;

  const ProductContent({Key key, this.index}) : super(key: key);

  @override
  _ProductContentState createState() => _ProductContentState();
}

class _ProductContentState extends State<ProductContent> {
  @override
  Widget build(BuildContext context) {
    // it provide us total height and width
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small devices
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Consumer<StufeViewModel>(
                builder: (ctx, stufeVM, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Hero(
                          tag: '${stufeVM.getGoodsList[widget.index].id}',
                          child: ProductPoster(
                            size: size ,
                            image: stufeVM.getGoodsList[widget.index].image,
                          ),
                        ),
                      ),
                      ListOfColors(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPadding / 2),
                        child: Text(
                          stufeVM.getGoodsList[widget.index].goodsName,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Text(
                        '\$${stufeVM.getGoodsList[widget.index].oriPrice}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: kSecondaryColor,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                        child: Text(
                          stufeVM.getGoodsList[widget.index].goodsName,
                          style: TextStyle(color: kTextLightColor),
                        ),
                      ),
                      SizedBox(height: kDefaultPadding),
                    ],
                  );
                }
              )

              
              
            ),
            AddCart(),
          ],
        ),
      ),
    );
  }
}