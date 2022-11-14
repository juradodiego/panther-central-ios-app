
const model = {
  user : {
    firstName : "Diego",
    lastName : "Jurado",
    role : {
      name : "student"
    },
    accounts : {
      "Panther Funds" : 50.00,
      "Dining Dollars" : 20.00,
      "Off-Campus Dining Dollars" : 5.00,
      "Additional Dining Dollars" : 0.00,
      "Bonus Bucks" : 0.00
    },
    transactions : [
      {
        date : "09/22/2022",
        description : "Ft. Pitt Subs",
        account : "Dining Dollars",
        amount : "-12.75"
      },
      {
        date : "09/23/2022",
        description : "Univ. Book Store",
        account : "Panther Funds",
        amount : "-50.00"
      }
    ],
    cards : [
      {
        cardName : "Double Cash Card",
        nameOnCard : "Diego Jurado",
        cardNumber : "1234567812345678",
        expDate : "12/25",
        CVV : 123,
        billingAddress : {
          lineOne : "135 N Bellefield Ave",
          lineTwo : "",
          city : "Pittsburgh",
          state : "PA",
          zip : "15213"
        }
      }
    ]
  },
  role : {
    name : "student"
  },
  login : {
    username: "daj85",
    password : "password123",
    authorized : true
  }
}

