import 'package:currency_converter_app/models/exchange_rate_model.dart';
import 'package:currency_converter_app/modules/historical/bloc/historical_bloc.dart';
import 'package:currency_converter_app/utiltes/date.dart';
import 'package:currency_converter_app/utiltes/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HistoricalView extends StatelessWidget {
  const HistoricalView({super.key});

  @override
  Widget build(BuildContext context) {
    HistoricalBloc historicalBloc = context.read<HistoricalBloc>();
    return Scaffold(
        body: Center(
            child: BlocBuilder<HistoricalBloc, HistoricalState>(
              builder: (context, state) {
                return state is HistoricalInitial?const SpinKitHourGlass(color:AppColors.kPrimaryColor):
                Column(
                  children: [
                    Expanded(
                      child: SfCartesianChart(
                          primaryXAxis: const CategoryAxis(
                            autoScrollingMode: AutoScrollingMode.start,
                            labelStyle: TextStyle(fontSize: 4),),
                          series: <CartesianSeries>[
                            ColumnSeries<ExchangeRateModel, String>(
                              color: Colors.blue.shade800,

                                dataSource: historicalBloc.data!['USD_JOD'],
                                xValueMapper: (ExchangeRateModel data, _) => DateFunctions.formatDate(data.date),
                                yValueMapper: (ExchangeRateModel data, _) => data.rate
                            ),
                            ColumnSeries<ExchangeRateModel, String>(
                                color: Colors.green.shade800,
                                dataSource: historicalBloc.data!['JOD_USD'],
                                xValueMapper: (ExchangeRateModel data, _) =>DateFunctions.formatDate(data.date),
                                yValueMapper: (ExchangeRateModel data, _) => data.rate
                            ),
                          ]
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(

                        children: [
                          const Spacer(),
                          CircleAvatar(maxRadius: 15,backgroundColor:Colors.blue.shade800 ,),
                          const SizedBox(width: 10,),
                          const Text('JOD'),
                          const Spacer(),
                          CircleAvatar(maxRadius: 15,backgroundColor:Colors.green.shade800,),
                          const SizedBox(width: 10,),
                          const Text('USD'),
                          const Spacer()
                        ],
                      ),
                    )
                  ],
                );
              },
            )
        )
    );
  }
}



