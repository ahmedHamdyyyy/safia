import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myfatoorah_flutter/MFUtils.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';
import 'package:safiaa/core/helpers/extensions_route.dart';
import 'package:safiaa/core/helpers/shred.dart';
import 'package:safiaa/core/helpers/spacing.dart';
import 'package:safiaa/core/recourses/routes_manger/const.dart';
import 'package:safiaa/core/widgets/custom_app_bar.dart';
import 'package:safiaa/features/orders/data/models/add_order_model.dart';

class Config {
  /*
TODO: The following API token key for testing only, so that when you go live
      don't forget to replace the following key with the live key provided by MyFatoorah.
      You can get the API Token Key from here:
      https://myfatoorah.readme.io/docs/test-token
*/
  static const String testAPIKey =
      'updxCXiFBakEjk1_nbiCICmpkE8RuAKYrPdBSEkyCc6BqwAgNM-FrdoyemRP4OVuVDuzLEm1X74iM-sXUn7KgYVps8JTQitCYrQaMcOw0i0X_NLsKPbpIfdNXEdCw93uhyQ4P9j_kg7kIY0dBDiCk7IGd3rwXgsamOiq0naSx-aZkRBTGselFO4ZP60ViGOknsih1wydNi3SrOoeC9xD79H-iwTgvAFNrd_iTs1piFq90FCrfFEYQlkEXdioSzkwU7rM9Kgt7wSvacgiYqCJyGeHAKNKyCEVacHFZ93TovEvdhuBqQG1huZC6leL7UwUTyAqcF8Q1kCqkMh_wj8A3nBYi2emAzIox7p_e_UPAUQq7oEVnAScOFMyDcZGor9-ILz-2RtDAbrjrzup6oNueC7FeWFspWWl-YmlwTGo-aXM8zrD3CGXfudhdLKIL0OcLQKscjVNbp9JUEnirUsbCB27tI8qhNpPghlygslfSMKPFqqZjw72_LQ1TY_OBPGoACN7P0klxTl_BiD0M2t4zn5dEJ1cpjsyl_RzhP1z5TCvWjgP8bKdff5al9RQ9O-_6pgJMCGxwUS6TI2I7isCFE735UoIzfZJOSMmr2bCC5CL7ofE1xVLExl7DVFuNsMm96R8_UDXWfP052kIAWbf5KMzVFnjtdmVMJ6jbvmsdmwTWmkyJBNjzYDvTmTZiGxEXB8pwg ';
// //TODO Get your google merchant id
//   static const String googleMerchantId = "your_google_merchant_id";
}

class PayMentPage extends StatefulWidget {
  const PayMentPage({super.key, required this.orderResponse});
  final OrderResponse orderResponse;

  @override
  State<PayMentPage> createState() => _PayMentPageState();
}

class _PayMentPageState extends State<PayMentPage> {
  String? _response = '';
  MFInitiateSessionResponse? session;

  List<MFPaymentMethod> paymentMethods = [];
  List<bool> isSelected = [];
  int selectedPaymentMethodIndex = -1;

  // double amount = 0;
  bool visibilityObs = false;
  late MFCardPaymentView mfCardView;
  late MFApplePayButton mfApplePayButton;
  // late MFGooglePayButton mfGooglePayButton;

  @override
  void initState() {
    super.initState();
    initiate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  initiate() async {
    if (Config.testAPIKey.isEmpty) {
      setState(() {
        _response =
            "Missing API Token Key.. You can get it from here: https://myfatoorah.readme.io/docs/test-token";
      });
      return;
    }

    // TODO, don't forget to init the MyFatoorah Plugin with the following line
    await MFSDK.init(
        Config.testAPIKey, MFCountry.SAUDIARABIA, MFEnvironment.LIVE);
    // (Optional) un comment the following lines if you want to set up properties of AppBar.
    // MFSDK.setUpActionBar(
    //     toolBarTitle: 'Company Payment',
    //     toolBarTitleColor: '#FFEB3B',
    //     toolBarBackgroundColor: '#CA0404',
    //     isShowToolBar: true);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initiateSessionForCardView();
      // await initiateSessionForGooglePay();
      await initiatePayment();
      // await initiateSession();
    });
  }

  log(Object object) {
    var json = const JsonEncoder.withIndent('  ').convert(object);
    setState(() {
      debugPrint(json);
      _response = json;
    });
  }

  // Initiate Payment
  initiatePayment() async {
    var request = MFInitiatePaymentRequest(
        invoiceAmount: widget.orderResponse.netPrice,
        currencyIso: MFCurrencyISO.SAUDIARABIA_SAR);

    await MFSDK
        .initiatePayment(request, MFLanguage.ENGLISH)
        .then((value) => {
              log(value),
              paymentMethods.addAll(value.paymentMethods!),
              for (int i = 0; i < paymentMethods.length; i++)
                isSelected.add(false)
            })
        .catchError((error) => {log(error.message)});
  }

  // Execute Regular Payment
  executeRegularPayment(int paymentMethodId) async {
    var request = MFExecutePaymentRequest(
        paymentMethodId: paymentMethodId,
        invoiceValue: widget.orderResponse.netPrice,
        userDefinedField: Shareds.getString(prefsKeyOrderId).toString());
    request.displayCurrencyIso = MFCurrencyISO.SAUDIARABIA_SAR;

    await MFSDK
        .executePayment(request, MFLanguage.ENGLISH, (invoiceId) {
          log(invoiceId);
        })
        .then((value) => log(value))
        .catchError((error) => {log(error.message)});
  }

  setPaymentMethodSelected(int index, bool value) {
    for (int i = 0; i < isSelected.length; i++) {
      if (i == index) {
        isSelected[i] = value;
        if (value) {
          selectedPaymentMethodIndex = index;
          visibilityObs = paymentMethods[index].isDirectPayment!;
        } else {
          selectedPaymentMethodIndex = -1;
          visibilityObs = false;
        }
      } else {
        isSelected[i] = false;
      }
    }
  }

  executePayment() {
    if (selectedPaymentMethodIndex == -1) {
      setState(() {
        _response = "Please select payment method first";
      });
    } else {
      if (widget.orderResponse.netPrice == 0) {
        setState(() {
          _response = "Set the amount";
        });
      } else {
        executeRegularPayment(
            paymentMethods[selectedPaymentMethodIndex].paymentMethodId!);
      }
    }
  }

  MFCardViewStyle cardViewStyle() {
    MFCardViewStyle cardViewStyle = MFCardViewStyle();
    cardViewStyle.cardHeight = 240;
    cardViewStyle.hideCardIcons = false;
    cardViewStyle.backgroundColor = getColorHexFromStr("#ccd9ff");
    cardViewStyle.input?.inputMargin = 3;
    cardViewStyle.label?.display = true;
    cardViewStyle.input?.fontFamily = MFFontFamily.TimesNewRoman;
    cardViewStyle.label?.fontWeight = MFFontWeight.Light;
    cardViewStyle.savedCardText?.saveCardText = "حفظ بيانات البطاقة";
    cardViewStyle.savedCardText?.addCardText = "استخدام كارت اخر";
    MFDeleteAlert deleteAlertText = MFDeleteAlert();
    deleteAlertText.title = "حذف البطاقة";
    deleteAlertText.message = "هل تريد حذف البطاقة";
    deleteAlertText.confirm = "نعم";
    deleteAlertText.cancel = "لا";
    cardViewStyle.savedCardText?.deleteAlertText = deleteAlertText;
    return cardViewStyle;
  }

  initiateSessionForCardView() async {
    MFInitiateSessionRequest initiateSessionRequest =
        MFInitiateSessionRequest(customerIdentifier: "123");

    await MFSDK
        .initSession(initiateSessionRequest, MFLanguage.ENGLISH)
        .then((value) => loadEmbeddedPayment(value))
        .catchError((error) => {log(error.message)});
  }

  loadCardView(MFInitiateSessionResponse session) {
    mfCardView.load(session, (bin) {
      log(bin);
    });
  }

  loadEmbeddedPayment(MFInitiateSessionResponse session) async {
    MFExecutePaymentRequest executePaymentRequest = MFExecutePaymentRequest(
        invoiceValue: widget.orderResponse.netPrice,
        userDefinedField: Shareds.getString(prefsKeyOrderId).toString());
    executePaymentRequest.displayCurrencyIso = MFCurrencyISO.SAUDIARABIA_SAR;
    await loadCardView(session);
    if (Platform.isIOS) {
      applePayPayment(session);
    }
  }

  applePayPayment(MFInitiateSessionResponse session) async {
    MFExecutePaymentRequest executePaymentRequest = MFExecutePaymentRequest(
        invoiceValue: widget.orderResponse.netPrice,
        userDefinedField: Shareds.getString(prefsKeyOrderId).toString());
    executePaymentRequest.displayCurrencyIso = MFCurrencyISO.SAUDIARABIA_SAR;

    await mfApplePayButton
        .displayApplePayButton(
            session, executePaymentRequest, MFLanguage.ENGLISH)
        .then((value) => {
              log(value),
            })
        .catchError((error) => {log(error.message)});
  }

  pay() async {
    var executePaymentRequest = MFExecutePaymentRequest(
        invoiceValue: widget.orderResponse.netPrice,
        userDefinedField: Shareds.getString(prefsKeyOrderId).toString());

    await mfCardView.pay(executePaymentRequest, MFLanguage.ENGLISH,
        (invoiceId) {
      debugPrint("-----------$invoiceId------------");
      log(invoiceId);
    }).then((value) {
      log(value);

      // تحقق إذا كانت العملية ناجحة
      if (value.invoiceTransactions![0].transactionStatus == "Succss" ||
          value.invoiceTransactions![0].transactionStatus == "SUCCSS") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PaymentSuccessPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('عملية الدفع خطأ')),
        );
      }
    }).catchError((error) {
      log(error.message);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("حدث خطأ أثناء الدفع: ${error.message}")),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    mfCardView = MFCardPaymentView(cardViewStyle: cardViewStyle());
    mfApplePayButton = MFApplePayButton(applePayStyle: MFApplePayStyle());
    // mfGooglePayButton = MFGooglePayButton();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Flex(
            direction: Axis.vertical,
            children: [
              verticalSpace(20),
              CustomAppBar(
                title: "الدفع",
                onPressed: () {
                  context.pushReplacementNamed(homeView);
                },
              ),
              verticalSpace(20),

              if (Platform.isIOS) applePayView(),
              // if (Platform.isAndroid) googlePayButton(),
              embeddedCardView(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        paymentMethodsList(),
                        if (selectedPaymentMethodIndex != -1)
                          btn("Execute Payment", executePayment),
                        // btn("Reload GooglePay", initiateSessionForGooglePay),
                        // ColoredBox(
                        //   color: const Color(0xFFD8E5EB),
                        //   child: SelectableText.rich(
                        //     TextSpan(
                        //       text: _response!,
                        //       style: const TextStyle(),
                        //     ),
                        //   ),
                        // ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget embeddedCardView() {
    return Column(
      children: [
        SizedBox(
          height: 220.h,
          child: mfCardView,
        ),
        Row(
          children: [
            const SizedBox(width: 2),
            Expanded(child: elevatedButton("ادفع", pay)),
            const SizedBox(width: 2),
            elevatedButton("", initiateSessionForCardView),
          ],
        )
      ],
    );
  }

  Widget applePayView() {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: mfApplePayButton,
        )
      ],
    );
  }

  // Widget googlePayButton() {
  //   return SizedBox(
  //     height: 70,
  //     child: mfGooglePayButton,
  //   );
  // }

  Widget paymentMethodsList() {
    return Column(
      children: [
        Text("Select payment method", style: textStyle()),
        SizedBox(
          height: 85,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: paymentMethods.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return paymentMethodsItem(ctxt, index);
              }),
        ),
      ],
    );
  }

  Widget paymentMethodsItem(BuildContext ctxt, int index) {
    return SizedBox(
      width: 70,
      height: 75,
      child: Container(
        decoration: isSelected[index]
            ? BoxDecoration(
                border: Border.all(color: Colors.blueAccent, width: 2))
            : const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: <Widget>[
              Image.network(
                paymentMethods[index].imageUrl!,
                height: 35.0,
              ),
              SizedBox(
                height: 24.0,
                width: 24.0,
                child: Checkbox(
                    checkColor: Colors.blueAccent,
                    activeColor: const Color(0xFFC9C5C5),
                    value: isSelected[index],
                    onChanged: (bool? value) {
                      setState(() {
                        setPaymentMethodSelected(index, value!);
                      });
                    }),
              ),
              Text(
                paymentMethods[index].paymentMethodEn ?? "",
                style: TextStyle(
                  fontSize: 8.0,
                  fontWeight:
                      isSelected[index] ? FontWeight.bold : FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget btn(String title, Function onPressed) {
    return SizedBox(
      width: double.infinity, // <-- match_parent
      child: elevatedButton(title, onPressed),
    );
  }

  Widget elevatedButton(String title, Function onPressed) {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        backgroundColor:
            WidgetStateProperty.all<Color>(const Color(0xff0495ca)),
        shape: WidgetStateProperty.resolveWith<RoundedRectangleBorder>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: Colors.red, width: 1.0),
              );
            } else {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: Colors.white, width: 1.0),
              );
            }
          },
        ),
      ),
      child: (title.isNotEmpty)
          ? Text(title, style: textStyle())
          : const Icon(Icons.refresh),
      onPressed: () async {
        await onPressed();
      },
    );
  }

  // Widget amountInput() {
  //   // return CustomTextFormField(

  //   // );
  //   return TextField(
  //     style: const TextStyle(color: Colors.white),
  //     textAlign: TextAlign.center,
  //     keyboardType: TextInputType.number,
  //     controller:
  //         TextEditingController(text: widget.orderResponse.netPrice.toString()),
  //     decoration: const InputDecoration(
  //       filled: true,
  //       fillColor: Color(0xff0495ca),
  //       hintText: "0.00",
  //       contentPadding: EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
  //       enabledBorder: OutlineInputBorder(
  //         borderSide: BorderSide(color: Colors.white, width: 1.0),
  //         borderRadius: BorderRadius.all(Radius.circular(8.0)),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderSide: BorderSide(color: Colors.red, width: 1.0),
  //         borderRadius: BorderRadius.all(Radius.circular(8.0)),
  //       ),
  //     ),
  //     onChanged: (value) {
  //       widget.orderResponse.netPrice = double.tryParse(value)!;
  //     },
  //   );
  // }

  TextStyle textStyle() {
    return const TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic);
  }
}

class PaymentSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 80),
            SizedBox(height: 20),
            Text(
              "تم الدفع بنجاح!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // العودة إلى الصفحة الرئيسية أو أي صفحة أخرى
                context.pushReplacementNamed(
                  homeView,
                );
              },
              child: Text("العودة إلى الصفحة الرئيسية"),
            ),
          ],
        ),
      ),
    );
  }
}
