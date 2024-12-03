#!/bin/zsh

echo "!!!! front to back !!!!! [MUST GET RESPONSE]"
kubectl exec -it front-end-app -- curl -m 1 http://back-end-api-app

echo "!!!! back to front !!!!! [MUST GET RESPONSE]"
kubectl exec -it back-end-api-app -- curl -m 1 http://front-end-app

echo "!!!! admin front to back !!!!! [MUST FAILED BY TIMEOUT]"
kubectl exec -it admin-front-end-app -- curl -m 1 http://back-end-api-app


echo "!!!! admin front to admin back !!!!! [MUST GET RESPONSE]"
kubectl exec -it admin-front-end-app -- curl -m 1 http://admin-back-end-api-app

echo "!!!! admin back to admin front !!!!! [MUST GET RESPONSE]"
kubectl exec -it admin-back-end-api-app -- curl -m 1 http://admin-front-end-app

echo "!!!! back to admin front !!!!! [MUST FAILED BY TIMEOUT]"
kubectl exec -it back-end-api-app -- curl -m 1 http://admin-front-end-app