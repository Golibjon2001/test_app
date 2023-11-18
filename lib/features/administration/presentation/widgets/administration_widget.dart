import 'package:flutter/material.dart';
import 'package:test_app/assets/colors/colors.dart';
import 'package:test_app/features/administration/domain/entity/administration_entity.dart';
class AdministrationWidget extends StatelessWidget {
  final AdministrationEntity administrationEntity;
  const AdministrationWidget({Key? key,required this.administrationEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: black, width: 1),
        borderRadius: BorderRadius.circular(10),
        color: white,
      ),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Text(
            "Name:${administrationEntity.name['firstname']}",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            "Lastname:${administrationEntity.name['lastname']}",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            "Email:${administrationEntity.email}",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            "Phone:${administrationEntity.phone}",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
