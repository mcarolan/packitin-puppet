
class packitin_database {
  class { '::mysql::server':
    override_options => { 'mysqld' => { 'bind_address' => '0.0.0.0' } },
    databases => {
      'packitin' => {
        ensure => 'present',
        charset => 'utf8',
      }
    },
    users => {
      'packitin@192.168.33.1' => {
        ensure => 'present',
        max_connections_per_hour => '0',
        max_queries_per_hour => '0',
        max_updates_per_hour => '0',
        max_user_connections => '0',
        password_hash => '*7BDD07F0602D3194A4C8E43066317655FC835DB0',
      },
    },
    grants => {
      "packitin@192.168.33.1/packitin.*" => {
        ensure => 'present',
        options => ['GRANT'],
        privileges => ['ALL'],
        table => 'packitin.*',
        user => 'packitin@192.168.33.1',
      }
    }
  }
}

