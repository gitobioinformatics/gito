# %%TOOL_NAME%% %%TOOL_BADGES%%

Docker image for %%TOOL_NAME%% ([Home][homepage]).

## How to pull(download) the latest Docker image
```
 $ docker pull gitobioinformatics/%%TOOL_ID%%
```

## How to run the image
```
 $ docker run -it --rm --user $(id -u):$(id -g) gitobioinformatics/%%TOOL_ID%%
```

## How to remove the image
```
 $ docker rmi gitobioinformatics/%%TOOL_ID%%
```

[hub]: https://hub.docker.com/r/gitobioinformatics/%%TOOL_NAME%%
[quay]: https://quay.io/repository/gitobioinformatics/%%TOOL_NAME%%
[homepage]: %%TOOL_HOMEPAGE%%

