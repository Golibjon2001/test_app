import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_app/assets/colors/colors.dart';
import 'package:test_app/features/basket/data/models.dart';
import 'package:test_app/features/basket/presentation/bloc/basked_bloc.dart';
import 'package:test_app/features/basket/presentation/widgets/basket_product.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  void initState() {
    super.initState();
  }

  var basketBox = Hive.box('basket');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: scaffoldBackground,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Basket",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: black,
          ),
        ),
      ),
      body: BlocBuilder<BaskedBloc, BaskedState>(
        builder: (context, state) {
          basketBox.put('basket', state.productsEntity ?? []);
          final List<BasketModel> products = List<BasketModel>.from(basketBox.get('basket', defaultValue: []));
          if (state.productsEntity?.isEmpty ?? true) {
            return Center(
              child: Text("No Products",style:Theme.of(context).textTheme.titleMedium,),
            );
          } else {
            return SafeArea(
                child: ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return BasketProduct(
                        basketModel: products[index],
                      );
                    }));
          }
        },
      ),
    );
  }
}
