# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?

Version control allows for the storage of multiple versions of the same project, at different points in time, to be stored all in one database.  It is useful, because it allows us to go back to a file at a previous point in time if we realize we made a mistake or would like to revert to a previous version of it.

* What is a branch and why would you use one?

A branch is a parallel track to an existing master file.  It is essentially a copy of the master file that becomes its own independent entity upon creation, separate from the master file.  This independent existence gives a branch the freedom to be developed in a different direction than the master.  It is a way to preserve a core part of a project and then embellish or experiment on the project, without destroying the original structure of the project.  Branches are also a useful way for multiple people to work on the same project.

* What is a commit? What makes a good commit message?

A commit is when you save a version of your file at a point in time.  A good commit message is one that lets the reader know what changes you made at the time of the commit.
* What is a merge conflict?

A merge conflict is when multiple branches are merged with a master, but there have been changes to the same lines of code in both branches.  When this happens, the system does not know which code should remain and which code should be removed.  In this instance a choice must be made to find a way to either combine both of these codes into a single code, or choose one branch's solution over the other.