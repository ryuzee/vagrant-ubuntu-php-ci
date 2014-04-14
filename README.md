vagrant-ubuntu-php-ci
===========

## 使い方

## アプリケーションの配置

### 開発環境

ローカルのディレクトリをVagrantの共有ディレクトリ機能を使って共有する。

カレントディレクトリで

```
git clone [アプリケーションレポジトリ] application 
```

のような形でcloneする。なお、application/app/webroot をドキュメントルートにしているので、CakePHP以外の場合は、application/app/webrootディレクトリを作成した上でその中に適当なPHPスクリプトを配置する。

### Vagrantのプラグインのインストール（推奨）

何度も環境を作り直すことになるので、aptのパッケージをキャッシュすることが望ましい。以下のようにしてインストールする。

```
vagrant plugin install vagrant-cachier
```

なお、本機能はVagrant1.4以降でしか動作しない。現在1.5.2が最新なので、最新版のVagrantを使う。

### boxの追加

将来的なことを考えてVagrantfile上のbox_urlは現時点では存在しないものを指定しているため、以下必須

```
vagrant box add opscode-ubuntu-14.04 https://dl.dropboxusercontent.com/u/428597/vagrant_boxes/opscode_ubuntu-14.04_chef-provisionerless.box
```

次に仮想マシンを起動する。仮想マシンは全部で3台ある。

* develop 主に開発環境
* ci 継続的インテグレーション環境
* deploy デプロイ先環境

全部起動する場合は、

```
vagrant up --provision
```

とすればOK。1台だけ起動する場合は、後ろに仮想マシン名を指定する。例えば

```
vagrant up --provision develop
```

それぞれの環境に何が入っているかは、Vagrantfileを参照



## バージョン情報

### PHP

```
vagrant@develop:~$ php -v
PHP 5.5.9-1ubuntu4 (cli) (built: Apr  9 2014 17:11:57) 
Copyright (c) 1997-2014 The PHP Group
Zend Engine v2.5.0, Copyright (c) 1998-2014 Zend Technologies
    with Zend OPcache v7.0.3, Copyright (c) 1999-2014, by Zend Technologies
    with Xdebug v2.2.3, Copyright (c) 2002-2013, by Derick Rethans
```

### PHPUnit

```
vagrant@develop:~$ phpunit --version
PHPUnit 4.0.14 by Sebastian Bergmann.
```

### PHP_PMD

```
vagrant@develop:~$ phpmd --version
PHPMD 1.5.0 by Manuel Pichler
```

### phpcpd

```
vagrant@develop:~$ phpcpd --version
phpcpd 2.0.0 by Sebastian Bergmann.
```


### phpDocumentor

```
vagrant@develop:~$ phpdoc --version
phpDocumentor version 2.4.0
```


### phing

```
vagrant@develop:~$ phing -v
Phing 2.7.0
```

