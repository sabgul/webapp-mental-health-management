
from handlers.inspiration import InspirationHandler
from handlers.logout import LogoutHandler
from handlers.breathing import BreathingHandler
from handlers.journal import JournalHandler
from handlers.registration import RegistrationHandler
from handlers.login import LoginHandler
from handlers.offline import OfflineHandler
from handlers.safe_space import SafeSpaceHandler
from handlers.reflect import ReflectHandler
from handlers.meditation import MeditationHandler
from handlers.menu import MenuHandler
from handlers.dashboard import DashboardHandler

"""
I am aware that multiple inheritance is unusual and in some cases considered
even harmful and I also prefere composition, but because of the GTK API it is
the easiest way to decompose code into multiple segments and use this class
as the only entry point to all signal handlers.
"""
class SignalHandler(
        DashboardHandler,
        MenuHandler,
        MeditationHandler,
        ReflectHandler,
        SafeSpaceHandler,
        OfflineHandler,
        LoginHandler,
        JournalHandler,
        BreathingHandler,
        LogoutHandler,
        InspirationHandler,
        RegistrationHandler
        ):
    def __init__(self, builder):
        self.builder = builder
        print('signal handler')
