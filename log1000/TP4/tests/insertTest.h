#include <string>
#include <list>
#include <cppunit/TestCase.h>
#include <cppunit/TestFixture.h>
#include <cppunit/ui/text/TextTestRunner.h>
#include <cppunit/extensions/HelperMacros.h>
#include <cppunit/extensions/TestFactoryRegistry.h>
#include <cppunit/TestResult.h>
#include <cppunit/TestResultCollector.h>
#include <cppunit/TestRunner.h>
#include <cppunit/BriefTestProgressListener.h>
#include <cppunit/CompilerOutputter.h>
#include <cppunit/XmlOutputter.h>
#include <netinet/in.h>

#include "../HashMap.h"

using namespace CppUnit;
using namespace std;

//-----------------------------------------------------------------------------

class insertTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE(insertTest);
    CPPUNIT_TEST(insertNew);
    CPPUNIT_TEST(replaceValue);
    CPPUNIT_TEST(addNewWithSameKey);
    CPPUNIT_TEST_SUITE_END();
    
public:
    void setUp(void);
    void tearDown(void);
    
protected:
    void insertNew(void);
    void replaceValue(void);
    void addNewWithSameKey(void);
    
private:
    
    HashMap* hashMap;
};

// ------------------------ IMPLEMENTATION ------------------------

void insertTest::insertNew(void)
{
	hashMap->insertNode(1, 123);
    CPPUNIT_ASSERT(1==hashMap->sizeofMap());
}

void insertTest::addNewWithSameKey(void)
{
	hashMap->insertNode(1, 123);
	hashMap->insertNode(21, 222);
    CPPUNIT_ASSERT(2==hashMap->sizeofMap());
}
void insertTest::replaceValue(void)
{
	hashMap->insertNode(1, 123);
	hashMap->insertNode(1, 222);
    CPPUNIT_ASSERT(222 == hashMap->get(1));
}
void insertTest::setUp(void)
{
    hashMap = new HashMap();
}

void insertTest::tearDown(void)
{
    delete hashMap;
}
