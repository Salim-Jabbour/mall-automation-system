import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

class CheckoutPage extends StatefulWidget {
  final String id;
  const CheckoutPage({super.key, required this.id});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PayPal Checkout",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Center(
        child: TextButton(
          onPressed: () async {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => PaypalCheckout(
                sandboxMode: true,
                clientId:
                    "AVYK-G9ep-BgNZ86v7jiCG5H-l48YRkCEcF4WXWVhyHdJl6wST5IsRX7P5I0X0GV_hVXvQWXBxK4qaYT", //TODO : get it from sandbox
                secretKey:
                    "EGdaBEgLXZOFn2TC44SP7ioRg30K5wb2fLz3817ubeIBbmqXeY8eWU6OuONJyysf28DCiVPnIit2xCU-", //TODO : get it from sandbox
                returnURL: "success.snippetcoder.com",
                cancelURL: "cancel.snippetcoder.com",
                transactions: const [
                  {
                    "amount": {
                      "total": '100',
                      "currency": "USD",
                      "details": {
                        "subtotal": '100',
                        "shipping": '0',
                        "shipping_discount": 0
                      }
                    },
                    "description": "The payment transaction description.",
                    "payment_options": {
                      "allowed_payment_method": "INSTANT_FUNDING_SOURCE"
                    },
                    "item_list": {
                      "items": [
                        {
                          "id": "0",
                          // "type": "type",
                          // "price": '5',
                          // "currency": "USD"
                        },
                      ],
                    }
                  }
                ],
                note: "Contact us for any questions on your order.",
                onSuccess: (Map params) async {
                  print("onSuccess: $params");
                  //TODO : check what inside params and send what you want to backend
                },
                onError: (error) {
                  print("onError: $error");
                  Navigator.pop(context);
                },
                onCancel: () {
                  print('cancelled:');
                },
              ),
            ));
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(1),
              ),
            ),
          ),
          child: const Text('Checkout'),
        ),
      ),
    );
  }
}
