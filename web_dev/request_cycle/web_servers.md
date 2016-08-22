#What are some of the key design philosophies of the Linux operating system?

The Linux system operates on the assumption that the user is comfortable with computers.  Unlike Windows, Linux does not try to hide functionality from you by preventing access from a full array of features.

A second principle that Linux operates on is: equality.  Whether you can afford an operating system or not does not impact you if you are a Linux user.  Linux is open source and promotes open communication within the Linux community.

The primary tenet of their philosophy is thus, 'Treat all users with respect.'

#What is a VPS?  What are the advantages of using a VPS?

A Virtual Private Server is what its title sounds like: a virtual machine run by an internet hosting service.  A VPS does not have its own private physical server dedicated to its tasks.  Rather, a single server for a hosting company is partitioned into multiple mini-servers that are run as VPS's.

The primary difference between a VPS and a dedicated server is that a virtual private servers are multiple virtual servers located on a single physical server while a dedicated server has only one account per server/CPU.

**Advantages to using a VPS include:**
* cost-effectiveness: A VPS is cheaper than running your own dedicated private server
* security: is more secure than shared hosting
* more powerful than shared hosting: you will not be sharing all your resources with other websites sharing the same server.  VPS's generally have a minimum allocation of resources available to them unlike shared hosting.  However, in shared hosting, you are dependent upon the activities of the other websites on the same server.  If they are hogging the server's resources, your site will run slower.

**Bonus Question:** Why is it considered a bad idea to run programs as the root user on a Linux system?

As a root user on Linux, you are given permission to do anything to your system.  This permission can be harmful in some cases.  For example, if you run a program that has a bug or mistakenly run malicious software, these programs have now been given full permission to wreak havoc on your system.  If you had run the same programs through a limited user account, your essential operating files would have been protected, and at most it would damage your home directory or similar attached devices.

A second reason to not run programs as a root user is to protect yourself if you make a mistake such as "rm -rf *" a location or if you are experimenting with your operating system.

In general, root user's features are not necessary for most computer tasks you will be accomplishing, so why keep the back door open for regular opportunities to sabotage your system?