# 译文：
# PBDB 引导

## 关于
使用 [PBDB API](http://paleobiodb.org/data1.2/)搭建，**PBDB 引导** 允许用户通过通过空间，时间和类别浏览古生物数据库。这个应用完全是客户端的，依赖于外部的服务包括：[Paleobiology Database](http://paleobiodb.org)，[GPlates](http://www.gplates.org)，和 [Phylopic](http://phylopic.org)。

您可以在 [http://paleobiodb.org/navigator](http://paleobiodb.org/navigator) 上浏览最新版本。


## 依赖
运行这个项目需先安装 Node.js，Grunt 和 Topojson。在苹果电脑上安装 Node.js 的方法在本文底部。安装 Node 后， 您可以使用 ````npm install -g grunt-cli```` 命令安装 Grunt，使用 ````npm install topojson -g```` 命令安装 Topojson。

## 组织
您想要修改的全部源文件都在 ````assets```` 文件夹下，全部编译压缩过的文件在 ````build```` 文件夹下。每个主要部件（regular map，reconstruction map，time scale，taxa browser，interface）就有自己的JS文件。全部的初始化代码写在 ````assets/js/navigator.js```` 中。Grunt 将全部这些文件打包压缩到 ````build/js/script.min.js```` 中。

## 起步
1。Clone 或者 fork 这个项目，下载这个项目并且进到这个项目的文件夹
2。````npm install````
3。使用如下命令 ````python -m SimpleHTTPServer```` 开启python服务，浏览器访问 localhost:8000。


## 有用的提示
To:

  * Rebuild the plate cache: ````grunt shell:plates```` then ````grunt shell:badPlates````
  * Rebuild the rotation cache: ````grunt shell:rotations````
  * Rebuild the collections < Phanerozoic cache: ````grunt shell:oldCollections````
  * Validate HTML: ````grunt htmlhint````
  * Concatenate/minify Javascript: ````grunt uglify````
  * Concatenate/minify CSS: ````grunt cssmin````
  * Validate HTML，concatenate/minify Javascript and CSS: ````grunt````


## Contributing
PBDB Navigator is an open-source project and welcomes feedback/contributions from the community。If you see a bug and would like to fix it，please submit a pull request。If you see a bug or have a suggestion but do not know how to fix it，please open a new issue or contact John Czaplewski at jczaplewski@wisc.edu

## License
Paleobiology Database data is used under a [CC-BY 4.0](http://creativecommons.org/licenses/by/4.0/) Creative Commons license。Plate and collection rotation data from [GPlates](http://www.gplates.org) is used under a GNU [General Public License (GPL)，version 2](http://www.gnu.org/licenses/old-licenses/gpl-2.0.html)，and taxonomic images from [Phylopic.org](http://phylopic.org/) are used under either a Public Domain or Creative Commons license.

All code unique to the PBDB Navigator interface is written by John Czaplewski unless otherwise specified，and uses a [CC0 1.0 Universal](http://creativecommons.org/publicdomain/zero/1.0/) Public Domain Dedication.

## Setup Node.js on OS X
Adapted from https://gist.github.com/isaacs/579814#file-node-and-npm-in-30-seconds-sh :

1。````echo 'export PATH=$HOME/local/bin:$PATH' >> ~/.bashrc````
2。````。~/.bashrc````
3。````cd ~````
4。````mkdir node-latest````
5。````cd node-latest````
6。````curl http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1````
7。````./configure --prefix=~/local````
8。````make install```` (Takes a while...might have to agree to XCode terms and conditions here。If you get an XCode error，run ````sudo xcodebuild -license````，view the license，and type ````agree```` to validate)
9。````curl https://npmjs.org/install.sh | sh````

If you get npm errno -13 with code EACCES while installing grunt，run ````sudo chown -R $USER /usr/local````。This will make you the owner of /usr/local which will make sure you never have to use sudo with npm (via http://howtonode.org/introduction-to-npm)









# PBDB Navigator

## About
Built on the [PBDB API](http://paleobiodb.org/data1.2/), **PBDB Navigator** allows users to explore the Paleobiology Database through space, time, and taxonomy. The application is entirely client-side and depends on external services, including the [Paleobiology Database](http://paleobiodb.org), [GPlates](http://www.gplates.org), and [Phylopic](http://phylopic.org).

You can find the current version at [http://paleobiodb.org/navigator](http://paleobiodb.org/navigator)


## Dependencies
This project requires Node.js, Grunt, and Topojson to be installed. To install Node.js on OS X see the instructions at the bottom of this document. Once Node is installed, you can install Grunt with ````npm install -g grunt-cli```` and Topojson with ````npm install topojson -g````.

## Organization
All working files (the ones you want to edit) are found in the ````assets```` directory, and all files to be used in the application (the compiled and minified versions) are found in the ````build```` directory. Each of the major application components (regular map, reconstruction map, time scale, taxa browser, interface) have their own Javascript file. All interface code is located in ````assets/js/navigator.js````. Grunt combines and minifies all these files into ````build/js/script.min.js````.

## Setup
1. Clone or fork this repository, and navigate into it
2. ````npm install````
3. Start a simple Python server with ````python -m SimpleHTTPServer```` and navigate to localhost:8000 in a web browser. 


## Helpful hints
To:

  * Rebuild the plate cache: ````grunt shell:plates```` then ````grunt shell:badPlates````
  * Rebuild the rotation cache: ````grunt shell:rotations````
  * Rebuild the collections < Phanerozoic cache: ````grunt shell:oldCollections````
  * Validate HTML: ````grunt htmlhint````
  * Concatenate/minify Javascript: ````grunt uglify````
  * Concatenate/minify CSS: ````grunt cssmin````
  * Validate HTML, concatenate/minify Javascript and CSS: ````grunt````


## Contributing
PBDB Navigator is an open-source project and welcomes feedback/contributions from the community. If you see a bug and would like to fix it, please submit a pull request. If you see a bug or have a suggestion but do not know how to fix it, please open a new issue or contact John Czaplewski at jczaplewski@wisc.edu

## License
Paleobiology Database data is used under a [CC-BY 4.0](http://creativecommons.org/licenses/by/4.0/) Creative Commons license. Plate and collection rotation data from [GPlates](http://www.gplates.org) is used under a GNU [General Public License (GPL), version 2](http://www.gnu.org/licenses/old-licenses/gpl-2.0.html), and taxonomic images from [Phylopic.org](http://phylopic.org/) are used under either a Public Domain or Creative Commons license.

All code unique to the PBDB Navigator interface is written by John Czaplewski unless otherwise specified, and uses a [CC0 1.0 Universal](http://creativecommons.org/publicdomain/zero/1.0/) Public Domain Dedication.

## Setup Node.js on OS X
Adapted from https://gist.github.com/isaacs/579814#file-node-and-npm-in-30-seconds-sh :

1. ````echo 'export PATH=$HOME/local/bin:$PATH' >> ~/.bashrc````
2. ````. ~/.bashrc````
3. ````cd ~````
4. ````mkdir node-latest````
5. ````cd node-latest````
6. ````curl http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1````
7. ````./configure --prefix=~/local````
8. ````make install```` (Takes a while...might have to agree to XCode terms and conditions here. If you get an XCode error, run ````sudo xcodebuild -license````, view the license, and type ````agree```` to validate)
9. ````curl https://npmjs.org/install.sh | sh````

If you get npm errno -13 with code EACCES while installing grunt, run ````sudo chown -R $USER /usr/local````. This will make you the owner of /usr/local which will make sure you never have to use sudo with npm (via http://howtonode.org/introduction-to-npm)