import 'package:coinkoi/modules/portfolio_module/local_widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PortfolioScreen extends StatefulWidget{
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  _Portfolio createState()=> _Portfolio();
}

class _Portfolio extends State<PortfolioScreen>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(), //_renderHeaderWidget,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              // child: Obx(
              //       ()=> Column(
              //       children: <Widget>[
              //         Row(
              //           children: [
              //             Text('My Portfolio'),
              //             Spacer(),
              //             const Icon(
              //                 Icons.blur_off_rounded
              //             ),
              //           ],
              //         ),
              //
              //         Row(
              //           children: [
              //             Text('\$'),
              //             Text('111')
              //           ],
              //         ),
              //
              //         Row(
              //           children: [
              //             Text('Total Profit/Loss:'),
              //             Spacer(),//flex:2
              //             Text('\$'),
              //             Text('111'+'%'),
              //           ],
              //         ),
              //
              //
              //       ]
              //   ),
              // ),
            )
        ),
      ),
    );
  }
}

// Widget testWidget(){
//   RaisedButton(
//     onPressed: (){
//       // Get.toNamed("/detailPortfolio", arguments: {"symbol":"BTC"});
//       Get.toNamed("/detailPortfolio", arguments: Coin( id: 1, name: "Bitcoin", symbol: "BTC"));
//     },
//     child: Text("move to detail protfolio"),)
// }



class PortfolioController extends GetxController {
  final _selectedIndex = 0.obs;
  get selectedIndex => _selectedIndex.value;
  set selectedIndex(index) => _selectedIndex.value= index;

}

// class PortfolioListView extends StatefulWidget{
//   const PortfolioListView({Key? key}) : super(key: key);
//   @override
//   _PortfolioListView createState()=> _PortfolioListView();
// }
// class _PortfolioListView extends State<PortfolioListView>{
//   @override
//   Widget build(BuildContext context) {
//     // final dao = Provider.of<ScalePlanDao>(context, listen: false);
//     return Scaffold(
//         body: StreamBuilder<List<WholeScalePlanData>>(
//           stream: dao.watchAllWPlans(),
//           builder: (context, snapshot){
//             if(snapshot.hasData){
//               final data = snapshot.data!;
//               return ListView.separated(
//                   itemBuilder: (_, index) {
//                     final item = data[index];
//                     return SavedPlanCard(
//                       title: item.name,
//                       createdAt: item.updatedAt,
//                     );
//                   },
//                   separatorBuilder: (_, index) {
//                     return Divider();
//                   },
//                   itemCount: data.length);
//             }else{
//               return Container();
//             }
//           },
//         )
//     );
//   }
// }