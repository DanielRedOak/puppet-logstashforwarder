define logstashforwarder::file (
    $paths,
    $fields,
){
    
    File {
        owner => 'root',
        group => 'root',
    }

    if ($paths != '') {
        validate_array($paths)
    }
    if ($fields != ''){
        validate_hash($fields)
    }
 
    if ($logstashforwarder::ensure == 'present' ) { 
        concat::fragment{"${name}":
            target  => "${logstashforwarder::configdir}/${logstashforwarder::config}",
            content => template("${module_name}/file_format.erb"),
            order   => 010,
        }
    }
}
