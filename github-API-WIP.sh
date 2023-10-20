#!/usr/bin/env bash

# // Get JSON of commits
_get_commits() {
  local owner=$1; shift
  local repo=$1; shift

  # // `api.github`: https://github.com/palp/geckodriver-alpine/blob/master/geckodriver.sh 
  local commits=$(curl -s https://api.github.com/repos/$owner/$repo/commits)
  echo $commits
}

# // Get *latest* VERIFIED commit
_get_latest_verified_commit() {
  local owner=$1; shift
  local repo=$1; shift

  local commit=$(echo "$(_get_commits $owner $repo)" \
    | jq '[.[] | select(.commit.verification.verified)] | .[0] | {sha, date:.commit.author.date, author:.author.login}' \
  )
  echo $commit
}

# // Get *latest* VERIFIED commit's hash
_get_latest_verified_commit_hash() {
  local owner=$1; shift
  local repo=$1; shift

  local hash=$(echo "$(_get_latest_verified_commit $owner $repo)" \
    | jq -r '.sha' \
  )
  echo $hash
}

_get_latest_verified_commit junegunn vim-plug
#_get_latest_verified_commit_hash junegunn vim-plug
