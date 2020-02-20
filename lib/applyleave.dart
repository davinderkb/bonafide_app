import 'package:bonafide_app/main.dart';
import 'package:bonafide_app/organizationprofile.dart';
import 'package:bonafide_app/util/constants.dart';
import 'package:flutter/material.dart';

class ApplyLeave extends StatefulWidget {
  @override
  ApplyLeaveState createState() {
    return new ApplyLeaveState();
  }


}
class ApplyLeaveState extends State<ApplyLeave> {
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();

  BuildContext context;
  Future<Null> _selectFromDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: fromDate,
        firstDate:DateTime(fromDate.year ),
        lastDate: new DateTime.now().add(new Duration(days: 0)),
        builder: (BuildContext context, Widget child){
          return Theme(
            data: ThemeData.light().copyWith(
              // primarySwatch: const Color(0xffEB5050),//OK/Cancel button text color
              primaryColor: const Color(0xffEB5050),//Head background
              accentColor: const Color(0xffEB5050),//selection color
              //dialogBackgroundColor: Colors.white,//Background color
            ),
            child: child,
          );
        }
    );
    if (picked != null && picked != fromDate)
      setState(() {
        fromDate = picked;
      });
  }
  Future<Null> _selectToDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: toDate,
        firstDate:DateTime(toDate.year ),
        lastDate: new DateTime.now().add(new Duration(days: 0)),
        builder: (BuildContext context, Widget child){
          return Theme(
            data: ThemeData.light().copyWith(
              // primarySwatch: const Color(0xffEB5050),//OK/Cancel button text color
              primaryColor: const Color(0xffEB5050),//Head background
              accentColor: const Color(0xffEB5050),//selection color
              //dialogBackgroundColor: Colors.white,//Background color
            ),
            child: child,
          );
        }
    );
    if (picked != null && picked != toDate)
      setState(() {
        toDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    TextStyle style = TextStyle(fontFamily: 'AvenirNext', fontSize: 14.0, color: Color(0xff707070));
    final reasonForLeave = TextField(
      maxLines: _height>_width ? 6 : 1,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(18.0, 20.0, 18.0, 20.0),
          hintText: "Write the reason here ...",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
    );
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
                  "Apply Leave",
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

            child: Stack(
              overflow: Overflow.visible,
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(
                  height:_height>_width? _height:_height/0.75+62 ,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: _height>_width? _height/1.2 :_height/0.75+12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0)
                          ),
                          color: Color(0xffEB5050),
                        ),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                                height:_height/5.2  ,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(8.0,0,8,16),
                                  child: Center(child: Image.asset("assets/images/apply_leaves_icon.png")),
                                )
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: _width - 24,
                                height:_height>_width?_height/2 : _height,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  color: Color(0xffF7B9B9),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10.0,10,10,0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(6,0,0,6),
                                        child: Text('From Date (Year-Month-Day)',textAlign: TextAlign.start,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 14, color: Color(0xff707070)),),
                                      ),
                                      Center(
                                        child: GestureDetector(
                                          onTap: (){_selectFromDate(context);},
                                          child: Container(
                                            width: _width-40,
                                            height: 55,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                              color: Color(0xffF4F6F7),
                                              border:Border.all(color: Color(0xff707070)),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                  child: Text("${fromDate.toLocal()}".split(' ')[0],textAlign: TextAlign.start,style: TextStyle(fontSize: 14, color: Color(0xff707070)),),
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
                                        padding: const EdgeInsets.fromLTRB(6,12,0,6),
                                        child: Text('To Date (Year-Month-Day)',textAlign: TextAlign.start,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 14, color: Color(0xff707070)),),
                                      ),
                                      Center(
                                        child: GestureDetector(
                                          onTap: (){_selectToDate(context);},
                                          child: Container(
                                            width: _width-40,
                                            height: 55,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                              color: Color(0xffF4F6F7),
                                              border:Border.all(color: Color(0xff707070)),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                                  child: Text("${toDate.toLocal()}".split(' ')[0],textAlign: TextAlign.start,style: TextStyle(fontSize: 14, color: Color(0xff707070)),),
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
                                        padding: const EdgeInsets.fromLTRB(0,20,0,0),
                                        child: Center(
                                          child: Container(
                                              height: _height>_width?_height/6+20 : 60,
                                              width: _width-40,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                color: Color(0xffF4F6F7),
                                              ),
                                              child: reasonForLeave
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: _height>_width?_height/1.2 -35 : _height/.75 -12,
                  bottom:_height>_width?90 : 10,
                  left: (_width - _width/1.2)/2,
                  child: SizedBox(
                    height: 50,
                    width: _width/1.2,
                    child: FlatButton(
                      child: Text('Apply',textAlign: TextAlign.start,style: TextStyle(fontSize: 14, color: Colors.white),),
                      onPressed: null,
                      disabledColor: Color(0xffEB5050),
                      shape:RoundedRectangleBorder(borderRadius: new BorderRadius.circular(32.0),side: BorderSide(color: Colors.white,)),
                    ),
                  ),
                )
              ],
            )
        ));
  }


}
