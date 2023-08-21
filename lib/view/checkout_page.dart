import 'package:get/get.dart';

import '../imports.dart';
import '../model/cart_model.dart';

class CheckOutPage extends StatelessWidget {
  CheckOutPage({super.key, required this.totalPrice});

  String totalPrice;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartItems>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Check Out',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     childAspectRatio: 2 / 3,
              //     mainAxisSpacing: 15,
              //     crossAxisSpacing: 15),
              itemCount: cart.items.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int i) {
                // double itemPrice = double.tryParse(
                //         cart.items.values.toList()[i].price!.toString()) ??
                //     0.0;

                // Add the price of the current item to the total price
                // totalPrice += itemPrice;
                // CartItem cartItem = cart.items.values.toList()[i];
                // Add the price of the current item to the total price
                // totalPrice +=
                //     double.tryParse(cartItem.price!.toString()) ?? 0.0;
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(cart.items.values.toList()[i].image!),
                  ),
                  title: Text(cart.items.values.toList()[i].name!),
                  subtitle: Text('Price :${double.tryParse(
                      cart.items.values.toList()[i].price!.toString())}'),
                );

                // CartCardTile(
                //   id: cart.items.values.toList()[i].id!,
                //   productId: cart.items.keys.toList()[i],
                //   price: double.tryParse(
                //       cart.items.values.toList()[i].price!.toString()),
                //   quantity: cart.items.values.toList()[i].quantity!,
                //   name: cart.items.values.toList()[i].name!,
                //   category: cart.items.values.toList()[i].category!,
                //   image: cart.items.values.toList()[i].image!,
                // );
              },
            ),
          ),
          // Center(
          //     child: Text(
          //   'Total Amount :${double.tryParse(totalPrice)!.toStringAsFixed(2)}',
          //   style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          // )),
        ],
      ),
      bottomSheet: Container(
              // margin: const EdgeInsets.all(10),
              width: Get.width,
              height: 50,
              color: Colors.green,
              child: Center(
                  child: Text(
               'Total Amount :${double.tryParse(totalPrice)!.toStringAsFixed(2)}',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              )),
            ),
    );
  }
}
