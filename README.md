The Apache Kylin website is built using
[Jekyll](http://jekyllrb.com/).

# Installing Jekyll

Jekyll is written in Ruby. All you should need to do to install it is

```bash
sudo gem install jekyll
```

Most platforms of interest (Linux, OSX, for instance) already have
Ruby and gem installed. If you are using a machine that doesn't have
these, you will have to install them before installing jekyll

# Developing and Previewing the Website

To preview the website through GitHub Pages: <http://apache.github.io/incubator-kylin>

To preview the website on your local machine:

```bash
jekyll serve --config _config.yml,_config-prod.yml
```

# Compiling the Website

Once the website is ready, you'll need to compile the site to static
HTML so that it can then be published to Apache. This is as simple as
running the `jekyll build` command. When this is done, `jekyll` uses
the `_config.yml` file and adds the `_config-prod.ym` file to derive
the full-blown configuration. The `_config.yml` file is set up for the
staging site. The _config-prod.yml configuration file causes a few
changes to the site: 

* The `noindex` meta tag is removed. We want the production site to be indexed by search engines, but we don't want the staging site to be indexed.
* The base URL is set to `/`. The production site is at `/`, whereas the staging site is at `/kylin-website/`.

Here is the command to build the production web-site
```bash
jekyll build --config _config.yml,_config-prod.yml
```
This puts all of the results into a directory called _site which is
updated each time the site is built.

(note that from this point on that the directions are probably a bit wrong)
# Uploading to the Apache Website (Kylin Committers Only, these directions will apply when Kylin becomes a top-level project)

Apache project websites use a system called svnpubsub for publishing. Basically, the static HTML needs to be pushed by one of the committers into the Apache SVN.

```bash
svn co https://svn.apache.org/repos/asf/kylin/site/trunk/content/kylin ../_site-apache
cp -R _site/* ../_site-apache/
cd ../_site-apache
```

Then `svn add` and `svn rm` as needed, and commit the changes via `svn commit -m "Website update"`. Note that once changes are committed via `svn commit`, they will immediately be visible on the live site: <http://incubator.apache.org/kylin>.
