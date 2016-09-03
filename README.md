[Test it now](http://forum.habrapp.ru/)

##How to start

Dependencies: PostgreSQL, Sphinx, ImageMagick

1. Create your config/database.yml и config/secrets.yml from example files
2. Create, migrate and seed your database
3. Start searchd daemoon

```
rake db:create db:migrate db:seed
rake ts:rebuild
```
