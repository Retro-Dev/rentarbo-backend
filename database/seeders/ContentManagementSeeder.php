<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class ContentManagementSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \DB::table('content_management')->insert([
            [
                'title' => 'Terms Condition',
                'slug' => 'terms-condition',
                'content' => '<p style="padding-bottom:20px ;">
                Welcome to PastorStays, a non-profit organization that connects
                ministers to vacation homes for nominal fees. By using our website and
                web app, you agree to be bound by the following terms and conditions.
            </p>
<div>
    <ol>
        <li style="margin-left: 17px !important;">
            <p style="padding-bottom:10px ;">Eligibility: Our services are available to credentialed ministers
            who are in good standing with their religious organization. By using
            our website and web app, you represent and warrant that you are a
            credentialed minister and that you are in good standing with your
            religious organization.</p>
        </li>
        <li style="margin-left: 17px !important;">
            <p style="padding-bottom:10px ;">
            Use of our Services: Our services are intended for personal and
            non-commercial use. You agree not to reproduce, duplicate, copy,
            sell, resell or exploit any portion of our website and web app
            without our express written permission.
            </p>
        </li>

        <li style="margin-left: 17px !important;">
            <p style="padding-bottom:10px ;">
            User Content: You are solely responsible for the content and
            information that you submit to our website and web app, including
            any reviews, comments, or messages. You agree that you will not post
            any content that is illegal, offensive, or in violation of any third
            party`s rights.
            </p>
        </li>

        <li style="margin-left: 17px !important;">
            <p style="padding-bottom:10px ;">
            Intellectual Property: All content on our website and web app,
            including text, graphics, logos, images, and software, is the
            property of PastorStays or our licensors and is protected by
            copyright and trademark laws.
            </p>
        </li>

        <li style="margin-left: 17px !important;">
            <p style="padding-bottom:10px ;">
            Reservation and Payment: By making a reservation through our website
            and web app, you agree to pay the nominal fee and any other charges
            incurred during your stay. You also agree to the host&apos;s
            cancellation policy.
            </p>
        </li>

        <li style="margin-left: 17px !important;">
            <p style="padding-bottom:10px ;">Responsibilities of Hosts: Hosts are responsible for maintaining the
            accuracy of the information they post on our website and web app,
            including property descriptions and availability. Hosts are also
            responsible for ensuring that the property is safe and in good
            condition for guests.</p>
        </li>

        <li style="margin-left: 17px !important;">
            <p style="padding-bottom:10px ;">
            Limitation of Liability: To the maximum extent permitted by law,
            PastorStays will not be liable for any damages arising out of or in
            connection with your use of our website and web app, including but
            not limited to direct, indirect, incidental, special, consequential,
            or punitive damages.
            </p>
        </li>

        <li style="margin-left: 17px !important;">
            <p style="padding-bottom:10px ;">
            Dispute Resolution: In the event of any dispute arising out of or in
            connection with our website and web app, the parties agree to first
            try to resolve the dispute informally. If the dispute cannot be
            resolved informally, the parties agree to resolve the dispute
            through binding arbitration.
            </p>
        </li>

        <li style="margin-left: 17px !important;">
            <p style="padding-bottom:10px ;">Governing Law: These terms and conditions shall be governed by and
            construed in accordance with the laws of the state of Washington,
            without giving effect to any principles of conflicts of law.</p>
        </li>

        <li style="margin-left: 17px !important;">
            <p style="padding-bottom:10px ;">
            Changes to Terms and Conditions: We reserve the right to make
            changes to these terms and conditions at any time. Your continued
            use of our website and web app following any changes indicates your
            acceptance of the new terms and conditions.
            </p>
        </li>
    </ol>
</div>
    <p style="margin-left: 17px !important;">
        If you have any questions or concerns about these terms and conditions,
        please contact us at hello@pastorstays.com
    </p>',
                'status' => '1',
                'created_at' => '2020-02-11 15:01:25',
                'updated_at' => NULL,
                'deleted_at' => NULL
            ],[
                'title' => 'Privacy Policy',
                'slug' => 'privacy-policy',
                'content' => '<div>
				
					
                <p style="padding-bottom: 20px;">At PastorStays, we are committed to protecting the privacy and
                security of our users. This privacy policy explains how we collect,
                use, and disclose personal information through our website and web
                app.</p>
                
                <div>
                    <ol style="margin-left: 30px !important; padding-bottom: 10px !important;">
                        <li><p>Information Collection and Use</p></li>
                    </ol>
                </div>

                <p style="margin-left:18px !important; " >
                    We collect personal information from users when they create an
                    account, make a reservation, or communicate with us through our
                    website or web app. This information may include name, contact
                    information, and payment information. We use this information to
                    provide the services requested, communicate with users, and
                    improve the functionality of our website and web app.
                </p>

                <p style="margin-left:18px !important; padding-bottom: 10px !important; ">
                    We also collect usage data, such as information about how users
                    interact with our website and web app, to improve the user
                    experience and understand how our services are being used.
                </p>

                <div>
                    <ol start="2" style="margin-left: 30px !important; padding-bottom: 10px !important;">
                        <li><p>Cookies and Tracking Technologies</p></li>
                    </ol>
                </div>

                <p style="margin-left:18px !important; ">
                    We use cookies and other tracking technologies to collect
                    information about users and their interactions with our website
                    and web app. Cookies are small text files that are stored on
                    users&apos; devices when they visit a website. They allow the
                    website to remember users&apos; preferences, login information,
                    and other data.
                </p>

                <p style="margin-left:18px !important; padding-bottom: 10px !important; ">
                    Users can control the use of cookies through their browser
                    settings. However, please note that disabling cookies may limit
                    the functionality of our website and web app.
                </p>

                <div>
                    <ol start="3" style="margin-left: 30px !important; padding-bottom: 10px !important;">
                        <li><p>Sharing of Information </p></li>
                    </ol>
                </div>

                <p style="margin-left:18px !important; ">
                    We do not share personal information with third parties for their
                    own marketing or advertising purposes without obtaining explicit
                    consent from users. We may share personal information with
                    third-party service providers, such as payment processors, to
                    assist with providing services to users.
                </p>

                <p style="margin-left:18px !important; padding-bottom: 10px !important; ">
                    We may also disclose personal information in response to legal
                    requests, such as a subpoena or court order, or to comply with
                    applicable laws.
                </p>

                <div>
                    <ol start="4" style="margin-left: 30px !important; padding-bottom: 10px !important;">
                        <li> <p>Security</p></li>
                    </ol>
                </div>

                <p style="margin-left:18px !important; padding-bottom: 10px !important; ">
                    We take reasonable measures to protect personal information from
                    unauthorized access, use, or disclosure. However, please note that
                    no data transmission over the internet or storage system can be
                    guaranteed to be 100% secure.
                </p>

                <div>
                    <ol start="5" style="margin-left: 30px !important; padding-bottom: 10px !important;">
                        <li><p>Changes to this Privacy Policy</p></li>
                    </ol>
                </div>

                <p style="margin-left:18px !important; ">
                    We may update this privacy policy from time to time. We will
                    notify users of any changes by updating the &quot;Last
                    Updated&quot; date at the top of this page. Users are encouraged
                    to review this privacy policy periodically to stay informed about
                    how we collect, use, and disclose personal information.
                </p>

                <p style="margin-left:18px !important; padding:20px 0  !important;">Contact Us</p>

                <p style="margin-left:18px !important; ">
                    If you have any questions or concerns about this privacy policy,
                    please contact us at hello@pastorstays.com
                </p>
            </li>
        </ol>
    </div>',
                'status' => '1',
                'created_at' => '2020-02-11 15:01:25',
                'updated_at' => NULL,
                'deleted_at' => NULL
            ],[
                'title' => 'About Us',
                'slug' => 'about-us',
                'content' => 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.',
                'status' => '1',
                'created_at' => '2020-02-11 15:01:25',
                'updated_at' => NULL,
                'deleted_at' => NULL,
            ],
            
            
        ]);

    }
}
