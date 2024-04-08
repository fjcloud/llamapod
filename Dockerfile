FROM registry.access.redhat.com/ubi9

WORKDIR /llamafile

ENV TMPDIR=/tmp

RUN curl -O -L https://huggingface.co/jartine/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/TinyLlama-1.1B-Chat-v1.0.Q5_K_M.llamafile &&\
    chgrp -R 0 /llamafile && chmod -R g+rwX /llamafile

CMD ./TinyLlama-1.1B-Chat-v1.0.Q5_K_M.llamafile --host 0.0.0.0 --nobrowser
