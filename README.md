# symfony-container 

Adds a symfony service to your [Ansible Container](https://github.com/ansible/ansible-container) project. Includes [PHP](https://php.net), [symfony](https://symfony.com), and [composer](https://getcomposer.org) - all the things you need to build a modern PHP app.

Run the following commands to install the service:

```
# Set the working directory to your Ansible Container project root
$ cd myproject

# Install the service
$ ansible-container install <USERNAME.ROLE_NAME>
```

## Getting started 

Set the PROJECT_NAME environment variable to the name of the project you want to create, and when the container starts the project will be initiazed. Inside the container the project gets created in the /symphony directory, which is a volume mounted to the root of Ansible Container project. In other words, your symfony project is accessible both inside and outside of the container.

If you want the project initialized using a particular version of symfony, simply set the SYMFONY_VERSION environment variable to the desired version. Otherwise, the default version installed is 'latest'. 

After the new symfony project is initialized, the symfony web server begins listening on port 8000. You can access the default web page for the new project by accessing port 8000 of your Docker host.

If you're running Docker Machine on Linux or OSX, you can run the following command from terminal session, replacing *default* with the name of your host:

```
$ http://$(docker-machine ip default):8000
```

## Requirements

- [Ansible Container](https://github.com/ansible/ansible-container)
- An existing Ansible Container project. To create a project, simply run the following:
    ```
    # Create an empty project directory
    $ mkdir myproject

    # Set the working directory to the new directory
    $ cd myproject

    # Initialize the project
    $ ansible-contiainer init
    ```

## Role Variables

??


## License

[Apache 2](https://github.com/chouseknecht/symfony-container/blob/master/LICENSE)

## Author Information

[@chouseknecht](https://github.com/chouseknecht)


