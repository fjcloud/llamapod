FROM registry.access.redhat.com/ubi9

WORKDIR /llamafile

RUN curl -O -L https://huggingface.co/jartine/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/TinyLlama-1.1B-Chat-v1.0.Q5_K_M.llamafile &&\
    chmod -R 777 /llamafile

CMD ./TinyLlama-1.1B-Chat-v1.0.Q5_K_M.llamafile --host 0.0.0.0 --nobrowser
