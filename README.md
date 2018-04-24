Seminar Hall Booking
====================

This project is to develop a seminar hall booking system for the college to
allow teachers to book the seminar halls through their online portal. This
is done to replace the traditional way of booking seminar halls using a
register.


#### BUILD

To generate the CSS files and to class files required by the project run,

    $ make

That's it, for now.!


#### RUNNING

To run this a recent version of apache tomcat is required. This repo
was tested using version 8.5.


The following typical steps are required to run this project using tomcat,

1. Clone this repo into the 'webapps' folder of the tomcat installation

1. Run 'make' inside the root of this repository

1. Start the tomcat server and open the app typically using
   http://localhost:8080/Seminar

Note: This project also requires that a database to run for it to interact with.
The structure of the tables in the database aren't documented currently which is
unfortunate.


##### Psss. This project is done partly to help enhance our web development skills. :smile:
