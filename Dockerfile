FROM postgres:16-alpine
ARG PGVECTOR_VERSION=v0.8.0
RUN set -eux; \
    apk add --no-cache --virtual .build build-base git; \
    git clone --branch "${PGVECTOR_VERSION}" --depth 1 https://github.com/pgvector/pgvector.git /tmp/pgvector; \
    cd /tmp/pgvector; \
    make with_llvm=no; \
    make with_llvm=no install; \
    apk del .build; \
    rm -rf /tmp/pgvector
