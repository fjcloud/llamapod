FROM registry.access.redhat.com/ubi9

WORKDIR /llamafile

ENV TMPDIR=/tmp

RUN curl -O -L https://huggingface.co/jartine/Meta-Llama-3-8B-Instruct-llamafile/resolve/main/Meta-Llama-3-8B-Instruct.Q5_K_M.llamafile &&\
    chmod -R 775 /llamafile

EXPOSE 8080

CMD ./Meta-Llama-3-8B-Instruct.Q5_K_M.llamafile --host 0.0.0.0 --nobrowser
