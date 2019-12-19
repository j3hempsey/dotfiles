from Foundation import NSUserNotification
from Foundation import NSUserNotificationCenter
from Foundation import NSUserNotificationDefaultSoundName
from optparse import OptionParser

def main():
    parser = OptionParser(usage='%prog -t TITLE -m MESSAGE')
    parser.add_option('-t', '--title', action='store', default='A title')
    parser.add_option('-m', '--message', action='store', default='...')
    parser.add_option('--no-sound', action='store_false', default=True,
        dest='sound')

    options, args = parser.parse_args()
	notify(options.title, options.message, options.sound)

def notify(tite, message, sound=True):
    notification = NSUserNotification.alloc().init()
    notification.setTitle_(title)
    notification.setInformativeText_(message)
    if sound:
        notification.setSoundName_(NSUserNotificationDefaultSoundName)

    center = NSUserNotificationCenter.defaultUserNotificationCenter()
    center.deliverNotification_(notification)

if __name__ == '__main__':
    main()
