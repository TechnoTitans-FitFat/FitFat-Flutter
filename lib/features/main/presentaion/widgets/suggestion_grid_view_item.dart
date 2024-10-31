import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';

class SuggestionGridViewItem extends StatelessWidget {
  const SuggestionGridViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppLightColor.whiteColor,
        boxShadow: [
          BoxShadow(
            color: AppLightColor.blackColor.withOpacity(0.25),
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(
            15,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppLightColor.blackColor.withOpacity(0.25),
                    blurRadius: 3,
                    offset: const Offset(4, 0),
                  ),
                ],
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    15,
                  ),
                ),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "imges/meal1.jpg",
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "Egg && Toast",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppLightColor.blackColor),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: AppLightColor.mainColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                "350 cal",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppLightColor.blackColor,
                ),
              ),
            ),
            Row(
              children: [
                const Text(
                  "170",
                  style: TextStyle(
                    color: AppLightColor.mainColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  "EGP",
                  style: TextStyle(
                      color: AppLightColor.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(),
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
        ),
      ),
    );
  }
}
