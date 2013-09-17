MysqlAgent
======

Mysql migration wrapper of rails.
It preserves scheme which might lost during native rails migration,
like `CHAR`, non auto-increment primary key and others.

### Installation:

Add `gem 'mysql_agent', :github => 'mz026/mysql_agent'` to your Gemfile,
which will add two tasks:

- `mysql_agent:migrate`: do the normal rails migration and dump schema to `db/schema.sql`
- `mysql_agent:schema:load`: load the schema dumped above


### Dependencies:

mysql\_agent depends on [mysqldump](http://dev.mysql.com/doc/refman/5.1/en/mysqldump.html)

### TODOs:
- add tests

### LICENSE
This project uses MIT-LICENSE.
