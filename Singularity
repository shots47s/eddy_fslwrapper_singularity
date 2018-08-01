BootStrap:docker
From: shots47s/fslwrappers:latest

%post
  mkdir /nvlib /nvbin

  echo 'export PATH="/nvbin:$PATH"' >> /environment
  echo 'export LD_LIBRARY_PATH="/nvlib:$LD_LIBRARY_PATH"' >> /environment

  #Add CUDA paths
  echo 'export CPATH="/usr/local/cuda/include:$CPATH"' >> /environment
  echo 'export PATH="/usr/local/cuda/bin:$PATH"' >> /environment
  echo 'export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"' >> /environment
  echo 'export CUDA_HOME="/usr/local/cuda"' >> /environment

