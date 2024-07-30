FROM registry.access.redhat.com/ubi9/ubi@sha256:1ee4d8c50d14d9c9e9229d9a039d793fcbc9aa803806d194c957a397cf1d2b17
WORKDIR /llamafile

COPY getty.txt /llamafile/getty.txt

ENV TMPDIR=/tmp

RUN curl -O -L https://huggingface.co/jartine/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/TinyLlama-1.1B-Chat-v1.0.F16.llamafile &&\
    chmod -R 775 /llamafile

EXPOSE 8080

CMD ./TinyLlama-1.1B-Chat-v1.0.F16.llamafile --host 0.0.0.0 --nobrowser
