# Traveller

<kbd>![MenuBar](https://github.com/LauraAubin/Traveller/blob/master/Docs/Images/MenuBar.png)</kbd>

This is a script that lets you know when the next available bus will be arriving. This is based on your timetable and what bus you will be taking next.

**Features:**

If there are any busses being tracked on GPS, this is what will be displayed:

`🚍 5 arriving in 12 minutes`

Busses on GPS take priority, but if there are none available, the next scheduled arrival will be displayed:

`🗓 7 scheduled in 24 minutes`

When there are no more routes that day, the output will be:

`😕 No busses are running`

Finally, if your timetable does not have any plans for a day of the week, the menu bar text will read as:

`😴 No routes today`

## Setup

- First, clone this repo. You'll need all of these files together for the script to work.
- Setup BitBar, this is needed to display the script output in the Mac OS X menu bar. [Better instructions here](https://github.com/LauraAubin/Traveller/blob/master/Docs/BitBar.md).
- Write your own timetable. This is needed so that the script knows what busses you need to take and when. [Better instructions here](https://github.com/LauraAubin/Traveller/blob/master/Docs/Timetable.md).

## API Notes

This program makes use of the OC Transpo API. By default, this repo already has a working API ID and key.

```
APP_ID = "f45f8077"
APP_KEY = "f3d78fbf26c0991d5a3dbaad6057b637"
```

There are better instructions [here](https://github.com/LauraAubin/Traveller/blob/master/Docs/OC%20Transpo%20API.md) if you want to create your own personal credentials.
