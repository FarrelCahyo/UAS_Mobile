import 'dart:developer';

import 'package:flutter/foundation.dart';
import '../exceptions/currency_exceptions.dart';
import '../model/currency_model.dart';
import '../model/custom_error.dart';
import '../services/currency_api_services.dart';

class CurrencyRepository {
  final CurrencyApiServices currencyApiServices;
  CurrencyRepository({
    required this.currencyApiServices,
  });

  Future<List<String>> fetchCodes(int? codeOrName) async {
    try {
      final codes = await currencyApiServices.getCodes(codeOrName);
      if (kDebugMode) {
        log('informasi nilai tukar: $codes');
      }

      return codes;
    } on CurrencyException catch (e) {
      throw CustomError(errMsg: e.message);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }

  Future<CurrencyModel> fetchCurrency(
      String currency1, String currency2) async {
    try {
      final currency =
          await currencyApiServices.getCurrency(currency1, currency2);
      if (kDebugMode) {
        log('Informasi nilai tukar: $currency');
      }

      return currency;
    } on CurrencyException catch (e) {
      throw CustomError(errMsg: e.message);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}
