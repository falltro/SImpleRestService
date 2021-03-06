package backend.services;


import backend.controllers.BaseRestController;
import backend.exceptions.TradeUnionNotFoundExeption;
import backend.persist.entity.DocPayment;
import backend.persist.entity.PersonEntity;
import backend.persist.entity.TradeUnion;
import backend.persist.models.TradeUnionModel;
import backend.persist.repositories.DocTradeUnionRepo;
import backend.persist.repositories.PersonRepo;
import backend.persist.repositories.TradeUnionRepo;
import backend.validator.tradeunionvalidate.TradeUnionValidator;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class TradeUnionService extends BaseRestController {

//    @Autowired
//    @Qualifier("beforeCreateTradeUnionValidator")
//    private TradeUnionValidator validator;
//
//    @InitBinder
//    protected void initBinder(WebDataBinder binder) {
//        binder.setValidator(validator);
//    }

    @Autowired
    TradeUnionRepo tradeUnionRepo;
    @Autowired
    PersonRepo personRepo;
    @Autowired
    DocTradeUnionRepo docTradeUnionRepo;

    @PersistenceContext
    private EntityManager em;

    public List<DocPayment> getAllDocPayments(int unionId){
        Query q = em.createNativeQuery("SELECT\n" +
                "\tdoc_payment.*\n" +
                "FROM\n" +
                "\tdoc_payment\n" +
                "WHERE\n" +
                "\tdoc_payment.org_id = ?1", "DocPaymentMapping");
        q.setParameter(1,unionId);
        return q.getResultList();
    }

    public List<PersonEntity> getAllActiveMembers(int unionId, Pageable pageable){
//
//        Query q = em.createNativeQuery("SELECT\n" +
//                "\tperson_main.* \n" +
//                "FROM\n" +
//                "\tperson_main\n" +
//                "\tINNER JOIN doc_member ON person_main.\"id\" = doc_member.person_id \n" +
//                "WHERE\n" +
//                "\t( doc_member.completed IS NOT NULL AND doc_member.org_id = ?1 ) \n" +
//                "ORDER BY\n" +
//                "\tdoc_member.created \\pageable\\", "PersonMapping");
//        q.setParameter(1,unionId);
//        return q.getResultList();
       return personRepo.getAllActiveMembers(unionId, pageable);

    }

    public List<PersonEntity> getAllActiveWithoutPageable(int unionId){
//
//        Query q = em.createNativeQuery("SELECT\n" +
//                "\tperson_main.* \n" +
//                "FROM\n" +
//                "\tperson_main\n" +
//                "\tINNER JOIN doc_member ON person_main.\"id\" = doc_member.person_id \n" +
//                "WHERE\n" +
//                "\t( doc_member.completed IS NOT NULL AND doc_member.org_id = ?1 ) \n" +
//                "ORDER BY\n" +
//                "\tdoc_member.created \\pageable\\", "PersonMapping");
//        q.setParameter(1,unionId);
//        return q.getResultList();
        return personRepo.getAllActiveWithoutPageable(unionId);

    }

    public List<TradeUnionModel> getAllTradeUnions(){
        List<TradeUnion> list = tradeUnionRepo.findAll();
        return list.stream().map(TradeUnionModel::toModel).collect(Collectors.toList());
    }

    public List<TradeUnion> getAllNaturalTradeUnions(){
        return tradeUnionRepo.findAll();
    }

    public TradeUnion createTradeUnion(TradeUnionModel model){
        TradeUnion tradeUnion = new TradeUnion();
        tradeUnion.setNameUnion(model.getNameUnion());
        tradeUnion.setAddress(model.getAddress());
        tradeUnion.setCity(model.getCity());
        tradeUnion.setUpdated(Timestamp.valueOf(LocalDateTime.now()));
        return tradeUnionRepo.save(tradeUnion);
    }
    public TradeUnion deleteTradeUnion(int id){
        TradeUnion tradeUnion = new TradeUnion();
        tradeUnionRepo.deleteById(id);
        return tradeUnion;
    }

    public TradeUnion getById(int id){
        return tradeUnionRepo.findById(id).orElseThrow( () -> new TradeUnionNotFoundExeption(id));
    }

    public TradeUnion update(int id, TradeUnion tradeUnion){
        TradeUnion tradeUnion1 = getById(id);
        merge(tradeUnion1, tradeUnion);
        tradeUnion1.setId(id);
        tradeUnion1.setUpdated(Timestamp.valueOf(LocalDateTime.now()));
        return  tradeUnionRepo.save(tradeUnion1);
    }
}
