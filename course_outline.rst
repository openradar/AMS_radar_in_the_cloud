AMS Short Course on Interacting with Radar Data in The Cloud
============================================================


**08:30 - 09:00** `Arrival, introductions and setting up of environments`_::

    Participants will arrive at Amazon by 8:30 and will be shown to the tutorial
    room

    Wifi will be set up and course materials distributed

**09:00 - 10:00** `How to set up an instance in the Amazon Cloud`_::

    An introduction to the concepts of virtualization and Elastic Cloud Compute
    (EC2) instances

    Installation on the EC2 instance of software required for the tutorial

**10:00 - 11:00** `An introduction and primer on Python and Scientific Python`_::

    Python is a general purpose, high-level, interpreted programming language
    that is widely used for scientific computing. During this session Python
    will breifly be introduced as a programming language for working with
    scientific data.  Much of the time will be spent introducing and providing
    background on some of the key libraries used in the scientific Python
    ecosystem including NumPy, SciPy, and matplotlib.

**11:00 - 12:00** `An introduction to Boto, Unidata tools and Py-ART`_::

    During this section additional Python tools, Boto, Siphon, THREDDS, and
    Py-ART, are introducts. These tools are needed or useful for accessing the
    NEXRAD Level 2 archive on Amazon Simple Storage Server (S3). This section
    will walk through using Boto, Amazon's Python library for talking to AWS,
    to access files on S3. Unidata's THREDDS server, and its Siphon Python
    client, will be introduced as a way for accessing the radar data using
    OPeNDAP and for querying available data files. Finally, Py-ART will be
    discussed as a Pythonic solution for analyzing and displaying radar data.

**12:00 - 13:30** `Lunch`_::

    On your own. 

**13:30 - 16:00** `Tying it together, using Boto, Py-ART and Siphon to fetch and plot radar data and observations in the cloud`_::

    Group activities where we will use code discussed from earlier to build an
    EC2 instance and python file that can fetch radar and other observations and
    produce a visualization for any site and time in the archive. 

**16:00 - 17:00** `Getting it to scale, how to use AWS to set up many processes`_::

    Radar data processing, in general tends to be very pleasantly parallel. This
    section will discuss how you can use instances and Amazon's scheduling tools
    to map many time steps or many sites into a cloud of processes.

**17:00 - 17:30** `Questions answers and feedback`_::

    A chance to ask the tutors questions, present your own use cases and find
    out what is next. 



.. raw:: pdf

      PageBreak


Arrival, introductions and setting up of environments
-----------------------------------------------------

Scott Collis, Jonathan Helmus and Mark Korver

Getting hooked into the wifi, testing connections, dissemination of course
materials.

How to set up an instance in the Amazon Cloud
---------------------------------------------

Mark Korver

An introduction to how to set up an EC2 instance and start it running. How to
log into it via SSH and how to run code and get results.  

An introduction and primer on Python and Scientific Python
----------------------------------------------------------

Jonathan Helmus and Ryan May

Python is a general purpose, high-level, interpreted programming language
that is widely used for scientific computing. During this session Python
will breifly be introduced as a programming language for working with
scientific data.  Much of the time will be spent introducing and providing
background on some of the key libraries used in the scientific Python
ecosystem including NumPy, SciPy, and matplotlib.


An introduction to Boto, Unidata tools and Py-ART
-------------------------------------------------

Scott Collis and Ryan May

During this section additional Python tools, Boto, Siphon, THREDDS, and
Py-ART, are introducts. These tools are needed or useful for accessing the
NEXRAD Level 2 archive on Amazon Simple Storage Server (S3). This section
will walk through using Boto, Amazon's Python library for talking to AWS,
to access files on S3. Unidata's THREDDS server, and its Siphon Python
client, will be introduced as a way for accessing the radar data using
OPeNDAP and for querying available data files. Finally, Py-ART will be
discussed as a Pythonic solution for analyzing and displaying radar data.


Lunch
-----

Details and suggestions will go here closer to the workshop date. 

Tying it together, using Boto, Py-ART and Siphon to fetch and plot radar data and observations in the cloud
-----------------------------------------------------------------------------------------------------------

All Tutors

Group project to build and run some code to create a visualization for one of a
number of specific historical cases. Pulling radar data from S3, using Siphon to
fetch observational data and Matplotlib to plot data overlay.
This is the hands on component where students will be building code. Students
will be provided with a python text file with missing blocks and using the
knowledge gained during the course and with the guidance of the tutors will
create a nice plot.

Getting it to scale, how to use AWS to set up many processes
------------------------------------------------------------

Mark Korver and Scott Collis

Radar data processing, in general tends to be very pleasantly parallel. This
section will discuss how you can use instances and Amazon's scheduling tools
to map many time steps or many sites into a cloud of processes.

Questions answers and feedback
------------------------------

All Tutors

Feedback and further discussion
