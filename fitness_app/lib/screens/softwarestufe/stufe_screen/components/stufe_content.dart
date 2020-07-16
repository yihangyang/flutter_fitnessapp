import 'package:fitness_app/config/constants.dart';
import 'package:fitness_app/screens/softwarestufe/product_screen/product_screen.dart';
import 'package:fitness_app/screens/softwarestufe/stufe_screen/components/category_list.dart';
import 'package:fitness_app/screens/softwarestufe/stufe_screen/components/product_card.dart';
import 'package:fitness_app/viewmodel/stufe_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StufeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: <Widget>[
          // SearchBox(onChanged: (value) {}),
          CategoryList(),
          SizedBox(height: kDefaultPadding / 2),
          Expanded(
            child: Stack(
              children: <Widget>[
                // Our background
                Container(
                  margin: EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                Consumer<StufeViewModel>(
                  builder: (ctx, cVM, child) {
                    return ListView.builder(
                      // here we use our demo procuts list
                      itemCount: cVM.getGoodsList.length,
                      itemBuilder: (context, index) => ProductCard(
                        itemIndex: index,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductsScreen(
                                index: index,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                )
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}