library persona;
import 'dart:js';

class Persona {
  String email;
  JsObject _navigatorID = context['navigator']['id'];

  /**
   * A persona is a representation of a user's "logged-in" status.
   * Give it the user's email, and two functions.
   * When the user logs in or out the corresponding function will be called,
   * allowing you to update your UI.
   * 
   * loggedIn will automatically call if the player has logged in previously,
   * loggedOut will automatically call if the player has logged out previously.
   * 
   */
  Persona(email, Function loggedIn, Function loggedOut) {
    JsObject watchData = new JsObject.jsify({
      'loggedInUser': email,
      'onlogin': loggedIn,
      'onlogout': loggedOut
    });
    // Give our JsObject to the Persona API
    _navigatorID.callMethod('watch', [watchData]);
  }

  /// Call when the user wants to login.
  request() {
    _navigatorID.callMethod('request');
  }

  /// Call when the user wants to logout.
  logout() {
    _navigatorID.callMethod('logout');
  }
}
