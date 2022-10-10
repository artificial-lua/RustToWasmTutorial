FROM rust as wasm-builder
RUN cargo install wasm-pack
COPY ./rust_builder /rust_builder
WORKDIR /rust_builder
COPY ./project_selector.txt  /rust_builder/project_selector.txt
RUN sh rust_builder.sh

FROM nginx as web
COPY ./html /usr/share/nginx/html
COPY --from=wasm-builder /rust_builder/*/pkg /usr/share/nginx/html/wasm
WORKDIR /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]