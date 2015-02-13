
class packitin_database {
  class { '::mysql::server':
    databases => {
      'packitin' => {
        ensure => 'present',
        charset => 'utf8',
      }
    },
    users => {
      'packitin@localhost' => {
        ensure => 'present',
        max_connections_per_hour => '0',
        max_queries_per_hour => '0',
        max_updates_per_hour => '0',
        max_user_connections => '0',
        password_hash => '*7BDD07F0602D3194A4C8E43066317655FC835DB0',
      },
    },
    grants => {
      "packitin@localhost/packitin.*" => {
        ensure => 'present',
        options => ['GRANT'],
        privileges => ['ALL'],
        table => 'packitin.*',
        user => 'packitin@localhost',
      }
    }
  }
}

