AMS Short Course on Interacting with Radar Data in The Cloud
============================================================

Welcome to what is going to be a very novel workshop. We have given several workshops in the past and used various techniques such as Anaconda environments and Virtual Machines. One limitation has always been the hardware. Well the fact that the AMS meeting is in Seattle and that Amazon now hosts the whole NEXRAD archive on a Simple Storage Solution (S3) Bucket means it is time for the first ever AMS Short Course on Interacting with Radar Data in The Cloud.

Pre-Worksop Instructions
------------------------
Please follow the instructions here:

http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/get-set-up-for-amazon-ec2.html

Note: Not all steps are compulsory, but at the very minimum the first step needs
to be completed and Amazon needs to verify your account.

Morning Directions
------------------
Please follow instructions here:

https://github.com/openradar/AMS_radar_in_the_cloud/blob/master/directions.rst

Starting and Provisioning an EC2 instance
-----------------------------------------
In this course we will be working with an EC2 instance that uses a shell script
to install Anaconda Python, Py-ART, MetPy, Siphon and Project Jupyter. The
script also configures Jupyter to serve notebooks via HTTPS so students can
interact with the EC2 instance. **Very** detailed instructions are here:

https://github.com/openradar/AMS_radar_in_the_cloud/blob/master/starting_ec2_instance.rst

Course Notebooks
----------------
1) An Introduction to Python 

https://github.com/openradar/AMS_radar_in_the_cloud/blob/master/notebooks/Introduction_to_Python.ipynb

2) An Introduction to Numpy

https://github.com/openradar/AMS_radar_in_the_cloud/blob/master/notebooks/Introduction_to_NumPy.ipynb

3) An Introduction to Matplotlib

https://github.com/openradar/AMS_radar_in_the_cloud/blob/master/notebooks/Introduction_to_Matplotlib.ipynb

4) An Introduction to Scipy

https://github.com/openradar/AMS_radar_in_the_cloud/blob/master/notebooks/Introduction_to_SciPy.ipynb

5) Basic Py-ART

https://github.com/openradar/AMS_radar_in_the_cloud/blob/master/notebooks/Basic%20PyART.ipynb

6) Siphon Radar Server

https://github.com/openradar/AMS_radar_in_the_cloud/blob/master/notebooks/Siphon%20Radar%20Server.ipynb

7) Surface Data with Siphon and MetPy

https://github.com/openradar/AMS_radar_in_the_cloud/blob/master/notebooks/Surface%20Data%20with%20Siphon%20and%20MetPy.ipynb

8) Introduction to Boto, Nexrad on S3 with a hurricane chaser

https://github.com/openradar/AMS_radar_in_the_cloud/blob/master/notebooks/introduction%20to%20S3%2C%20Boto%20and%20Nexrad%20on%20S3%20with%20a%20hurricane%20chaser.ipynb

9) Putting it all together

https://github.com/openradar/AMS_radar_in_the_cloud/blob/master/notebooks/Putting_it_all_together.ipynb
