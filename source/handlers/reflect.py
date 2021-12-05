#!/bin/env python3
"""
author: Daniel Kříž
login:  xkrizd03
e-mail: xkrizd03@vutbr.cz

reflect.py contains the ReflectHandler class, which implements logic for
signals emitted by the GTK (view) in the exercise/reflect section.

It also implements logic for finishing the daily reflect task and random
choice of reflect questions. (this choice is not persistent)
"""

from .daily_handler import DailyHandler


class ReflectHandler(DailyHandler):
    """
    ReflectHandler: Implements logic for signals emitted by exercise/reflect
    """

    active_stack = 0
    children = [
        'first_reflect_text',
        'second_reflect_text',
        'third_reflect_text',
    ]

    def __init__(self, builder, data_driver):
        self.builder = builder
        self.data_driver = data_driver

    def on_reflect_next_clicked(self, _):
        # button was clicked at the first question, so we have to make the
        # previous button sensitivive again
        if self.active_stack == 0:
            btn = self.builder.get_object('reflect_previous')
            btn.set_sensitive(True)

        self.active_stack += 1
        stack = self.builder.get_object('reflect_stack')
        child = self.builder.get_object(self.children[self.active_stack])
        stack.set_visible_child(child)

        if self.active_stack == 2:
            btn = self.builder.get_object('reflect_next')
            btn.set_sensitive(False)
            # when we have come to the last question, then we have done the
            # daily task of reflecting
            self.update_daily('reflect')
            # self.data_driver.daily.set('reflect', True)



    def on_reflect_previous_clicked(self, _):
        # button was clicked at the last question, so we have to make the
        # next button sensitivive again
        if self.active_stack == 2:
            btn = self.builder.get_object('reflect_next')
            btn.set_sensitive(True)

        self.active_stack -= 1
        stack = self.builder.get_object('reflect_stack')
        child = self.builder.get_object(self.children[self.active_stack])
        stack.set_visible_child(child)

        if self.active_stack == 0:
            btn = self.builder.get_object('reflect_previous')
            btn.set_sensitive(False)

    def init_reflect(self, data_driver):
        showed = []
        for question in self.children:
            text = ''
            id, text = data_driver.get_random()
            if id in showed:
                while id in showed:
                    id, text = data_driver.get_random()
            else:
                showed.append(id)
            self.builder.get_object(question).set_text(text)

