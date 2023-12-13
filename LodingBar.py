#!/usr/bin/env python
import time

def display_message(message):
    print(message)
    time.sleep(1)  # انتظر لثانية واحدة بعد عرض الرسالة

def progress(progress_percentage):
    progress_bar = "["
    for i in range(0, 100):
        if i < progress_percentage:
            progress_bar += "\033[32m="
        else:
            progress_bar += " "
    progress_bar += "\033[0m]"
    progress_bar += " " + str(progress_percentage) + "%"
    print(progress_bar, end='\r')

if __name__ == "__main__":
    delay = 1 / 100  # تعيين التأخير بحسب المتطلبات

    # عرض "Search" في البداية
    display_message("				Searches the Metasploit database")

    for i in range(0, 101):
        time.sleep(delay)
        progress(i)

    # سطر جديد بعد الانتهاء
    print("\n				\033[91m\033[1mDONE >>>>>>...............: ")
    
