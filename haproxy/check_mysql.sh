# Query below to get all group replication members
# mysql -s -h mysql -u root -proot_password -e "SELECT JSON_ARRAYAGG(JSON_OBJECT('host', member_host, 'state', member_state, 'role', member_role)) FROM performance_schema.replication_group_members";

exit 0;
