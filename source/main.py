#!/bin/env python3
"""
author: Daniel Kříž
login:  xkrizd03
e-mail: xkrizd03@vutbr.cz

DataDriver.py contains the DataDriver class, which implements is simply entry
point for all the data drivers in the application. By data driver I mean an
API for corresponding application data.
"""

import gi
gi.require_version("Gtk", "3.0")
from gi.repository import Gtk as gtk

# TODO: remove us
from drivers.quotes import QuotesDriver
from drivers.reflect import ReflectDriver
qd = QuotesDriver()
rd = ReflectDriver()

from DataDriver import DataDriver
from SignalHandler import SignalHandler

class Application(SignalHandler):
    """
    Application: This class represents the whole application, it inherits all
    signal handlers thanks to SignalHandler.
    """

    def __init__(self, builder, data_driver):
        self.builder = builder
        self.data_driver = data_driver
        self.window = builder.get_object('application_window')
        # this connects application signals to the view signals
        builder.connect_signals(self)


    def start(self):
        """
        start: Application entry-point
        """
        # TODO: move to the DailyHandler.init_daily
        dt = self.builder.get_object('daily_quete_text')
        da = self.builder.get_object('daily_quete_author')
        auth, text = qd.get_random()
        dt.set_text(text)
        da.set_text('- ' + auth)

        # Initialization of individual sections
        self.init_reflect(rd)
        self.init_safe_space()
        self.window.show_all()

        # We are running in the offline mode
        logout = self.builder.get_object('logout_button')
        logout.set_visible(False)


    def on_application_window_destroy(self, _):
        """
        on_application_window_destroy: Application deconstructor
        """
        gtk.main_quit()

if __name__ == '__main__':
    builder = gtk.Builder()
    builder.add_from_file("../ui/ui.glade")

    app = Application(builder, DataDriver())
    app.start()

    gtk.main()
