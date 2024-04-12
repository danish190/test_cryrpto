import 'package:flutter/material.dart';
import 'package:test_project/l10n/l10n.dart';
import 'package:test_project/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../controller /crypto_assets_controller.dart';
import '../../generated/assets.gen.dart';
import '../../utils/colors.dart';

/// {@template crypto_stats_page}
///  Page that hanldes the user interface for crypto stats feature.
/// {@endtemplate}
class CryptoStatsPage extends StatelessWidget {
  /// {@macro crypto_stats_page}
  const CryptoStatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: homePageColor,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(
                  text: 'Welcome',
                  size: 15,
                  maxLine: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(
                      text: 'Elian Ortega ',
                      fontWeight: FontWeight.w700,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.jpeg'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: containerBackgroundColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: 'Balance',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      BigText(
                        text: '\$450.933',
                        color: Colors.white,
                        size: 20,
                        fontWeight: FontWeight.w800,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(
                            text: 'Monthly Profit',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: BigText(
                                  text: '\$12.933',
                                  color: Colors.white,
                                  size: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: containerChildBackgroundColor,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_drop_up_rounded,
                                      color: iconColor,
                                      size: 25,
                                    ),
                                    BigText(
                                      text: '10%',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                BigText(
                  text: 'Live Prices',
                  size: 15,
                  maxLine: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
          
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 240,
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: cryptoAssetsContainerBackground,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child:
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    Image.asset(Assets.images.btc.path, height: 40),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    BigText(text: '47899.00',
                                    color: Colors.black,
                                      size: 20,
                                      fontWeight: FontWeight.w800,
                                    ),
                                    Spacer(),
                                    BigText(text: 'SELL',
                                      size: 13,
                                    ),
          
          
                                  ],
                                ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                BigText(text: 'Crypto Assets'),
                SizedBox(height: 20,),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: GetBuilder<CryptoAssetsController>(
                    init: CryptoAssetsController(),

                    builder: ( cryptoAssetsObj) {
                      return ListView.builder(
                          itemCount: cryptoAssetsObj.assetId.length,
                          itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0.0, 0.75)
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: cryptoAssetsContainerBackground,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 30 ,
                                  width: 40,
                                  child: Image.network(cryptoAssetsObj.urls[index],),
                                ),
  SizedBox(
    width: 100,
  ),
                                BigText(text: cryptoAssetsObj.assetId[index]),


                              ],
                            ),
                          ),
                        );
                      }
                      );
                    }
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
