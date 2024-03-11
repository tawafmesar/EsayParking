import 'package:flutter/material.dart';

import '../../core/constant/parkinglot.dart';

Widget carouselCard(int index, num distance, num duration) {
  return Card(
    clipBehavior: Clip.antiAlias,
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(parkinglot[index]['image']),
            radius: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  parkinglot[index]['name'],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(parkinglot[index]['items'],
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 5),
                Expanded(
                  child: Text(
                    '${distance.toStringAsFixed(2)}kms, ${duration.toStringAsFixed(2)} mins',
                    style: const TextStyle(color: Colors.tealAccent),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
