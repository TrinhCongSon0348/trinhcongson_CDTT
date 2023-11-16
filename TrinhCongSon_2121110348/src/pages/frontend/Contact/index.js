// import { FaPlus, FaRegEye, FaEdit, FaTrash } from 'react-icons/fa';
function Contact() {
    return (
        <section className="maincontent my-3">
            <div className="container">
                <h3 className="text-black">LIÊN HỆ</h3>
                <h3 className="text-black">Chi tiết liên hệ</h3>
                <h3 className="text-black">Siêu xe đẹp</h3>
                <h5>Address:168/25 Chế Lan Viên, P.Tây Thạnh, Q.Tân Phú, Hồ Chí Minh</h5>
                <h5>Email: trinhcongson.net</h5>
                <h5>Phone: 0981212201</h5>
                <form accept-charset="UTF-8" action="/contact" class="contact-form" method="post">
                    <input name="form_type" type="hidden" value="contact" />
                    <input name="utf8" type="hidden" value="✓" />
                    <div class="form-group">
                        <label for="contactFormName" class="sr-only">Tên</label>
                        <input required="" type="text" id="contactFormName" class="form-control input-lg" name="contact[name]" placeholder="Tên của bạn" autocapitalize="words" value="" />
                    </div>
                    <div class="form-group">
                        <label for="contactFormEmail" class="sr-only">Email</label>
                        <input required="" type="email" name="contact[email]" placeholder="Email của bạn" id="contactFormEmail" class="form-control input-lg" autocorrect="off" autocapitalize="off" value="" />
                    </div>
                    <div class="form-group">
                        <label for="contactFormMessage" class="sr-only">Nội dung</label>
                        <textarea required="" rows="6" name="contact[body]" class="form-control" placeholder="Viết bình luận" id="contactFormMessage"></textarea>
                    </div>

                    <input type="submit" class="btn btn-primary btn-lg btn-rb" value="Gửi liên hệ" />
                    
                </form>
            </div>
            
        </section>
    );
}

export default Contact;