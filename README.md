# notes

My notes (website). Well, the website part is coming soon.

## Design Philosophy

Whilst the site uses quartz, I've opted not to follow the traditional
quartz way of having my own 'fork'. In theory, it should make it easier
to use any other static site generator should I want to.

## Development

Run a quartz development server:

> [!NOTE]
> Due to how Docker handles bind mounts and how many editors modify
> files, changes to the `quartz/quartz.*.ts` will likely require a
> restart of the container

```bash
docker compose build
docker compose up -d

# After making changes to quartz/
docker compose restart
```

Build the quartz site to the `public/` directory:

```bash
docker build --output . .
```

## License

[Attribution-ShareAlike 4.0 International](LICENSE)
