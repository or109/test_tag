#! /bin/bash

mstr_brnch=master

echo "tag name: "
read tagName

brnch=branch_instal_$tagName
echo $brnch

# show all branches
git branch
echo "branch to checkout from: "
read chk

git branch -d $brnch &> /dev/null
git branch $brnch $mstr_brnch
git checkout $brnch;

# list all diff of dirs and files
echo "list all diff of dirs and files"
git diff --name-only $brnch $chk
echo "list of dirs to checkout: "
read pathName

rm -rf $pathName
git checkout $chk $pathName;
git commit
git tag $tagName -m "tag $tagName from `date`"
git push origin $brnch --follow-tags $tagName

echo "Done!"
read -p "Press enter to continue"