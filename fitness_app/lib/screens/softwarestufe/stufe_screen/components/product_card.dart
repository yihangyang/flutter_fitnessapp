import 'dart:convert';

import 'package:fitness_app/config/constants.dart';
import 'package:fitness_app/model/product_model.dart';
import 'package:fitness_app/viewmodel/stufe_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key key,
    this.itemIndex,
    this.press,
  }) : super(key: key);

  final int itemIndex;
  final Function press;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  // List<ListData> list = [];
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // It  will provide us total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      // color: Colors.blueAccent,
      height: 160,
      child: Consumer<StufeViewModel>(
        builder: (context, sVM, child) {
          // sVM.setGoodsList = list;
          return InkWell(
            onTap: widget.press,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                // Those are our background
                Container(
                  height: 136,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: widget.itemIndex.isEven ? kBlueColor : kSecondaryColor,
                    boxShadow: [kDefaultShadow],
                  ),
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                ),
                // our product image
                Positioned(
                  top: 0,
                  right: 0,
                  child: Hero(
                    tag: '${sVM.getGoodsList[widget.itemIndex].id}',
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      height: 160,
                      // image is square but we add extra 20 + 20 padding thats why width is 200
                      width: 200,
                      child: Image.network(
                        sVM.getGoodsList[widget.itemIndex].image,
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                ),
                // Product title and price
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: SizedBox(
                    height: 136,
                    // our image take 200 width, thats why we set out total width - 200
                    width: size.width - 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding),
                          child: Text(
                            sVM.getGoodsList[widget.itemIndex].goodsName,
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                        // it use the available space
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding * 1.5, // 30 padding
                            vertical: kDefaultPadding / 4, // 5 top and bottom
                          ),
                          decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(22),
                              topRight: Radius.circular(22),
                            ),
                          ),
                          child: Text(
                            "\$ ${sVM.getGoodsList[widget.itemIndex].oriPrice}",
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }

  // void _getModulCategory() async{
  //   await request('stufe').then((val) {
  //     var data = json.decode(val.toString());
  //     StufeModel category =  StufeModel.fromJson(data);
  //     list = category.data;
  //     final stufeArray = data;
  //     List<StufeModel> stufes = [];
  //     for(var json in stufeArray) {
  //       stufes.add(StufeModel.fromJson(json));
  //     }
  //   });
  // }

  
}