#!/bin/env python3
"""
author: Daniel Kříž
login:  xkrizd03
e-mail: xkrizd03@vutbr.cz

login.py contains the LogicHandler class, which implements logic for signals
emitted in the login dialog.

WARNING: this module should communicate with server, which is not implemented
for this project, because of that these functions don't have any functionality
"""


class LoginHandler():
    """
    LogicHandler: Implements logic for signals emitted by login dialog
    """

    def on_login_register_button_clicked(self, _):
        """
        on_login_register_button_clicked: the user is not registered and wants
        to, the dialog is going to change it's stack window to the register one
        and user is going to continue with its registration there.
        """
        pass


    def on_login_login_button_clicked(self, _):
        """
        on_login_login_button_clicked: the user wants to login, data will be
        checked with the server. If they are not correct, user will be notified
        via dialog.
        """
        pass


    def on_login_cancel_button_clicked(self, _):
        """
        on_logic_cancel_button_clicked: if this signal is emitted, then the
        use decided not to login, two things can happen either the user already
        opted for offline data storage, and the application is still going to
        work. Or the login is required and the application is going to turn
        itself off.
        """
        pass
