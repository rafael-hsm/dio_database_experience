## Challenge Description
Replicate the logical database design modeling for the e-commerce scenario. Pay attention to the primary and foreign key definitions, as well as the constraints present in the modeled scenario. Note that within this modeling there will be relationships present in the EER model. Therefore, see how to proceed in these cases. Also, apply model mapping to the proposed refinements in the conceptual modeling module.

As demonstrated during the challenge, perform the creation of the SQL Script to create the database schema. Afterwards, perform data persistence for testing. Also specify more complex queries than those presented during the challenge explanation. Therefore, **create SQL queries with the clauses below:**

1. Simple recoveries with SELECT Statement
2. Filters with WHERE Statement
3. Create expressions to generate derived attributes
4. Set data ordering with ORDER BY
5. Filter conditions for groups - HAVING Statement
6. Create joins between tables to provide a more complex perspective on the data

guidelines
There is no minimum number of queries to be performed;
The aforementioned topics must be present in the queries;
**Elaborate questions that can be answered by consultations;**
Clauses can be present in more than one query;
The project should be added to a Github repository for future project challenge assessment. Add the logical project description to the Readme to provide context about your presented logical schema.

Objective:
[Remembering] Apply the mapping to the scenario:

“Refine the presented model by adding the following points”

1. PJ and PF Client – ​​An account can be PJ or PF, but cannot have both information;
2. Payment – ​​You may have registered more than one payment method;
3. Delivery – Has status and tracking code;

Some of the questions you can ask to support SQL queries:

1. How many orders were placed by each customer?
2. Are any vendors also a supplier?
3. List of supplier products and inventories;
4. List of supplier names and product names;