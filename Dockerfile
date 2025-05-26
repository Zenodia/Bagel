# Use a base image with Python
FROM nvcr.io/nvidia/pytorch:24.10-py3 
#FROM python:3.10-slim

ENV DERBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Stockholm
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
 

# Set working directory
WORKDIR /workspace

RUN apt update -y 
#RUN apt install ffmpeg -y

RUN python -m pip install --upgrade pip
COPY . .

RUN pip install -r requirements.txt
RUN pip install gradio
#RUN pip install opencv-fixer==0.2.5
#RUN python -c "from opencv_fixer import AutoFix; AutoFix()"


# Expose port 8888 for JupyterLab
EXPOSE 8888 9999 8000 7860 7861 60808

# Start JupyterLab when the container runs
CMD ["sh", "-c", "tail -f /dev/null"]
#CMD ["jupyter", "lab", "--allow-root", "--ip=0.0.0.0","--NotebookApp.token=''", "--port=8888"]
