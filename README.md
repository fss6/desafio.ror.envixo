# Desafio ROR Envixo

* Start containers

```
docker-compose up --build
docker-compose run web rails db:create db:migrate db:seed
```
* Initial users
  - [admin]:
    - **email:** admin@admin.com
    - **password:** admin@123
  - [user]:
    - **email:** user@user.com
    - **password:** user@123
* Run tests
```
docker-compose run web rails test
```

* External libs used
  - [Gem] Devise
  - [Gem] Cancancan 
  - [Gem] Ransack
  - [Gem] Faker (only development)
  - [Webpacker] Bootstartp

* Used Ruby on Rails resources
  - Associations
    - belongs_to
    - has_many
    - polymorphic
    - has_and_belongs_to_many
    - join_table
  - Internationalization (I18n)
  - Nested attributes
  - Layouts
  - othres ...
    
