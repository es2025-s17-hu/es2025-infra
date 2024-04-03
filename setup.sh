docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username httpadmin --password kiscica17 --email me@example.com --admin"

docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username jgenkzym --password K7QhhFz7 --email jgenkzym@httpf.hu --must-change-password=false"
docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username wje4rmtr --password BK6Xnruq --email wje4rmtr@httpf.hu --must-change-password=false"
docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username zn62jyyu --password Z98KmycL --email zn62jyyu@httpf.hu --must-change-password=false"
docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username 2wdx6yex --password mZNJLPDP --email 2wdx6yex@httpf.hu --must-change-password=false"
docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username 5ubuuepk --password kndSqTwc --email 5ubuuepk@httpf.hu --must-change-password=false"
docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username r2z4hbn7 --password MhDpQmEp --email r2z4hbn7@httpf.hu --must-change-password=false"

pat=$(curl -X POST -H "Content-Type: application/json" -d '{"name": "PAT", "scopes": ["write:package"]}' -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/users/httpadmin/tokens --insecure | jq '.sha1')

curl -X POST -H "Content-Type: application/json" -d '{"username": "competitors", "private": true}' -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/orgs --insecure
id=$(curl -X POST -H "Content-Type: application/json" -d '{"name": "competitors", "can_create_org_repo": true, "units_map": {"repo.actions":"read","repo.packages":"none","repo.code":"write","repo.issues":"write","repo.ext_issues":"none","repo.wiki":"admin","repo.pulls":"owner","repo.releases":"none","repo.projects":"none","repo.ext_wiki":"none"}}' -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/orgs/competitors/teams --insecure | jq '.id')
curl -X PUT -H "Content-Type: application/json" -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/teams/$id/members/jgenkzym --insecure
curl -X PUT -H "Content-Type: application/json" -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/teams/$id/members/wje4rmtr --insecure
curl -X PUT -H "Content-Type: application/json" -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/teams/$id/members/zn62jyyu --insecure
curl -X PUT -H "Content-Type: application/json" -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/teams/$id/members/2wdx6yex --insecure
curl -X PUT -H "Content-Type: application/json" -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/teams/$id/members/5ubuuepk --insecure
curl -X PUT -H "Content-Type: application/json" -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/teams/$id/members/r2z4hbn7 --insecure

curl -X PUT -H "Content-Type: application/json" -d '{"data": "$pat"}' -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/orgs/competitors/actions/secrets/REGISTRY_TOKEN --insecure
curl -X PUT -H "Content-Type: application/json" -d '{"data": "httpadmin"}' -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/orgs/competitors/actions/secrets/REGISTRY_USER --insecure

docker login gitea.dineease.com -u httpadmin -p kiscica17

docker pull nginx:latest
docker tag nginx:latest gitea.dineease.com/jgenkzym/module-a:latest
docker tag nginx:latest gitea.dineease.com/jgenkzym/module-b:latest
docker tag nginx:latest gitea.dineease.com/jgenkzym/module-c:latest

docker tag nginx:latest gitea.dineease.com/wje4rmtr/module-a:latest
docker tag nginx:latest gitea.dineease.com/wje4rmtr/module-b:latest
docker tag nginx:latest gitea.dineease.com/wje4rmtr/module-c:latest

docker tag nginx:latest gitea.dineease.com/zn62jyyu/module-a:latest
docker tag nginx:latest gitea.dineease.com/zn62jyyu/module-b:latest
docker tag nginx:latest gitea.dineease.com/zn62jyyu/module-c:latest

docker tag nginx:latest gitea.dineease.com/2wdx6yex/module-a:latest
docker tag nginx:latest gitea.dineease.com/2wdx6yex/module-b:latest
docker tag nginx:latest gitea.dineease.com/2wdx6yex/module-c:latest

docker tag nginx:latest gitea.dineease.com/5ubuuepk/module-a:latest
docker tag nginx:latest gitea.dineease.com/5ubuuepk/module-b:latest
docker tag nginx:latest gitea.dineease.com/5ubuuepk/module-c:latest

docker tag nginx:latest gitea.dineease.com/r2z4hbn7/module-a:latest
docker tag nginx:latest gitea.dineease.com/r2z4hbn7/module-b:latest
docker tag nginx:latest gitea.dineease.com/r2z4hbn7/module-c:latest

docker push gitea.dineease.com/jgenkzym/module-a:latest
docker push gitea.dineease.com/jgenkzym/module-b:latest
docker push gitea.dineease.com/jgenkzym/module-c:latest

docker push gitea.dineease.com/wje4rmtr/module-a:latest
docker push gitea.dineease.com/wje4rmtr/module-b:latest
docker push gitea.dineease.com/wje4rmtr/module-c:latest

docker push gitea.dineease.com/zn62jyyu/module-a:latest
docker push gitea.dineease.com/zn62jyyu/module-b:latest
docker push gitea.dineease.com/zn62jyyu/module-c:latest

docker push gitea.dineease.com/2wdx6yex/module-a:latest
docker push gitea.dineease.com/2wdx6yex/module-b:latest
docker push gitea.dineease.com/2wdx6yex/module-c:latest

docker push gitea.dineease.com/5ubuuepk/module-a:latest
docker push gitea.dineease.com/5ubuuepk/module-b:latest
docker push gitea.dineease.com/5ubuuepk/module-c:latest

docker push gitea.dineease.com/r2z4hbn7/module-a:latest
docker push gitea.dineease.com/r2z4hbn7/module-b:latest
docker push gitea.dineease.com/r2z4hbn7/module-c:latest

