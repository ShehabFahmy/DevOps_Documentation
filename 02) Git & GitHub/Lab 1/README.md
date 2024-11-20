## Clone a Repository
```
git clone https://github.com/Ahmed-Nasr-hassan/test-projetct.git
```
## Create a Local Repository, a Remote Repository and Upload a File from the Local to the Remote Repository
```
cd local-repo
git init
git branch -M main
git remote add origin https://github.com/ShehabFahmy/DevOps_YAT_git_lab1.git
echo "Shehab Mostafa" > file.txt
git add .
git commit -m "File Added"
git push origin main
```
---
## Pull Request
A pull request is a proposal to merge a set of changes from one branch into another. In a pull request, collaborators can review and discuss the proposed set of changes before they integrate the changes into the main codebase.
After initializing a pull request, you'll see a review page that shows a high-level overview of the changes between your branch (the compare branch) and the repository's base branch. You can add a summary of the proposed changes, review the changes made by commits, add labels, milestones, and assignees, and @mention individual contributors or teams.

Creating the pull request:
1) On GitHub.com, navigate to the main page of the repository.
2) In the "Branch" menu, choose the branch that contains your commits.
3) Above the list of files, in the yellow banner, click Compare & pull request to create a pull request for the associated branch.
4) Use the base branch dropdown menu to select the branch you'd like to merge your changes into, then use the compare branch drop-down menu to choose the topic branch you made your changes in.
5) Type a title and description for your pull request.
6) To create a pull request that is ready for review, click Create Pull Request. To create a draft pull request, use the drop-down and select Create Draft Pull Request, then click Draft Pull Request. If you are the member of an organization, you may need to request access to draft pull requests from an organization owner.

Once you've created a pull request, you can push commits from your topic branch to add them to your existing pull request. These commits will appear in chronological order within your pull request and the changes will be visible in the "Files changed" tab.

Other contributors can review your proposed changes, add review comments, contribute to the pull request discussion, and even add commits to the pull request. By default, in public repositories, any user can submit reviews that approve or request changes to a pull request. Organization owners and repository admins can limit who is able to give approving pull request reviews or request changes.

After you're happy with the proposed changes, you can merge the pull request. If you're working in a shared repository model, you create a pull request and you, or someone else, will merge your changes from your feature branch into the base branch you specify in your pull request.
