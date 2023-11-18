import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/assets/colors/colors.dart';
import 'package:test_app/features/basket/data/models.dart';
import 'package:test_app/features/basket/presentation/bloc/basked_bloc.dart';
import 'package:test_app/features/home/domain/entity/products_entity.dart';
class Products extends StatelessWidget {
  final ProductsEntity productsEntity;
  const Products({Key? key,required this.productsEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Image.network(
                productsEntity.image ?? '',
                height: 100,
                fit: BoxFit.fill,
              )),
          const SizedBox(
            height: 10,
          ),
          Text(
            productsEntity.title ?? '',
            style: Theme.of(context).textTheme.titleSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          //const SizedBox(height:5,),
          Text(
            "Price:${productsEntity.price.toString() ?? ""}",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  BasketModel basked = BasketModel(
                    image: productsEntity.image ?? '',
                    title: productsEntity.title ?? '',
                    price: productsEntity.price.toString() ?? "",
                  );
                  context.read<BaskedBloc>().add(AddProductBasked(basked));
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Add product successful")));
                },
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add_shopping_cart_outlined,
                      color: white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
