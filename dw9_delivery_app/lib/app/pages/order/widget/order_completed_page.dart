import 'package:dw9_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class OrderCompletedPage extends StatelessWidget {

  const OrderCompletedPage({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
         body: SingleChildScrollView(
           child: Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 SizedBox(
                   height: context.percentHeight(.2),
                 ),
                 Image.asset('assets/images/logo_rounded.png'),

                 const SizedBox(
                  height: 10,
                 ),

                 Text(
                  'Pedido realizado com sucesso, em breve você receberá a confirmação do seu pedido',
                  style: context.textStyles.textExtraBold.copyWith(
                      fontSize: 18,
                      color: context.colors.primary
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  DeliveryButton(
                    label: 'Fechar',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    width: context.percentWidth(.8),
                  )
               ],

             ),
           ),
         ),
       );
  
  }
}