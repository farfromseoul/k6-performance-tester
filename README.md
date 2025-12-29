# k6-performance-tester

performance(load+stress+soaking tester)

---

# How To Install k6 on Ubuntu

```
curl -LO https://github.com/grafana/k6/releases/download/v1.4.2/k6-v1.4.2-linux-amd64.tar.gz
tar -xzf k6-v1.4.2-linux-amd64.tar.gz
sudo mv k6-v1.4.2-linux-amd64/k6 /usr/local/bin/k6
sudo chmod +x /usr/local/bin/k6
k6 version

```
---
#Performance Test Strandard

##Load Test

* 예상 TPS를 만족하는가? 
- p95 / p99 latency
- error rate
- SLI/SLO 충족 여부

##Stress Test

* 시스템의 최대 성능 TPS를 측정, 시스템이 어디서 어떻게 망가지는지 확인한다.
- 임계 TPS
- 최초 오류 발생 지점
- latency 폭증 시점
- recovery 가능 여부

##Soaking Test

* 평균 (이상 또는 이하) TPS로  12 - 24 시간 지속적으로 부하를 주어서, 시스템상 병목 지점을 찾는 테스트

>  Load Test는 안정적인 예상 운영 TPS를 찾는 과정,
Stress는 최대 TPS를 찾고, 양상 확인, 몇분을 버티고 붕괴되는지, 복구 가능한지(또는 어떤식으로)
불가한지를 측정하는것임
