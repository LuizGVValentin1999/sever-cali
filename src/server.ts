import Fastify from "fastify"; 
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient({
    log: ['query']
})

async function bootstrap() {   
    const fastify = Fastify({  
                    logger:true, 
    })     

    const info = await prisma.batata.findMany({
        where:{
            nome:{
                startsWith: 'R'
            }
        }
    })

    fastify.get('/', function (request, reply) {
                reply.send(info)   
    });         
                              
    await fastify.listen({port : 8080}) }  
bootstrap();