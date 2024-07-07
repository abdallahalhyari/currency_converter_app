import 'package:currency_converter_app/models/country_model.dart';
import 'package:currency_converter_app/utiltes/Size_Config.dart';
import 'package:currency_converter_app/utiltes/constant.dart';
import 'package:currency_converter_app/utiltes/theme/colors.dart';
import 'package:flutter/material.dart';


// Used in both of currency list screens.

class CurrencyListWidget extends StatelessWidget {
  final Color currencyNameColor;
  final List<CountryModel> countries;
  CurrencyListWidget({required this.currencyNameColor,required this.countries});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: currencyNameColor,
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(4),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.pop(
                  context,
                  index,
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Wrap(
                  children: [
                    Image.network('https://flagcdn.com/16x12/${countries[index].id.toLowerCase()}.png'),
                    const SizedBox(width: 6),
                    RichText(
                      text: TextSpan(
                        text: '${countries[index].currencyName} ',
                        style: TextStyle(
                          color: currencyNameColor==AppColors.kPrimaryColor?AppColors.kSecondaryColor:AppColors.kPrimaryColor,
                          fontSize: 15,
                          letterSpacing: 2,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: countries[index].alpha3,
                            style: TextStyle(
                              color: currencyNameColor.withOpacity(0.5),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: countries.length,
        ),
      ),
    );
  }
}
