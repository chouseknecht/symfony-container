# symfony-container 

[![Build Status](https://travis-ci.org/chouseknecht/symfony-container.svg?branch=master)](https://travis-ci.org/chouseknecht/symfony-container)

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

### Start with the demo app 

The first time you start the symfony service an empty project is created, and you're ready to start development. If you're new to symfony and would rather start with the demo app, you can do that too. Just change the *DEMO_MODE* environment variable to *DEMO_MODE=1* in *container.yml*, and the service will be initialized with the [symfony demo](https://github.com/symfony/symfony-demo).

As mentioned above, the built-in web server will automatically start, and you can access it on port 8000.

## Configuring PHP

The *templates* directory contains *php.ini.j2*, which gets expanded and copied to */etc/php.ini* when you run `ansible-container build`. See Role Variables below for specific settings you can adjust using variables.

The best thing to do is to use the template, and make adjustments via role variables. If you need to make more adjustments than supported through the already defined variables, you can add additional variables or modify the template file directly.

If you find that you must set database usernames and passwords globally in your *php.ini*, be sure to use environment variables rather than templating the actual values into the file, so that you don't create and then accidentally distribute an image containing usernames and passwords.

Since the configuration file ends up being */etc/php.ini*, another option is to mount your own custom configuration file to this path at run-time.

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

The following variables are used to configure PHP in */etc/php.ini*:

```
php_memory_limit: "256M"
php_max_execution_time: "60"
php_max_input_time: "60"
php_max_input_vars: "1000"
php_realpath_cache_size: "32K"
php_upload_max_filesize: "64M"
php_post_max_size: "32M"
php_date_timezone: "America/New_York"
php_allow_url_fopen: "On"
php_sendmail_path: ""
php_output_buffering: "4096"
php_short_open_tag: false
php_error_reporting: "E_ALL & ~E_DEPRECATED & ~E_STRICT"
php_display_errors: "Off"
php_display_startup_errors: "On"
php_expose_php: "On"
php_session_cookie_lifetime: 0
php_session_gc_probability: 1
php_session_gc_divisor: 1000
php_session_gc_maxlifetime: 1440
php_session_save_handler: files
php_session_save_path: ''
php_variable_order: "GPCS"
php_request_order: "GP"
```

## License

[Apache 2](https://github.com/chouseknecht/symfony-container/blob/master/LICENSE)

## Author Information

[@chouseknecht](https://github.com/chouseknecht)


