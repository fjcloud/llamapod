FROM registry.access.redhat.com/ubi9/ubi

WORKDIR /llamafile

COPY getty.txt /llamafile/getty.txt

ENV TMPDIR=/tmp

RUN curl -O -L https://huggingface.co/Mozilla/Llama-3.2-3B-Instruct-llamafile/resolve/main/Llama-3.2-3B-Instruct.Q6_K.llamafile &&\
    chmod -R 775 /llamafile

EXPOSE 8080

CMD ./Llama-3.2-3B-Instruct.Q6_K.llamafile --host 0.0.0.0
