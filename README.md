# pc-parent
[![Build Status](https://travis-ci.org/Postremus/pc-parent.png)](https://travis-ci.org/Postremus/pc-parent)
[![Maven Central](https://maven-badges.herokuapp.com/maven-central/com.pro-crafting/pc-parent/badge.svg)](https://maven-badges.herokuapp.com/maven-central/com.pro-crafting/pc-parent)

Parent pom for pro-crafting projects.

## Usage

In your current pom, add the following snippet:

```
<parent>
    <groupId>com.pro-crafting</groupId>
    <artifactId>pc-parent</artifactId>
    <version>1-SNAPSHOT</version>
</parent>
```

## Versioning

Every change to a parent pom file is considered as major, and critical, since every change can cause undesired side effects to child poms.
Therefore, we use a only mayor versions. E.g. The current version is 1, the next version is 2, etc.

## Authors

* **Martin Panzer** - *Initial work* - [Postremus](https://github.com/Postremus)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* [Nathan Fischer - Complete guide to continuous deployment [..]](http://www.debonair.io/post/maven-cd/) - Excellent example of how to setup cd with travis-ci