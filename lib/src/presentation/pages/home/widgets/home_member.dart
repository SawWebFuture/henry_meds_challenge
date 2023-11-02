import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeMember extends StatelessWidget {
  const HomeMember({
    super.key,
    required this.imageUrl,
    required this.memberType,
    required this.onTap,
  });

  final String imageUrl;
  final String memberType;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 180,
            height: 10,
            decoration: BoxDecoration(
              color: HexColor('#00836c'),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          Container(
            color: HexColor('#00836c'),
            height: 180,
            width: 180,
            child: FittedBox(fit: BoxFit.fill, child: Image.asset(imageUrl)),
          ),
          Container(
            width: 180,
            height: 40,
            decoration: BoxDecoration(
              color: HexColor('#00836c'),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                memberType,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
