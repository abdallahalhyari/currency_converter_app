import 'dart:ui';

import 'package:currency_converter_app/injection_container.dart';
import 'package:currency_converter_app/modules/conversion/bloc/conversion_bloc.dart';
import 'package:currency_converter_app/modules/historical/bloc/historical_bloc.dart';
import 'package:currency_converter_app/modules/historical/view/historical_view.dart';
import 'package:currency_converter_app/utiltes/Size_Config.dart';
import 'package:currency_converter_app/utiltes/theme/colors.dart';
import 'package:currency_converter_app/widgets/CurrencyListWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart' as transition;

class ConversionView extends StatelessWidget {
  const ConversionView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ConversionBloc conversionBloc = context.read<ConversionBloc>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.kPrimaryColor,
          child: const Icon(
            Icons.bar_chart,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              transition.PageTransition(
                type: transition.PageTransitionType.rightToLeft,
                child: BlocProvider(
                  create: (context) =>
                      getIt.get<HistoricalBloc>()..add((GetHistoricalData())),
                  child: const HistoricalView(),
                ),
              ),
            );
          }),
      body: SingleChildScrollView(
        child: SizedBox(
          height:SizeConfig.screenHeight,
          child: Stack(
            children: <Widget>[
              BlocBuilder<ConversionBloc, ConversionState>(
                builder: (context, state) {
                  return state is ConversionInitial
                      ? const SpinKitHourGlass(color:AppColors.kPrimaryColor)
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                color: AppColors.kPrimaryColor,
                                child: Column(
                                  children: <Widget>[
                                  const  Spacer(),
                                    GestureDetector(
                                      onTap: () async {
                                        var selectedCurrency =
                                        await Navigator.push(
                                          context,
                                          transition.PageTransition(
                                            type: transition
                                                .PageTransitionType.rightToLeft,
                                            child: CurrencyListWidget(
                                              countries: conversionBloc.countries,
                                              currencyNameColor:
                                              AppColors.kPrimaryColor,
                                            ),
                                          ),
                                        );
                                        conversionBloc.add(TopSelectCountry(
                                            index: selectedCurrency));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            conversionBloc
                                                .countries[conversionBloc
                                                .tobSelectedCountryIndex]
                                                .currencyName,
                                            style: AppColors.kCurrencyNameStyle
                                                .copyWith(
                                                color:
                                                AppColors.kSecondaryColor,
                                                fontSize: 26),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(width: 10),
                                          Image.network(
                                              'https://flagcdn.com/16x12/${conversionBloc.countries[conversionBloc.tobSelectedCountryIndex].id.toLowerCase()}.png'),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 60,
                                          child: TextField(
                                            controller: conversionBloc
                                                .textEditingAmountController,
                                            onChanged: (value) {},
                                            onSubmitted: (value) {
                                              conversionBloc
                                                  .add(GetResultConversion());
                                            },
                                            style: const TextStyle(
                                              fontSize: 26,
                                              color:
                                                  AppColors.kSecondaryColor,
                                            ),
                                            decoration: const InputDecoration(
                                              counterText: '',
                                              border: UnderlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              hintText: '0',
                                              hintMaxLines: 1,
                                              hintStyle: TextStyle(
                                                color:
                                                    AppColors.kSecondaryColor,
                                              ),
                                            ),
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            maxLength: 6,
                                            //   maxLengthEnforced: true,
                                            cursorColor:
                                                AppColors.kSecondaryColor,
                                            keyboardType:
                                                TextInputType.number,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          conversionBloc
                                              .countries[conversionBloc
                                                  .tobSelectedCountryIndex]
                                              .currencySymbol,
                                          style: AppColors.kCurrencyCodeStyle
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      conversionBloc
                                          .countries[conversionBloc
                                              .tobSelectedCountryIndex]
                                          .id,
                                      style: AppColors.kCurrencyCodeStyle
                                          .copyWith(
                                              color: Colors.white,
                                              fontSize: 24),
                                    ),
                                    const  Spacer(),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: AppColors.kSecondaryColor,
                                child: Column(
                                  children: <Widget>[
                                   const Spacer(),
                                    GestureDetector(
                                      onTap: () async {
                                        var selectedCurrency =
                                        await Navigator.push(
                                          context,
                                          transition.PageTransition(
                                            type: transition
                                                .PageTransitionType.rightToLeft,
                                            child: CurrencyListWidget(
                                              countries: conversionBloc.countries,
                                              currencyNameColor:
                                              AppColors.kSecondaryColor,
                                            ),
                                          ),
                                        );
                                        conversionBloc.add(BottomSelectCountry(
                                            index: selectedCurrency));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            conversionBloc
                                                .countries[conversionBloc
                                                .bottomSelectedCountryIndex]
                                                .currencyName,
                                            style: AppColors.kCurrencyNameStyle
                                                .copyWith(
                                                color:AppColors.kPrimaryColor,
                                                fontSize: 26),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(width: 10),
                                          Image.network(
                                              'https://flagcdn.com/16x12/${conversionBloc.countries[conversionBloc.bottomSelectedCountryIndex].id.toLowerCase()}.png')
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 40),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: <Widget>[
                                        Text(
                                          conversionBloc.finalResult,
                                          style: const TextStyle(
                                              color: AppColors.kPrimaryColor,
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          conversionBloc
                                              .countries[conversionBloc
                                                  .bottomSelectedCountryIndex]
                                              .currencySymbol,
                                          style: AppColors.kCurrencyCodeStyle
                                              .copyWith(
                                                  color:
                                                      AppColors.kPrimaryColor,
                                                  fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      conversionBloc
                                          .countries[conversionBloc
                                              .bottomSelectedCountryIndex]
                                          .id,
                                      style: AppColors.kCurrencyCodeStyle
                                          .copyWith(
                                              color: AppColors.kPrimaryColor,
                                              fontSize: 24),
                                    ),
                                   const Spacer()
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
