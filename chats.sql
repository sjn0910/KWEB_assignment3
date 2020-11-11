CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    userid VARCHAR(32) NOT NULL,
    userpw VARCHAR(32) NOT NULL,
    nickname VARCHAR(32) NOT NULL,
    prof_pic VARCHAR(256) NOT NULL,
    prof_mes VARCHAR(64) NOT NULL,
    is_quited TINYINT DEFAULT 0,
    join_date DATE NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE channels (
    id INT NOT NULL AUTO_INCREMENT,
    chan_name VARCHAR(32) NOT NULL,
    creater INT NOT NULL,
    chan_link VARCHAR(256) NOT NULL,
    max_capa INT NOT NULL,
    is_quited TINYINT DEFAULT 0,
    created_date DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (creater)
    REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE chats (
    id INT NOT NULL AUTO_INCREMENT,
    content TEXT(256) NOT NULL,
    writer INT NOT NULL,
    channel INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (writer)
    REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (channel)
    REFERENCES channels(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE blocks (
    id INT NOT NULL AUTO_INCREMENT,
    blocker INT NOT NULL,
    blocked INT NOT NULL,
    block_date DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (blocker)
    REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (blocked)
    REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE follows (
    id INT NOT NULL AUTO_INCREMENT,
    follower INT NOT NULL,
    followee INT NOT NULL,
    follow_date DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (follower)
    REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (followee)
    REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;