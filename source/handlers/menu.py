#!/bin/env python3
"""
author: Daniel Kříž
login:  xkrizd03
e-mail: xkrizd03@vutbr.cz

menu.py contains the MenuHandler class, which implements logic for signals
emitted by the menu
"""

class MenuHandler():
    """
    MenuHandler: Implements logic for signals emitted by application menu
    """

    def __init__(self, builder):
        self.builder = builder


    def init_menu(self):
        """
        init_menu: As the class is going to be inherited by the SignalHandler
        and after that by the Application itself. We have to provide some way
        how to initialy read the data from model and setup the menu.
        """
        pass


    def on_about_button_clicked(self, _):
        """
        on_about_button_clicked: the user wants to see informations about
        the application. This button opens the 'about' window
        """
        about_window = self.builder.get_object('about_window')
        about_window.show_all()
        # FIXME: currenly the about can be open only once, then it fails

    # NOTE: These signals doesn't seem to work
    def on_destroy_about_window(self, _):
        """
        on_destroy_about_window: this signal is emitted when the about window
        is close, and this function should clear all the memory
        """
        pass


    def on_reflect_change_value(self, _):
        """
        on_reflect_value_changed: user changed the default amount of reflect
        questions in the exercise/reflect. Update the model.
        """
        pass


    def on_meditation_time_value_changed(self, _):
        """
        on_meditation_value_changed: user changed the default amount of time
        for one meditation in exercise/meditation. Update the model.
        """
        pass

    def on_login_button_clicked(self, _):
        pass

    def on_logout_button_clicked(self, _):
        pass
