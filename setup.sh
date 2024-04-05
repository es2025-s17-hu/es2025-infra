docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username httpadmin --password kiscica17 --email me@example.com --admin"

docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username competitor-4621 --password 4621 --email competitor-4621@httpf.hu --must-change-password=false"
docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username competitor-7552 --password 7552 --email competitor-7552@httpf.hu --must-change-password=false"
docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username competitor-6513 --password 6513 --email competitor-6513@httpf.hu --must-change-password=false"
docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username competitor-2494 --password 2494 --email competitor-2494@httpf.hu --must-change-password=false"
docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username competitor-6455 --password 6455 --email competitor-6455@httpf.hu --must-change-password=false"
docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username competitor-9546 --password 9546 --email competitor-9546@httpf.hu --must-change-password=false"
docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username competitor-9999 --password 9999 --email competitor-9999@httpf.hu --must-change-password=false"

pat=$(curl -X POST -H "Content-Type: application/json" -d '{"name": "PAT1", "scopes": ["write:package"]}' -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/users/httpadmin/tokens --insecure | jq '.sha1')

echo "PAT: $pat"

curl -X POST -H "Content-Type: application/json" -d '{"username": "competitors", "private": true}' -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/orgs --insecure
id=$(curl -X POST -H "Content-Type: application/json" -d '{"name": "competitors", "can_create_org_repo": true, "units_map": {"repo.actions":"read","repo.packages":"none","repo.code":"write","repo.issues":"write","repo.ext_issues":"none","repo.wiki":"admin","repo.pulls":"owner","repo.releases":"none","repo.projects":"none","repo.ext_wiki":"none"}}' -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/orgs/competitors/teams --insecure | jq '.id')
curl -X PUT -H "Content-Type: application/json" -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/teams/$id/members/competitor-4621 --insecure
curl -X PUT -H "Content-Type: application/json" -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/teams/$id/members/competitor-7552 --insecure
curl -X PUT -H "Content-Type: application/json" -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/teams/$id/members/competitor-6513 --insecure
curl -X PUT -H "Content-Type: application/json" -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/teams/$id/members/competitor-2494 --insecure
curl -X PUT -H "Content-Type: application/json" -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/teams/$id/members/competitor-6455 --insecure
curl -X PUT -H "Content-Type: application/json" -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/teams/$id/members/competitor-9546 --insecure
curl -X PUT -H "Content-Type: application/json" -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/teams/$id/members/competitor-9999 --insecure

curl -X PUT -H "Content-Type: application/json" -d '{"data": "$pat"}' -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/orgs/competitors/actions/secrets/REGISTRY_TOKEN --insecure
curl -X PUT -H "Content-Type: application/json" -d '{"data": "httpadmin"}' -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/orgs/competitors/actions/secrets/REGISTRY_USER --insecure

docker login gitea.dineease.com -u httpadmin -p kiscica17

docker pull nginx:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-a-4621:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-b-4621:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-c-4621:latest

docker tag nginx:latest gitea.dineease.com/competitors/module-a-7552:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-b-7552:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-c-7552:latest

docker tag nginx:latest gitea.dineease.com/competitors/module-a-6513:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-b-6513:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-c-6513:latest

docker tag nginx:latest gitea.dineease.com/competitors/module-a-2494:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-b-2494:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-c-2494:latest

docker tag nginx:latest gitea.dineease.com/competitors/module-a-6455:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-b-6455:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-c-6455:latest

docker tag nginx:latest gitea.dineease.com/competitors/module-a-9546:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-b-9546:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-c-9546:latest

docker tag nginx:latest gitea.dineease.com/competitors/module-a-9999:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-b-9999:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-c-9999:latest

docker push gitea.dineease.com/competitors/module-a-4621:latest
docker push gitea.dineease.com/competitors/module-b-4621:latest
docker push gitea.dineease.com/competitors/module-c-4621:latest

docker push gitea.dineease.com/competitors/module-a-7552:latest
docker push gitea.dineease.com/competitors/module-b-7552:latest
docker push gitea.dineease.com/competitors/module-c-7552:latest

docker push gitea.dineease.com/competitors/module-a-6513:latest
docker push gitea.dineease.com/competitors/module-b-6513:latest
docker push gitea.dineease.com/competitors/module-c-6513:latest

docker push gitea.dineease.com/competitors/module-a-2494:latest
docker push gitea.dineease.com/competitors/module-b-2494:latest
docker push gitea.dineease.com/competitors/module-c-2494:latest

docker push gitea.dineease.com/competitors/module-a-6455:latest
docker push gitea.dineease.com/competitors/module-b-6455:latest
docker push gitea.dineease.com/competitors/module-c-6455:latest

docker push gitea.dineease.com/competitors/module-a-9546:latest
docker push gitea.dineease.com/competitors/module-b-9546:latest
docker push gitea.dineease.com/competitors/module-c-9546:latest

docker push gitea.dineease.com/competitors/module-a-9999:latest
docker push gitea.dineease.com/competitors/module-b-9999:latest
docker push gitea.dineease.com/competitors/module-c-9999:latest
