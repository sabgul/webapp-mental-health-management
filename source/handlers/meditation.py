import time

class MeditationHandler():

    def __init__(self,builder ):
        self.builder = builder


    def on_morning_meditation_start_button_clicked(self, _):
        print('called start')
        meditation_time = [5, 0]
        time_label = self.builder.get_object('morning_meditation_time')
        while meditation_time[0] != 0 or meditation_time[1] != 0:
            print('not even here')
            if meditation_time[1] == 0:
                meditation_time[0] -= 1
                meditation_time[1] == 59
            time.sleep(1.0)
            meditation_time[1] -= 1
            time_label.set_text(f'{meditation_time[0]}:{meditation_time[1]}')



    def on_morning_meditation_pause_button_clicked(self, _):
        pass


    def on_morning_meditation_reset_button_clicked(self, _):
        pass


    def on_evening_meditation_start_button_clicked(self, _):
        pass


    def on_evening_meditation_stop_button_clicked(self, _):
        pass


    def on_evening_meditation_reset_button_clicked(self, _):
        pass


    def on_midday_meditation_start_button_clicked(self, _):
        pass


    def on_midday_meditation_reset_button_clicked(self, _):
        pass


    def on_midday_meditation_pause_button_clicked(self, _):
        pass
