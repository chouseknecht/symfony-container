# symfony-container 

Adds a symfony service to your [Ansible Container](https://github.com/ansible/ansible-container) project. Includes [PHP 7](https://php.net), [symfony](https://symfony.com), and [composer](https://getcomposer.org) - all the things you need to build a modern PHP app.

Run the following commands to install the service:

```
# Set the working directory to your Ansible Container project root
$ cd myproject

# Install the service
$ ansible-container install <USERNAME.ROLE_NAME>
```

## Getting started 

The root of your Ansible Container project directory is mounted to the container as */symfony*, and the first time you start the container a new project called *symfony* will be initiazed in */symfony*. So inside the container the project is accessible as */symfony/symfony*, and in the root of your project you will see it as *symfony*.

If you want the project initialized using a particular version of symfony, simply set the SYMFONY_VERSION environment variable to the desired version. Otherwise, the default version installed is 'latest'. 

After the new symfony project is initialized, the symfony web server begins listening on port 8000. You can access the default web page for the new project by accessing port 8000 of your Docker host.

If you're running Docker Machine on Linux or OSX, you can run the following command from terminal session, replacing *default* with the name of your host:

```
$ http://$(docker-machine ip default):8000
```

## Configuring PHP

The default */etc/php.ini* file that comes with the PHP pacakge is used. If you wish to override it, the easiest thing to do is mount a host or named volume containing your custom settings to that path. 

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

symfony_php_timezone: America/New_York
> Set the default time zone to a value found in [PHP Supported Timezones](http://php.net/manual/en/timezones.php)


## License

[Apache 2](https://github.com/chouseknecht/symfony-container/blob/master/LICENSE)

## Author Information

[@chouseknecht](https://github.com/chouseknecht)


