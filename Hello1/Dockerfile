FROM microsoft/dotnet:2.1-sdk-alpine AS build
WORKDIR /app
COPY . .
RUN dotnet publish -c Release -o out

FROM microsoft/dotnet:2.1-aspnetcore-runtime-alpine
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "Hello1.dll"]