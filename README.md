This is a simple example of a realtime pakyow application.

To run it:

```bash
gem install pakyow`

git clone git@github.com:jphager2/pakyow-help-desk.git

cd pakyow-help-desk

bundle install
```

Set up a new postges database and export the postges url for the database to the `DATABASE_URL` environment variable or put it in .env.development

e.g. `DATABASE_URL=postgresql://localhost:5432/help_desk_pakyow_dev`

Then:

```bash
rake db:create
rake db:migrate

pakyow s
```

Now the server is started and you can point your browser to localhost:3000 to see the app.
