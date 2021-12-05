#!/bin/env python3
"""
author: Daniel Kříž
login:  xkrizd03
e-mail: xkrizd03@vutbr.cz

registration.py contains the RegistrationHandler class, which implements logic
for signals emitted in the registration dialog.

WARNING: this module should communicate with server, which is not implemented
for this project, because of that these functions don't have any functionality
"""


class RegistrationHandler():
    """
    RegistrationHandler: Implements logic for signals emitted by registration
    dialog
    """

    def on_register_take_me_back_button_clicked(self, _):
        """
        on_register_take_me_back_button_clicked: user changed his mind with
        registration and wants to be taken back to the login stack window
        """
        pass


    def on_register_button_clicked(self, _):
        """
        on_register_button_clicked: send data to the server for verification.
        If they are not valid, notify the user with error dialog. Otherwise
        log the user in.
        """
        pass


    def on_register_offline_button_clicked(self, _):
        """
        on_register_offline_button_clicked: user changed his mind with
        registration and wants to use the application offline. transfer him
        to the offline stack window.
        """
        pass
