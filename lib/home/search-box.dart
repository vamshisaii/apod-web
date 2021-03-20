import 'package:apod/home/home-bloc.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchBox extends StatefulWidget {
  SearchBox({Key key, @required this.bloc}) : super(key: key);
  final HomeBloc bloc;

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final dateFormat = DateFormat("dd-MMM-yyyy");
  DateTime pickedDate = DateTime.now();

  void search() {
    print(pickedDate);
    widget.bloc.loadAPOD(DateFormat('yyyy-MM-dd').format(pickedDate));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.4,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: DateTimeField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white54,
                enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                    width: 1.0,
                  ),
                ),
                labelText: "Date *",
                prefixIcon: Icon(Icons.date_range),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10),
              ),
              resetIcon: null,
              format: dateFormat,
              validator: (val) {
                if (val != null) {
                  return null;
                } else {
                  return 'Date is required';
                }
              },
              initialValue: DateTime.now(),
              onChanged: (value) {
                setState(() {
                  pickedDate = value;
                });
              },
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime.now());
              },
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 1,
            child: FloatingActionButton(
                backgroundColor: Colors.blueGrey[600],
                onPressed: () {
                  search();
                },
                child: Icon(Icons.search)),
          )
        ],
      ),
    );
  }
}
