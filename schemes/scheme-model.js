const db = require('../data/schemes.db3')

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
}

function find(){
    return db('schemes')
}

function findById(id){
   return db('schemes').where({id: id})
}

/*SELECT stp.id, sch.scheme_name, stp.step_number, stp.instructions
FROM steps as stp
JOIN schemes as sch
    ON stp.scheme_id = sch.id
WHERE sch.id = 2
ORDER BY stp.step_number */

function findSteps(id){
   return db('steps as stp')
    .join('schemes as scm', 'stp.scheme_id', 'scm.id')
    .where({scheme_id: id})
    .orderBy('stp.step_number', 'asc')
    .select('stp.id', 'scm.scheme_name', 'stp.step_number', 'stp.instructions')
}

function add(scheme) {
    return db("schemes").insert(scheme)
      .then(newID => {
        return findById(newID)
      })
  }

function update(changes,id){
    return db("schemes").where({ id }).update(changes)
}

function remove(id) {
    return db("schemes").where({ id }).del();
}