# Repository For...
- Rust를 wasm으로 빌드하여 웹상에서 실행시키는 예제, 학습용 페이지
- 프로젝트 구조
    - Docker
        - Rust Builder
        - nginx


## 초기 설정
``` bash
curl https://sh.rustup.rs -sSf | sh
cargo install wasm-pack
```

## 사용법
1. 원하는 프로젝트 명으로 Rust의 wasm 프로젝트를 생성한다.
2. 프로젝트의 루트 디렉토리로 이동한다.
3. sh copy-html.sh 스크립트를 사용한다. ( 이하, 스크립트 내용 )
    1. docker-compose up -d --build
    2. rm -rf ./html
    3. docker cp rust_builder:/usr/share/nginx/html ./result
4. result 디렉토리 내 생긴 파일을 확인한다,

## hello-wasm!
```bash
cd rust_builder
cargo new --lib hello-wasm
```

## Build 프로세스 ( sh copy-html.sh )
1. rust 이미지로 rust_builder 컨테이너 생성
2. wasm 설치
3. local의 rust_builder 디렉토리를 rust_builder 컨테이너 내 복사
4. 빌드할 프로젝트 목록이 담긴 project_selector.txt 파일 복사
5. rust_builder 컨테이너 내 rust_builder.sh 실행
    1. 복사된 project_selector.txt 참조
    2. 각 줄을 읽어 해당하는 프로젝트의 디렉토리로 이동
    3. wasm build 작업 실행
6. nginx이미지로 web 컨테이너 생성
7. local의 html 디렉토리를 nginx의 html 디렉토리로 복사
8. rust_builder의 rust_builder 디렉토리의 내부 pkg 디렉토리 내 파일들 복사하여 nginx/html/wasm에 복사
9. nginx 컨테이너 시작
10. local에 있는 html 디렉토리 삭제
11. nginx/html 디렉토리를 local로 복사하여 확인