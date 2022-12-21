import 'package:flutter/material.dart';
import 'package:uas_farrel/widgets/buttomnav.dart';
import 'package:uas_farrel/cubits/currency/currency_cubit.dart';
import 'package:uas_farrel/repositories/currency_repository.dart';
import 'package:uas_farrel/services/currency_api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) =>
          CurrencyRepository(currencyApiServices: CurrencyApiServices()),
      child: BlocProvider(
        create: (context) => CurrencyCubit(
            currencyRepository: context.read<CurrencyRepository>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'UAS MOBILE',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: const BottomNav(
            title: '',
          ),
        ),
      ),
    );
  }
}
