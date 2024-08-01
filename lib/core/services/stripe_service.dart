// ignore_for_file: avoid_print
import 'package:capstone_project_mobile/constants/api_route_constant.dart';
import 'package:capstone_project_mobile/core/model/dto/create_payment_intent.dart';
import 'package:capstone_project_mobile/core/services/http_service.dart';
import 'package:capstone_project_mobile/utils/api_helper.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  StripeService._();

  static final StripeService instance = StripeService._();

  Future<void> makePayment(CreatePaymentIntent body) async {
    try {
      int amountInCents = convertFromDollarToCent(body.amount);

      HttpService httpService =
          HttpService(path: '${ApiRoute.stripe.name}/create-payment-intent');
      var HttpResponse(:httpRes, :jsonData) = await httpService.httpPost(
        body: {
          'amount': amountInCents,
          'currency': body.currency,
        },
      );
      if (ApiHelper.isOk(httpRes.statusCode)) {
        String? paymentIntentClientSecret = jsonData['data']['client_secret'];
        if (paymentIntentClientSecret == null) return;
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: 'ChanTek Application',
        ));
        await _processPayment(
            amount: amountInCents, patientId: '63686861790123456789abcd');
      } else {
        throw jsonData;
      }
    } catch (e) {
      print('Error during payment: $e');
      rethrow;
    }
  }

  int convertFromDollarToCent(int amount) {
    return amount * 100;
  }

  Future<void> _processPayment(
      {required int amount, required String patientId}) async {
    try {
      await Stripe.instance.presentPaymentSheet();

      print('Payment successful!');
    } on StripeException catch (e) {
      print('Stripe error: ${e.error.localizedMessage}');
      throw {e.error.localizedMessage};
    } catch (e) {
      print('Payment error: $e');
      rethrow;
    }
  }
}
