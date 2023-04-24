-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-04-24 21:52:47.085

-- tables
-- Table: ItemMovement
CREATE TABLE ItemMovement (
    id int  NOT NULL,
    item_id int  NOT NULL,
    location_id int  NOT NULL,
    user_id int  NOT NULL,
    quantity int  NOT NULL,
    movement_type int  NOT NULL,
    movement_date int  NOT NULL,
    CONSTRAINT ItemMovement_pk PRIMARY KEY  (id)
);

-- Table: audit
CREATE TABLE audit (
    id int  NOT NULL,
    name int  NOT NULL,
    date_created datetime  NOT NULL,
    date_modified datetime  NOT NULL,
    user_created int  NOT NULL,
    user_modified int  NOT NULL,
    item_id int  NOT NULL,
    user_id int  NOT NULL,
    CONSTRAINT audit_pk PRIMARY KEY  (id)
);

-- Table: item
CREATE TABLE item (
    id int  NOT NULL,
    location_id int  NOT NULL,
    order_service_id int  NOT NULL,
    classification varchar(20)  NOT NULL,
    description varchar(20)  NOT NULL,
    creation_date datetime  NOT NULL,
    modified_date datetime  NOT NULL,
    CONSTRAINT item_pk PRIMARY KEY  (id)
);

-- Table: location
CREATE TABLE location (
    id int  NOT NULL,
    ItemMovement_id int  NOT NULL,
    name varchar(7)  NOT NULL,
    block char(1)  NOT NULL,
    "column" int  NOT NULL,
    row int  NOT NULL,
    side char(1)  NOT NULL,
    CONSTRAINT location_pk PRIMARY KEY  (id)
);

-- Table: notification
CREATE TABLE notification (
    id int  NOT NULL,
    type varchar(20)  NOT NULL,
    description varchar(50)  NOT NULL,
    creation_date datetime  NOT NULL,
    expiration_date datetime  NOT NULL,
    is_read char(1)  NOT NULL,
    user_id int  NOT NULL,
    item_id int  NOT NULL,
    CONSTRAINT notification_pk PRIMARY KEY  (id)
);

-- Table: order_service
CREATE TABLE order_service (
    id int  NOT NULL,
    creation_date int  NOT NULL,
    modified_date int  NOT NULL,
    user_id int  NOT NULL,
    CONSTRAINT order_service_pk PRIMARY KEY  (id)
);

-- Table: report
CREATE TABLE report (
    id int  NOT NULL,
    name int  NOT NULL,
    description int  NOT NULL,
    query int  NOT NULL,
    creation_date int  NOT NULL,
    user_id int  NOT NULL,
    CONSTRAINT report_pk PRIMARY KEY  (id)
);

-- Table: report_permission
CREATE TABLE report_permission (
    id int  NOT NULL,
    user_id int  NOT NULL,
    report_id int  NOT NULL,
    CONSTRAINT report_permission_pk PRIMARY KEY  (id)
);

-- Table: role
CREATE TABLE role (
    id int  NOT NULL,
    name varchar(20)  NOT NULL,
    description varchar(50)  NOT NULL,
    CONSTRAINT role_pk PRIMARY KEY  (id)
);

-- Table: user
CREATE TABLE "user" (
    id int  NOT NULL,
    fullname varchar(50)  NOT NULL,
    email varchar(50)  NOT NULL,
    password varchar(50)  NOT NULL,
    user_type varchar(20)  NOT NULL,
    status bit  NOT NULL,
    role_id int  NOT NULL,
    CONSTRAINT user_pk PRIMARY KEY  (id)
);

-- foreign keys
-- Reference: ItemMovement_item (table: ItemMovement)
ALTER TABLE ItemMovement ADD CONSTRAINT ItemMovement_item
    FOREIGN KEY (item_id)
    REFERENCES item (id);

-- Reference: ItemMovement_location (table: ItemMovement)
ALTER TABLE ItemMovement ADD CONSTRAINT ItemMovement_location
    FOREIGN KEY (location_id)
    REFERENCES location (id);

-- Reference: ItemMovement_user (table: ItemMovement)
ALTER TABLE ItemMovement ADD CONSTRAINT ItemMovement_user
    FOREIGN KEY (user_id)
    REFERENCES "user" (id);

-- Reference: Items_location (table: item)
ALTER TABLE item ADD CONSTRAINT Items_location
    FOREIGN KEY (location_id)
    REFERENCES location (id);

-- Reference: audit_items_item (table: audit)
ALTER TABLE audit ADD CONSTRAINT audit_items_item
    FOREIGN KEY (item_id)
    REFERENCES item (id);

-- Reference: audit_user (table: audit)
ALTER TABLE audit ADD CONSTRAINT audit_user
    FOREIGN KEY (user_id)
    REFERENCES "user" (id);

-- Reference: item_order_service (table: item)
ALTER TABLE item ADD CONSTRAINT item_order_service
    FOREIGN KEY (order_service_id)
    REFERENCES order_service (id);

-- Reference: location_ItemMovement (table: location)
ALTER TABLE location ADD CONSTRAINT location_ItemMovement
    FOREIGN KEY (ItemMovement_id)
    REFERENCES ItemMovement (id);

-- Reference: notification_item (table: notification)
ALTER TABLE notification ADD CONSTRAINT notification_item
    FOREIGN KEY (item_id)
    REFERENCES item (id);

-- Reference: notification_user (table: notification)
ALTER TABLE notification ADD CONSTRAINT notification_user
    FOREIGN KEY (user_id)
    REFERENCES "user" (id);

-- Reference: order_service_user (table: order_service)
ALTER TABLE order_service ADD CONSTRAINT order_service_user
    FOREIGN KEY (user_id)
    REFERENCES "user" (id);

-- Reference: report_permission_report (table: report_permission)
ALTER TABLE report_permission ADD CONSTRAINT report_permission_report
    FOREIGN KEY (report_id)
    REFERENCES report (id);

-- Reference: report_permission_user (table: report_permission)
ALTER TABLE report_permission ADD CONSTRAINT report_permission_user
    FOREIGN KEY (user_id)
    REFERENCES "user" (id);

-- Reference: report_user (table: report)
ALTER TABLE report ADD CONSTRAINT report_user
    FOREIGN KEY (user_id)
    REFERENCES "user" (id);

-- Reference: user_role (table: user)
ALTER TABLE "user" ADD CONSTRAINT user_role
    FOREIGN KEY (role_id)
    REFERENCES role (id);

-- End of file.

