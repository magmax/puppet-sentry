# Puppet module: Sentry



This is a Puppet module for [Sentry] based on the second generation layout ("NextGen") of Example42 Puppet Modules.

Made by Miguel Ángel Garcia / MagMax

Official site: not yet

Official git repository: http://github.com/magmax/puppet-sentry

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module (you need it even if you don't use and install Puppi)

For detailed info about the logic and usage patterns of Example42 modules check the DOCS directory on Example42 main modules set.


## USAGE - Basic management

* Install sentry with default settings

        class { 'sentry': }

* Install a specific version of sentry package

        class { 'sentry':
          version => '1.0.1',
        }

* Disable sentry service.

        class { 'sentry':
          disable => true
        }

* Remove sentry package

        class { 'sentry':
          absent => true
        }

* Enable auditing without without making changes on existing sentry configuration *files*

        class { 'sentry':
          audit_only => true
        }

* Module dry-run: Do not make any change on *all* the resources provided by the module

        class { 'sentry':
          noops => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file

        class { 'sentry':
          source => [ "puppet:///modules/example42/sentry/sentry.conf-${hostname}" , "puppet:///modules/example42/sentry/sentry.conf" ],
        }


* Use custom source directory for the whole configuration dir

        class { 'sentry':
          source_dir       => 'puppet:///modules/example42/sentry/conf/',
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file. Note that template and source arguments are alternative.

        class { 'sentry':
          template => 'example42/sentry/sentry.conf.erb',
        }

* Automatically include a custom subclass

        class { 'sentry':
          my_class => 'example42::my_sentry',
        }


## USAGE - Example42 extensions management
* Activate puppi (recommended, but disabled by default)

        class { 'sentry':
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with a puppi::helper define ) to customize the output of puppi commands

        class { 'sentry':
          puppi        => true,
          puppi_helper => 'myhelper',
        }

* Activate automatic monitoring (recommended, but disabled by default). This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { 'sentry':
          monitor      => true,
          monitor_tool => [ 'nagios' , 'monit' , 'munin' ],
        }

* Activate automatic firewalling. This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { 'sentry':
          firewall      => true,
          firewall_tool => 'iptables',
          firewall_src  => '10.42.0.0/24',
          firewall_dst  => $ipaddress_eth0,
        }


## DEVELOPMENT

There is a Vagrant environment to be used for development. To use it, you have to install [Vagrant] and [librarian-puppet].

Once installed, just execute:

    $ librarian-puppet install

To fetch all the dependant modules, and:

    $ vagrant up

To create the virtual machine. Once everything is set, you can enter the virtual machine doing:

    $ vagrant ssh


### About the repository

There are some special files:

- **vagrant**, that contains the puppet configuration for vagrant. This file may be used as example to use this module.
- **Vagrantfile**, configuration for [Vagrant]
- **Puppetfile**, configuration for [librarian-puppet]
- **sentry**, link to '.', required for [Vagrant] to find this module. This file is only required for development reasons.

The rest of files are part of example42 templates and, indeed, the puppet-sentry module.

## CONTINUOUS TESTING

Travis {<img src="https://travis-ci.org/magmax/puppet-sentry.png?branch=master" alt="Build Status" />}[https://travis-ci.org/magmax/puppet-sentry]


[Sentry]: http://sentry.readthedocs.org/en/latest/
[Vagrant]: http://www.vagrantup.com/
[librarian-puppet]: https://github.com/rodjek/librarian-puppet#librarian-puppet
