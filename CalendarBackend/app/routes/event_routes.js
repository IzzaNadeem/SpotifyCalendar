var ObjectID = require('mongodb').ObjectID;
module.exports = function(app, db) {
  app.get('/events/:id', (req, res) => {
    const id = req.params.id;
    const details = { '_id': new ObjectID(id) };
    db.collection('events').findOne(details, (err, item) => {
      if (err) {
        res.send({'error':'An error has occurred'});
      } else {
        res.send(item);
      } 
    });
  });
app.post('/events', (req, res) => {
    const event = { description: req.body.description, 
                    startTime: String(req.body.startTime), 
                    endTime: String(req.body.endTime), 
                    day: req.body.day, 
                    month: req.body.month, 
                    year: req.body.year};
    db.collection('events').insert(event, (err, result) => {
      if (err) { 
        res.send({ 'error': 'An error has occurred' }); 
      } else {
        res.send(result.ops[0]);
      }
    });
  });

//get all events 
  app.get('/events', (req, res) => {
    db.collection('events').find({}).toArray(function(err, result) {
      if(err) {
        res.send({'error':'An error has occured getting all events'});
      } else {
        res.send(result);
      }
    });
  });

  //delete an event 
  app.delete('/events/:id', (req, res) => {
    const id = req.params.id;
    const details = { '_id': new ObjectID(id) };
    db.collection('events').remove(details, (err, item) => {
      if (err) {
        res.send({'error':'An error has occured deleting the event'});
      } else {
        res.send('Event ' + id + 'deleted!');
      }
    });
  });

};