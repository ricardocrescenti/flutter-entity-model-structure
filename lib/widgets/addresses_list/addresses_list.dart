import 'package:flutter/material.dart';
import 'package:user_structure/user_structure.dart';
import 'package:user_structure/widgets/address_tile/address_tile.dart';

class AddressesList extends StatelessWidget {
  final List<EntityAddressModelPattern> addresses;
  final Function(BuildContext context, EntityAddressModelPattern address) onTap;
  final Function(BuildContext context, EntityAddressModelPattern address) onLongPress;

  AddressesList({
    @required this.addresses,
    this.onTap,
    this.onLongPress
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: addresses.length,
      itemBuilder: (context, index) => AddressTile.fromAddress(addresses[index],
        onTap: (onTap != null ? () => onTap(context, addresses[index]) : null), 
        onLongPress: (onLongPress != null ? () => onLongPress(context, addresses[index]) : null)
      ),
      separatorBuilder: (context, index) => Divider());
  }
}