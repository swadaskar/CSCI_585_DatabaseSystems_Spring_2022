Assumptions:
1.Students have to take at least one project and at least one coding class, that's why cardinality is 1 to many with project and class entity.
2.Instructor has to teach at least one class and each class has at least one instructor.
3.One instructor can oversee many projects, but one project can be overseen by only one instructor.
4.Many students take up a project and project work is done everyday at specified time within the week. 
  Similarly classes are taken at specified time throughout the week. (Stated in HW Description: Each class or project lasts a week.)
5.Damaged part will be charged equally among the group of students working on the project.
6.All suppliers are online suppliers(as stated) with websites to order from.


Designer's point of view:
★All bold attributes have the NOT NULL constraint, whereas the non-bold attributes can be null.

★Student: Student maintains many to many relationships with class, project and instructor entities. Therefore I have made a composite entity(weak entity) 
	for each of these instances. 
	These entities will also contain the rating attribute the student gives at the end of the curriculum.
	Student maintains a weak relationship with the book entity.

★Instructor: Instructor entity has a many to many relationship with classes, so I made a composite entity 'TEACHING' between them 
	which also contains instructor's preferred textbook and their teaching hours.
	Instructor has a one to many relationship with project entity, assuming one project has only one instructor supervising it. 
	Instructor base rate will be derived from INPR_SUPERVISE_HRS(in project entity) and TEACH_HRS(in teaching entity) attributes, 
	multiplied by predecided rates(which is identical for each instructor as stated) for teaching and supervising.

★Project: Project has a many to many relation with student entity, so it has a composite entity with the student entity.
	Project has a PRO_TABLE attribute where the students would work as stated. It has a one to many relationship with part entity.
	I have assumed that all students within the group will be charged equally for the loss/damage of a part.

★Class: Class entity has many to many relation with student and instructor, therefore it maintains a composite entity between itself and them.

★Part: Part has a composite entity (ORDER) between itself and the supplier. ORDER is a strong entity.
	
★Room: Room entity maintains a one to many, weak relationship with project and class entities.

★Book: Book entity maintains a many to one relation with student entity. Also, it has a cardinality of (0,4) as required.