import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Map of data
  Map data = {};
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data :ModalRoute.of(context).settings.arguments;
    print(data);

    // set backgroundImage
    // set Ternary Operator
    String bgImage = data['isDayTime'] ? 'day.jpeg' : 'nyte.jpeg';
    Color bgColor = data['isDayTime'] ? Colors.blue[700] : Colors.lightBlue[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.fill
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                // Navigator.pushNamed
                FlatButton.icon(
                  // pop in the data from WorldTime----calling setState
                    onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDayTime': result['isDayTime'],
                          'flag': result['flag'],
                          'country': result['country']
                        };
                      });
                    },
                    icon: Icon(Icons.edit_location, color: Colors.grey[300],),
                    label: Text('Edit Location', style: TextStyle(color: Colors.grey[300]),)),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      data['country'],
                      style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 2,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 66, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
