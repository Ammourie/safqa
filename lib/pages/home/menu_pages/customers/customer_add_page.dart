// ignore_for_file: body_might_complete_normally_nullable

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safqa/controllers/signup_controller.dart';
import 'package:safqa/pages/create_invoice/customer_info_page.dart';
import 'package:safqa/pages/home/menu_pages/customers/bank_info_page.dart';
import 'package:safqa/pages/home/menu_pages/customers/controller/customers_controller.dart';
import 'package:safqa/widgets/circular_go_btn.dart';
import 'package:safqa/widgets/signup_text_field.dart';
import 'package:sizer/sizer.dart';

class AddCustomerPage extends StatelessWidget {
  AddCustomerPage({super.key});
  TextEditingController fullNameControler = TextEditingController();
  TextEditingController customerPhoneNumberControler = TextEditingController();
  TextEditingController customerRefrenceControler = TextEditingController();
  TextEditingController emailControler = TextEditingController();
  CustomersController _customersController = Get.find();
  SignUpController _signUpController = Get.find();
  final formKey = GlobalKey<FormState>();
  String customerMobileCodeID = "1";
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Add Customer",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16.0.sp),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Container(
          width: w,
          height: h,
          padding: const EdgeInsets.all(20),
          child: ListView(
            primary: false,
            children: [
              blackText("Full Name", 16),
              SignUpTextField(
                padding: EdgeInsets.all(0),
                controller: fullNameControler,
                validator: (s) {
                  if (s!.isEmpty) return "required";
                  return null;
                },
              ),
              const SizedBox(height: 10),
              blackText("Mobile number", 16),
              Obx(() {
                List countries = _signUpController.globalData['country'];
                List<String> ids = countries
                    .map<String>(
                      (e) => e['id'].toString(),
                    )
                    .toSet()
                    .toList();
                List<String> countriesCodes = countries
                    .map<String>(
                      (e) => e['code'].toString(),
                    )
                    .toSet()
                    .toList();
                _signUpController
                    .selectPhoneNumberManagerCodeDrop(countriesCodes[0]);
                return SignUpTextField(
                  controller: customerPhoneNumberControler,
                  padding: EdgeInsets.all(0),
                  keyBoardType: TextInputType.number,
                  prefixIcon: SizedBox(
                    width: 60,
                    child: DropdownButtonFormField<String>(
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      isExpanded: true,
                      items: countriesCodes
                          .map((e) => DropdownMenuItem<String>(
                                child: Center(child: Text(e)),
                                value: e,
                              ))
                          .toList(),
                      value:
                          _signUpController.selectedPhoneNumberManagerCodeDrop,
                      onChanged: (value) {
                        customerMobileCodeID =
                            ids[countriesCodes.indexOf(value!)];
                      },
                    ),
                  ),
                  onchanged: (s) {
                    _signUpController.dataToRegister['phone_number_manager'] =
                        s!;
                    _signUpController.errors = {};
                  },
                  validator: (s) {
                    if (_signUpController.errors == null) return null;
                    return _signUpController.errors
                            .containsKey("phone_number_manager")
                        ? _signUpController.errors['phone_number_manager'][0]
                            .toString()
                        : null;
                  },
                  hintText: 'Manager Mobile Number',
                );
              }),
              // IntlPhoneField(
              //   validator: (s) {
              //     if (s!.number.isEmpty) return "required";
              //     return null;
              //   },
              //   flagsButtonPadding: EdgeInsets.symmetric(horizontal: 20),
              //   dropdownIconPosition: IconPosition.trailing,
              //   keyboardType: TextInputType.number,
              //   decoration: InputDecoration(
              //     fillColor: Color(0xffF8F8F8),
              //     filled: true,
              //     border: OutlineInputBorder(
              //         borderRadius: new BorderRadius.circular(10.0),
              //         borderSide: BorderSide.none),
              //   ),
              //   initialCountryCode: 'IN',
              //   onChanged: (phone) {
              //     logSuccess(customerPhoneNumberControler.text);
              //   },
              //   onCountryChanged: (value) =>
              //       customerMobileCode = "+${value.dialCode}",
              //   controller: customerPhoneNumberControler,
              // ),
              const SizedBox(height: 10),
              blackText("Email", 16),
              SignUpTextField(
                padding: EdgeInsets.all(0),
                controller: emailControler,
                keyBoardType: TextInputType.emailAddress,
                validator: (s) {
                  if (s!.isEmpty) {
                    return "required";
                  } else if (!EmailValidator.validate(s)) {
                    return "please enter a valid email!";
                  }
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  blackText("Customer Reference", 16),
                  SizedBox(width: 10),
                  greyText("(optional)", 13)
                ],
              ),
              SignUpTextField(
                padding: EdgeInsets.all(0),
                controller: customerRefrenceControler,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 15),
              Container(
                width: w,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade100, width: 2),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        blackText("Bank Info", 16),
                        SizedBox(width: 10),
                        greyText("(Optional)", 14)
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        Get.to(() => BankInfoPage(),
                            transition: Transition.rightToLeft);
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              CircularGoBTN(
                text: "Add Customer",
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    _customersController.customerToCreate.fullName =
                        fullNameControler.text;
                    _customersController.customerToCreate.email =
                        emailControler.text;
                    _customersController.customerToCreate.phoneNumber =
                        customerPhoneNumberControler.text;
                    _customersController.customerToCreate.phoneNumberCodeId =
                        customerMobileCodeID;
                    // logSuccess(_customersController.customerToCreate.toJson());
                    await _customersController.createCustomer();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
