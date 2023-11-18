import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/assets/colors/colors.dart';
import 'package:test_app/features/basket/data/models.dart';
import 'package:test_app/features/basket/presentation/bloc/basked_bloc.dart';
class BasketProduct extends StatelessWidget {
  final BasketModel basketModel;
  const BasketProduct({Key? key,required this.basketModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: white,
          border: Border.all(color: baliHai, width: 2)),
      child: Row(
        children: [
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image:
                DecorationImage(image: NetworkImage(basketModel.image ?? ''))),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 230,
                child: Text(
                  "Name:${basketModel.title}",
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Price:${basketModel.price.toString()}",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(
                width: 230,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<BaskedBloc>().add(RemoveProductBasked(basketModel));
                      },
                      child: const Icon(
                        Icons.remove_shopping_cart,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
