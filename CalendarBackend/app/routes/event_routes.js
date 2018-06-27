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
    const event = { descrription: req.body.body, title: req.body.title, 
                    startTime: parseFloat(req.body.startTime), 
                    endTime: parseFloat(req.body.endTime), 
                    day: parseInt(req.body.day), month: parseInt(req.body.month), 
                    year: parseInt(req.body.year)};
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