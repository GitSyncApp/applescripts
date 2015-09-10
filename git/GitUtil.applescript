--property GitUtil : my ScriptLoader's load_script(alias ((path to scripts folder from user domain as text) & "git:GitUtil.applescript"))
property ScriptLoader : load script alias ((path to scripts folder from user domain as text) & "file:ScriptLoader.scpt") --prerequisite for loading .applescript files
property TextAsserter : my ScriptLoader's load_script(alias ((path to scripts folder from user domain as text) & "text:TextAsserter.applescript"))
property git_path : "/usr/local/git/bin/" --to execute git commands we need to call the git commands from this path
(*
 * Returns current git status
 * @param: local_repo_path is the path to the target repository on your local machine (posix path)
 * NOTE: ~/someProject/someProject.git (use the ~ char if you want to access the users homve folder in OSX)
 * NOTE: the cd is to move manouver into the local repository path, the ; char ends the call so you can make another call
 * NOTE: To obtaine a more meaningfull list of items, create a metod that compiles a multidim accociative array derived from the text based staus
 * NOTE: Appending -s simplifies the ret msg or you can also use --porcelain which does the same
 *)
on status(local_repo_path, option)
	return do shell script "cd " & local_repo_path & ";" & git_path & "git status" & " " & option
end status
(*
 * Add a file or many files to a commit
 * @param file_name is the file name you want to add, use * if you want to add all files
 * Caution: when a file is removed, the * char wont work, you have to add the file manually
 * Example: GitUtils's add(local_repo_path, "*")
 *)
on add(local_repo_path, file_name)
	if (TextAsserter's is_wrapped_in(file_name, "\"") = false) then --avoids quoting a file_name that is already quoated, this can happen when git removes a file
		set file_name to quoted form of file_name
	end if
	set shell_cmd to "cd " & local_repo_path & ";" & git_path & "git add" & " " & file_name
	log "shell_cmd: " & shell_cmd
	return do shell script shell_cmd
end add
(*
 * Commits current changes
 * NOTE: Commit , usually doesnt return anything
 * @Param: msg example: "created index.html file"
 * Return example: [master af86d55] added
 * 1 file changed, 0 insertions(+), 0 deletions(-)
 * create mode 100644 error.html
 * NOTE: its important that the message is betweentwo single quates
 * Example: GitUtils's commit(local_repo_path, "changes made")
 * TODO: can we also add desscription to a commit?
 * TODO: what does commit -a do? -all?
 * NOTE: There is no "extended description" concept in git. Only the commit message. What happens is that the commit message can have a single line or multiple lines External tools or websites such as git-cola or GitHub can interpret multiple lines commit messages as: The first line is a short description All the other lines are an extended description For one line messages, only the "short description" is defined.
 * TODO: git commit -m "Title" -m "Description .........." <--this works
 *)
on commit(local_repo_path, message_title, message_description)
	log "message_title: " & message_title
	return do shell script "cd " & local_repo_path & ";" & git_path & "git commit" & " " & "-m" & " '" & message_title & "' " & "-m" & " '" & message_description & "'"
end commit

(*
 * Uploads the current from the local git commits to the remote git
 * NOTE: if the remote history has diverged from your history, you need to pull the remote branch and merge it into your local one,
 * @param from_where: "master"
 * @param to_where: "origin"
 * NOTE: git push <remote> <branch> (Push the specified branch to <remote>, along with all of the necessary commits and internal objects. This creates a local branch in the destination repository. To prevent you from overwriting commits, Git won�t let you push when it results in a non-fast-forward merge in the destination repository.)
 * @param remote_repo_url: github.com/user-name/repo-name.git
 * NOTE: you may mitigate using username and pass by researching how to use SSH key in github from trusted maschines
 * TODO: maybe add try error when doing the shell part
 * TODO: add branch as a param
 * Example: GitUtils's push(local_repo_path, "github.com/user-name/repo-name.git", user_name, user_password)
 * NOTE: Original gti cmd: git push https://github.com/user/test.git master
 * NOTE: ssh-example: ssh://user@host/path/to/repo.git
 * NOTE: Only Push to Bare Repositories In addition, you should only push to repositories that have been created with the --bare flag. Since pushing messes with the remote branch structure, it�s important to never push to another developer�s repository. But because bare repos don�t have a working directory, it�s impossible to interrupt anybody�s developments.
 * NOTE: The only time you should ever need to force push is when you realize that the commits you just shared were not quite right and you fixed them with a git commit --amend or an interactive rebase. However, you must be absolutely certain that none of your teammates have pulled those commits before using the --force option.
 * NOTE: you can also do "git push" if you are already switched into the branch you want to push and there is only one remote repo attached to the local repo
 *)
on push(local_repo_path, remote_repo_url, user_name, user_password)
	set target_branch to "master" --master branch
	set remote_loc to "https://" & user_name & ":" & user_password & "@" & remote_repo_url --https://user:pass@github.com/user/repo.git--"origin"
	set shell_cmd to "cd " & local_repo_path & ";" & git_path & "git push" & " " & remote_loc & " " & target_branch
	log "shell_cmd: " & shell_cmd
	return do shell script shell_cmd
end push
(*
 * The opposite of the add action
 * Important: You should never use git reset <commit> when any snapshots after <commit> have been pushed to a public repository
 * NOTE: The * resets all
 * NOTE: git reset <file> --Removes a file from the staging area, 
 * NOTE: git reset --hard --Removes a file from the staging area and the actual file (does not remove an untracked file)
 * NOTE: git reset --Removes all files form the staging area, opposite of 
 * NOTE: git reset <commit> --reset the staging area to a specific commit id, this is great when you want to group a bunch of commits together
 * NOTE: git reset --hard <commit>--reset the staging area and the actual files to a specific commit id (does not remove untracked files)
 * NOTE: git reset --hard HEAD~2--resets 2 commits backward, also removes the actual files (does not remove untracked files)
 * NOTE: "git reset --hard" (Undo changes in tracked files)
 * NOTE: "git clean -df" (Remove untracked files, does not remove .ignored files, use "-xf" for that)
 *)
on reset(local_repo_path, file_name)
	return do shell script "cd " & local_repo_path & ";" & git_path & "git reset" & " " & file_name
end reset
(*
 * clean
 * NOTE: git clean -n --Perform a �dry run� of git clean. This will show you which files are going to be removed without actually doing it.
 * NOTE: git clean -f --Remove untracked files from the current directory. The -f (force) flag is required unless the clean.requireForce configuration option is set to false (it's true by default). This will not remove untracked folders or files specified by .gitignore.
 * NOTE: git clean -f <path> --Remove untracked files, but limit the operation to the specified path.
 * NOTE: git clean -df --Remove untracked files and untracked directories from the current directory.
 * NOTE: git clean -xf --Remove untracked files from the current directory as well as any files that Git usually ignores.
 *)
on clean()
	--condition 
end clean
(*
 * Downloads the current from the remote git to the local git
 * NOTE: the original git cmd is "git pull origin master"
 * NOTE: "https://user:pass@github.com/user/repo.git"
 * NOTE: returns "Already up-to-date." if there are nothing to pull from remote
 * TODO: Do we need login and pass for pulling? - for private repos, yes
 * NOTE: In the simplest terms, git pull does a git fetch followed by a git merge.
 * TODO: what is git pull --rebase <remote>. Same as the above command, but instead of using git merge to integrate the remote branch with the local one, use git rebase.
 * NOTE: git fetch followed by git merge, git pull rolls this into a single command. git fetch <remote> followed by git merge origin/<current-branch>.
 * NOTE: you can also do "git pull" if you are already switched into the branch you want to pull and there is only one remote repo attached to the local repo
 *)
on pull(local_repo_path, remote_repo_url, user_name, user_password)
	set remote_loc to "https://" & user_name & ":" & user_password & "@" & remote_repo_url
	set target_branch to "master" --master branch
	return do shell script "cd " & local_repo_path & ";" & git_path & "git pull" & " " & remote_loc & " " & target_branch
end pull
(*
 * Manual pull
 * CAUTION: remember to wrap this method in a try error clause, so that you can handle merge conflicts
 * NOTE: the goal of this method is to arrive at the same state as the remote branch
 *)
on manual_pull(local_repo_path, remote_path, local_branch, remote_branch)
	fetch(local_repo_path, remote_path, from_branch) --git fetch origin master, retrive the latest repo info
	set is_remote_branch_ahead to GitAsserter's is_remote_branch_ahead(local_repo_path, remote_path, local_branch, remote_branch) --use the git log oneline thing here	--git log --oneline master..origin/master (to view the commit ids of the commits that the remote repo is ahead of local repo )
	if is_remote_branch_ahead then --asserts if a merge isneeded
		merge(local_file_path, local_branch, remote_branch) --git merge master origin/master (merges the changes from remote that you just fetched)
	end if
end manual_pull
(*
 * Cherry
 * NOTE: git cherry -v origin/master
 * TODO: impliment user and pass when this is needed, use "" if not
 * NOTE: this can be used to assert if there are any local commits ready to be pushed, if there are local commits then text will be returned, if there arent then there will be no text
 * Caution: if you use git add with https login and pass, you need to run "git remote update" in order for the above note to work
 *)
on cherry(local_repo_path, user_name, user_password)
	set loc to "origin" --"https://" & user_name & ":" & user_password & "@" & remote_repo_url
	set what_branch to "master" --master branch
	return do shell script "cd " & local_repo_path & ";" & git_path & "git cherry" & " -v " & loc & "/" & what_branch --TODO: whats the -v, verbose?
end cherry
(*
 * The opposite of the add action
 * "git reset"
 *)
on revert()
	
end revert

(*
 * --rm --remove files, research this
 *)
on remove()
	
end remove
(*
 * Init
 *)
on init(local_repo_path)
	set shell_cmd to "cd " & local_repo_path & ";" & git_path & "git init"
	log "shell_cmd: " & shell_cmd
	return do shell script shell_cmd
end init
(*
 * Attach a remote repo to a local repo
 * NOTE: git remote add origin https://github.com/user/test.git
 * NOTE: git remote add john http://dev.example.com/john.git (YOu can also add other teammates git repos to the same repo as above)
 *)
on attach_remote_repo(local_repo_path, remote_repo_path)
	set shell_cmd to "cd " & local_repo_path & ";" & git_path & "git remote add origin" & " " & (quoted form of remote_repo_path)
	log "shell_cmd: " & shell_cmd
	return do shell script shell_cmd
end attach_remote_repo
(*
 * Detach a remote repo of a local repo
 * NOTE: the reverse of attach_remote_repo method
 * NOTE: git remote rm origin
 *)
on detach_remote_repo(local_repo_path)
	set shell_cmd to "cd " & local_repo_path & ";" & git_path & "git remote rm origin"
	log "shell_cmd: " & shell_cmd
	return do shell script shell_cmd
end detach_remote_repo
(*
 * Clone
 * NOTE: Cloning automatically creates a remote connection called "origin" pointing back to the original repository.
 * NOTE: git clone <repo> <directory>
 * NOTE: 
 *)
on clone(remote_path, local_path)
	set shell_cmd to git_path & "git clone " & remote_path & " " & local_path
	log "shell_cmd: " & shell_cmd
	return do shell script shell_cmd
end clone
(*
 * Manually clone a git to a local folder
 * NOTE:  same as clone but differs in that it clones into an existing folder
 * TODO: this method is wrong see git workflows
 *)
on manual_clone(local_repo_path, remote_repo_path)
	--"git init" <--Installs the invisible .git folder
	--TODO: do reasearch with different posix paths ~/testing/ vs Users/Joe/testing vs macintosh hd/ user / etc, and how to convert between them
	--"git remote add origin https://github.com/user/testing.git" <-- attach a remote repo
	--"git fetch origin master" <--Download the latest .git data
	--"git checkout master" <-- Switches to the master branch (if you are already there then skip this)
	--"git fetch origin master" <-- Do this Again to download the latest .git data  , since your ahead sort of
end manual_clone
(*
 * Get a log of what is new, less verbose with pretty oneline
 * NOTE: git log --pretty=oneline
 * NOTE: "pretty=oneline" --get a log of what is new, less verbose with pretty oneline
 * NOTE: the cmd is: "git log"
 * NOTE: the do_log name is used because applescript has reserved the log word for its own log method
 * NOTE: git log --oneline
 * NOTE: "git log --oneline master..origin/master" to view the commit ids of the commits that the remote repo is ahead of local repo
 *)
on do_log(local_repo_path, cmd)
	set shell_cmd to "cd " & local_repo_path & ";" & git_path & "git log " & cmd
	log "shell_cmd: " & shell_cmd
	return do shell script shell_cmd
end do_log
(*
 * Config
 * NOTE: set your name: git config --global user.name "your-user-name"
 * NOTE: set your email: git config --global user.email you@example.com
 *)
on config()
	
end config
(*
 *
 * NOTE: the digits within the @@ and @@ signs represents indices of the lines that changed. Like: @@ -1 +1,3 @@,do a test with numbered lines from 1 - 16 and remove some to see the meaning like in this research: http://stackoverflow.com/questions/10950412/what-does-1-1-mean-in-gits-diff-output
 * NOTE: git diff returns a result if a file is removed (the removed file will look like this in the returned result: "--- path-to-removed-file")
 * NOTE: git diff does not reurn a result if a file is added
 * NOTE: git diff returns a result if a file is changed (the returned result will contain the lines that changed with a "-" preceding the line that is removed and a "+" preceding the line that is added)
 *)
on diff()
	return do shell script "cd " & local_repo_path & ";" & git_path & "git remote update"
end diff
(*
 * NOTE: brings your remote refs up to date
 * TODO: Ellaborate, it seems this method is needed to get the cherry method to work
 *)
on git_remote_update(local_repo_path)
	return do shell script "cd " & local_repo_path & ";" & git_path & "git remote update"
end git_remote_update
(*
 * NOTE: git remote -v (List the remote connections you have to other repositories. include the URL of each connection.)
 * NOTE: git remote add <name> <url> (Create a new connection to a remote repository. After adding a remote, you�ll be able to use <name> as a shortcut)
 * NOTE: git remote rm <name> (Remove the connection to the remote repository called <name>.)
 * NOTE: git remote rename <old-name> <new-name> (Rename a remote connection from <old-name> to <new-name>.)
 *)
on remote()
	--condition 
end remote
(*
 * Checkout
 * NOTE: When you switch between branches, the local files change accordingly
 * NOTE: to base a new branch of another branch do: "git checkout -b <new-branch> <existing-branch>"
 * NOTE: to create a new branch and switch to it do:"git checkout -b new-branch-name-here"
 * NOTE: "git checkout branch_name" is also a way to switch between your branches
 * NOTE: Checkout is a way to move back and forward in your code history. The git checkout command serves three distinct functions: checking out files, checking out commits, and checking out branches.
 * NOTE: git checkout works hand-in-hand with git branch. When you want to start a new feature, you create a branch with git branch, then check it out with git checkout. You can work on multiple features in a single repository by switching between them with git checkout
 * NOTE: To create a new branch adn start using it: "git branch new-feature" then "git checkout new-feature"
 * NOTE: git checkout <commit> <file> (checks out a spessific file from a spessific commit)
 * NOTE: git checkout <commit> (checks out all files from a spessific commit)
 * NOTE: git checkout HEAD hello.py (you can check out the most recent version with the following:)
 * NOTE: git checkout master hello.py (checks out a spessific file in a spessific branch)
 * NOTE: you can switch to a newly fetched branch with: "git checkout origin/master"
 * NOTE: after a merge you can use: "git checkout --thiers *" or "git checkout --ours *"
 * @param local_repo_path: path to the repository to operate on, must be absolute not relative
 * @param loc: can be branch like: origin/master or master or some_feature, or --ours, --theirs can also be an commit id
 * @param file_path: can be a relative file path, or the astrix sign for every file "*"
 *)
on check_out(local_repo_path, loc, file_path)
	set shell_cmd to "cd " & local_repo_path & ";" & git_path & "git checkout " & loc
	if file_path is not space then
		set shell_cmd to shell_cmd & " " & file_path
	end if
	log "shell_cmd: " & shell_cmd
	return do shell script shell_cmd
end check_out
(*
 * Fetch
 * NOTE: Fetching is what you do when you want to see what everybody else has been working on. Since fetched content is represented as a remote branch, it has absolutely no effect on your local development work. This makes fetching a safe way to review commits before integrating them with your local repository.
 * NOTE: The git fetch command downloads commits from a remote repository into your local repo, does not download the actual files
 * NOTE: git fetch <remote> (Fetch all of the branches from the repository. This also downloads all of the required commits and files from the other repository.)
 * NOTE: git fetch <remote> <branch> (Same as the above command, but only fetch the specified branch.)
 * NOTE: you can switch to the fetched branch with: "git checkout origin/master" then do "git log --oneline master..origin/master" to view the commit ids of the commits that the remote repo is ahead of local repo
 * TODO: does this work here: "git checkout --theirs *"  or "git checkout --ours *" 
 *)
on fetch(local_repo_path, remote_path, branch)
	--condition
	set shell_cmd to "cd " & local_repo_path & ";" & git_path & "git fetch " & remote_path
	if branch is not space then
		set shell_cmd to shell_cmd & " " & branch
	end if
	log "shell_cmd: " & shell_cmd
	return do shell script shell_cmd
end fetch
(*
 * branch
 * NOTE: to delete a branch do: "git branch -d some-branch" (if you just merged the branch in, if not use -D)
 * NOTE: to delete a branch from a remote repo: "git push origin --delete some_branch" Delete the specified branch. This is a �safe� operation in that Git prevents you from deleting the branch if it has unmerged changes.
 * NOTE: you can check which branches you have open by doing "git branch"
 * NOTE: Remote branches are just like local branches, except they represent commits from somebody else�s repository. You can check out a remote branch just like a local one, but this puts you in a detached HEAD state (just like checking out an old commit). You can think of them as read-only branches. 
 * NOTE: you can inspect these branches with the usual git checkout and git log commands. If you approve the changes a remote branch contains, you can merge it into a local branch with a normal git merge.
 * NOTE: git branch -r
 * # origin/master
 * # origin/develop
 * # origin/some-feature
 * NOTE: git checkout -b new_branch_name_here (Create and check out <new-branch>. The -b option is a convenience flag that tells Git to run git branch <new-branch> before running )
 *)
on branch(target_branch, delete_flag)
	
end branch
(*
 * Merging is Git's way of putting a forked history back together again
 * NOTE: If the two branches you�re trying to merge both changed the same part of the same file, Git won�t be able to figure out which version to use. When such a situation occurs, it stops right before the merge commit so 
 * NOTE: Note that merge conflicts will only occur in the event of a 3-way merge. It�s not possible to have conflicting changes in a fast-forward merge.
 * NOTE: The current branch will be updated to reflect the merge, but the target branch will be completely unaffected. 
 * NOTE: to list all local branches in your repo do: "git branch"
 * NOTE: to list all remote branches in your repo do: "git branch -r"
 * NOTE: "git branch -D branch_name_here" Force delete the specified branch, even if it has unmerged changes. This is the command to use if you want to permanently throw away all of the commits associated with a particular line of development.
 * NOTE: "git merge --no-ff branch_name_here" Merge the specified branch into the current branch, but always generate a merge commit (even if it was a fast-forward merge). This is useful for documenting all merges that occur in your repository.
 * NOTE: "git merge branch_name_here" Merge the specified branch into the current branch. Git will determine the merge algorithm automatically (discussed below).
 * NOTE: To merge a branch into another branch: first switch to the branch you want to merge into by doing "git checkout master", then do "git merge some_branch"
 * NOTE: To check out and merge a branch inn one-line: "git merge target_branch new_branch" (aka: target_branch <-- new_branch)
 * NOTE: To merge a remote branch into your local branch do: "git fetch origin master", "git checkout master", "git merge origin/master", if you get conflicts and you just want to keep all your or their updates you do "git checkout --thiers *" or "git checkout --ours *" and then add and commit and push. Now you have merged perfectly
 * @param from_branch the branch you want to apply to the @param into_branch
 * @param into_branch is the branch you usually checkout before doing the merge
 *)
on merge(local_repo_path, into_branch, from_branch)
	set shell_cmd to "cd " & local_repo_path & ";" & git_path & "git merge " & into_branch & " " & from_branch
	log "shell_cmd: " & shell_cmd
	return do shell script shell_cmd
end merge
(*
 * rebase
 * NOTE: it seems rebasing is almost the same as merging, but with rebasing you also get the opertunity to squash commits into fewer commits, so when the rebasing is complete, the commit history looks will look simpler than with merging.
 * NOTE: The golden rule of git rebase is to never use it on public branches.
 * NOTE: One of the best ways to incorporate rebasing into your workflow is to clean up local, in-progress features. By periodically performing an interactive rebase, you can make sure each commit in your feature is focused and meaningful. This lets you write your code without worrying about breaking it up into isolated commits�you can fix it up after the fact.
 * NOTE: you can also squash together commits without merging: "git checkout feature" then "git rebase -i HEAD~3" By specifying HEAD~3 as the new base, you�re not actually moving the branch�you�re just interactively re-writing the 3 commits that follow it. Note that this will not incorporate upstream changes into the feature branch.
 * NOTE: If you would prefer a clean, linear history free of unnecessary merge commits, you should reach for git rebase instead of git merge when integrating changes from another branch.
 * NOTE: you switch to the branch you want to rebase and then do "git rebase master"
 * TODO: try "git rebase -i" see if it works as a commit squassher
 *)
on rebase()
	
end rebase

(*
 * stash
 * NOTE: plain old `git stash` won't touch files that are untracked. For this, you need to use `git stash -u`
 * NOTE: stash vs branch merge: branch merge creates an extra commit, use stash when your in the middle of some unfinished feature and you need to pause it where it is
 * NOTE: stash vs branch rebase: the jury is still out, need more research into rebase, but it could resolve the extra commit problem
 * NOTE: use names for each stash: git stash save Major refactor of foo before interruption
 * NOTE: apply stash: git stash apply stash@{1}
 * NOTE: applies the latest stash and removes it: git stash pop
 * NOTE: remove stashes: stash drop stash@{1}
 * NOTE: list all stashes: git stash list
 * NOTE: stash also removes all files in your directory as if you just did a "git reset --hard"
 * NOTE: when you apply your stash again, you may get file conflicts, resolve this as you would resolve a branch merge
 * TODO: test if you can use theirs and ours as you would in a regular merge
 * TODO: create 2 methods for stash, stash and stash_by_id, stash_at
 *)
on stash(title)
	--TODO: if no title is provided store the stash without title: by not including the save syntax
	--"git stash -u save " & title
end stash