import 'package:flutter/material.dart';
import 'package:user_structure/user_structure.dart';

class AddressTile extends StatelessWidget {
  final Widget title;
  final List<Widget> lines;
  final Function() onTap;
  final Function() onLongPress;

  AddressTile({
    @required this.title,
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
      title: title,
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: lines,
      ),
      isThreeLine: true,
    );
  }

  static AddressTile fromAddress(EntityAddressModelPattern address, {Function() onTap, Function() onLongPress}) {
    assert(address != null);
    assert(address.street != null);

    List<Widget> title = [Text(address.contact, style: TextStyle(fontWeight: FontWeight.bold))];
    if (address.primary ?? false) {
      title.addAll([
        Padding(padding: EdgeInsets.only(left: 5)),
        Text('-', textScaleFactor: 0.8, style: TextStyle(fontWeight: FontWeight.bold)),
        Padding(padding: EdgeInsets.only(left: 5)),
        Text('Principal', textScaleFactor: 0.8, style: TextStyle(fontWeight: FontWeight.bold))
      ]);
    }

    List<Widget> lines = [Text(address.street + (address.number != null && address.number.isNotEmpty ? ', ' + address.number : '') + (address.complement != null && address.complement.isNotEmpty ? ' - ' + address.complement : ''))];

    if (address.neighborhood != null && address.neighborhood.isNotEmpty) {
      lines.add(Text(address.neighborhood));
    }

    if (address.cityName != null && address.cityName.isNotEmpty) {
      lines.add(Text(address.cityName + (address.state != null && address.state.isNotEmpty ? ' - ' + address.state : '')));
    }

    if (address.zipCode != null && address.zipCode.isNotEmpty) {
      lines.add(Text(address.zipCode));
    }

    return AddressTile(
      title: Row(children: title),
      lines: lines,
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}