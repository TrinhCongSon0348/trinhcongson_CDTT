import React, { useEffect, useState } from "react";
import axios from "axios";
import FontAwesomeIcon from '@fortawesome/react-fontawesome';
import { faStar as solidStar } from '@fortawesome/free-solid-svg-icons';
import { faStar as regularStar } from '@fortawesome/free-regular-svg-icons';

function StarRating({ apartmentId, userId }) {
    const [selectedrating, setSelectedRating] = useState(0);
    const [comment, setComment] = useState('');
    const [starcount, setStarCount] = useState(0);
    useEffect(() => {
        fetchStarCount();
    }, []);

    const handleRatingChange = (rating) => {
        setSelectedRating(rating);
    };

    const handleCommentChange = (e) => {
        setComment(e.target.value);
    };

    const handleSubmitRating = () => {
        if (selectedrating === 0) {
            alert("Please select a rating!");
            return;
        }

        const ratingData = {
            apartment_id: apartmentId,
            user_id: userId,
            number_rating: selectedrating,
            comment: comment,
        };

        axios
            .post('http://localhost:8000/api/rating', ratingData)
            .then((response) => {
                console.log('Rating sumited successfully:', response.data);
                setSelectedRating(0);
                setComment('');
                fetchStarCount();
            })
            .catch((error) => {
                console.log("Rating submited failed:", error);
            });
    };

    const fetchStarCount = () => {
        axios
            .get(`http://localhost:8000/api/rating?apartment_id=${apartmentId}&user_id=${userId}`)
            .then((response) => {
                setStarCount(response.data.number_of_stars);
            })
            .catch((error) => {
                console.log('Failed to fetch star count:', error);
            });
    };

    const renderStars = () => {
        const isRated = starcount !== 0;
        return (<div className="star-container">
            {[1, 2, 3, 4, 5].map((index) => (
                <FontAwesomeIcon
                    key={index}
                    className='icon-star'
                    icon={isDated ? solidStar : regularStar}
                    onClick={() => handleRatingChange(index)}
                    style={{
                        cursor: 'pointer',
                        padding: '10px',
                        fontSize: '30px',
                        color: isRated ? (index <= starcount ? 'yellow' : 'black') : (index <= selectedrating ? 'yellow' : 'black'),
                    }}
                />
            ))}
        </div>
        );
    };
    return(
        <div className="star-rating-container">
            <div>
                <h4 style={{marginBottom:'10px'}}>Đánh giá:</h4>
                {renderStars()}
            </div>
            <div>
                <h4 style={{marginBottom:'10px', }}>Bình luận:</h4>
                <textarea value={comment} onChange={handleCommentChange} style={{width: '700px', minHeight: '100px'}}></textarea>
            </div>
            <div style={{textAlign:'right'}}>
                <button onClick={handleSubmitRating}>Submit</button>
            </div>
        </div>

    )
}