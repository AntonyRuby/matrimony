// Expanded(
//   child: GridView.builder(
//     padding: const EdgeInsets.all(30.0),
//     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2,
//       crossAxisSpacing: 20.0,
//       mainAxisSpacing: 40.0,
//       childAspectRatio: 0.90,
//     ),
//     itemCount: _searchResults.length,
//     itemBuilder: (context, index) {
//       final user = _searchResults[index];
//       return GestureDetector(
//         onTap: () => Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (_) => ProfileScreen(
//               user: {
//                 'id': index,
//                 'name': user.name,
//                 'age': user.age,
//                 'image': user.image,
//                 'caste': user.caste,
//               },
//             ),
//           ),
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10.0),
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.shade400,
//                 blurRadius: 25.0,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: Stack(
//                   children: [
//                     Positioned.fill(
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10.0),
//                           image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image: NetworkImage(user.image),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 10.0,
//                       left: 10.0,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 10.0,
//                           vertical: 5.0,
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10.0),
//                           color: Colors.white.withOpacity(0.8),
//                         ),
//                         child: const Text(
//                           'New',
//                           style: TextStyle(
//                             color: Colors.red,
//                             fontSize: 12.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 10.0),
//               Text(
//                 user.name,
//                 style: const TextStyle(
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 5.0),
//               Text(
//                 '${user.age} years',
//                 style: const TextStyle(
//                   fontSize: 14.0,
//                   color: Colors.grey,
//                 ),
//               ),
//               const SizedBox(height: 5.0),
//               Text(
//                 user.caste,
//                 style: const TextStyle(
//                   fontSize: 14.0,
//                   color: Colors.grey,
//                 ),
//               ),
//               const SizedBox(height: 10.0),
//             ],
//           ),
//         ),
//       );
//     },
//   ),
// ),
