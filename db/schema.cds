namespace utadeo.nextnest;

entity country {
    key id      : Integer;
        name    : String(50) not null;
        preffix : String(10) not null;
        cities  : Association to many city
                      on cities.country = $self;
}

entity city {
    key id            : Integer;
        name          : String(50) not null;
        country       : Association to country;
        living_places : Association to many living_place
                            on living_places.city = $self;
}

entity user {
    key id            : Integer;
        name          : String(50) not null;
        lastname      : String(50) not null;
        email         : String(50) not null;
        password      : String(50) not null;
        is_active     : Boolean not null;
        created_at    : DateTime not null;
        group         : Association to one group
                            on group.admin = $self;
        posts         : Association to many post
                            on posts.author = $self;
        comments      : Association to many comment
                            on comments.user = $self;
        living_places : Association to many living_place
                            on living_places.user = $self;
        hearts        : Association to many heart
                            on hearts.sender = $self;
        members       : Association to many member
                            on members.member = $self;
        profile       : Association to one profile
                            on profile.user = $self;
}

entity type_post {
    key id    : Integer;
        name  : String(50) not null;
        code  : String(5) not null;
        posts : Association to many post
                    on posts.type_post = $self;
}

entity group {
    key id          : Integer;
        title       : String(60) not null;
        description : String(200) not null;
        created_at  : DateTime not null;
        admin       : Association to user;
        posts       : Association to many post
                          on posts.group = $self;
        members     : Association to many member
                          on members.group = $self;
}

entity post {
    key id          : Integer;
        content     : String(300) not null;
        created_at  : DateTime not null;
        type_post   : Association to type_post;
        author      : Association to user;
        group       : Association to group;
        comments    : Association to many comment
                          on comments.post = $self;
        hearts      : Association to many heart
                          on hearts.post = $self;
        images_post : Association to many image_post
                          on images_post.post = $self;
}

entity comment {
    key id         : Integer;
        content    : String(200) not null;
        created_at : DateTime not null;
        comment    : Association to comment;
        post       : Association to post;
        user       : Association to user;
        hearts     : Association to many heart
                         on hearts.comment = $self;
}

entity image {
    key id         : Integer;
        src        : String(100) not null;
        created_at : DateTime not null;
        cv         : Association to one cv
                         on cv.image = $self;
        image_post : Association to one image_post
                         on image_post.image = $self;
        profile    : Association to one profile
                         on profile.image = $self;
}

entity cv {
    key id          : Integer;
        image       : Association to image;
        educations  : Association to many education
                          on educations.cv = $self;
        experiences : Association to many experience
                          on experiences.cv = $self;
        skills      : Association to many skill
                          on skills.cv = $self;
}

entity education {
    key id             : Integer;
        institute_name : String(80) not null;
        academic_title : String(50) not null;
        graduated_at   : Date not null;
        cv             : Association to cv;
}

entity type_expense {
    key id       : Integer;
        name     : String(50) not null;
        icon     : String(50);
        expenses : Association to many expense
                       on expenses.type_expense = $self;
}

entity living_place {
    key id          : Integer;
        address     : String(60) not null;
        latitude    : String(12) not null;
        longitude   : String(12) not null;
        started_at  : DateTime not null;
        finished_at : DateTime;
        owner_name  : String(50);
        cost        : Decimal not null;
        is_current  : Boolean not null;
        user        : Association to user;
        city        : Association to city;
        expenses    : Association to many expense
                          on expenses.living_place = $self;
}

entity expense {
    key id           : Integer;
        cost         : Decimal not null;
        created_at   : DateTime not null;
        description  : String(150);
        type_expense : Association to type_expense;
        living_place : Association to living_place;
}

entity experience {
    key id           : Integer;
        company_name : String(100) not null;
        position     : String(120) not null;
        start_date   : Date not null;
        finish_date  : Date not null;
        description  : String(300) not null;
        cv           : Association to cv;
}

entity friend {
    key id          : Integer;
        user        : Association to profile;
        friend      : Association to profile;
        is_accepted : Boolean not null;
        created_at  : DateTime not null;
}

entity heart {
    key id        : Integer;
        sender_at : DateTime not null;
        sender    : Association to user;
        comment   : Association to comment;
        post      : Association to post;
}

entity image_post {
    key id    : Integer;
        post  : Association to post;
        image : Association to image;
}

entity member {
    key id        : Integer;
        joined_at : DateTime not null;
        group     : Association to group;
        member    : Association to user;
}

entity profile {
    key id         : Integer;
        date_birth : Date not null;
        phone      : String(10);
        biography  : String(200);
        user       : Association to user;
        image      : Association to image;
}

entity skill {
    key id         : Integer;
        desciption : String(160) not null;
        cv         : Association to cv;
}
