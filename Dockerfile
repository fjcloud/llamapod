FROM registry.access.redhat.com/ubi9

WORKDIR /llamafile

ENV TMPDIR=/tmp

RUN curl -O -L https://huggingface.co/jartine/llava-v1.5-7B-GGUF/resolve/main/llava-v1.5-7b-q4.llamafile &&\
    chmod -R 775 /llamafile

EXPOSE 8080

CMD ./llava-v1.5-7b-q4.llamafile --host 0.0.0.0 --nobrowser
