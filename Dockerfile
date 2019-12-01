FROM mcr.microsoft.com/dotnet/core/sdk:3.0
MAINTAINER codedevote@gmail.com

RUN apt-get update -qq \
    && apt-get install -y apt-transport-https \
    && apt-key adv --no-tty --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
    && echo "deb https://download.mono-project.com/repo/debian stable-stretch main" | tee /etc/apt/sources.list.d/mono-official-stable.list \
    && apt-get update -qq \
    && apt-get install -y --no-install-recommends mono-devel msbuild \
	&& rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN apt-get update && apt-get install -y --fix-missing mono-complete nuget
