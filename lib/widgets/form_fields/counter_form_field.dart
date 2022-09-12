
import 'package:client/helpers/spacings_helper.dart';
import 'package:flutter/material.dart';

class CounterFormField extends StatefulWidget {
  final Function(int)? onChange;

  const CounterFormField({ Key? key, this.onChange}) : super(key: key);

  @override
  State<CounterFormField> createState() => _CounterFormFieldState();
}

class _CounterFormFieldState extends State<CounterFormField> {

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: counter == 0 ? null : minusOne,
          icon: const Icon(Icons.remove),
          color: Theme.of(context).primaryColor,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SpacingsHelper.small),
          child: SizedBox(
            width: 20,
            child: Center(child: Text(counter.toString()))
          ),
        ),
        IconButton(
          onPressed: plusOne,
          icon: const Icon(Icons.add),
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }

  void minusOne() {
    setState(() {
      counter--;
      widget.onChange?.call(counter);
    });
    
  }

  void plusOne() {
    setState(() {
      counter++;
      widget.onChange?.call(counter);
    });
  }
}