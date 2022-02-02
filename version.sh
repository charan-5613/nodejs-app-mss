latestTag=$(git describe --tags $(git rev-list --tags --max-count=1))
    echo $latestTag
    chmod a+x ios/LakeshoreProject/Info.plist
    oldTag=$(git describe --tags $(git rev-list --tags --max-count=1 --skip=1 --no-walk))
    echo $oldTag
sed -i "${3}s/"$oldTag"/"$latestTag"/" package.json
