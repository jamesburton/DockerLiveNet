# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/sdk:latest AS build
WORKDIR /source

# copy csproj and restore as distinct layers
# COPY *.csproj .
COPY DockerLiveNet.csproj .
RUN dotnet restore --use-current-runtime

# copy and publish app and libraries
COPY . .
RUN dotnet publish -c Release -o /app --use-current-runtime --self-contained false --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:latest
WORKDIR /app
COPY --from=build /app .
EXPOSE 80
ENTRYPOINT ["dotnet", "DockerLiveNet.dll", "--urls", "http://*:80"]