# ex: syntax=puppet si ts=4 sw=4 et

define racoon::iptunnel (
    $local_net,
    $local_gateway  = $::ipaddress,
    $remote_net,
    $remote_gateway,
    $port           = 'any',
) {
    file { "/etc/ipsec-tools.d/${name}-iptunnel.conf":
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template('racoon/ipsec-tools/iptunnel.erb'),
        notify  => Exec['setkey restart'],
    }
}