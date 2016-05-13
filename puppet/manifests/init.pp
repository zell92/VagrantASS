node 'web' {

include java7-jre
include java7-jdk
include tomee 
}

node 'db' {
include postgresql
}

node default {

}