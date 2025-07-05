import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/widgets/custom_app_bar.dart';
import 'package:fitfat/features/cart/data/models/cart_model.dart';
import 'package:fitfat/features/cart/presentation/widgets/cart_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final List<CartModel> cartItems = [
    CartModel(
        title: "Beef Bourguignon",
        price: 60,
        calories: 400,
        rating: 3.3,
        image: 'assets/images/photo.png',
        count: 1),
    CartModel(
        title: "Grilled Chicken",
        price: 90,
        calories: 350,
        rating: 4.2,
        image: 'assets/images/photo.png'),
  ];
  bool isChecked = false;
  int selectedCardIndex = 0;
  String selectedPaymentMethod = 'cash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: const CustomAppBar(title: 'Payment Methods'),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                width: 319,
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 1.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color: context.theme.backgroundColor,
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset('assets/icons/wallet.jpg'),
                    const SizedBox(width: 15),
                    Text(
                      'Cash',
                      style: GoogleFonts.openSans(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Checkbox(
                      checkColor: context.theme.mainColor,
                      activeColor: context.theme.backgroundColor,
                      value: selectedPaymentMethod == 'cash',
                      onChanged: (_) {
                        setState(() {
                          selectedPaymentMethod = 'cash';
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 319,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
                color: context.theme.backgroundColor,
              ),
              child: ExpansionTile(
                title: Row(
                  children: [
                    Image.asset('assets/icons/card.jpg'),
                    const SizedBox(width: 8),
                    Text(
                      'Credit Card',
                      style: GoogleFonts.openSans(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                tilePadding: const EdgeInsets.symmetric(horizontal: 12),
                childrenPadding: EdgeInsets.zero,
                children: [
                  Container(
                      width: 280,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey, // Border color
                          width: 1.0, // Border width
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: context.theme.backgroundColor,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            'assets/icons/cart1.jpg',
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            '•••• 1234',
                            style: GoogleFonts.openSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                          const Spacer(),
                          Radio<int>(
                            activeColor: context.theme.mainColor,
                            value: 0,
                            groupValue: selectedCardIndex,
                            onChanged: (int? value) {
                              setState(() {
                                selectedCardIndex = value!;
                                selectedPaymentMethod = 'card';
                              });
                            },
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 280,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey, // Border color
                        width: 1.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(12),
                      color: context.theme.backgroundColor,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/icons/cart2.jpg',
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          '•••• 1234',
                          style: GoogleFonts.openSans(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                        const Spacer(),
                        Radio<int>(
                          value: 1,
                          activeColor: context.theme.mainColor,
                          groupValue: selectedCardIndex,
                          onChanged: (int? value) {
                            setState(() {
                              selectedCardIndex = value!;
                              selectedPaymentMethod = 'card';
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 280,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey, // Border color
                          width: 1.0, // Border width
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xffFCE9EB)),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset('assets/icons/add_icon.png'),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Add Card',
                          style: GoogleFonts.openSans(
                              color: context.theme.mainColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 319,
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey, // Border color
                  width: 1.0, // Border width
                ),
                borderRadius: BorderRadius.circular(12),
                color: context.theme.backgroundColor,
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset('assets/icons/e_wallet.png'),
                  const SizedBox(width: 15),
                  Text(
                    'E wallet',
                    style: GoogleFonts.openSans(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Checkbox(
                    checkColor: context.theme.mainColor,
                    activeColor: context.theme.backgroundColor,
                    value: selectedPaymentMethod == 'e-wallet',
                    onChanged: (_) {
                      setState(() {
                        selectedPaymentMethod = 'e-wallet';
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CartBottomBar(
        cartItems: [],
      ),
    );
  }
}
