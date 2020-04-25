import 'package:flutter/material.dart';
import 'package:user_structure/user_structure.dart';

class AddressTile extends StatelessWidget {
  final String contact;
  final List<String> lines;
  final Function() onTap;
  final Function() onLongPress;

  AddressTile({
    @required this.contact,
    @required this.lines,
    this.onTap,
    this.onLongPress
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.place),
      onTap: this.onTap,
      onLongPress: this.onLongPress,
      title: Text(contact),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: lines.map<Widget>((item) => Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(item))).toList(),
      ),
      isThreeLine: true,
    );
  }

  static AddressTile fromAddress(EntityAddressModelPattern address, {Function() onTap, Function() onLongPress}) {
    assert(address != null);
    assert(address.street != null);

    List<String> lines = [address.street + (address.number != null && address.number.isNotEmpty ? ', ' + address.number : '') + (address.complement != null && address.complement.isNotEmpty ? ' - ' + address.complement : '')];

    if (address.neighborhood != null && address.neighborhood.isNotEmpty) {
      lines.add(address.neighborhood);
    }

    if (address.cityName != null && address.cityName.isNotEmpty) {
      lines.add(address.cityName + (address.state != null && address.state.isNotEmpty ? ' - ' + address.state : ''));
    }

    if (address.zipCode != null && address.zipCode.isNotEmpty) {
      lines.add(address.zipCode);
    }

    return AddressTile(
      contact: address.contact,
      lines: lines,
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}