import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyTransactionPage(),
    );
  }
}

class MyTransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    double height = mediaQuery.size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: const Color(0xFF7775F8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {},
                    color: Colors.black,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'MyTransaction',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                width: width * 0.9,
                height: height * 0.7,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 150,
                          height: 28,
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownButton<String>(
                            value: 'last week',
                            underline: Container(),
                            onChanged: (_) {},
                            items: <String>[
                              'last week',
                              'last month',
                              'last year'
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Container(
                                  width: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        value,
                                        style: const TextStyle(fontSize: 14),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      if (value == 'last week')
                                        Image.asset(
                                          'assets/images/vector_icon.jpg',
                                          width: 12.75,
                                          height: 12.75,
                                          alignment: Alignment.topLeft,
                                          gaplessPlayback: true,
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          ..._buildTransactionList(),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTransactionList() {
    return [
      _buildTransactionItem(
          'Amount Deposited', '+ ₹ 500', 'August 9, 2023 at 2.07pm'),
      _buildTransactionItem('Entry Paid', '- ₹ 20', 'August 9, 2023 at 2.07pm'),
      _buildTransactionItem('Offer Applied', '+ ₹ 20', 'August 9, 2023 at 2.07pm'),
      _buildTransactionItem(
          'Amount withdrawal', '- ₹ 200', 'August 9, 2023 at 2.07pm'),
      _buildTransactionItem(
          'Amount Deposited', '+ ₹ 500', 'August 9, 2023 at 2.07pm'),
      _buildTransactionItem(
          'Amount Deposited', '+ ₹ 500', 'August 9, 2023 at 2.07pm'),
      _buildTransactionItem(
          'Amount Deposited', '+ ₹ 500', 'August 9, 2023 at 2.07pm'),
    ];
  }

  Widget _buildTransactionItem(String title, String amount, String date) {
    return Container(
      width: double.infinity,
      height: 80,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(date, style: TextStyle(fontSize: 14)),
            ],
          ),
          Text(
            amount,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
