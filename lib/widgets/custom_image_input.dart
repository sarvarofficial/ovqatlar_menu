import 'package:flutter/material.dart';

class CustomImageInput extends StatefulWidget {
  final TextEditingController imageController;
  final String label;

  const CustomImageInput(
      {Key? key, required this.imageController, required this.label})
      : super(key: key);

  @override
  State<CustomImageInput> createState() => _CustomImageInputState();
}

class _CustomImageInputState extends State<CustomImageInput> {
  var image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Row(
        
        children: [
          Container(
            alignment: Alignment.center,
            width: 100,
            height: 100,
            decoration: BoxDecoration(border: Border.all()),
            child: image != null && image.isNotEmpty
                ? Image.network(image,width: 100,height: 100,fit: BoxFit.cover,)
                : Text("Rasmni kiriting:"),
          ),
          Expanded(
            child: TextField(
              controller: widget.imageController,
              onSubmitted: (value) {
                setState(() {
                  image = value;
                });
              },
              decoration: InputDecoration(labelText: widget.label),
              textInputAction: TextInputAction.done,
            ),
          ),
        ],
      ),
    );
  }
}
