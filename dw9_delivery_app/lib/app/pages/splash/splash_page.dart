import 'package:dw9_delivery_app/app/core/config/env/env.dart';
import 'package:dw9_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/app_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.colors.primary;
    return Scaffold(
      appBar: AppBar(title: Text('Splash')),
      body: Column(
        children: [
          Container(
            color: Colors.amber,
            width: context.percentWidth(.5),
            height: context.percentHeight(.5),
          ),
          DeliveryButton(
            label: Env.i['backend_base_url'] ?? '',
            onPressed: () {},
            width: 200,
            height: 60,
          ),
          Text(context.screenHeight.toString()),
          TextFormField(
            decoration: InputDecoration(labelText: "teste"),
          )
        ],
      ),
    );
  }
}
