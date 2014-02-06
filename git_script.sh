#!/bin/bash

###############################
#
# Will Tanna
# Created 5/26/2013
# gitScript.sh
# williamtanna@gmail.com
#
###############################


# Legend : If there is a, Type 'text here' , type exactly that without single quotes. 
# Therefore, Type 'git init' , would look like this in your command line:
# williamtanna$ git init
 
# If this is your first time setting up git in this directory, follow these directions:
# 1. Go into your directory that you want to set up git with. ( cd /path/to/my/repo )
# 2. Type 'git init', this will create the repo
# 3. Type 'git status', you will see all the files that are not added to the repo
# 4. If you want to add everything, type 'git add .'
# 5. Finally type, 'git commit -m "Put essential information in between the double quotes"'
# 6. The above will commit all of your files and get you rolling
# 7. If you just want to add certain files just type, 'git add filename1 filename2 etc'
# 8. Once you get the repo all started on your computer, go to your bitbucket or github account
# 9. Create a repo for this new directory with a good name, and preferably with the language you are using
# 10. When the repo is created on bitbucket/github you will have the option to upload files or 'Push Up', select 'Push Up', or the variation of it
# 11. You will get a little how too on how to push your git
# 12. If you are not in your current repo directory go there now, cd /path/to/your/repo
# 13. Type, 'git remote add origin https://yourname@bitbucket.org/yourgame/nameofRepo
# 14. The above line adds the remote site/URL to a name called origin. So the URL of your repo is essentially the variable origin
# 15. Finally type, 'git push -u origin --all', this pushes everything from your repo on your computer up to the servers of bitbucket/githun
#
#
# You want to add and commit as much as possible so your data doesn't get lost and so that if you make a mistake
# in your code you can easily retrace your steps to a previous commit
#
# If you want to pull the data from the bitbucket/github servers on to your computer because you messed up, just simply type
# 'git pull origin master'
# The above line fetches the files form the remote repository and merges it with your local one

# Once you init your git and get it all setup with the repo, this script will take care of the rest for you
# It will launch git status for you so you can see what is modified or is an extra file
# It will then ask you if you want to continue or not
# The script will then ask you if you have any "extra" files that need to be added to the rep
# Modifed files are not "extra" files, if all you have is "modified files" then just press "n" (no)
# If you do have files to add, it will ask you to either add all of them, or type out one by one which ones you want to be added
# Once that is done, or if you pressed "n", it will ask you for the message that will be synced to your repo commit
# type in your message and press enter, it will commit all the changes with your message
# wait 5 seconds, then push everything up, to the repo server
# The script will then finish, and everything will be updated on both your computer, and on the repo server!

# If you want to see a log of all your commits, simply type:
# 'git log'
# 'git log -p -2' , this will show the print of the changes of only 2 commits
# 'git log -p -2 --word-dif' , actually shows you the before and after of your commits
# for above ^,  {+ textA +} < the text inside the {++} is the stuff that was added
# {- textB -} < the text inside the {--} is the stuff that was removed from the file

# More info on git commands at, http://git-scm.com/book

# To use this script on your computer just go to your terminal and type:
# chmod a+x git_script.sh
# Then type: ./git_script.sh
# to activate it

echo 'First we are going to see if the git status looks good'
git status
echo "Does it look good to continue? (y/n)"
read answer
answer=`echo $answer | tr '[:upper:]' '[:lower:]'`
# if you answer yes that means you approve the status of your current git
if [[ $answer == 'y' ]] ; then
        echo $answer
        #check if you need to add any files to your repo
        echo 'Do you need to add any extra files to the repo? (y/n)'
        echo '(If all you have is "modified", then press "n")'
        read answer2
        answer2=`echo $answer2 | tr '[:upper:]' '[:lower:]'`
        if [[ $answer2 == "y" ]] ; then
                echo $answer2
                # A quick easy way to just add all the files
                echo 'Do you want to just add all the files? (y/n)'
                read answer3
                answer3=`echo $answer3 | tr '[:upper:]' '[:lower:]'`
                if [[ $answer3 == "y" ]] ; then
                        git add .
                else
                        echo 'Please type which files you want to add one at a time, then press enter'
                        while read input
                        do
                                if [[ $input != "" ]] ; then
                                        git add $input
                                else
                                        break
                                fi
                        done
                fi
        fi
        echo 'Please input a message for the git repo'
        read input_variable
        git commit -am "$input_variable"
        sleep 5
        echo 'Now pushing the current git status to github/bitbucket'
        git push -u origin --all
else
        echo "The status did not look good"
fi