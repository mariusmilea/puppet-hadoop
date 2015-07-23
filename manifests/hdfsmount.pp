# hdfs mount class
class hadoop::hdfsmount (
    $nodes = $hadoop::params::nodes,
) inherits hadoop::params {

    $active_namenode = $::active_namenode
    file { '/tmp/get_active_namenode.rb':
      ensure  => present,
      content => template("${module_name}/get_active_namenode.rb.erb"),
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
    } ->
    exec { 'remount' :
      path    => "/usr/lib/hadoop/bin",
      command => "/usr/lib/hadoop/bin/fuse_dfs dfs://${active_namenode}:8020 /mnt/hdfs",
      require => [Package['jdk'], Package['hadoop-hdfs-fuse']]
    }
}
