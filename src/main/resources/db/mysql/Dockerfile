FROM mysql:5.7

WORKDIR /petclinic

COPY user.sql .

# Start mysql and create the petclinic database
RUN /etc/init.d/mysql start && mysql -u root < user.sql

EXPOSE 3306
