FROM tensorflow/tensorflow:latest-gpu-jupyter
RUN apt update
RUN apt install -y git vim curl
RUN git clone https://github.com/openai/CLIP
RUN git clone https://github.com/CompVis/taming-transformers
RUN git clone https://github.com/vgan/aiartbot.git
RUN pip install torch==1.9.0+cu111 torchvision==0.10.0+cu111 -f https://download.pytorch.org/whl/torch_stable.html
RUN pip install ftfy regex tqdm omegaconf pytorch-lightning tweepy Mastodon.py imageio pandas seaborn kornia einops==0.3.0 transformers==4.3.1 gspread oauth2client
RUN chmod u+x aiartbot/aiartbot.py
RUN mkdir -p "/root/.cache/torch/hub/checkpoints"
RUN curl "https://download.pytorch.org/models/vgg16-397923af.pth" -o "/root/.cache/torch/hub/checkpoints/vgg16-397923af.pth"
WORKDIR "/tf/aiartbot"
ADD VERSION .
