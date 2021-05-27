import 'package:flutter/material.dart';
import 'package:formapp/model/form.dart';
import '../../screens/screens.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  Formdata formdata = Formdata();
  DateTime currentDate = DateTime.now();
  final myController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1949),
        lastDate: DateTime(2200));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 150,
                  child: TextFormField(
                    readOnly: true,
                    controller: myController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Select Date';
                      }
                    },
                    onTap: () {
                      _selectDate(context);
                      myController.text = currentDate.toString();
                    },
                    onSaved: (value) {
                      formdata.time = value;
                    },
                    decoration: InputDecoration(
                        labelText: 'Select Date',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                Container(
                  width: 150,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Amount';
                      }
                    },
                    onSaved: (value) {
                      formdata.amount = value;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        focusColor: Theme.of(context).primaryColor,
                        hoverColor: Theme.of(context).primaryColor,
                        labelText: 'Amount',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 300,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter vehicle details';
                        }
                      },
                      onSaved: (value) {
                        formdata.vehicleName = value;
                      },
                      decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          hoverColor: Theme.of(context).primaryColor,
                          hintText: 'Vehicle Name/ Vehicle Number',
                          labelText: 'Vehicle',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 200,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter No of passengers';
                        }
                      },
                      onSaved: (value) {
                        formdata.passengercount = value;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          hoverColor: Theme.of(context).primaryColor,
                          labelText: 'Passengers',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Travel Route',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 150,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Departure ';
                            }
                          },
                          onChanged: (value) {
                            formdata.departure = value;
                          },
                          decoration: InputDecoration(
                              labelText: 'Departure',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ),
                      Container(
                        width: 150,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Destination';
                            }
                          },
                          onSaved: (value) {
                            formdata.destination = value;
                          },
                          decoration: InputDecoration(
                              labelText: 'Destination',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.greenAccent[400],
                      elevation: 0,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TicketScreen(
                                      this.formdata,
                                    )));
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.greenAccent[400],
                      elevation: 0,
                    ),
                    onPressed: () {
                      _formKey.currentState!.reset();
                      myController.clear();
                    },
                    child: Text('Clear'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
