property ScriptLoader : load script alias ((path to scripts folder from user domain as text) & "file:ScriptLoader.scpt") --prerequisite for loading .applescript files
property GitParser : my ScriptLoader's load_script(alias ((path to scripts folder from user domain as text) & "git:GitParser.applescript"))
property GitAsserter : my ScriptLoader's load_script(alias ((path to scripts folder from user domain as text) & "git:GitAsserter.applescript"))
property GitModifier : my ScriptLoader's load_script(alias ((path to scripts folder from user domain as text) & "git:GitModifier.applescript"))
property git_path : "/usr/local/git/bin/" --to execute git commands we need to call the git commands from this path

(*
 * Manual pull
 * CAUTION: remember to wrap this method in a try error clause, so that you can handle merge conflicts
 * NOTE: the goal of this method is to arrive at the same state as the remote branch
 * TODO: add support for different local and remote branch name
 *)
on manual_pull(local_repo_path, remote_path, branch)
	log "manual_pull()"
	log GitModifier's fetch(local_repo_path, remote_path, branch) --git fetch origin master, retrive the latest repo info
	set is_remote_branch_ahead to GitAsserter's is_remote_branch_ahead(local_repo_path, branch) --use the git log oneline thing here	--git log --oneline master..origin/master (to view the commit ids of the commits that the remote repo is ahead of local repo )
	
	log "is_remote_branch_ahead: " & is_remote_branch_ahead
	return --faux break
	if is_remote_branch_ahead then --asserts if a merge isneeded
		GitModifier's merge(local_file_path, branch, "origin/" & branch) --git merge master origin/master (merges the changes from remote that you just fetched)
	end if
end manual_pull

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
