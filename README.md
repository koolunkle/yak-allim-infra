# Yak-Allim-Infra

> **복약 안내서 OCR 분석 기반 복약 관리 솔루션**

**Yak-Allim-Infra**는 Yak-Allim 서비스를 위한 공용 인프라(Jenkins, n8n) 관리 저장소입니다.

---

## 서비스 구성
* **Jenkins (CI/CD Controller)**: `http://localhost:9090`
  * Dynamic Docker Agent 방식을 활용하여 백엔드(Spring Boot) 및 클라이언트(Android APK) 파이프라인 제어
* **n8n (Workflow Automation)**: `http://localhost:5678`
  * OCR 및 자동화 워크플로우 엔진

## 구동 방법

### 1. 환경 변수 설정
```bash
cp .env.example .env
```

### 2. 초기 네트워크 및 볼륨 설정
```bash
chmod +x scripts/init-volumes.sh
./scripts/init-volumes.sh
```

### 3. 인프라 서비스 실행
```bash
docker compose up -d
```

### 4. 인프라 상태 확인
```bash
docker compose ps
```
