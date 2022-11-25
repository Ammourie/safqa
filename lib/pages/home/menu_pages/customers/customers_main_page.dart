import 'package:badges/badges.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safqa/pages/create_invoice/customer_info_page.dart';
import 'package:safqa/pages/home/menu_pages/customers/controller/customers_controller.dart';
import 'package:safqa/pages/home/menu_pages/customers/customer_add_page.dart';
import 'package:safqa/pages/home/menu_pages/customers/customer_details.dart';
import 'package:safqa/pages/home/menu_pages/customers/customer_search_filter_page.dart';
import 'package:safqa/pages/home/menu_pages/products/tabs/product_tab.dart';
import 'package:safqa/widgets/popup_menu.dart';
import 'package:safqa/widgets/signup_text_field.dart';
import 'package:safqa/widgets/zero_app_bar.dart';
import 'package:sizer/sizer.dart';

class CustomersMainPage extends StatefulWidget {
  CustomersMainPage({super.key});

  @override
  State<CustomersMainPage> createState() => CustomersMainPageState();
}

class CustomersMainPageState extends State<CustomersMainPage> {
  CustomersController _customersController = Get.find();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const ZeroAppBar(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/welcome_background.png"),
                fit: BoxFit.cover,
              ),
            ),
            width: w,
            height: h,
          ),
          Column(
            children: [
              Container(
                height: 90,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 22.0.sp,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    whiteText("Customers", 17, fontWeight: FontWeight.w600),
                    Opacity(
                      opacity: 0,
                      child: whiteText("text", 16),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: w,
                  padding: EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      SignUpTextField(
                        hintText: "Search ...",
                        padding: EdgeInsets.all(0),
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          color: Colors.grey,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            Get.to(() => CustomerSearchFilterPage());
                          },
                          child: Badge(
                            badgeColor: Color(0xff1BAFB2),
                            showBadge: true,
                            position: BadgePosition.topEnd(top: 8, end: 8),
                            child: Image(
                              image: AssetImage("assets/images/filter.png"),
                              width: 18,
                              height: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => AddCustomerPage());
                            },
                            child: Container(
                              width: 0.45 * w,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Color(0xff2F6782).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Icon(
                                      Icons.add_rounded,
                                      color: Color(0xff2F6782),
                                    ),
                                  ),
                                  // SizedBox(width: 5),
                                  Text(
                                    "Create Customer",
                                    style: TextStyle(
                                      color: Color(0xff2F6782),
                                      fontSize: 12.0.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              //TODO:
                            },
                            child: Container(
                              width: 0.45 * w,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Color(0xff8B8B8B).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Icon(
                                      Icons.file_download_outlined,
                                      color: Color(0xff8B8B8B),
                                    ),
                                  ),
                                  // SizedBox(width: 5),
                                  Text(
                                    "Import Customer",
                                    style: TextStyle(
                                      color: Color(0xff8B8B8B),
                                      fontSize: 12.0.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 40,
                        child: Row(
                          // scrollDirection: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            listBTN(text: "Copy", onTap: () {}, width: w / 4.5),
                            // listBTN(text: "Print", onTap: () {},width: w / 4.5),
                            MyPopUpMenu(
                              menuList: [
                                PopupMenuItem(
                                  child: Row(
                                    children: [
                                      Icon(
                                        EvaIcons.file,
                                        color: Colors.grey.shade500,
                                      ),
                                      SizedBox(width: 10),
                                      Text("PDF"),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.print,
                                        color: Colors.grey.shade500,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Printer"),
                                    ],
                                  ),
                                ),
                              ],
                              widget: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                decoration: BoxDecoration(
                                  color: const Color(0xffF9F9F9),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: blueText("print", 12),
                                ),
                              ),
                            ),

                            listBTN(
                                text: "Excel", onTap: () {}, width: w / 4.5),
                            listBTN(text: "CSV", onTap: () {}, width: w / 4.5),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: GetBuilder<CustomersController>(builder: (c) {
                          return c.getCustomerFlag
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : ListView.separated(
                                  primary: false,
                                  itemBuilder: (context, index) => ListTile(
                                      onTap: () {
                                        Get.to(() => CustomerDetailsPage(
                                              customer: c.customers[index],
                                            ));
                                      },
                                      title: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          blackText(
                                            c.customers[index].fullName!,
                                            14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          greyText(
                                              c.customers[index].phoneNumber!,
                                              13)
                                        ],
                                      ),
                                      dense: true,
                                      visualDensity: VisualDensity(vertical: 4),
                                      leading: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xffF9F9F9),
                                        ),
                                        child: Center(
                                          child: greyText(
                                              c.customers[index].fullName![0],
                                              15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    height: 20,
                                  ),
                                  itemCount: c.customers.length,
                                );
                        }),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
