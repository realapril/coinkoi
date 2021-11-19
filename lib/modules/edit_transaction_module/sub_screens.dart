
import 'package:coinkoi/core/style/txt_style.dart';
import 'package:flutter/material.dart';

class SubScreens{
  Widget buyAndSellView(int idx) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('Price Per Coin', style: TxtStyle.body3),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                        // controller: _controller,
                          decoration: const InputDecoration.collapsed(
                            hintText: 'ss',
                            ),
                          // onChanged: (value) => csController.runFilter(value),
                          ),
                      ),
                      ),

                    ],
                  ),

                  const Divider(),
                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Quantity', style: TxtStyle.body3),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          // controller: _controller,
                          decoration: const InputDecoration.collapsed(
                            hintText: 'ss',
                          ),
                          // onChanged: (value) => csController.runFilter(value),
                        ),
                      ),
                      Text('LUNA'),

                    ],
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Total Spent', style: TxtStyle.body3),
                  ),
                  TextField(
                    decoration: const InputDecoration.collapsed(
                      hintText: 'ss',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Date', style: TxtStyle.body3),
                  ),




                ],
              ),
            ),
          ]),
        )
    );
  }

  Widget transferView() {
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [

                ],
              ),
            ),
          ]),
        )
    );
  }
}