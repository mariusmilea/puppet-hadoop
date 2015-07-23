# puppet-hadoop

It is often the case when you have a hadoop cluster running in HA mode and
managed by puppet to need a reliable way of getting the active namenode.

In this example we tackle the situation when we have puppet mounting a FUSE mount
which means that knowing precisely the active namenode is crucial.

Puppet flow 
===========

1. hdfsmount.pp templates get_active_namenode.rb.erb with the hadoop nodes from hiera
2. the active_namenode variable gets the output of the get_active_namenode.rb facter
3. the active_namenode variable can then be used in exec statements or for further 
templating

Note
====

This example can be used also for situations when you have to assign a puppet variable
inside a .pp class the output of an external script, especially when that scripts needs
to contain parameters coming from an external source like hiera.
