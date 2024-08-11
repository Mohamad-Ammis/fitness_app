import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/models/shop/order_model.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.model,
  });
  final OrderModel model;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(15, 30, 15, 15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.fromLTRB(16, 25, 16, 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 131, 218, 134),
                              borderRadius: BorderRadius.circular(999)),
                          child: const Icon(
                            Icons.price_check_sharp,
                            color: Colors.white,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Price',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: Constans.fontFamily,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$${model.totalPrics}',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black.withOpacity(.2),
                                fontFamily: Constans.fontFamily,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: const Color(0xFFA1B5F4),
                              borderRadius: BorderRadius.circular(999)),
                          child: const Icon(
                            Icons.numbers_outlined,
                            color: Colors.white,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Items Count',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: Constans.fontFamily,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${model.itemCount}',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black.withOpacity(.2),
                                fontFamily: Constans.fontFamily,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date:${model.createdAt}',
                    style: TextStyle(
                        color: Colors.black.withOpacity(.2),
                        fontSize: 16,
                        fontFamily: Constans.fontFamily,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'status : ${model.status}',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(.2),
                        fontFamily: Constans.fontFamily,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color(0xFFA1B5F4),
                        borderRadius: BorderRadius.circular(16)),
                    child: const Center(
                      child: Text(
                        'Click',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: Constans.fontFamily,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ),
        Positioned.fill(
            child: Align(
          alignment: Alignment.topRight,
          child: Container(
            decoration: const BoxDecoration(
                color: Color(0xFFA1B5F4),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            margin: const EdgeInsets.fromLTRB(15, 30, 15, 15),
            padding: const EdgeInsets.all(8),
            child: const Icon(
              Icons.info,
              color: Colors.white,
            ),
          ),
        )),
        // Positioned.fill(
        //     child: Align(
        //   alignment: Alignment.topCenter,
        //   child: Container(
        //       decoration: BoxDecoration(
        //           color: Color.fromARGB(255, 177, 196, 255),
        //           borderRadius: BorderRadius.circular(999)),
        //       margin: EdgeInsets.only(right: 100),
        //       padding: EdgeInsets.all(6),
        //       child: Lottie.asset('assets/lottie/otp.json',
        //           width: 50,
        //           height: 50,
        //           fit: BoxFit.fill,
        //           alignment: Alignment.center)),
        // )),
      ],
    );
  }
}
