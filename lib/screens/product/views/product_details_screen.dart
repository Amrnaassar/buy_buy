import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:buy_buy/screens/product/views/product_returns_screen.dart';


import '../../../utils/components/buy_full_ui_kit.dart';
import '../../../utils/components/cart_button.dart';
import '../../../utils/components/custom_modal_bottom_sheet.dart';
import '../../../utils/components/product/product_card.dart';
import '../../../utils/constants.dart';
import '../../../utils/models/product_model.dart';
import 'components/notify_me_card.dart';
import 'components/product_images.dart';
import 'components/product_info.dart';
import 'components/product_list_tile.dart';
import 'product_buy_now_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
   ProductDetailsScreen({required this.productItem});
  static String id='ProductDetailsScreen';

  ProductModel productItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: productItem.IsAvailable
          ? CartButton(
              price: productItem.price,
              press: () {
                customModalBottomSheet(
                  context,
                  height: MediaQuery.of(context).size.height * 0.92,
                  child:  ProductBuyNowScreen(item: productItem),
                );
              },
            )
          :

          /// If profuct is not available then show [NotifyMeCard]
          NotifyMeCard(
              isNotify: false,
              onChanged: (value) {},
            ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              floating: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/Bookmark.svg",
                      color: Theme.of(context).textTheme.bodyLarge!.color),
                ),
              ],
            ),
            ProductImages(
              images: [productItem.image, productDemoImg2, productDemoImg3],
            ),
            ProductInfo(
              brand: productItem.brandName,
              title: productItem.title ,
              isAvailable: productItem.IsAvailable,
              description:productItem.description,

            ),


            SliverPadding(
              padding: const EdgeInsets.all(defaultPadding),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "You may also like",
                  style: Theme.of(context).textTheme.titleSmall!,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child:  SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // Find demoPopularProducts on models/ProductModel.dart
                  itemCount: demoPopularProducts.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(
                      left: defaultPadding,
                      right: index == demoPopularProducts.length - 1
                          ? defaultPadding
                          : 0,
                    ),
                    child: ProductCard(
                      image: demoPopularProducts[index].image,
                      brandName: demoPopularProducts[index].brandName,
                      title: demoPopularProducts[index].title,
                      price: demoPopularProducts[index].price,
                      priceAfetDiscount: demoPopularProducts[index].priceBeforDiscount,
                      dicountpercent: demoPopularProducts[index].dicountpercent,
                      press: () {
                        ProductModel item=demoPopularProducts[index];
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  ProductDetailsScreen(productItem: item)),
                        );                },
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: defaultPadding),
            )
          ],
        ),
      ),
    );
  }
}
