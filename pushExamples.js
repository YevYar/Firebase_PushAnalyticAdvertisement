/**************************************
 * ПРИМЕР NOTIFICATION + DATA MESSAGE *
 **************************************/

{
 "to" : "d87FCHciRDQ:APA91bESGLSz9O7Fg-T6zwaRUt7hkPhuLTZ8SEdTQAWNJ1mbpcNAvLesYzgNu_XIPnT0bwOCRU_aIomrqjJ3F19ajEah1OJ1GzKAWxFS4kdxV7P7MOxVLx6RaFodqi5MEs9W_nCs2lf0",
 "collapse_key" : "type_a",
 "mutable_content" : true, // нужно для исп. iOS service extensions
 "notification" : {
     "body" : " Body of Your Notification __ Body of Your Notification __ Body of Your Notification __ Body of Your Notification __ Body of Your Notification __ Body of Your Notification __ Body of Your Notification __ Body of Your Notification __ Body of Your Notification __ Body of Your Notification __",
     "title": "Title of Your Notification",
     "badge": 100,
     "click_action": "CustomSamplePush_4", // если этот ключ есть, то на Андроиде приложение не открывается при нажатии на пуш
     "sound" : "default" // без этого ключа уведомления на iOS не будут издавать звук
 }, // далее идет опциональная нагрузка
 "data" : {
     "body" : "Body of Your Notification in Data",
     "title": "Title of Your Notification in Title",
     "key_1" : "Value for key_1",
     "key_2" : "Value for key_2"
 }
}

/****************************************
 * ПРИМЕР DATA-ONLY MESSAGE (ТИХИЙ ПУШ) *
 ****************************************/

{
    "to" : "fUSUfjYzGrE:APA91bHw1n5CM8v2sHNBaFWdz4P5C0sLFrJV10IveDOmUNF17EbZ3SaSO90gSK9irf40f5csQwuioIR6zKRTUhJmpv384SqxluHZTmqoajwb2PeWuf-2qU5zcyEZFGwLmR-JjT_BsE2K",
        "data" : {
        "score" : 7
    },
    "content_available" : true,
    "priority" : "high" // обязательно для Андроид
}