FROM registry.access.redhat.com/ubi9

WORKDIR /llamafile

ENV TMPDIR=/tmp

RUN curl -O -L https://huggingface.co/jartine/Mistral-7B-Instruct-v0.2-llamafile/resolve/main/mistral-7b-instruct-v0.2.Q5_K_M.llamafile &&\
    chmod -R 775 /llamafile

EXPOSE 8080

CMD ./mistral-7b-instruct-v0.2.Q5_K_M.llamafile --host 0.0.0.0 --nobrowser
