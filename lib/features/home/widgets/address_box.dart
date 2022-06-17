import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/user_provider.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      height: kToolbarHeight,
      width: double.maxFinite,
      color: const Color(0xFF232f3f),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.location_on_outlined,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Text(
              'Delivery to "${user.name}" - ${user.address}',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.keyboard_double_arrow_down,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
