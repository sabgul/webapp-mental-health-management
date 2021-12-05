#!/bin/env python3
"""
author: Daniel Kříž
login:  xkrizd03
e-mail: xkrizd03@vutbr.cz

offline.py contains the OfflineHandler class, which implements logic
for signals emitted in the offline dialog.
"""


class SafeSpaceHandler():
    """
    SafeSpaceHandler: Implements logic for signals emitted by Safe Space
    """

    def __init__(self, builder, data_driver):
        self.builder = builder
        self.data_driver = data_driver


    def init_safe_space(self):
        """
        init_safe_space: the safe space window has to be initiliazed before
        the application can be used. As the SafeSpaceHandler class is going
        to be inherited to the Application, we can use this function.
        """
        line_list = self.builder.get_object('prevention_store')
        for line in self.data_driver.prevention.get_all():
            line_list.append([line['country']])
        cb = self.builder.get_object('safe_space_combobox')
        cb.set_model(line_list)


    def on_safe_space_combobox_changed(self, _):
        """
        on_safe_space_combobox_changed: user changed it's country of stay,
        update the links according to the data stored in the model
        """
        cb = self.builder.get_object('safe_space_combobox')
        cb_iter = cb.get_active_iter()
        if cb_iter is not None:
            country_code = cb.get_model()[cb_iter][:2][0]
            data = self.data_driver.prevention.get(country_code)

            gui_webpage = self.builder.get_object('safe_space_webpage')
            gui_webpage.set_uri(data['webpage'])
            gui_webpage.set_label(data['webpage'])

            phonenum = f"+{data['phone-prefix']}{data['phone']}"
            gui_phone = self.builder.get_object('safe_space_phone_number')
            gui_phone.set_uri(phonenum)
            gui_phone.set_label(phonenum)
