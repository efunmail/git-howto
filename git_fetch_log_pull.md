## Intro

- If *creating* DIR (on server) - from REPO...

```sh
git clone https://github.com/USER/REPO  DIR

cd DIR
```

---

## PREVIEW any changes in repo

// https://stackoverflow.com/a/180368
// https://stackoverflow.com/a/13226324

- Fetch, then log:


```sh
git fetch

git log -p HEAD..origin/main
```

----

## PULL (changed files) from repo

// https://stackoverflow.com/a/1443232

```sh
git pull
```
