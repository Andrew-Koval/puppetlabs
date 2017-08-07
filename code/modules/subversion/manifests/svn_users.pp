# === Class: subversion::svn_users
#
#  Creation of subversion users
#
# === Parameters
#
# None
#
# === Variables
#
# None
#
# === Examples
#
# None
#
# === Authors
#
# Andriy Koval <akova@softserveinc.com>
#
# === Copyright
#
# Copyright 2017 Andriy Koval
#

class subversion::svn_users (
  $svn_users	  = hiera('svn_users'),
  $svn_user1	  = $svn_users['user1'],
  $username_user1 = $svn_user1['svn_user'],
  $password_user1 = $svn_user1['user_password'],
  $svn_user2	  = $svn_users['user2'],
  $username_user2 = $svn_user2['svn_user'],
  $password_user2 = $svn_user2['user_password'],
  $svn_user3	  = $svn_users['user3'],
  $username_user3 = $svn_user3['svn_user'],
  $password_user3 = $svn_user3['user_password'],
){

  $users = {
   "$username_user1" => "$password_user1",
   "$username_user2" => "$password_user2",
   "$username_user3" => "$password_user3",
  }
  notice ($users)

  $users.each |$usernames, $passwords| {
     svn_users{$usernames: password => $passwords }
  }
}  

  define svn_users(
    $user = $name,
    $password
  ){
    htpasswd { "$user":
      username    => "$user",
      cryptpasswd => "$password",
      target	  => '/etc/svn-auth-conf',
    }
    notice("User is $name password is $password")
  }

  class {'subversion::svn_users':}
