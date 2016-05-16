# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?
	* Version control allows us to view the entire history of revisions to one or more files, and merge revisions made by different people.
* What is a branch and why would you use one?
	* A branch copies what is in a repo and becomes a working copy that is safe to build and experiment from.
	* Changes are isolated in separate branches. If you decide not to implement a change or new feature, you simply decide not to merge that branch into the master branch.
* What is a commit? What makes a good commit message?
	* A commit is a save point in Git
	* A commit has a unique ID and a message
	* A good commit message is specific to the changes made between that commit and the previous one
* What is a merge conflict?
	* A merge conflict is when two people make changes to the same file and both commit their changes back to master.
	* Git doesn't know which pull request is correct, so users have to solve the conflict themselves.