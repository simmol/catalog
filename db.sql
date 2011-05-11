CREATE TABLE  `catalog`.`category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(252) NOT NULL,
  `lang` varchar(32) NOT NULL,
  PRIMARY KEY (`cid`,`lang`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8

CREATE TABLE  `catalog`.`subcategory` (
  `scid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`scid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

CREATE TABLE  `catalog`.`subcategory_lang` (
  `scid` int(11) NOT NULL,
  `lang` varchar(32) NOT NULL,
  `name` varchar(252) NOT NULL,
  PRIMARY KEY (`scid`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

CREATE TABLE `catalog`.`product` (
  `pid` integer  NOT NULL AUTO_INCREMENT,
  `cid` integer  NOT NULL,
  `scid` integer  NOT NULL,
  `price` varchar(32)  NOT NULL,
  `updated_at` TIMESTAMP  NOT NULL,
  PRIMARY KEY (`pid`)
)
ENGINE = InnoDB;

CREATE TABLE `catalog`.`product_lang` (
  `pid` integer  NOT NULL,
  `lang` varchar(32)  NOT NULL,
  `name` varchar(252)  NOT NULL,
  `description` text  NOT NULL,
  PRIMARY KEY (`pid`, `lang`)
)
ENGINE = InnoDB;

