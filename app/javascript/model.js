const {
  SpraypaintBase,
  attr,
  belongsTo,
  hasMany,
  hasOne  
} = require("spraypaint/dist/spraypaint")


export const ApplicationRecord = SpraypaintBase.extend({
  static: {
    baseUrl: "/",
    apiNamespace: "api/v1"
  }
})

export const Author = ApplicationRecord.extend({
  static: {
    jsonapiType: "authors"
  },

  attrs: {
    fullName: attr(),
    email: attr(),
    createdAt: attr({ persist: false }),
  	updatedAt: attr({ persist: false }),

  	books: hasMany()
  }
})

export const Library = ApplicationRecord.extend({
  static: {
    jsonapiType: "libraries"
  },

  attrs: {
    name: attr(),
    address: attr(),
    createdAt: attr({ persist: false }),
    updatedAt: attr({ persist: false }),

    books: hasMany('owner')
  }
})

export const University = ApplicationRecord.extend({
  static: {
    jsonapiType: "universities"
  },

  attrs: {
    name: attr(),
    address: attr(),
    createdAt: attr({ persist: false }),
    updatedAt: attr({ persist: false }),

    books: hasMany('owner')
  }
})


export const Book = ApplicationRecord.extend({
  static: {
    jsonapiType: "books"
  },

  attrs: {    
    title: attr(),
    isbn: attr(),
    authorId: attr(),
    ownerId: attr(),
    ownerType: attr(),
    createdAt: attr({ persist: false }),
  	updatedAt: attr({ persist: false }),

  	author: belongsTo(),
    owner: belongsTo()
  }
})