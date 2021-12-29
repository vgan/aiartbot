FROM vault.habana.ai/gaudi-docker/1.1.0/ubuntu18.04/habanalabs/pytorch-installer-1.9.1:1.1.0-614 
RUN apt update
RUN apt install -y git vim
RUN git clone https://github.com/openai/CLIP
RUN git clone https://github.com/CompVis/taming-transformers
RUN git clone https://github.com/vgan/AWS_Deep_Learning_Challenge_2022.git
RUN pip install torch==1.9.0+cpu torchvision==0.10.0+cpu -f https://download.pytorch.org/whl/torch_stable.html
RUN pip install ftfy regex tqdm omegaconf pytorch-lightning tweepy Mastodon.py imageio pandas seaborn kornia einops==0.3.0 transformers==4.3.1 google-api-python-client google-auth-httplib2 google-auth-oauthlib
RUN chmod u+x AWS_Deep_Learning_Challenge_2022/aiartbot.py
RUN mkdir -p "/root/.cache/torch/hub/checkpoints"
RUN curl "https://download.pytorch.org/models/vgg16-397923af.pth" -o "/root/.cache/torch/hub/checkpoints/vgg16-397923af.pth"
RUN ln -s /mnt/AWS_Deep_Learning_Challenge_2022/models /AWS_Deep_Learning_Challenge_2022/
RUN ln -s /mnt/AWS_Deep_Learning_Challenge_2022/outputs /AWS_Deep_Learning_Challenge_2022/
WORKDIR "/AWS_Deep_Learning_Challenge_2022/"
ADD VERSION .
