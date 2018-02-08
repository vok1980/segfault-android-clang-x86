

class Handler
{
};


class Boo
{
public:
	Boo& boo(bool (*handler)())
	{
		return *this;
	}

	Boo& foo(bool (Handler::*handler)())
	{
		return *this;
	}

	void (Handler::*a)() = nullptr; // comment to fix
	bool (Handler::*b)() = nullptr; // comment to fix
};

// static const auto boo1 = [](){
// 	auto res = Boo()
// 		// .foo(nullptr)
// 		;
// 		res.foo(nullptr);
// 	return res;
// }();

static const auto boo =
	Boo()
		.boo(nullptr)
		.foo(nullptr) // comment to fix
		;


int main()
{
	return 0;
}
