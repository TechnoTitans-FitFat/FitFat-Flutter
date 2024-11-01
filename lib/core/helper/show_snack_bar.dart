import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, massage) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(massage)));
}

void ShowDialog(BuildContext context, massage) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
          backgroundColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppLightColor.whiteColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      const SizedBox(
                        height: 8,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Success',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                              color: AppLightColor.green),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          massage,
                          style: const TextStyle(color: AppLightColor.greyColor),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -30,
                child: CircleAvatar(
                  backgroundColor: AppLightColor.green,
                  maxRadius: 32,
                  child: Card(
                    color: AppLightColor.green,
                    elevation:16,
                    shadowColor: AppLightColor.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    child: const Icon(Icons.check,color: AppLightColor.whiteColor,size: 64,),
                  ),
                ),
              ),
            ],
          ));
    },
  );
}
