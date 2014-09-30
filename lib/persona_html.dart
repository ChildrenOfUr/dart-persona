library persona;
import 'dart:js';
import 'dart:async';
import 'dart:html';

class Persona {
  String email;
  JsObject _navigatorID = context['navigator']['id'];

  /**
   * A persona is a representation of a user's "logged-in" status.
   * Give it the user's email, and two functions.
   * When the user logs in or out the corresponding function will be called,
   * allowing you to update your UI.
   * 
   */
  Persona(email, Function loggedIn, Function loggedOut) {
    JsObject watchData = new JsObject.jsify({
      'loggedInUser': email,
      // Verifies the assertion before calling the provided 'login' function.
      'onlogin': loggedIn,
      'onlogout': loggedOut
    });
    // Give our JsObject to the Persona API
    _navigatorID.callMethod('watch', [watchData]);
  }

  /// Call when the user wants to login, will be
  /// called automatically on load if they still are.
  request() {
    _navigatorID.callMethod('request');
  }

  /// Call when the user wants to logout, will be
  /// called automatically on load if they are not.
  logout() {
    _navigatorID.callMethod('logout');
  }
}
