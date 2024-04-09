FROM registry.access.redhat.com/ubi9

WORKDIR /llamafile

ENV TMPDIR=/tmp

RUN curl -O -L https://huggingface.co/jartine/rocket-3B-llamafile/resolve/main/rocket-3b.Q5_K_M.llamafile &&\
    chmod -R 775 /llamafile

EXPOSE 8080

CMD ./rocket-3b.Q5_K_M.llamafile --host 0.0.0.0 --nobrowser
