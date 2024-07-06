const cds = require('@sap/cds');
const { Console } = require('console');
module.exports = async function () {

    const db = await cds.connect.to('db') // connect to database service
    const { Incidents, Cutomers } = db.entities         // get reflected definitions

    //   // Reduce stock of ordered books if available stock suffices
    //   this.on ('submitOrder', async req => {
    //     const {book,quantity} = req.data
    //     const n = await UPDATE (Books, book)
    //       .with ({ stock: {'-=': quantity }})
    //       .where ({ stock: {'>=': quantity }})
    //     n > 0 || req.error (409,`${quantity} exceeds stock for book #${book}`)
    //   })

    //   // Add some discount for overstocked books
    //   this.after ('each','Books', book => {
    //     if (book.stock > 111) book.title += ` -- 11% discount!`
    //   })

    this.before('CREATE', 'Incidents', (req) => {
        console.log('this.before(CREATE, Incidents) is triggered');
        console.log(req.data);
        if (req.data.urgencyCode == null) {
            req.data.urgencyCode = req.data.urgency_code;
        }
    })
    this.on('ChangeUrgencytoHigh', async (req) => {
        console.log('this.on is triggered');
        console.log(req.params);
        const query = await SELECT(Incidents).where({ ID: req.params[0].ID });
        if (query[0].urgencyCode != 'H'){
        const n = await UPDATE(Incidents).set({ urgencyCode: 'H', urgency_code: 'H' }).where({ ID: req.params[0].ID })
        req.notify('Status Changed to High');
        }
        else{
            req.error();
        }
    })
     this.on('getCurrentStatus', async (req) => {
        console.log('Get current Status is triggered');
        console.log(req.params);
        const query = await SELECT(Incidents).where({ ID: req.params[0].ID });
        console.log('query' , query);
        return query[0].status_code;
     })
    
    }