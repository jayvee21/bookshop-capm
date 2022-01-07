namespace bookshop.db;

using { managed, cuid, Currency } from '@sap/cds/common';

entity Books:  managed {
    key ID  :   Integer;
    title   :   localized String(100);
    desc    :   localized String(1000);
    author  :   Association to Authors;
    stock   :   Integer;
    price   :   Decimal(9,2);
    currency:   Currency;
    image   :   LargeBinary @Core.MediaType :   'image/png';

}


entity Authors :  managed {
    key ID  :   Integer;
    name    :   String(100);
    dateOfBirth :   Date;
    placeOfBirth:   String;
    placeOfDeath:   String;
    books   :   Association to many Books on books.author = $self;
}

entity Orders   :   managed, cuid {
    OrderNo :   String @title:'Order Number'; //> Readable key
    items   :   Composition of many OrderItems on items.parent = $self; 
}

entity OrderItems   :  cuid {
    parent  :   Association to Orders;
    book    :   Association to Books;
    qty     :   Integer;
    netAmount:  Decimal(9,2);
}