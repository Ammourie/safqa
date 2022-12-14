import 'dart:io';

class DataToCreateInvoice {
  String? token;
  String? customerName;
  String? customerMobileNumbr;
  String? customerMobileNumbrCode;
  String? customerRefrence;
  int? customerSendBy = 1;
  String? currencyId = "1";
  int? discountType;
  String? discountValue;
  String? expiryDate;
  String? remindAfter;
  String? recurringStartDate;
  String? recurringIntervalId;
  String? isOpenInvoice;
  String? comments;
  String? termsAndConditions;
  String? recurringEndDate;
  int? languageId = 1;
  File? attachFile;

  List<String> productName = [];
  List<int> productQuantity = [];
  List<String> productPrice = [];
  DataToCreateInvoice({
    this.token,
    this.customerName,
    this.customerMobileNumbr,
    this.customerMobileNumbrCode,
    this.customerRefrence,
    this.customerSendBy,
    this.currencyId,
    this.discountType,
    this.discountValue,
    this.expiryDate,
    this.remindAfter,
    this.recurringEndDate,
    this.recurringStartDate,
    this.languageId = 1,
    this.attachFile,
    this.comments,
    this.termsAndConditions,
    this.recurringIntervalId,
    this.isOpenInvoice,
  });

  // DataToCreateInvoice.fromJson(
  //   Map<String, dynamic> json,
  // ) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["token"] = token;
    data["customer_name"] = customerName;
    data["send_invoice_option_id"] = customerSendBy;
    data["customer_mobile"] = customerMobileNumbr;
    data["customer_mobile_code"] = customerMobileNumbrCode;
    data["customer_reference"] = customerRefrence;
    data["product_name"] = productName;
    data["product_quantity"] = productQuantity;
    data["product_price"] = productPrice;
    data["currency_id"] = currencyId;
    data["discount_type"] = discountType;
    data["discount_value"] = discountValue;
    data["expiry_date"] = expiryDate;
    data["remind_after"] = remindAfter;
    data["recurring_end_date"] = recurringEndDate;
    data["recurring_start_date"] = recurringStartDate;
    data["language_id"] = languageId;
    // data["attach_file"] = attachFile;
    data["comment"] = comments;
    data["terms_and_conditions"] = termsAndConditions;
    data["recurring_interval_id"] = recurringIntervalId;
    data["is_open_invoice"] = isOpenInvoice;

    return data;
  }
}
