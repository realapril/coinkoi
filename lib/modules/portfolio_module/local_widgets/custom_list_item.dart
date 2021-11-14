import 'package:flutter/cupertino.dart';

//https://www.codegrepper.com/code-examples/dart/custom+listtile+flutter
// class CustomListItem extends StatelessWidget {
//   const CustomListItem({
//     this.thumbnail,
//     this.title,
//     this.user,
//     this.viewCount,
//   });
//
//   final Widget thumbnail;
//   final String title;
//   final String user;
//   final int viewCount;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Expanded(
//             flex: 2,
//             child: thumbnail,
//           ),
//           Expanded(
//             flex: 3,
//             child: _VideoDescription(
//               title: title,
//               user: user,
//               viewCount: viewCount,
//             ),
//           ),
//           const Icon(
//             Icons.more_vert,
//             size: 16.0,
//           ),
//         ],
//       ),
//     );
//   }
// }