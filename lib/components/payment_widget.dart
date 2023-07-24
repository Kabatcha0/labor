import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:labor/components/navigator.dart';
import 'package:labor/modules/my_wallet/my_wallet.dart';

class PaymentWidget extends StatelessWidget {
  String assetName;
  PaymentWidget({required this.assetName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigator(context: context, widget: const MyWallet());
      },
      child: Container(
        width: double.infinity,
        height: 200,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Image.asset(
          assetName,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
