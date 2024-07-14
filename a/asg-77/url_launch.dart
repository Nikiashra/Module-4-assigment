import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlScreen extends StatelessWidget
{
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();

  void _makePhoneCall(String phoneNumber) async {
    var url = Uri.parse("tel:$phoneNumber");
    if (await canLaunchUrl(url))
    {
      await launchUrl(url);
    }
    else
    {
      throw 'Could not launch $url';
    }
  }

  void _sendSMS(String phoneNumber, String message) async {
    var url = Uri.parse("sms:$phoneNumber?body=$message");
    if (await canLaunchUrl(url))
    {
      await launchUrl(url);
    }
    else
    {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Url Launch"),
        backgroundColor: Colors.tealAccent,

      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: 'Enter Phone Number'),
            ),
            SizedBox(height: 20),

            ElevatedButton(
                onPressed:() => _makePhoneCall(_phoneController.text),
                child:Text('Make Call'),
            ),

            SizedBox(height: 20),

            TextField(
              controller: _smsController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Enter SMS'),
            ),
            SizedBox(height: 20),

            ElevatedButton(
                onPressed: () => _sendSMS(_phoneController.text,_smsController.text),
                child: Text('Send Sms'))

          ],
        ),
      ),
    );
  }
}
