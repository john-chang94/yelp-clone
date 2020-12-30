export const renderStars = (rating) => {
    let stars = [];
    for (let i = 1; i <= 5; i++) {
        // Key is required because stars gets rendered as an array in components
        if (i <= rating) {
            // Add a whole star
            stars.push(<i className="fas fa-star" key={i}></i>)
            // Add a half star if rating is a decimal and is equal to current loop index
        } else if (i === Math.ceil(rating) && !Number.isInteger(rating)) {
            stars.push(<i className="fas fa-star-half-alt" key={i}></i>)
        } else {
            // Add an empty star
            stars.push(<i className="far fa-star" key={i}></i>)
        }
    }
    return stars;
}