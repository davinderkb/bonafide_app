import 'package:bonafide_app/main.dart';
import 'package:bonafide_app/organizationprofile.dart';
import 'package:bonafide_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';


class AddTimesheetEntry extends StatefulWidget {

  @override

  @override
  AddTimesheetEntryState createState() {
    return new AddTimesheetEntryState();
}


}


class AddTimesheetEntryState extends State<AddTimesheetEntry> {
  DateTime selectedDate = DateTime.now();

  BuildContext context;
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showRoundedDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate:DateTime(selectedDate.year ),
        lastDate: new DateTime.now().add(new Duration(days: 0)),
      borderRadius: 16,
      theme: ThemeData(primarySwatch: Colors.red),
    );

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'AvenirNext', fontSize: 14.0, color: Color(0xff707070));
    final timeHours = TextField(
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(18.0, 20.0, 18.0, 20.0),
          hintText: "Enter time (hh:mm)",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
    );
    this.context = context;
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                new Text(
                  "Add Entry",
                  style: new TextStyle(
                      fontFamily: 'AvenirNext',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFFFFFF)),
                  textAlign: TextAlign.center,
                ),

              ]),
          centerTitle: false,
          elevation: 0.0,
          backgroundColor: Color(0xffEB5050),
        ),
        body: SingleChildScrollView(

            child: Column(

              children: <Widget>[
                Container(
                  height: _height/4.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(60.0)
                    ),
                    color: Color(0xffEB5050),
                  ),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                          height:_height/5  ,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8.0,0,8,16),
                            child: Center(child: Image.asset("assets/images/clipart_add_entry.png")),
                          )
                      ),

                    ],),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12,60,12,12),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: (){_selectDate(context);},
                        child: Container(
                          width: _width-72,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            color: Color(0xffF4F6F7),
                              border:Border.all(color: Color(0xff707070)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(12,0,0,0),
                                child: Text("${selectedDate.toLocal()}".split(' ')[0],
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 14, color: Color(0xff707070)),),
                              ),
                              Padding(
                                  padding: const EdgeInsets.fromLTRB(0,0,8,0),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    child: Image.asset("assets/images/ic_date.png",color: Color(0xffEB5050),),

                                  )

                              ),

                            ],
                          ),
                        ),
                      ),
                    ) ,

                    Padding(
                      padding: const EdgeInsets.all(12),
                    ),
                    Center(
                      child: Container(
                        width: _width-72,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Color(0xffF4F6F7),
                        ),
                        child: timeHours,
                      ),
                    ) ,

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                ),
                SizedBox(
                  height: 60,
                  width: _width-72,
                  child: FlatButton.icon(
                    label: Text('Save',textAlign: TextAlign.start,style: TextStyle(fontSize: 14, color: Colors.white),),
                    icon: Icon(
                      Icons.save,
                      color: Colors.white,
                    ),
                    onPressed: null,
                    disabledColor: Color(0xffEB5050),
                    shape:RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0),side: BorderSide(color: Colors.white)),
                  ),
                )
              ],
            )
        ));
  }

}
