
import 'dart:html';
import 'package:persona/persona_html.dart';

main(){
	Persona nav = new Persona('bob.vankeuren@gmail.com',report,out);
  querySelector('#login').onClick.listen((_){
    nav.request({'backgroundColor': '#24ccff', 'siteName': 'Pizza Paul'});
    });
  querySelector('#logout').onClick.listen((_){
    nav.logout();
    });
	
}


report(String data) {
  querySelector('#data').text += '\n $data';
}
out() {
  querySelector('#data').text += '\n logged Out!';
}
