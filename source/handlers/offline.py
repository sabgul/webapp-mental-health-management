#!/bin/env python3
"""
author: Daniel Kříž
login:  xkrizd03
e-mail: xkrizd03@vutbr.cz

offline.py contains the OfflineHandler class, which implements logic
for signals emitted in the offline dialog.
"""


class OfflineHandler():
    """
    OfflineHandler: Implements logic for signals emitted by offline dialog
    """

    def on_offline_take_me_back_button_clicked(self, _):
        """
        on_offline_take_me_back_button_clicked: the user changed his mind with
        using the application in offline mode. Take the user back to the
        login stack window.
        """
        pass


    def on_offline_understand_button_clicked(self, _):
        """
        on_offline_understand_button_clicked: the user understands what it
        means to use the application offline. End the offline dialog and
        open the application.
        """
        pass


    def on_offline_login_button_clicked(self, _):
        pass
