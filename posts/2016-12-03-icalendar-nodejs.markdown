---
title: Using the icalendar format with nodejs
author: Paul
---


_[French version available on medium](https://medium.com/@paul.derosanbo/utilisation-du-format-icalendar-avec-nodejs-e8db3890d299)_


When developing my new time management application, I have been working on calendars and periods using the icalendar format. This is a summary of the libraries used for my developments.

The purpose of the application is to record and display absences and other read-only calendars. The icalendar format was used to import external calendars for work schedules, holidays and school holidays.


## Management of recurrence rules

[ical.js](https://github.com/peterbraden/ical.js): This module is the most usefull I could find despite some missing features, support for the RDATE server side property is not complete. With the commits added in my [fork](https://github.com/polo2ro/ical.js), it is possible to compute repetitive events from the RDATE and RRULE rules.

[rrule](https://github.com/jkbrzt/rrule): This module allows the calculation of recurrence rules from a start date and a RRULE property, it can be used to calculate the recurrences of an event from informations stored in the database. The latest npm version is not very up to date at the moment, I had to use a specific commit number to take advantage of the latest features.


## Non-working days

There are services that offer ics calendars for non-working days, but they are not enough accurate or contain several areas in the same file, for example the one proposed for France by google calendar contains Christmas Eve but this is not an official non-working day in France...

I created a project to facilitate the management of non-working days on multiples countries, this module generate ics (icalendar) files for each different "zone" of non-working days. A Markdown index file is also generated to view the list of supported fields.

* Module on github: [icsdb](https://github.com/gadael/icsdb)
* [Supported areas](https://github.com/gadael/icsdb/tree/master/build)

For the moment I use this module by entering the ics files url directly in the application. I think it is possible to use these files on other calendars such as google calendar. In the future I would probably add a json index to retrieve the list of files available by API.
