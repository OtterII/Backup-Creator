import os
import time

global t

if os.path.exists('time.txt'):
    # If a time is saved, it reads it.
    txt = open('time.txt')
    t = int(txt.read())
    txt.close()
    print('Started at ' + str(t/2) + ' hours. ' + str(24-t/2) + ' hours to go until backup.')

else:
    # If a time is not saved, it creates and saves the time as 0.
    t = 0
    txt = open('time.txt', 'w+')
    txt.write(str(t))
    txt.close()

while True:
    if t < 48:
        # If the time is less than 48 halves of an hour, it will wait half an
        # hour, then increment and save the time.
        time.sleep(1800)
        t += 1
        txt = open('time.txt', 'w+')
        txt.write(str(t))
        txt.close()
        print('Waited another half an hour. There are now ' + str(24-t/2) + ' hours left until the next backup will be taken.')

    else:
        fileManager = os.popen('./fileManager.sh')
        print(fileManager)
        t = 0
