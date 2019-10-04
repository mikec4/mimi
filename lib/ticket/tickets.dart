import 'package:flutter/material.dart';
import 'package:mimi/ticket/ticket.dart';

class Tickets extends StatefulWidget {
  @override
  _TicketsState createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(title: Text('My Tickets'),),
      body: Center(
        child: ListTile(
          leading: Icon(Icons.report_problem,),
          title: Text('Ooops not available',style: Theme.of(context).textTheme.subtitle,),
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Tickets'),
    //     elevation: 2.0,
    //   ),
    //   body: Container(
    //     child: ListView.separated(
    //       separatorBuilder: (context,i){
    //          return Divider(color: Colors.grey,);
    //       },
    //       itemBuilder: (context,i){
    //          return ListTile(
    //           leading: Padding(
    //             padding: const EdgeInsets.only(left: 10.0,right: 0.0),
    //             child: Stack(
    //               alignment: Alignment(-0.3,-0.4),
    //               fit: StackFit.loose,
    //               children: <Widget>[
    //                 CustomPaint(
    //                     size: Size(50.0, 50.0),
    //                     painter: CustomCircle(),
    //                   ),
    //                   Text('K',style:TextStyle(color: Colors.white,fontSize: 20.0))
    //               ],
    //             ), 
    //           ),
    //           title: Padding(
    //             padding: const EdgeInsets.only(right: 10.0),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: <Widget>[
    //                 Text('Kimaro Luxury Coach',style: TextStyle(fontSize:16.0,fontWeight: FontWeight.w700),),
    //                 Text('10:00',style: TextStyle(fontSize: 15.0,color: Colors.blue),)
    //               ],
    //             ),
    //           ),
    //           subtitle: Text('You have paid 50000 to Kimaro Luxury ...',
    //           style:TextStyle(fontSize: 13.0,color: Colors.grey[400],fontFamily: 'Raleway')),
    //            contentPadding: EdgeInsets.only(left: 1.0,right: 1.0),
    //            onTap: (){
    //              //Navigator.pop(context);
    //              Navigator.push(context, MaterialPageRoute(builder: (context)=> Ticket()));
    //            },
    //         );

    //       },
    //       itemCount: 100,
          
    //     ),
    //   )
    // );
  }
}



class CustomCircle extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    Paint paint = Paint();
    paint.color = Colors.red;
    //paint.strokeWidth = 5.0;
    paint.style = PaintingStyle.fill;

    canvas.drawCircle(Offset(20.0,20.0), width/2, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}