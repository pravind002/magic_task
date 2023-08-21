// import 'package:ecommagix/imports.dart';

import '../../imports.dart';
import '../../model/cart_model.dart';
import '../text/text_builder.dart';

class CartCardTile extends StatelessWidget {
  final String? id;
  final String? productId;
  final double? price;
  final int? quantity;
  final String? name;
  final String? image;
  final String? category;
  const CartCardTile({
    Key? key,
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.name,
    this.image,
    this.category,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final cart = Provider.of<CartItems>(context);

    final totalPrice = (price! * quantity!);

    return Card(
      color: Colors.white,
      margin: EdgeInsets.zero,
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Image.network(
                image!,
                height: size.height,
                width: size.width,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextBuilder(
                      text: name!,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextBuilder(text: category, fontSize: 12.0),
                  ),
                  const SizedBox(height: 2.0),
                  Padding(
                    padding: EdgeInsets.only(left: 2, right: 2),
                    child: Row(
                      children: [
                        TextBuilder(
                          text: 'Total: ',
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                        TextBuilder(
                          text: totalPrice.toString(),
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                            onTap: () {
                              cart.removeItem(productId.toString());
                            },
                            child: Icon(Icons.delete_outline_sharp))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
