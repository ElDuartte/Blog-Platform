Project Title: Blog Platform with Live Comments and Newsletter System
Version: 1.0
Date: May 26, 2025
Author: Juan Felipe

1. Introduction

1.1 Purpose
The purpose of this document is to outline the software design of a Blog Platform built using Ruby on Rails 8. The platform will allow users to read and publish blog posts, leave live comments in real time, and subscribe to a newsletter system.

1.2 Scope
The application will:

Enable blog post creation, editing, deletion, and viewing.

Support user authentication and authorization.

Include a real-time comment system using Hotwire (Turbo + Stimulus).

Provide a newsletter subscription feature with email delivery.

Offer admin dashboard capabilities.

2. System Overview
   This is a full-stack monolithic web application using Ruby on Rails 8. PostgreSQL will be the primary data store. Hotwire will be used for real-time features. ActionMailer will handle newsletters.

3. Technologies
   Backend: Ruby on Rails 8

Frontend: Turbo + Stimulus (Hotwire)

Database: PostgreSQL

Email Service: ActionMailer (optionally integrated with SendGrid or Mailgun)

Authentication: Devise

Authorization: Pundit

Styling: Tailwind CSS

Deployment: Render.com / Fly.io / Heroku (TBD)

4. Architecture

4.1 MVC Pattern
Models: Post, User, Comment, Subscription, Newsletter

Views: ERB templates with Turbo Frames and Streams

Controllers:

PostsController: CRUD for blog posts

CommentsController: Create/delete comments (Turbo Stream responses)

SubscriptionsController: Manage subscriptions

NewslettersController: Admin-only to send newsletters

4.2 Realtime Comments
Use Turbo Streams to broadcast new comments to subscribed users.

Comments are associated with posts and are updated in real-time without page reloads.

4.3 Newsletter System
Subscriptions are stored in the database.

Newsletter content is written and sent via admin panel.

Uses ActionMailer with HTML + plaintext support.

5. Database Design (ERD Overview)
   Users

id

email

password_digest

role (admin, reader)

Posts

id

user_id

title

body

published_at

Comments

id

post_id

user_id

content

created_at

Subscriptions

id

email

confirmed (boolean)

Newsletters

id

title

content

sent_at

6. API Design
   (Optional if you expose any RESTful endpoints for future frontend apps)

7. Security Considerations
   CSRF protection enabled

Strong password policies

Email confirmation for subscriptions

Role-based access control via Pundit

8. Future Enhancements
   Markdown editor for blog posts

Comment moderation

Analytics dashboard for admins

Integration with external newsletter services
