---
title: Gadael.com project introduction
author: Paul
---

_[French version available on medium](https://medium.com/@paul.derosanbo/presentation-du-projet-gadael-751d8aae0274)_

![Gadael.com page preview](/images/gadael-header.png)

## Service Objectives

The objective of the project is to provide a hosted online service allowing companies with multiple employees to manage their working time more effectively. Each employee can connect to the application and perform leave requests or requests for working time recovery.

A paid plan will be available for companies with more than 5 active users. Below 5, registration and use are free which allows easy testing of the solution and either continue use in SAAS mode or install it on another server.

## Service operation

From the gadael.com website, users will be able to register and create an instance of the Gadael application for their company. Each user must first choose a name that will be used in subdomain. Each user company is therefore isolated on its own site.

The application once created in the subdomain allows to create accounts and manages itself its own authentication. The accounts of gadael.com do not allow to use the application but only to start it, to stop it, to switch to paid plan, etc...

## The Gadael application

Gadael allows management of leave requests, working-time recovery requests, time saving accounts, different types of balance consumption for part-time workschedules. Several configurable levels of approval, display of calendars by services or personal calendars. Seniority rights, country specific rights, etc.

Administrators must set up leave rights and managers have to validate user requests. Roles may be cumulated if necessary.

The application has been developed to meet the needs of companies of all sizes and was conceived from the start to manage collaborators spread across several countries.

The other strength of Gadael lies in the management of planning and the historization of what has been done. Changes in work schedules and leave right collections may be planned in advance and the balance of entitlements can be exported as it was at an earlier date.

Gadael can integrate into an existing information system, so connectors have been developed so that periods of absence are visible in Google Calendar. Similarly it is possible to authenticate with a google account.

To facilitate the production of pay slips, it is possible to export the paid vacation periods of the month either in Excel format or in [Sage](http://www.sage.fr/fr/logiciels/paie-ressources-humaines#bas-de-page-paie) format.


## Moral Commitment

This is a software as a service but with the following commitments:

* It is possible to host yourself the same application without restriction, it is an open-source software.
* It should be possible to migrate the data to another host at any time and delete your account.
* Access to paid plan must not change the application functionalities because only one version of the software exists.
* No ads will be displayed on the application.
* User data will not be exploited or resold. If a newsletter is to be added later, it must be the subject of an additional registration.

In large part, these commitments match to the charter by the [french initiative "les chatons"](https://chatons.org/). At the moment, membership in this network is not foreseen because the commitments they entail require more investment.


## More information

The Gadael software is published under MIT license, I am the software author and the owner of the site gadael.com which will eventually propose the SAAS hosting solution.

The [gadael software on github](https://github.com/gadael/gadael)

Gadael is a word that means departure, holiday or absence in Irish Gaelic.
