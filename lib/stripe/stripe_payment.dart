// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:splinder/core/api/api_end_points.dart';
// import 'package:splinder/core/db/app_db.dart';
//
// import '../core/locator/locator.dart';
// import '../data/model/request/pre_register/pre_register_request_model.dart';
// import '../generated/l10n.dart';
// import '../ui/home/bloc/home_bloc.dart';
// import '../ui/offline/bloc/offline_bloc.dart';
//
// class StripePayment {
//   Map<String, dynamic>? paymentIntent;
//
//   //call this method on button from where you want to checkout for payment
//   Future<void> makePayment(
//       {String? amount, String? currencyType, String? type}) async {
//     try {
//       //STEP 1: Create Payment Intent
//       paymentIntent = await createPaymentIntent(amount, currencyType, type);
//
//       //STEP 2: Initialize Payment Sheet
//       await Stripe.instance
//           .initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           // billingDetails: BillingDetails(
//           //
//           //   name: appDB.user.name,
//           //   email: appDB.user.email,
//           //   phone: appDB.user.mobileNumber,
//           // ),
//
//           paymentIntentClientSecret: paymentIntent!['client_secret'],
//           customerId: appDB.user.stripeCustId,
//           //Gotten from payment intent
//           style: ThemeMode.light,
//
//           merchantDisplayName: S.current.splinder,
//         ),
//       )
//           .then((value) {
//         debugPrint('Stripe Initialized ');
//       }).onError((error, stackTrace) {
//         debugPrint('Stripe Error ${error.toString()}');
//       });
//
//       //STEP 3: Display Payment sheet
//       displayPaymentSheet(type);
//     } catch (err) {
//       throw Exception(err);
//     }
//   }
//
//   //this method will popup payment sheet
//   displayPaymentSheet(String? type) async {
//     try {
//       await Stripe.instance.presentPaymentSheet().then((value) async {
//         //call api or do anything here after payment successful
//         debugPrint('payment success ');
//
//         if (type == 'online') {
//           locator<HomeBloc>().add(
//               HomePaymentEvent(model: PreRegisterRequestModel(type: 'online')));
//         } else {
//           locator<OfflineBloc>().add(OfflinePaymentEvent(
//               model: PreRegisterRequestModel(type: 'offline')));
//         }
//
//         paymentIntent = null;
//       }).onError((error, stackTrace) {
//         throw Exception(error);
//       });
//     } on StripeException catch (e) {
//       debugPrint('Error is:---> $e');
//       AlertDialog(
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Row(
//               children: [
//                 Icon(
//                   Icons.cancel,
//                   color: Colors.red,
//                 ),
//                 Text(S.current.paymentFailed),
//               ],
//             ),
//           ],
//         ),
//       );
//     } catch (e) {
//       debugPrint('$e');
//     }
//   }
//
//   //create payment intent
//   Future<Map<String, dynamic>> createPaymentIntent(
//       String? amount, String? currency, String? type) async {
//     final userDetail = {
//       'userId': appDB.user.id,
//       'datingType': type,
//     };
//
//     try {
//       //Request body
//       Map<String, dynamic> body = {
//         'amount': calculateAmount(amount ?? ''),
//         'currency': currency,
//         'description': userDetail.toString(),
//         'customer': appDB.user.stripeCustId,
//       };
//
//       //Make post request to Stripe
//       var response = await http.post(
//         Uri.parse(APIEndPoints.stripePaymentIntentUrl),
//         headers: {
//           'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
//           'Content-Type': 'application/x-www-form-urlencoded'
//         },
//         body: body,
//       );
//       debugPrint('Payment Intent Body: ${response.body.toString()}');
//       return jsonDecode(response.body);
//     } catch (err) {
//       throw Exception(err.toString());
//     }
//   }
//
//   //calculate Amount
//   String calculateAmount(String amount) {
//     final calculatedAmount = (int.parse(amount)) * 100;
//     return calculatedAmount.toString();
//   }
// }
