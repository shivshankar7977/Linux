#!bin/bash

# Get the latest CUDA version
latest_cuda_version=$(curl -s https://developer.nvidia.com/cuda-downloads | grep -oP 'CUDA Toolkit ([0-9]+\.[0-9]+)' | head -n1 | grep -oP '[0-9]+\.[0-9]+')

if [ -z "$latest_cuda_version" ]; then
    echo "Failed to fetch the latest CUDA version. Please check your internet connection or try again later."
    exit 1
fi

echo "Latest CUDA version available: $latest_cuda_version"

# Install dependencies
sudo yum install -y epel-release
sudo yum install -y wget

# Download CUDA installer
wget -q --show-progress "https://developer.download.nvidia.com/compute/cuda/repos/rhel8/x86_64/cuda-rhel8.repo" -O /etc/yum.repos.d/cuda.repo

# Install CUDA toolkit and driver
sudo yum clean all
sudo yum -y install cuda

# Add CUDA to the PATH and LD_LIBRARY_PATH
echo "export PATH=/usr/local/cuda-$latest_cuda_version/bin:\$PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-$latest_cuda_version/lib64:\$LD_LIBRARY_PATH" >> ~/.bashrc

# Source the bashrc file to apply changes
source ~/.bashrc

# Verify CUDA installation
echo "Verifying CUDA installation..."
nvcc --version

echo "CUDA $latest_cuda_version installation completed successfully."
