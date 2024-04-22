docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username httpadmin --password kiscica17 --email me@example.com --admin"

docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username competitor-1 --password 4621 --email competitor-1@httpf.hu --must-change-password=false"
docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username competitor-2 --password 7552 --email competitor-2@httpf.hu --must-change-password=false"
docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username competitor-3 --password 6513 --email competitor-3@httpf.hu --must-change-password=false"
docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username competitor-4 --password 2494 --email competitor-4@httpf.hu --must-change-password=false"
docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username competitor-5 --password 6455 --email competitor-5@httpf.hu --must-change-password=false"
docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username competitor-6 --password 9546 --email competitor-6@httpf.hu --must-change-password=false"
docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username competitor-7 --password 9999 --email competitor-7@httpf.hu --must-change-password=false"
docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username competitor-8 --password 6825 --email competitor-8@httpf.hu --must-change-password=false"
docker exec --user 1234:1000 gitea /bin/bash -c "gitea admin user create --username competitor-9 --password 9863 --email competitor-9@httpf.hu --must-change-password=false"

pat=$(curl -X POST -H "Content-Type: application/json" -d '{"name": "PAT1", "scopes": ["write:package"]}' -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/users/httpadmin/tokens --insecure | jq '.sha1')

echo "PAT: $pat"

curl -X POST -H "Content-Type: application/json" -d '{"username": "competitors", "private": true}' -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/orgs --insecure
id=$(curl -X POST -H "Content-Type: application/json" -d '{"name": "competitors", "can_create_org_repo": true, "units_map": {"repo.actions":"read","repo.packages":"none","repo.code":"write","repo.issues":"write","repo.ext_issues":"none","repo.wiki":"admin","repo.pulls":"owner","repo.releases":"none","repo.projects":"none","repo.ext_wiki":"none"}}' -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/orgs/competitors/teams --insecure | jq '.id')
curl -X PUT -H "Content-Type: application/json" -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/teams/$id/members/competitor-1 --insecure
curl -X PUT -H "Content-Type: application/json" -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/teams/$id/members/competitor-2 --insecure
curl -X PUT -H "Content-Type: application/json" -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/teams/$id/members/competitor-3 --insecure
curl -X PUT -H "Content-Type: application/json" -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/teams/$id/members/competitor-4 --insecure
curl -X PUT -H "Content-Type: application/json" -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/teams/$id/members/competitor-5 --insecure
curl -X PUT -H "Content-Type: application/json" -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/teams/$id/members/competitor-6 --insecure
curl -X PUT -H "Content-Type: application/json" -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/teams/$id/members/competitor-7 --insecure
curl -X PUT -H "Content-Type: application/json" -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/teams/$id/members/competitor-8 --insecure
curl -X PUT -H "Content-Type: application/json" -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/teams/$id/members/competitor-9 --insecure

curl -X PUT -H "Content-Type: application/json" -d '{"data": "$pat"}' -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/orgs/competitors/actions/secrets/REGISTRY_TOKEN --insecure
curl -X PUT -H "Content-Type: application/json" -d '{"data": "httpadmin"}' -u httpadmin:kiscica17 https://gitea.dineease.com/api/v1/orgs/competitors/actions/secrets/REGISTRY_USER --insecure

docker login gitea.dineease.com -u httpadmin -p kiscica17

docker pull nginx:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-a-1:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-b-1:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-c-1:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-d-1:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-e-1:latest

docker tag nginx:latest gitea.dineease.com/competitors/module-a-2:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-b-2:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-c-2:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-d-2:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-e-2:latest

docker tag nginx:latest gitea.dineease.com/competitors/module-a-3:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-b-3:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-c-3:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-d-3:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-e-3:latest

docker tag nginx:latest gitea.dineease.com/competitors/module-a-4:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-b-4:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-c-4:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-d-4:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-e-4:latest

docker tag nginx:latest gitea.dineease.com/competitors/module-a-5:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-b-5:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-c-5:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-d-5:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-e-5:latest

docker tag nginx:latest gitea.dineease.com/competitors/module-a-6:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-b-6:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-c-6:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-d-6:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-e-6:latest

docker tag nginx:latest gitea.dineease.com/competitors/module-a-7:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-b-7:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-c-7:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-d-7:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-e-7:latest

docker tag nginx:latest gitea.dineease.com/competitors/module-a-8:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-b-8:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-c-8:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-d-8:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-e-8:latest

docker tag nginx:latest gitea.dineease.com/competitors/module-a-9:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-b-9:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-c-9:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-d-9:latest
docker tag nginx:latest gitea.dineease.com/competitors/module-e-9:latest

docker push gitea.dineease.com/competitors/module-a-1:latest
docker push gitea.dineease.com/competitors/module-b-1:latest
docker push gitea.dineease.com/competitors/module-c-1:latest
docker push gitea.dineease.com/competitors/module-d-1:latest
docker push gitea.dineease.com/competitors/module-e-1:latest

docker push gitea.dineease.com/competitors/module-a-2:latest
docker push gitea.dineease.com/competitors/module-b-2:latest
docker push gitea.dineease.com/competitors/module-c-2:latest
docker push gitea.dineease.com/competitors/module-d-2:latest
docker push gitea.dineease.com/competitors/module-e-2:latest

docker push gitea.dineease.com/competitors/module-a-3:latest
docker push gitea.dineease.com/competitors/module-b-3:latest
docker push gitea.dineease.com/competitors/module-c-3:latest
docker push gitea.dineease.com/competitors/module-d-3:latest
docker push gitea.dineease.com/competitors/module-e-3:latest

docker push gitea.dineease.com/competitors/module-a-4:latest
docker push gitea.dineease.com/competitors/module-b-4:latest
docker push gitea.dineease.com/competitors/module-c-4:latest
docker push gitea.dineease.com/competitors/module-d-4:latest
docker push gitea.dineease.com/competitors/module-e-4:latest

docker push gitea.dineease.com/competitors/module-a-5:latest
docker push gitea.dineease.com/competitors/module-b-5:latest
docker push gitea.dineease.com/competitors/module-c-5:latest
docker push gitea.dineease.com/competitors/module-d-5:latest
docker push gitea.dineease.com/competitors/module-e-5:latest

docker push gitea.dineease.com/competitors/module-a-6:latest
docker push gitea.dineease.com/competitors/module-b-6:latest
docker push gitea.dineease.com/competitors/module-c-6:latest
docker push gitea.dineease.com/competitors/module-d-6:latest
docker push gitea.dineease.com/competitors/module-e-6:latest

docker push gitea.dineease.com/competitors/module-a-7:latest
docker push gitea.dineease.com/competitors/module-b-7:latest
docker push gitea.dineease.com/competitors/module-c-7:latest
docker push gitea.dineease.com/competitors/module-d-7:latest
docker push gitea.dineease.com/competitors/module-e-7:latest

docker push gitea.dineease.com/competitors/module-a-8:latest
docker push gitea.dineease.com/competitors/module-b-8:latest
docker push gitea.dineease.com/competitors/module-c-8:latest
docker push gitea.dineease.com/competitors/module-d-8:latest
docker push gitea.dineease.com/competitors/module-e-8:latest

docker push gitea.dineease.com/competitors/module-a-9:latest
docker push gitea.dineease.com/competitors/module-b-9:latest
docker push gitea.dineease.com/competitors/module-c-9:latest
docker push gitea.dineease.com/competitors/module-d-9:latest
docker push gitea.dineease.com/competitors/module-e-9:latest
