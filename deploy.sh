git add .
git commit -m "test"
git push
fly unpause-pipeline -t concourse-lab -p movie-fun
fly trigger-job -t concourse-lab -j movie-fun/deploy
