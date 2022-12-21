import 'dart:developer';
import 'package:uas_farrel/cubits/currency/currency_cubit.dart';
import 'package:uas_farrel/widgets/custom_textbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_choices/search_choices.dart';
import '../widgets/error_dialog.dart';

class KursPage extends StatefulWidget {
  const KursPage({Key? key}) : super(key: key);

  @override
  State<KursPage> createState() => _KursPageState();
}

class _KursPageState extends State<KursPage> {
  final _formKey = GlobalKey<FormState>();
  bool isValidating = false;
  bool isSwapping = true;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  double? inputValue;

  String? value1;
  String? value2;

  @override
  void initState() {
    _fetchCodes(0);
    value1 = 'USD';
    value2 = 'IDR';
    _fetchInitial();
    super.initState();
  }

  Future<dynamic> _fetchInitial() async {
    var currency =
        await context.read<CurrencyCubit>().fetchCurrency(value1!, value2!);
    return currency;
  }

  Future<List<String>> _fetchCodes(int? codeOrName) async {
    var codes = await context.read<CurrencyCubit>().fetchCodes(codeOrName);
    return codes;
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text("Konversi Mata Uang",
              style: TextStyle(
                color: Colors.white,
              )),
          automaticallyImplyLeading: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 120.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextBox(
                      onPress: () {
                        Navigator.of(context).pop();
                        context
                            .read<CurrencyCubit>()
                            .fetchCurrency(value1!, value2!);
                      },
                      value: value1,
                      child: SearchChoices.single(
                        items: context
                            .read<CurrencyCubit>()
                            .state
                            .codes!
                            .map(dropDownItems)
                            .toList(),
                        hint: "Pilih Mata Uang",
                        searchHint: "Cari",
                        closeButton: '',
                        doneButton: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Selesai')),
                        onChanged: (value) {
                          if (value!.compareTo(value1!) == 0) {
                            return;
                          } else {
                            setState(() {
                              value1 = value;
                            });
                          }
                        },
                        displayItem: (item, selected) {
                          return Row(
                            children: [
                              selected
                                  ? const Icon(
                                      Icons.radio_button_checked,
                                      color: Colors.deepPurple,
                                    )
                                  : const Icon(
                                      Icons.radio_button_unchecked,
                                      color: Colors.deepPurple,
                                    ),
                              const SizedBox(width: 7),
                              item,
                            ],
                          );
                        },
                        isExpanded: true,
                        dropDownDialogPadding: const EdgeInsets.all(50),
                      ),
                    ),
                    SizedBox(width: 20),
                    IconButton(
                      // hoverColor: Colors.grey,
                      icon: const Icon(
                        Icons.swap_horizontal_circle_sharp,
                        size: 30,
                        color: Colors.deepPurple,
                      ),
                      onPressed: () {
                        setState(() {
                          isSwapping = !isSwapping;
                          final temp = value1;
                          value1 = value2;
                          value2 = temp;
                        });
                        value1 != value2
                            ? context
                                .read<CurrencyCubit>()
                                .fetchCurrency(value1!, value2!)
                            : null;
                      },
                    ),
                    const SizedBox(width: 28),
                    CustomTextBox(
                      onPress: () {
                        Navigator.of(context).pop();
                        context
                            .read<CurrencyCubit>()
                            .fetchCurrency(value1!, value2!);
                      },
                      value: value2,
                      child: SearchChoices.single(
                        items: context
                            .read<CurrencyCubit>()
                            .state
                            .codes!
                            .map(dropDownItems)
                            .toList(),
                        hint: "Pilih Mata Uang",
                        searchHint: "Cari",
                        closeButton: '',
                        doneButton: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Selesai')),
                        onChanged: (value) {
                          if (value!.compareTo(value2!) == 0) {
                            return;
                          } else {
                            setState(() {
                              value2 = value;
                            });
                          }
                        },
                        displayItem: (item, selected) {
                          return Row(
                            children: [
                              selected
                                  ? const Icon(
                                      Icons.radio_button_checked,
                                      color: Colors.deepPurple,
                                    )
                                  : const Icon(
                                      Icons.radio_button_unchecked,
                                      color: Colors.deepPurple,
                                    ),
                              const SizedBox(width: 7),
                              item,
                            ],
                          );
                        },
                        isExpanded: true,
                        dropDownDialogPadding: const EdgeInsets.all(50),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text('Besar Konversi Mata Uang: ',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
                const SizedBox(height: 20),
                BlocConsumer<CurrencyCubit, CurrencyState>(
                  listener: (context, state) {
                    if (state.fetchStatus == FetchStatus.error) {
                      errorDialog(context, state.error.errMsg);
                    }
                  },
                  builder: (context, state) {
                    if (state.fetchStatus == FetchStatus.loading) {
                      return const Center(
                          child: SizedBox(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(
                                color: Colors.deepPurple,
                              )));
                    }
                    return Text(
                        showExchangeRate(state.currencyModel.conversionRate),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20));
                  },
                ),
                const SizedBox(height: 27),
                Text(
                    'Update Terakhir: ${context.read<CurrencyCubit>().state.currencyModel.lastUpdate}'),
                const SizedBox(height: 30),
                Form(
                  key: _formKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          textCapitalization: TextCapitalization.words,
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                            labelText: 'Konversikan',
                            hintText: 'Total Uang yang akan dikonversi',
                            prefixIcon: const Icon(Icons.monetization_on),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          validator: (String? input) {
                            if (input!.isEmpty) {
                              return 'Silakan masukkan jumlah';
                            }
                            return null;
                          },
                          onSaved: (String? input) {
                            inputValue = double.parse(input!);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: 50,
                        width: 180,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                          ),
                          onPressed: () {
                            setState(() {
                              _submit();
                            });

                            inputValue != null &&
                                    inputValue!.compareTo(inputValue!) != 0
                                ? context
                                    .read<CurrencyCubit>()
                                    .fetchCurrency(value1!, value2!)
                                : null;
                          },
                          icon: const Icon(Icons.wifi_protected_setup),
                          label: const Text(
                            'Konversi',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  DropdownMenuItem<String> dropDownItems(String item) {
    return DropdownMenuItem(
      onTap: () => log(item),
      value: item,
      child: Text(
        item,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      ),
    );
  }

  String showExchangeRate(dynamic rate) {
    var result =
        context.read<CurrencyCubit>().state.currencyModel.conversionRate;

    if (inputValue == null) {
      return '1 $value1 = $result $value2';
    }

    return '$inputValue $value1 = ${result * (inputValue ?? 0)} $value2';
  }
}
