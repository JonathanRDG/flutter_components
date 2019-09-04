import 'package:flutter/material.dart';
class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valueSlider=100.0;
  bool _blockCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckBox(),
            _createSwitch(),
            Expanded(
                child: _createImage()
            )
          ],
        )
      ),
    );
  }

  _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de imagen',
      value: _valueSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_blockCheck)?null:(valuue){
        setState(() {
          _valueSlider = valuue;
        });
      },
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage('http://mouse.latercera.com/wp-content/uploads/2019/07/spider-man-2.jpg'),
      width: _valueSlider,
      fit: BoxFit.contain,
    );

  }

  _createCheckBox() {
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _blockCheck,
      onChanged: (valuue){
        setState(() {
          _blockCheck = valuue;
        });

      },

    );
  }

  _createSwitch() {
    return SwitchListTile(
        title: Text('Bloquear slider'),
        value: _blockCheck,
        onChanged: (valuue){
          setState(() {
            _blockCheck = valuue;
          });


        });
  }
}
