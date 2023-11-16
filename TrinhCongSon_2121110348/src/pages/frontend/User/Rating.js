import { useState } from 'react';
import StarRating from './StarRating';

function Rating() {
    const [userdetail, setUserdetail]=useState();
    return (
        <div className='rating'>
            <StarRating apartmentId={apartment.apartment_id} userid={userdetail.id} rating={apartment.rating} />

        </div>
    );
}

export default Rating;