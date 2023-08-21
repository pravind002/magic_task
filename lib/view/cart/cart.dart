import 'package:get/get.dart';

import '../../imports.dart';
import '../../model/cart_model.dart';
import '../../widgets/card/cart_card_tile.dart';
import '../appbar/app_name.dart';
import '../checkout_page.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double totalPrice = 0.0;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   totalPrice;
  // }
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartItems>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        title: const AppName(),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15),
              itemCount: cart.items.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int i) {
                double itemPrice = double.tryParse(
                        cart.items.values.toList()[i].price!.toString()) ??
                    0.0;

                // Add the price of the current item to the total price
                totalPrice += itemPrice;
                // CartItem cartItem = cart.items.values.toList()[i];
                // Add the price of the current item to the total price
                // totalPrice +=
                //     double.tryParse(cartItem.price!.toString()) ?? 0.0;
                return CartCardTile(
                  id: cart.items.values.toList()[i].id!,
                  productId: cart.items.keys.toList()[i],
                  price: double.tryParse(
                      cart.items.values.toList()[i].price!.toString()),
                  quantity: cart.items.values.toList()[i].quantity!,
                  name: cart.items.values.toList()[i].name!,
                  category: cart.items.values.toList()[i].category!,
                  image: cart.items.values.toList()[i].image!,
                );
              },
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CheckOutPage(
                          totalPrice: '$totalPrice',
                        )),
              );
              setState(() {
                totalPrice;
              });
              // Get.to(() => );
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              width: Get.width,
              height: 50,
              color: Colors.green,
              child: const Center(
                  child: Text(
                'Check Out',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
            ),
          )
          //  Container(
          //   width: Get.width,
          //   height: 100,color: Colors.green,
          //  child:  Column(children: [
          //   Text('$totalPrice')
          //  ],),)
        ],
      ),
    );
  }
}
