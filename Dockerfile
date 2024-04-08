FROM registry.access.redhat.com/ubi9

RUN mkdir /llamafile && \
    curl -O -L https://huggingface.co/jartine/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/TinyLlama-1.1B-Chat-v1.0.Q5_K_M.llamafile
    chmod +x TinyLlama-1.1B-Chat-v1.0.Q5_K_M.llamafile

CMD ./TinyLlama-1.1B-Chat-v1.0.Q5_K_M.llamafile
