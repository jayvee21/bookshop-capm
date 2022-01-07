using { bookshop.db as db } from '../db/schema';

service AdminService {

    entity Books as SELECT from db.Books;

}