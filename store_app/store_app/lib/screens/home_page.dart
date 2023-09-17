import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/controllers/products_controller.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/custom_card.dart';
import 'package:store_app/widgets/grid_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'New Trend',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.cartPlus,
                  color: Colors.black,
                ))
            // Padding(
            //   padding: EdgeInsets.only(right: 10),
            //   child: Icon(
            //     FontAwesomeIcons.chartGantt,
            //     color: Colors.black,
            //   ),
            // )
          ],
          leading: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 70),
            child: FutureBuilder<List<ProductModel>>(
              future: ProductsController().getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ProductModel> products = snapshot.data!;
                  return GridViewCustom(products: products);
                } else
                  Center(child: CircularProgressIndicator());
                return Text('some thing is error');
              },
            )));
  }
}
