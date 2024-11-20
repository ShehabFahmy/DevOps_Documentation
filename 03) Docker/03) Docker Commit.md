## Creating an Image from a Container (NOT Recommended)
1. Run a container from an image.
2. Enter this container (docker exec -it).
3. Do whatever changes you want.
4. `docker commit <container_id> new_image_name`
Now you have a new customized image, but why is it not recommended?
Due to lack of documentation, therefore we need a file with instructions to be done inside the container, which is the **Dockerfile**.