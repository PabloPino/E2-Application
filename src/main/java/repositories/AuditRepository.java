
package repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Audit;

@Repository
public interface AuditRepository extends JpaRepository<Audit, Integer> {

	//Query Dashboard (ACME-ROOKIES)
	@Query("select avg(1.0 * (select count(a.score) from Audit a where a.position.id = p.id)) from Position p")
	Double queryRookiesC1AVG();

	@Query("select max(1.0 * (select count(a.score) from Audit a where a.position.id = p.id)) from Position p")
	Double queryRookiesC1MAX();

	@Query("select min(1.0 * (select count(a.score) from Audit a where a.position.id = p.id)) from Position p")
	Double queryRookiesC1MIN();

	@Query("select stddev(1.0 * (select count(a.score) from Audit a where a.position.id = p.id)) from Position p")
	Double queryRookiesC1STDDEV();

	@Query("select avg(1.0 * (select count(a.score) from Audit a where a.position.company.id = c.id)) from Company c")
	Double queryRookiesC2AVG();

	@Query("select max(1.0 * (select count(a.score) from Audit a where a.position.company.id = c.id)) from Company c")
	Double queryRookiesC2MAX();

	@Query("select min(1.0 * (select count(a.score) from Audit a where a.position.company.id = c.id)) from Company c")
	Double queryRookiesC2MIN();

	@Query("select stddev(1.0 * (select count(a.score) from Audit a where a.position.company.id = c.id)) from Company c")
	Double queryRookiesC2STDDEV();

	@Query("select a.position.company.comercialName from Audit a  group by a.position.company.id order by count(a.score) desc")
	List<String> queryRookiesC3();

	@Query("select avg(p.salary) from Audit a join a.position p group by  p having count(a.score)>(select avg(1.0*(select count(b.score) from Audit b where b.position.id=x.id))from Position x)")
	Double queryRookiesC4();
}