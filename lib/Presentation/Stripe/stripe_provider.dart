import 'dart:convert';
import 'package:flutter_code_structure/config/app_url.dart';
import 'package:flutter_code_structure/config/flutter_toast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_stripe/flutter_stripe.dart';



class StripeProvider extends ChangeNotifier{
  String _transactionId = '';
  Map<String, dynamic>? paymentIntent;
  bool isPaymentSheetLoading = false;

  void setPaymentSheetLoading(bool loading) {
    isPaymentSheetLoading = loading;
    notifyListeners();
  }

  Future<void> makePayment(
      {
        required String bookingID,
        required String requestType,
        required double price,
        required BuildContext context,
      }) async {
    setPaymentSheetLoading(true);
    try {
      // Create payment intent data
      paymentIntent =
      await createPaymentIntent(price.toString(), 'USD'); // Amount in USD (e.g., $1)
      // Initialise the payment sheet setup
      _transactionId = paymentIntent!['client_secret'].toString();
      // print("Transaction ID: ${paymentIntent!['id']}");
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Client secret key from payment data
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          googlePay: const PaymentSheetGooglePay(
            // Currency and country code are according to India
            testEnv: true,
            currencyCode: "USD",
            merchantCountryCode: "US",
          ),
          // Merchant Name
          merchantDisplayName: 'Flutterwings',
          // return URL if you want to add
          // returnURL: 'flutterstripe://redirect',
        ),
      );
      // Display payment sheet
      await displayPaymentSheet(
          context: context,
          price: price,
          bookingID: bookingID,
          requestType: requestType);
      setPaymentSheetLoading(false);
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print("Exception: $e");
      }
      if (e is StripeConfigException) {
        if (kDebugMode) {
          print("Stripe exception: ${e.message}");
        }
      } else {
        if (kDebugMode) {
          print("Exception: $e");
        }
      }
      setPaymentSheetLoading(false);
      notifyListeners();
    }
  }

  Future<void> displayPaymentSheet(
      {
        required BuildContext context,
        required String bookingID,
        required String requestType,
        required double price}) async {
    try {
      await Stripe.instance.presentPaymentSheet();
      // AppConstant.
      FlutterToast.toastMessage(message: "Payment has been paid successfully",);
      print("this is request type ${requestType}");
      paymentIntent = null;
      notifyListeners();
    } on StripeException catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }

      FlutterToast.toastMessage(message: "Payment has been cancelled",isError: true);

      notifyListeners();
    } catch (e) {
      print("Error in displaying ::: ${e.toString()}");
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': ((double.parse(amount)) * 100)
            .toInt()
            .toString(), // Amount in cents
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      var response = await http.post(
        Uri.parse(AppUrl.stripeBaseUrl),
        headers: {
          'Authorization': 'Bearer ${AppUrl.stripeSecretKey}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );
      Map<String, dynamic> bodyData = jsonDecode(response.body);
      if (kDebugMode) {
        print("this is payment ${response.statusCode}");
        print("this is payment $bodyData");
        // print('Payment Intent Body: ${bodyData['error']['message']}');
      }
      return jsonDecode(response.body.toString());
    } catch (err) {
      setPaymentSheetLoading(false);
      if (kDebugMode) {
        print('Error charging user: ${err.toString()}');
      }
      return {};
    }
  }
}