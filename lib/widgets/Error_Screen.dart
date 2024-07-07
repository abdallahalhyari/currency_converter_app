
import 'package:currency_converter_app/utiltes/Size_Config.dart';
import 'package:currency_converter_app/widgets/InfoText.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final int errorStatusCode;
  final String requestUrl;

  ErrorScreen({required this.errorStatusCode, required this.requestUrl});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      // backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Center(
                      child: Icon(
                        Icons.report,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                               10,
                              0,
                             10,
                              1.5),
                          child: Text(
                            'Error response code : $errorStatusCode',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 6,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              10,
                              1.5,
                              10,
                              0),
                          child: Text(
                            'Requested Exchange : $requestUrl',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Sorry for this inconvenience.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 4,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        5,
                        2,
                        5,
                        2),
                    child: InfoText(
                      firstText:
                          'Please contact the developer regarding this inconvenience. The most effective and easiest way of doing this is taking a screenshot and then mailing it to',
                      secondText: 'alhyariabdallh@gmail.com',
                      thirdText: 'Thanks for your patience.',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
