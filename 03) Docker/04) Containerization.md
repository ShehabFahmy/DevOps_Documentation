## Containerizing an Application
1. Start with your application code and dependencies.
2. Create a **Dockerfile** that describes your app, its dependencies, and how to run it.
3. Feed the **Dockerfile** into the `docker build` command.
4. Push the new image to a registry (optional).
5. Run container from the image.
### **Dockerfile** instructions:

| Instruction  | Description                                                                                                                         |
| ------------ | ----------------------------------------------------------------------------------------------------------------------------------- |
| `FROM`       | Specifies the base image for the new image you will build. Must be the first instruction.                                           |
| `WORKDIR`    | Sets the working directory for the following instructions. Creates the directory if not exists then enters it.                      |
| `COPY`       | Copies files or directories from the host system to the image.                                                                      |
| `ADD`        | Similar to `COPY` but also supports fetching files from URLs and extracting compressed files.                                       |
| `RUN`        | Executes a command during the build process. Each RUN instruction creates a single new layer.                                       |
| `EXPOSE`     | Documents the network port that the application uses.                                                                               |
| `CMD`        | Provides the default command to run when the container starts. It can be overridden by passing a command in `docker run`.           |
| `ENTRYPOINT` | Sets the command and arguments that are not overridden, making the container behave like an executable.                             |
| `VOLUME`     | Creates a mount point with the specified path and marks it as holding externally mounted volumes from the host or other containers. |
| `ARG`        | Defines a variable that users can pass at build-time to the builder with the `docker build` command.                                |
| `USER`       | Sets the user name or UID to use when running the image and for any `RUN`, `CMD`, and `ENTRYPOINT` instructions that follow it.     |
| `ONBUILD`    | Adds a trigger instruction to the image that will be executed when the image is used as a base for another build.                   |
