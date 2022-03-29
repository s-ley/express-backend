export const errorMiddleware = (err, req, res, next) => {
    const statusCode = res.statusCode === 200 ? 500 : res.statusCode;

    // Log
    console.error(err);

    // Respond
    res.status(statusCode)
    res.json({
        message: process.env.NODE_ENV === 'production' ? 'Server error' : err,
    });
}