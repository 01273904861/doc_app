// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive/hive.dart';

// class PaymentCubit extends Cubit<Map<String, String?>> {
//   final Box box;

//   PaymentCubit(this.box)
//       : super(
//           {'method': null, 'card': null},
//         ) {
//     loadData(); // Load saved data when app starts
//   }

//   void selectMethod(String method) {
//     emit({'method': method, 'card': null}); // Reset card when changing method
//   }

//   void selectCard(String card) {
//     emit({'method': state['method'], 'card': card});
//   }

//   void saveData() {
//     box.put('method', state['method']);
//     box.put('card', state['card']);
//   }

//   void loadData() {
//     emit({
//       'method': box.get('method', defaultValue: null),
//       'card': box.get('card', defaultValue: null)
//     });
//   }
// }

// class PaymentScreen extends StatelessWidget {
//   final List<PaymentOption> paymentOptions = [
//     PaymentOption(
//         name: "Credit Card",
//         cards: ["Master Card", "American Express", "Capital One", "Barclays"]),
//     PaymentOption(name: "Bank Transfer", cards: []),
//     PaymentOption(name: "Paypal", cards: []),
//   ];

//   const PaymentScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Payment Option")),
//       body: BlocBuilder<PaymentCubit, Map<String, String?>>(
//         builder: (context, state) {
//           String? selectedMethod = state['method'];
//           String? selectedCard = state['card'];

//           return Padding(
//             padding: const EdgeInsets.all(16.0)
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text("Payment Option",,//first child
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

//                 // Payment Method List
//                 ...paymentOptions.map((option) {//second child
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       RadioListTile<String>(
//                         title: Text(option.name),
//                         value: option.name,
//                         groupValue: selectedMethod,
//                         onChanged: (value) {
//                           context.read<PaymentCubit>().selectMethod(value!);
//                         },
//                       ),

//                       // Show available cards when method is selected
//                       if (selectedMethod == option.name &&
//                           option.cards.isNotEmpty)
//                         Padding(
//                           padding: const EdgeInsets.only(left: 40.0, top: 4.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: option.cards.map((card) {
//                               return TextButton(
//                                 onPressed: () {
//                                   context.read<PaymentCubit>().selectCard(card);
//                                 },
//                                 child: Text(
//                                   card,
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: card == selectedCard
//                                         ? Colors.blue
//                                         : Colors.black,
//                                     fontWeight: card == selectedCard
//                                         ? FontWeight.bold
//                                         : FontWeight.normal,
//                                   ),
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                     ],
//                   );
//                 }),

//                 // Save Button
//                 ElevatedButton(
//                   onPressed: () {
//                     context.read<PaymentCubit>().saveData();
//                     ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text("Payment Option Saved")));
//                   },
//                   child: const Text("Save Selection"),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class PaymentOption {
//   final String name;
//   final List<String> cards;

//   PaymentOption({required this.name, required this.cards});
// }
