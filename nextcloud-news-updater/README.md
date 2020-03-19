# nextcloud-news-updater

I created this docker image for the [nextcloud news updater](https://github.com/nextcloud/news-updater) 
as other available images did not work for me.
I wanted it to use the console API and not the REST API.

## Getting started

The image needs access to the nextcloud volume and to the network of the database used for nextcloud.

```
 $ docker run -d 
      --volume nextcloud:/var/www/html
      --net db-network
      lunarys/nextcloud-news-updater
```

It should also be possible to use the REST API with this image, though I have not tested it.
