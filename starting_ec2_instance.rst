Starting and Provisioning an EC2 Instance
=========================================

Aim
---
This course will be taught using Jupyter [1] notebooks hosted on an Amazon Web
Services (AWS) Elastic Cloud Compute (EC2) instance. The aim of these
instructions is to: Start an EC2 instance with the correct access permissions
and use the key provided to log in, run some pre-defined scripts to provision
the EC2 instance with Anaconda Python [2] and the tools required for the course
and, finally, to start the Jupyer notebook server and connect to it using a web
browser. 

First: Stanting an EC2 instance
-------------------------------
1) Point your browser at https://aws.amazon.com/ and click "sign into the console" in the top right hand corner. 
2) Log in with the credentials you generated using the pre-course instructions,
once authenticated this will take you to the console which will look *similar*
to this:

.. image:: images/setup1_console.png
   :scale: 100 %
   :alt: alternate text
   :align: center

3) Type "ec2" into the text box under "AWS services" and click the first option
in the drop down box. This will land you on a page that looks similar to this
(of course you will not have existing snapshots etc...):

.. image:: images/setup2_ec2.png
   :scale: 100 %
   :alt: alternate text
   :align: center

3) If it is not expanded out already (ie there is a "+" sign) click on "Instances" and in the menu below it click on "Instances" and you will be greeted by this screen:

.. image:: images/setup3_instances.png
   :scale: 100 %
   :alt: alternate text
   :align: center

You can now click on "Launch Instance" on either blue and white button.

4) You will be greeted by a page that looks like this:

.. image:: images/setup4_options.png
   :scale: 100 %
   :alt: alternate text
   :align: center

click select next to the "Ubuntu Server 16.04 LTS (HVM), SSD Volume Type"
option. The next page asks you to click a radio button next to the "size" of the
machine you want to start. **While you are experimenting** use "t2.micro" which
gives you a 1GB 1CPU EC2 instance. **For the course** 1GB will not cut it,
select "m4.large". The on demand pricing [3] is 10.8 cents an hour.

.. image:: images/setup5_machines.png
   :scale: 100 %
   :alt: alternate text
   :align: center

Once your selection has been made click the **gray** button "Next: Configure
Instance Details". 

5) The next page can be left as all defaults... Click the **gray** button "Next:
Add Storage"

6) Again, this can be left as all defaults. Click the **gray** button "Next:
Add Tags"

7) *Again*, no need to add tags for the purposes of this course... Once more
click the **gray** button "Next: configure Security Group"

8) Now we have work to do! We need to configure our instance to be able to serve
the Jupyter notebook via HTTPS on port 8888. You will see a page similar to that
below. Make sure "Create a new security group" is checked, later you can select
"select and existing group" to save you time! Enter a simple name for the
Security group name like "j_sever". Enter something descriptive for the
Description. 

.. image:: images/setup6_security.png
   :scale: 100 %
   :alt: alternate text
   :align: center

We need to configure to allow connections from any IP to ports 443 (HTTPS) and
8888 (where Jupyter listens). Click "Add Rule". This will create a new row. On
the new row the drop down box on the left will default to "Custom TCP Rule".
Click it and select "HTTPS". Then click "Add Rule" again but this time, in the
new row leave the drop down on "Custom TCP Rule". In that same, third, row enter
"8888" into "Port Range" column and "0.0.0.0/0" in the source column. Once done
it should look like this:

.. image:: images/setup7_secset.png
   :scale: 100 %
   :alt: alternate text
   :align: center

Now we can click the **blue** button "Review and Launch".


[1]

[2]

[3] https://aws.amazon.com/ec2/pricing/on-demand/
