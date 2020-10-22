# do_database_perf_testing

```
CREATE DATABASE pub;

CREATE ROLE admin LOGIN PASSWORD 'XXXXXXXXX';
CREATE ROLE gretl LOGIN PASSWORD 'YYYYYYYYY';
```

```
CREATE EXTENSION postgis;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
```

```
export ORG_GRADLE_PROJECT_dbUriDo='jdbc:postgresql://db-postgresql-fra1-95073-do-user-876548-0.a.db.ondigitalocean.com:25060/pub?sslmode=require'
export ORG_GRADLE_PROJECT_dbUserDo=admin
export ORG_GRADLE_PROJECT_dbPwdDo=XXXXXXXXX

export ORG_GRADLE_PROJECT_dbUserDoDdl=doadmin
export ORG_GRADLE_PROJECT_dbPwdDoDdl=YYYYYYYYYY
```

```
./start-gretl.sh --docker-image sogis/gretl-runtime:latest --job-directory $PWD/. tasks --all
```