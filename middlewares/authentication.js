module.exports = (req,res, next) => {
    if (req.session.userId) {
        next()
    } else {
        next('route')
    }
}