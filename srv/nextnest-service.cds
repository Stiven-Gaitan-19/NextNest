using utadeo.nextnest as schema from '../db/schema';

service ApiServices {
    entity Countries as projection on schema.country;
    entity Departments as projection on schema.department;
    entity Cities as projection on schema.city;
    entity Users as projection on schema.user;
    entity TypePosts as projection on schema.type_post;
    entity Groups as projection on schema.group;
    entity Posts as projection on schema.post;
    entity Comments as projection on schema.comment;
    entity Images as projection on schema.image;
    entity CVs as projection on schema.cv;
    entity Educations as projection on schema.education;
    entity TypeExpenses as projection on schema.type_expense;
    entity LivingPlaces as projection on schema.living_place;
    entity Expenses as projection on schema.expense;
    entity Experiences as projection on schema.experience;
    entity Friends as projection on schema.friend;
    entity Hearts as projection on schema.heart;
    entity ImagesPost as projection on schema.image_post;
    entity Members as projection on schema.member;
    entity Profiles as projection on schema.profile;
    entity Skills as projection on schema.skill;
}