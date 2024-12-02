import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Card(
              elevation: 30,
              shadowColor: Colors.black,
              color: AppLightColor.whiteColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      'imges/meal1.jpg',
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tuna Crunch',
                        style: AppStyles.textStyle16
                            .copyWith(color: AppLightColor.blackColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                color:
                                    AppLightColor.mainColor.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                'Keto',
                                style: AppStyles.textStyle12
                                    .copyWith(color: AppLightColor.mainColor),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                color:
                                    AppLightColor.mainColor.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                '350 Cal',
                                style: AppStyles.textStyle12
                                    .copyWith(color: AppLightColor.mainColor),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color(0xffFDE424),
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '4.5',
                            style: AppStyles.textStyle16.copyWith(
                                color: AppLightColor.blackColor, fontSize: 14),
                          )
                        ],
                      ),
                      const SizedBox(width: 15),
                      Row(
                        children: [
                          Text(
                            '170',
                            style: AppStyles.textStyle16
                                .copyWith(color: AppLightColor.mainColor),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'EGP',
                            style: AppStyles.textStyle16
                                .copyWith(color: AppLightColor.blackColor),
                          ),
                          const SizedBox(
                            width: 150,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: AppLightColor.mainColor,
                              borderRadius: BorderRadius.circular(
                                25,
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.add,
                                color: AppLightColor.whiteColor,
                                size: 20,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
