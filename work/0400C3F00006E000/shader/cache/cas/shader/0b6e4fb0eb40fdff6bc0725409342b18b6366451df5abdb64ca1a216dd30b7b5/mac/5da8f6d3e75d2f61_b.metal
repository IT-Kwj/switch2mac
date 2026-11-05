#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c1 [[id(0)]];
    device _23* cp_s0 [[id(1)]];
    device _23* cp_s1 [[id(2)]];
    device _23* cp_s2 [[id(3)]];
    device _23* cp_s3 [[id(4)]];
    device _23* cp_s4 [[id(5)]];
    device _23* cp_s5 [[id(6)]];
    device _23* cp_s6 [[id(7)]];
    device _23* cp_s7 [[id(8)]];
    device _23* cp_s8 [[id(9)]];
    device _23* cp_s9 [[id(10)]];
    device _23* cp_s10 [[id(11)]];
    device _23* cp_s11 [[id(12)]];
    device _23* cp_s12 [[id(13)]];
    device _23* cp_s13 [[id(14)]];
    texture2d<float> cp_t_tcb_2A [[id(15)]];
    sampler cp_t_tcb_2ASmplr [[id(16)]];
    texture2d<float> cp_t_tcb_2C [[id(17)]];
    sampler cp_t_tcb_2CSmplr [[id(18)]];
    sampler cp_t_tcb_2ASmplr_w [[id(19)]];
    sampler cp_t_tcb_2CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

static inline __attribute__((always_inline))
void _71(thread const int& _13964, thread const int& _13965, thread const int& _13966, thread const int& _13967, thread int& _13968, thread int& _13969, thread int& _13970, thread int& _13971, thread int& _13972, thread int& _13973)
{
    float _13976 = as_type<float>(_13966) + 0.0;
    bool _13978 = _13976 != 0.0;
    bool _13980 = isnan(_13976);
    bool _13982 = _13978 || _13980;
    bool _13984 = isnan(0.0);
    bool _13986 = _13982 || _13984;
    int _13988 = _13964;
    int _13990 = _13965;
    int _13992 = _13966;
    int _13994 = _13986 ? (-1) : 0;
    if (!_13986)
    {
        float _13996 = as_type<float>(_13966) * 1.0;
        _13988 = as_type<int>(_13996);
    }
    int _13998 = _13988;
    bool _14000 = !_13986;
    int _14002 = _13998;
    int _14004 = _13998;
    if (!_14000)
    {
        float _14006 = as_type<float>(_13966) + 0.0;
        bool _14008 = _14006 >= 0.0;
        bool _14010 = isnan(_14006);
        bool _14012 = _14008 || _14010;
        bool _14014 = isnan(0.0);
        bool _14016 = _14012 || _14014;
        _13994 = _14016 ? (-1) : 0;
        if (!_14016)
        {
            _14002 = 2147483647;
        }
        int _14018 = _14002;
        bool _14020 = !_14016;
        int _14022 = _14018;
        _14004 = _14018;
        if (!_14020)
        {
            float _14024 = as_type<float>(_13966) + 0.0;
            bool _14026 = _14024 > as_type<float>(0x7f800000u /* inf */);
            bool _14028 = isnan(_14024);
            bool _14030 = _14026 || _14028;
            bool _14032 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _14034 = _14030 || _14032;
            _13994 = _14034 ? (-1) : 0;
            if (_14034)
            {
                float _14036 = as_type<float>(_13966) + 1.0;
                _14022 = as_type<int>(_14036);
            }
            int _14038 = _14022;
            int _14040 = _14038;
            _14004 = _14038;
            if (!_14034)
            {
                float _14042 = 0.0 + as_type<float>(_13966);
                bool _14044 = _14042 != as_type<float>(0x7f800000u /* inf */);
                bool _14046 = isnan(_14042);
                bool _14048 = _14044 || _14046;
                bool _14050 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _14052 = _14048 || _14050;
                _13994 = _14052 ? (-1) : 0;
                if (!_14052)
                {
                    _14040 = _13966;
                }
                int _14054 = _14040;
                bool _14056 = !_14052;
                _14004 = _14054;
                if (!_14056)
                {
                    float _14058 = as_type<float>(_13966) * 18446744073709551616.0;
                    float _14060 = rsqrt(_14058);
                    float _14062 = _14058 * _14060;
                    float _14064 = _14060 * 0.5;
                    float _14066 = -_14062;
                    float _14068 = 0.0 + _14066;
                    float _14070 = fma(_14064, _14068, 0.5);
                    float _14072 = fma(_14062, _14070, _14062);
                    float _14074 = -_14072;
                    float _14076 = 0.0 + _14074;
                    float _14078 = fma(_14072, _14076, _14058);
                    float _14080 = fma(_14064, _14078, _14072);
                    float _14082 = _14080 * 2.3283064365386962890625e-10;
                    _14004 = as_type<int>(_14082);
                    _13990 = as_type<int>(_14072);
                    _13992 = as_type<int>(_14068);
                }
            }
        }
    }
    int _14084 = _14004;
    int _14086 = _13990;
    int _14088 = _13992;
    int _14090 = _13994;
    _13968 = _13967;
    _13969 = 0;
    _13970 = _14084;
    _13971 = _14086;
    _13972 = _14088;
    _13973 = _14090;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _5414 = false;
    bool _4942 = false;
    bool _4046 = false;
    bool _3790 = false;
    bool _2988 = false;
    bool _2346 = false;
    bool _2390 = false;
    bool _2174 = false;
    bool _866 = false;
    float _75 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _77 = as_type<float>(gl_LocalInvocationID.x);
    float _79 = as_type<float>(gl_WorkGroupID.x);
    int _81 = as_type<int>(_79) << 5;
    int _83 = _81 + as_type<int>(_77);
    float _85 = trunc(_75);
    int _87 = int(_85);
    bool _91 = _83 >= _87;
    int _93 = 0;
    if (_91)
    {
        _93 = 0;
    }
    int _95 = _93;
    int _97 = _95;
    int _99 = _95;
    if (!_91)
    {
        int _101 = _83 << 4;
        int _103 = _101 + 12;
        uint _106 = uint(int(uint(_103) >> uint(2)));
        float _108 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_106)]);
        float _110 = trunc(_108);
        int _112 = int(_110);
        bool _114 = _112 >= 1;
        int _116 = _114 ? (-1) : 0;
        if (!_114)
        {
            _97 = 0;
        }
        int _118 = _97;
        bool _120 = !_114;
        _99 = _118;
        if (!_120)
        {
            float _122 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _124 = uint(int(uint(_103) >> uint(2)));
            float _126 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_124)]);
            float _128 = float(_112);
            float _130 = -_126;
            float _132 = _122 + _130;
            bool _134 = _132 > _128;
            int _136 = as_type<int>(_122);
            if (!_134)
            {
                bool _138 = _122 >= _126;
                bool _140 = isnan(_122);
                bool _142 = _138 || _140;
                bool _144 = isnan(_126);
                bool _146 = _142 || _144;
                _116 = _146 ? (-1) : 0;
            }
            int _148 = _116;
            if (_134)
            {
                _136 = 0;
            }
            int _150 = _136;
            _99 = _150;
            if (!_134)
            {
                int _152 = ~_148;
                int _154 = (_152 != 0) ? 0 : 1;
                _99 = _154;
            }
        }
    }
    int _156 = _99;
    int _158 = _156 & 1;
    bool _160 = _158 != 0;
    if (!_160)
    {
        return;
    }
    float _162 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _164 = _83 << 4;
    uint _166 = uint(int(uint(_164) >> uint(2)));
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_166)]);
    int _170 = _164 + 4;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    float _174 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_172)]);
    int _176 = _164 + 8;
    uint _178 = uint(int(uint(_176) >> uint(2)));
    float _180 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_178)]);
    int _182 = as_type<int>(_162) & 512;
    bool _184 = _182 != 0;
    int _186 = _164 + 12;
    uint _188 = uint(int(uint(_164) >> uint(2)));
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_188)]);
    int _192 = _164 + 4;
    uint _194 = uint(int(uint(_192) >> uint(2)));
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_194)]);
    int _198 = _164 + 8;
    uint _200 = uint(int(uint(_198) >> uint(2)));
    float _202 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_200)]);
    uint _204 = uint(int(uint(_164) >> uint(2)));
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_204)]);
    int _208 = _164 + 4;
    uint _210 = uint(int(uint(_208) >> uint(2)));
    float _212 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_210)]);
    int _214 = _164 + 8;
    uint _216 = uint(int(uint(_214) >> uint(2)));
    float _218 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_216)]);
    float _220 = 0.0;
    float _222 = 0.0;
    float _224 = 0.0;
    int _226 = _184 ? (-1) : 0;
    if (_184)
    {
        float _228 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _230 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _232 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _220 = _228;
        _222 = _230;
        _224 = _232;
    }
    float _234 = _220;
    float _236 = _222;
    float _238 = _224;
    float _240 = 0.0;
    float _242 = 0.0;
    float _244 = 0.0;
    if (_184)
    {
        float _246 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _248 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _250 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _240 = _246;
        _242 = _248;
        _244 = _250;
    }
    float _252 = _240;
    float _254 = _242;
    float _256 = _244;
    float _258 = 0.0;
    float _260 = 0.0;
    float _262 = 0.0;
    if (_184)
    {
        float _264 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _266 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _268 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _258 = _264;
        _260 = _266;
        _262 = _268;
    }
    float _270 = _258;
    float _272 = _260;
    float _274 = _262;
    uint _276 = uint(int(uint(_164) >> uint(2)));
    float _278 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_276)]);
    uint _280 = uint(int(uint(_186) >> uint(2)));
    float _282 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_280)]);
    uint _284 = uint(int(uint(_186) >> uint(2)));
    float _286 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_284)]);
    float _288 = _236;
    float _290 = _252;
    float _292 = _254;
    float _294 = _256;
    float _296 = _234;
    float _298 = _236;
    float _300 = _238;
    float _302 = _272;
    float _304 = _270;
    float _306 = _274;
    int _308 = as_type<int>(_206);
    int _310 = as_type<int>(_212);
    int _312 = as_type<int>(_218);
    int _314 = as_type<int>(_206);
    int _316 = as_type<int>(_212);
    int _318 = as_type<int>(_218);
    int _320 = as_type<int>(_206);
    int _322 = as_type<int>(_212);
    int _324 = as_type<int>(_218);
    if (!_184)
    {
        int _326 = _164 + 4;
        int _328 = _164 + 8;
        uint _330 = uint(int(uint(_164) >> uint(2)));
        float _332 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_330)]);
        uint _334 = uint(int(uint(_326) >> uint(2)));
        float _336 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_334)]);
        uint _338 = uint(int(uint(_328) >> uint(2)));
        float _340 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_338)]);
        uint _342 = uint(int(uint(_164) >> uint(2)));
        float _344 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_342)]);
        uint _346 = uint(int(uint(_326) >> uint(2)));
        float _348 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_346)]);
        uint _350 = uint(int(uint(_328) >> uint(2)));
        float _352 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_350)]);
        uint _354 = uint(int(uint(_164) >> uint(2)));
        float _356 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_354)]);
        uint _358 = uint(int(uint(_326) >> uint(2)));
        float _360 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_358)]);
        uint _362 = uint(int(uint(_328) >> uint(2)));
        float _364 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_362)]);
        float _366 = _332 * _332;
        float _368 = _336 * _336;
        float _370 = _340 * _340;
        float _372 = fma(_344, _344, _366);
        float _374 = fma(_348, _348, _368);
        float _376 = fma(_352, _352, _370);
        float _378 = fma(_356, _356, _372);
        float _380 = fma(_360, _360, _374);
        float _382 = sqrt(_378);
        float _384 = fma(_364, _364, _376);
        float _386 = sqrt(_380);
        float _388 = sqrt(_384);
        bool _390 = _382 > 0.0;
        bool _392 = _386 > 0.0;
        bool _394 = _388 > 0.0;
        float _396 = _238;
        float _398 = _382;
        float _400 = _376;
        float _402 = _388;
        float _404 = _368;
        float _406 = _378;
        float _408 = _380;
        float _410 = _348;
        if (_390)
        {
            float _412 = rsqrt(_378);
            _396 = _412;
        }
        float _414 = _396;
        float _416 = 0.0;
        if (_392)
        {
            float _418 = rsqrt(_380);
            _416 = _418;
        }
        float _420 = _416;
        float _422 = 0.0;
        if (_394)
        {
            float _424 = rsqrt(_384);
            _422 = _424;
        }
        float _426 = _422;
        if (!_390)
        {
            _398 = 0.0;
        }
        float _428 = _398;
        float _430 = _428;
        float _432 = _414;
        if (_390)
        {
            float _434 = _332 * _414;
            _430 = _434;
        }
        float _436 = _430;
        _290 = _436;
        if (!_390)
        {
            _400 = 0.0;
        }
        float _438 = _400;
        float _440 = _438;
        if (_390)
        {
            float _442 = _344 * _414;
            _440 = _442;
        }
        float _444 = _440;
        _296 = _444;
        if (!_390)
        {
            _402 = 0.0;
        }
        float _446 = _402;
        float _448 = _446;
        if (_390)
        {
            float _450 = _356 * _414;
            _448 = _450;
        }
        float _452 = _448;
        _304 = _452;
        if (!_392)
        {
            _288 = 0.0;
        }
        float _454 = _288;
        float _456 = _454;
        if (_392)
        {
            float _458 = _348 * _420;
            _456 = _458;
        }
        float _460 = _456;
        _298 = _460;
        if (!_392)
        {
            _404 = 0.0;
        }
        float _462 = _404;
        float _464 = _462;
        if (_392)
        {
            float _466 = _336 * _420;
            _464 = _466;
        }
        float _468 = _464;
        _292 = _468;
        if (!_392)
        {
            _406 = 0.0;
        }
        float _470 = _406;
        float _472 = _470;
        if (_392)
        {
            float _474 = _360 * _420;
            _472 = _474;
        }
        float _476 = _472;
        _302 = _476;
        if (!_394)
        {
            _408 = 0.0;
        }
        float _478 = _408;
        float _480 = _478;
        if (!_394)
        {
            _432 = 0.0;
        }
        float _482 = _432;
        float _484 = _482;
        if (_394)
        {
            float _486 = _340 * _426;
            _480 = _486;
        }
        float _488 = _480;
        _294 = _488;
        if (!_394)
        {
            _410 = 0.0;
        }
        float _490 = _410;
        _306 = _490;
        if (_394)
        {
            float _492 = _352 * _426;
            _484 = _492;
        }
        float _494 = _484;
        _300 = _494;
        if (_394)
        {
            float _496 = _364 * _426;
            _306 = _496;
        }
    }
    float _498 = _290;
    float _500 = _292;
    float _502 = _294;
    float _504 = _296;
    float _506 = _298;
    float _508 = _300;
    float _510 = _302;
    float _512 = _304;
    float _514 = _306;
    float _516 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _518 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[27]);
    float _520 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[24]);
    float _522 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[25]);
    float _524 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[26]);
    float _526 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[27]);
    float _528 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _530 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _532 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _534 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _536 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _538 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _540 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _542 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _544 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _546 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _548 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _550 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    uint _552 = uint(int(uint(_186) >> uint(2)));
    float _554 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_552)]);
    float _556 = trunc(_518);
    int _558 = int(_556);
    float _560 = _286 * _522;
    float _562 = _286 * _520;
    float _564 = _516 * _560;
    bool _566 = _558 != 1;
    bool _568 = _532 > 0.0;
    float _570 = abs(_528);
    float _572 = log2(_570);
    float _574 = _516 * _562;
    float _576 = _286 * _524;
    float _578 = _498;
    float _580 = _562;
    float _582 = _502;
    float _584 = _500;
    float _586 = _506;
    float _588 = _528;
    float _590 = _564;
    float _592 = _574;
    float _594 = _514;
    float _596 = _544;
    if (!_566)
    {
        float _598 = _564 * _498;
        _578 = _598;
    }
    float _600 = _578;
    if (!_566)
    {
        float _602 = _564 * _500;
        _580 = _602;
    }
    float _604 = _580;
    if (!_566)
    {
        float _606 = _564 * _502;
        _582 = _606;
    }
    float _608 = _582;
    float _610 = _608;
    if (!_566)
    {
        float _612 = fma(_574, _504, _600);
        _584 = _612;
    }
    float _614 = _584;
    float _616 = _600;
    float _618 = _614;
    if (_568)
    {
        float _620 = 1.0 / _532;
        _616 = _620;
    }
    float _622 = _616;
    if (!_566)
    {
        float _624 = fma(_574, _506, _604);
        _586 = _624;
    }
    float _626 = _586;
    float _628 = _516 * _576;
    float _630 = _628;
    if (!_566)
    {
        float _632 = fma(_574, _508, _608);
        _588 = _632;
    }
    float _634 = _588;
    float _636 = _516 * _572;
    if (!_566)
    {
        float _638 = fma(_628, _510, _626);
        _590 = _638;
    }
    float _640 = _590;
    if (!_566)
    {
        float _642 = fma(_628, _512, _614);
        _592 = _642;
    }
    float _644 = _592;
    if (!_566)
    {
        float _646 = fma(_628, _514, _634);
        _630 = _646;
    }
    float _648 = _630;
    bool _650 = _534 > 0.0;
    float _652 = exp2(_636);
    float _654 = _286 * _516;
    float _656 = -_282;
    float _658 = _530 + _656;
    float _660 = _536 * _542;
    float _662 = _544 * _534;
    float _664 = fma(_190, _654, _168);
    float _666 = _658;
    float _668 = _622;
    float _670 = _654;
    int _672 = _650 ? (-1) : 0;
    if (_568)
    {
        float _674 = _658 * _622;
        _666 = _674;
    }
    float _676 = _666;
    float _678 = fma(_196, _654, _174);
    float _680 = _516 * _660;
    float _682 = _644 + _664;
    float _684 = _538 * _542;
    float _686 = _682;
    if (_568)
    {
        float _688 = precise::min(_676, 1.0);
        _594 = _688;
    }
    float _690 = _594;
    if (_650)
    {
        float _692 = -_662;
        float _694 = fma(_278, _692, _544);
        _596 = _694;
    }
    float _696 = _596;
    float _698 = _540 * _542;
    float _700 = _640 + _678;
    float _702 = fma(_202, _654, _180);
    float _704 = fma(_190, _652, _680);
    float _706 = _516 * _684;
    float _708 = _696;
    float _710 = _700;
    if (_568)
    {
        float _712 = _690 * _696;
        _708 = _712;
    }
    float _714 = _708;
    float _716 = _516 * _698;
    float _718 = _516 * _546;
    float _720 = _516 * _548;
    float _722 = _516 * _550;
    float _724 = _648 + _702;
    float _726 = fma(_196, _652, _706);
    float _728 = fma(_202, _652, _716);
    float _730 = _718 * _714;
    float _732 = _720 * _714;
    float _734 = _722 * _714;
    bool _736 = !_184;
    float _738 = _732;
    float _740 = _730;
    float _742 = _734;
    float _744 = _724;
    if (!_736)
    {
        float _746 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _748 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _750 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _752 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _754 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _756 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _758 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _760 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _762 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _764 = _750 * _752;
        float _766 = _750 * _754;
        float _768 = _748 * _752;
        float _770 = -_764;
        float _772 = fma(_746, _756, _770);
        float _774 = -_766;
        float _776 = fma(_748, _756, _774);
        float _778 = -_768;
        float _780 = fma(_746, _754, _778);
        float _782 = _760 * _746;
        float _784 = _760 * _772;
        float _786 = _762 * _748;
        float _788 = _758 * _754;
        float _790 = -_782;
        float _792 = fma(_758, _748, _790);
        float _794 = -_784;
        float _796 = fma(_758, _776, _794);
        float _798 = _760 * _756;
        float _800 = _762 * _752;
        float _802 = _758 * _750;
        float _804 = fma(_762, _780, _796);
        float _806 = -_798;
        float _808 = fma(_762, _754, _806);
        float _810 = -_800;
        float _812 = fma(_758, _756, _810);
        float _814 = -_788;
        float _816 = fma(_760, _752, _814);
        float _818 = 1.0 / _804;
        float _820 = -_802;
        float _822 = fma(_762, _746, _820);
        float _824 = -_746;
        float _826 = fma(_824, _756, _764);
        float _828 = -_786;
        float _830 = fma(_760, _750, _828);
        float _832 = _808 * _818;
        float _834 = _812 * _818;
        float _836 = _816 * _818;
        float _838 = _826 * _818;
        float _840 = _732 * _832;
        float _842 = _732 * _834;
        float _844 = _730 * _818;
        float _846 = _732 * _836;
        float _848 = _830 * _818;
        float _850 = _822 * _818;
        float _852 = fma(_776, _844, _840);
        float _854 = fma(_730, _838, _842);
        float _856 = _792 * _818;
        float _858 = fma(_780, _844, _846);
        float _860 = fma(_734, _848, _852);
        float _862 = fma(_734, _850, _854);
        float _864 = fma(_734, _856, _858);
        _668 = _758;
        _618 = _760;
        _610 = _762;
        _670 = _850;
        _738 = _862;
        _740 = _860;
        _742 = _864;
        _866 = true;
    }
    else
    {
        int _868 = as_type<int>(_162) & 1024;
        bool _870 = _868 != 0;
        _672 = _870 ? (-1) : 0;
        if (_870)
        {
            _226 = -1;
        }
        int _872 = _226;
        int _874 = _872;
        if (!_870)
        {
            int _876 = as_type<int>(_162) & 2048;
            bool _878 = _876 != 0;
            _874 = _878 ? (-1) : 0;
        }
        int _880 = _874;
        int _882 = ~_880;
        if (!(_882 != 0))
        {
            uint _884 = uint(int(uint(_164) >> uint(2)));
            float _886 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_884)]);
            int _888 = _164 + 4;
            uint _890 = uint(int(uint(_888) >> uint(2)));
            float _892 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_890)]);
            int _894 = _164 + 8;
            uint _896 = uint(int(uint(_894) >> uint(2)));
            float _898 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_896)]);
            uint _900 = uint(int(uint(_164) >> uint(2)));
            float _902 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_900)]);
            int _904 = _164 + 4;
            uint _906 = uint(int(uint(_904) >> uint(2)));
            float _908 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_906)]);
            int _910 = _164 + 8;
            uint _912 = uint(int(uint(_910) >> uint(2)));
            float _914 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_912)]);
            uint _916 = uint(int(uint(_164) >> uint(2)));
            float _918 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_916)]);
            int _920 = _164 + 4;
            uint _922 = uint(int(uint(_920) >> uint(2)));
            float _924 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_922)]);
            int _926 = _164 + 8;
            uint _928 = uint(int(uint(_926) >> uint(2)));
            float _930 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_928)]);
            float _932 = _898 * _902;
            float _934 = _898 * _908;
            float _936 = _892 * _902;
            float _938 = -_932;
            float _940 = fma(_886, _914, _938);
            float _942 = -_934;
            float _944 = fma(_892, _914, _942);
            float _946 = -_936;
            float _948 = fma(_886, _908, _946);
            float _950 = _924 * _886;
            float _952 = _924 * _940;
            float _954 = _930 * _892;
            float _956 = _918 * _908;
            float _958 = -_950;
            float _960 = fma(_918, _892, _958);
            float _962 = -_952;
            float _964 = fma(_918, _944, _962);
            float _966 = _924 * _914;
            float _968 = _930 * _902;
            float _970 = _918 * _898;
            float _972 = fma(_930, _948, _964);
            float _974 = -_966;
            float _976 = fma(_930, _908, _974);
            float _978 = -_968;
            float _980 = fma(_918, _914, _978);
            float _982 = -_956;
            float _984 = fma(_924, _902, _982);
            float _986 = 1.0 / _972;
            float _988 = -_970;
            float _990 = fma(_930, _886, _988);
            float _992 = -_886;
            float _994 = fma(_992, _914, _932);
            float _996 = -_954;
            float _998 = fma(_924, _898, _996);
            float _1000 = _976 * _986;
            float _1002 = _980 * _986;
            float _1004 = _984 * _986;
            float _1006 = _994 * _986;
            float _1008 = _732 * _1000;
            float _1010 = _732 * _1002;
            float _1012 = _730 * _986;
            float _1014 = _732 * _1004;
            float _1016 = _998 * _986;
            float _1018 = _990 * _986;
            float _1020 = fma(_944, _1012, _1008);
            float _1022 = fma(_730, _1006, _1010);
            float _1024 = _960 * _986;
            float _1026 = fma(_948, _1012, _1014);
            float _1028 = fma(_734, _1016, _1020);
            float _1030 = fma(_734, _1018, _1022);
            float _1032 = fma(_734, _1024, _1026);
            _668 = _918;
            _618 = _924;
            _610 = _930;
            _670 = _1018;
            _738 = _1030;
            _740 = _1028;
            _742 = _1032;
        }
    }
    _866 = false;
    float _1034 = _668;
    float _1036 = _618;
    float _1038 = _610;
    float _1040 = _670;
    float _1042 = _738;
    float _1044 = _740;
    float _1046 = _742;
    int _1048 = _672;
    uint _1050 = uint(int(uint(_186) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1050)] = as_type<uint>(_554);
    int _1052 = _83 << 5;
    float _1054 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    uint _1056 = uint(int(uint(_164) >> uint(2)));
    float _1058 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1056)]);
    int _1060 = _164 + 4;
    uint _1062 = uint(int(uint(_1060) >> uint(2)));
    float _1064 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1062)]);
    int _1066 = _164 + 8;
    uint _1068 = uint(int(uint(_1066) >> uint(2)));
    float _1070 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1068)]);
    float _1072 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[71]);
    float _1074 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[82]);
    uint _1076 = uint(int(uint(_1052) >> uint(2)));
    float _1078 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1076)]);
    int _1080 = _1052 + 4;
    uint _1082 = uint(int(uint(_1080) >> uint(2)));
    float _1084 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1082)]);
    int _1086 = _1052 + 8;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    float _1090 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1088)]);
    int _1092 = _1052 + 12;
    uint _1094 = uint(int(uint(_1092) >> uint(2)));
    float _1096 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1094)]);
    uint _1098 = uint(int(uint(_164) >> uint(2)));
    float _1100 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1098)]);
    int _1102 = _164 + 4;
    uint _1104 = uint(int(uint(_1102) >> uint(2)));
    float _1106 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1104)]);
    int _1108 = _164 + 8;
    uint _1110 = uint(int(uint(_1108) >> uint(2)));
    float _1112 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1110)]);
    float _1114 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[79]);
    float _1116 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[80]);
    int _1118 = as_type<int>(_1054) & 512;
    bool _1120 = _1118 != 0;
    float _1122 = _1034;
    float _1124 = _1036;
    float _1126 = _1038;
    float _1128 = _1040;
    int _1130 = _1048;
    int _1132 = as_type<int>(_1054);
    if (_1120)
    {
        float _1134 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1136 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1138 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1140 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1122 = _1134;
        _1124 = _1136;
        _1126 = _1138;
        _1128 = _1140;
    }
    float _1142 = _1122;
    float _1144 = _1124;
    float _1146 = _1126;
    float _1148 = _1128;
    float _1150 = _604;
    float _1152 = _522;
    float _1154 = _576;
    float _1156 = _526;
    if (_1120)
    {
        float _1158 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1160 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1162 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1164 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1150 = _1158;
        _1152 = _1160;
        _1154 = _1162;
        _1156 = _1164;
    }
    float _1166 = _1150;
    float _1168 = _1152;
    float _1170 = _1154;
    float _1172 = _1156;
    float _1174 = _662;
    float _1176 = 0.0;
    float _1178 = 0.0;
    int _1180 = 0;
    if (_1120)
    {
        float _1182 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1184 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1186 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1188 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1174 = _1182;
        _1176 = _1184;
        _1178 = _1186;
        _1180 = as_type<int>(_1188);
    }
    float _1190 = _1174;
    float _1192 = _1176;
    float _1194 = _1178;
    int _1196 = _1180;
    float _1198 = -_1072;
    float _1200 = _1064 + _1198;
    float _1202 = precise::max(0.0, _1074);
    int _1204 = _1052 + 16;
    int _1206 = as_type<int>(_1054) & 1024;
    bool _1208 = _1206 != 0;
    bool _1210 = _1202 != 0.0;
    bool _1212 = isnan(_1202);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan(0.0);
    bool _1218 = _1214 || _1216;
    uint _1220 = uint(int(uint(_164) >> uint(2)));
    float _1222 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_1220)]);
    int _1224 = _164 + 4;
    uint _1226 = uint(int(uint(_1224) >> uint(2)));
    float _1228 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_1226)]);
    int _1230 = _164 + 8;
    uint _1232 = uint(int(uint(_1230) >> uint(2)));
    float _1234 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_1232)]);
    int _1236 = _164 + 12;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    float _1240 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_1238)]);
    uint _1242 = uint(int(uint(_1204) >> uint(2)));
    float _1244 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1242)]);
    int _1246 = _1204 + 4;
    uint _1248 = uint(int(uint(_1246) >> uint(2)));
    float _1250 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1248)]);
    int _1252 = _1204 + 8;
    uint _1254 = uint(int(uint(_1252) >> uint(2)));
    float _1256 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1254)]);
    int _1258 = _1204 + 12;
    uint _1260 = uint(int(uint(_1258) >> uint(2)));
    float _1262 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1260)]);
    float _1264 = 0.0;
    float _1266 = _1078;
    float _1268 = _1084;
    float _1270 = _1096;
    if (!_1120)
    {
        _1264 = 0.0;
    }
    float _1272 = _1264;
    float _1274 = 0.0;
    float _1276 = _1272;
    if (!_1120)
    {
        _1274 = 0.0;
    }
    float _1278 = _1274;
    int _1280 = as_type<int>(_1054) & 2048;
    bool _1282 = _1280 != 0;
    float _1284 = _1278;
    if (!_1218)
    {
        _1130 = 0;
    }
    int _1286 = _1130;
    int _1288 = _1286;
    if (!_1218)
    {
        _1132 = as_type<int>(_1112);
    }
    int _1290 = _1132;
    float _1292 = _1144;
    float _1294 = _1168;
    float _1296 = _1146;
    float _1298 = _1192;
    float _1300 = _1170;
    float _1302 = _1142;
    float _1304 = _1194;
    int _1306 = _1196;
    float _1308 = _1148;
    int _1310 = _1290;
    if (_1120)
    {
        float _1312 = _1200 * _1144;
        _1292 = _1312;
    }
    float _1314 = _1292;
    float _1316 = _1314;
    if (_1120)
    {
        float _1318 = fma(_1058, _1142, _1314);
        _1316 = _1318;
    }
    float _1320 = _1316;
    if (_1120)
    {
        float _1322 = _1200 * _1168;
        _1294 = _1322;
    }
    float _1324 = _1294;
    float _1326 = _1324;
    if (_1120)
    {
        float _1328 = fma(_1070, _1146, _1320);
        _1296 = _1328;
    }
    float _1330 = _1296;
    float _1332 = _1330;
    if (_1120)
    {
        float _1334 = _1200 * _1192;
        _1298 = _1334;
    }
    float _1336 = _1298;
    float _1338 = _1336;
    if (_1120)
    {
        float _1340 = fma(_1058, _1166, _1324);
        _1326 = _1340;
    }
    float _1342 = _1326;
    float _1344 = _1078 + _1084;
    int _1346 = as_type<int>(_1342);
    float _1348 = _1344;
    if (_1120)
    {
        float _1350 = fma(_1058, _1190, _1336);
        _1338 = _1350;
    }
    float _1352 = _1338;
    int _1354 = as_type<int>(_1352);
    if (_1120)
    {
        float _1356 = fma(_1070, _1170, _1342);
        _1300 = _1356;
    }
    float _1358 = _1300;
    float _1360 = _1090 + _1344;
    int _1362 = as_type<int>(_1360);
    if (!_1120)
    {
        _1302 = 0.0;
    }
    float _1364 = _1302;
    float _1366 = _1364;
    if (_1120)
    {
        float _1368 = fma(_1070, _1194, _1352);
        _1304 = _1368;
    }
    float _1370 = _1304;
    if (_1120)
    {
        float _1372 = _1172 + _1358;
        _1366 = _1372;
    }
    float _1374 = _1366;
    float _1376 = -_1096;
    bool _1378 = _1360 != _1376;
    bool _1380 = isnan(_1360);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan(_1376);
    bool _1386 = _1382 || _1384;
    float _1388 = _1374;
    bool _1390 = _1386;
    if (_1120)
    {
        float _1392 = as_type<float>(_1196) + _1370;
        _1276 = _1392;
    }
    float _1394 = _1276;
    float _1396 = _1394;
    if (_1120)
    {
        float _1398 = _1148 + _1330;
        _1284 = _1398;
    }
    float _1400 = _1284;
    float _1402 = _1400;
    if (!_1218)
    {
        _1346 = as_type<int>(_1100);
    }
    int _1404 = _1346;
    int _1406 = _1386 ? 0 : 1;
    int _1408 = _1406;
    int _1410 = _1406;
    int _1412 = _1404;
    if (!_1218)
    {
        _1362 = as_type<int>(_1106);
    }
    int _1414 = _1362;
    int _1416 = _1414;
    if (!_1208)
    {
        _1306 = as_type<int>(_1374);
    }
    int _1418 = _1306;
    bool _1420 = !_1208;
    int _1422 = _1418;
    float _1424 = 0.0;
    float _1426 = 0.0;
    float _1428 = 0.0;
    float _1430 = 0.0;
    float _1432 = _1244;
    float _1434 = _1250;
    float _1436 = _1256;
    float _1438 = _1262;
    if (!_1420)
    {
        float _1440 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1442 = uint(int(uint(_164) >> uint(2)));
        float _1444 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1442)]);
        int _1446 = _164 + 4;
        uint _1448 = uint(int(uint(_1446) >> uint(2)));
        float _1450 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1448)]);
        int _1452 = _164 + 8;
        uint _1454 = uint(int(uint(_1452) >> uint(2)));
        float _1456 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1454)]);
        int _1458 = _164 + 12;
        uint _1460 = uint(int(uint(_1458) >> uint(2)));
        float _1462 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1460)]);
        uint _1464 = uint(int(uint(_164) >> uint(2)));
        float _1466 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1464)]);
        int _1468 = _164 + 4;
        uint _1470 = uint(int(uint(_1468) >> uint(2)));
        float _1472 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1470)]);
        int _1474 = _164 + 8;
        uint _1476 = uint(int(uint(_1474) >> uint(2)));
        float _1478 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1476)]);
        uint _1480 = uint(int(uint(_164) >> uint(2)));
        float _1482 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1480)]);
        int _1484 = _164 + 4;
        uint _1486 = uint(int(uint(_1484) >> uint(2)));
        float _1488 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1486)]);
        int _1490 = _164 + 8;
        uint _1492 = uint(int(uint(_1490) >> uint(2)));
        float _1494 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1492)]);
        int _1496 = _164 + 12;
        uint _1498 = uint(int(uint(_1496) >> uint(2)));
        float _1500 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1498)]);
        float _1502 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1504 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1506 = _1200 * _1450;
        float _1508 = _1200 * _1472;
        float _1510 = _1200 * _1488;
        float _1512 = fma(_1058, _1444, _1506);
        float _1514 = fma(_1058, _1466, _1508);
        float _1516 = fma(_1058, _1482, _1510);
        float _1518 = fma(_1070, _1456, _1512);
        float _1520 = fma(_1070, _1478, _1514);
        float _1522 = fma(_1070, _1494, _1516);
        float _1524 = _1440 + _1518;
        float _1526 = _1502 + _1520;
        float _1528 = _1504 + _1522;
        _1388 = _1444;
        _1348 = _1512;
        _1332 = _1518;
        _1308 = _1462;
        _1354 = as_type<int>(_1520);
        _1422 = as_type<int>(_1526);
        _1424 = _1482;
        _1426 = _1516;
        _1428 = _1522;
        _1430 = _1500;
        _1402 = _1524;
        _1396 = _1528;
    }
    float _1530 = _1388;
    float _1532 = _1348;
    float _1534 = _1332;
    float _1536 = _1308;
    int _1538 = _1354;
    int _1540 = _1422;
    float _1542 = _1424;
    float _1544 = _1426;
    float _1546 = _1428;
    float _1548 = _1430;
    float _1550 = _1402;
    float _1552 = _1396;
    bool _1554 = !_1282;
    float _1556 = _1530;
    float _1558 = _1534;
    float _1560 = _1532;
    float _1562 = _1550;
    float _1564 = _1552;
    int _1566 = _1540;
    float _1568 = _1536;
    float _1570 = _1548;
    float _1572 = _1544;
    float _1574 = _1546;
    int _1576 = _1538;
    float _1578 = _1542;
    if (!_1554)
    {
        uint _1580 = uint(int(uint(_164) >> uint(2)));
        float _1582 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1580)]);
        int _1584 = _164 + 4;
        uint _1586 = uint(int(uint(_1584) >> uint(2)));
        float _1588 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1586)]);
        int _1590 = _164 + 8;
        uint _1592 = uint(int(uint(_1590) >> uint(2)));
        float _1594 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1592)]);
        int _1596 = _164 + 12;
        uint _1598 = uint(int(uint(_1596) >> uint(2)));
        float _1600 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1598)]);
        uint _1602 = uint(int(uint(_164) >> uint(2)));
        float _1604 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1602)]);
        int _1606 = _164 + 4;
        uint _1608 = uint(int(uint(_1606) >> uint(2)));
        float _1610 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1608)]);
        int _1612 = _164 + 8;
        uint _1614 = uint(int(uint(_1612) >> uint(2)));
        float _1616 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1614)]);
        int _1618 = _164 + 12;
        uint _1620 = uint(int(uint(_1618) >> uint(2)));
        float _1622 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1620)]);
        uint _1624 = uint(int(uint(_164) >> uint(2)));
        float _1626 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1624)]);
        int _1628 = _164 + 4;
        uint _1630 = uint(int(uint(_1628) >> uint(2)));
        float _1632 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1630)]);
        int _1634 = _164 + 8;
        uint _1636 = uint(int(uint(_1634) >> uint(2)));
        float _1638 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1636)]);
        int _1640 = _164 + 12;
        uint _1642 = uint(int(uint(_1640) >> uint(2)));
        float _1644 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1642)]);
        float _1646 = _1200 * _1588;
        float _1648 = _1200 * _1610;
        float _1650 = _1200 * _1632;
        float _1652 = fma(_1058, _1582, _1646);
        float _1654 = fma(_1058, _1604, _1648);
        float _1656 = fma(_1058, _1626, _1650);
        float _1658 = fma(_1070, _1594, _1652);
        float _1660 = fma(_1070, _1616, _1654);
        float _1662 = fma(_1070, _1638, _1656);
        float _1664 = _1658 + _1600;
        float _1666 = _1660 + _1622;
        float _1668 = _1662 + _1644;
        _1556 = _1582;
        _1558 = _1658;
        _1560 = _1652;
        _1562 = _1664;
        _1564 = _1668;
        _1566 = as_type<int>(_1666);
        _1568 = _1600;
        _1570 = _1644;
        _1572 = _1656;
        _1574 = _1662;
        _1576 = as_type<int>(_1654);
        _1578 = _1626;
    }
    float _1670 = _1556;
    float _1672 = _1558;
    float _1674 = _1560;
    float _1676 = _1562;
    float _1678 = _1564;
    int _1680 = _1566;
    float _1682 = _1568;
    float _1684 = _1570;
    float _1686 = _1572;
    float _1688 = _1574;
    int _1690 = _1576;
    float _1692 = _1578;
    bool _1694 = !_1218;
    float _1696 = _1676;
    float _1698 = _1678;
    float _1700 = _1676;
    float _1702 = _1678;
    float _1704 = _1674;
    float _1706 = _1682;
    float _1708 = _1670;
    float _1710 = _1672;
    float _1712 = _1688;
    float _1714 = _1692;
    float _1716 = _1686;
    float _1718 = _1684;
    int _1720 = _1680;
    int _1722 = _1690;
    if (!_1694)
    {
        uint _1724 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
        float _1726 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1724)]);
        int _1728 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 16;
        uint _1730 = uint(int(uint(_1728) >> uint(2)));
        float _1732 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1730)]);
        int _1734 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 8;
        uint _1736 = uint(int(uint(_1734) >> uint(2)));
        float _1738 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1736)]);
        int _1740 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 24;
        uint _1742 = uint(int(uint(_1740) >> uint(2)));
        float _1744 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1742)]);
        float _1746 = _1202 * 0.5;
        float _1748 = 1.0 / _1202;
        float _1750 = -_1732;
        float _1752 = fma(_1746, _1750, _1726);
        float _1754 = -_1746;
        float _1756 = _1754 + _1752;
        float _1758 = -_1744;
        float _1760 = fma(_1746, _1758, _1738);
        float _1762 = -_1756;
        float _1764 = _1762 + _1676;
        float _1766 = -_1746;
        float _1768 = _1766 + _1760;
        float _1770 = _1764 * _1748;
        float _1772 = -_1768;
        float _1774 = _1772 + _1678;
        float _1776 = floor(_1770);
        float _1778 = _1774 * _1748;
        float _1780 = floor(_1778);
        float _1782 = -_1776;
        float _1784 = fma(_1202, _1782, _1764);
        bool _1786 = _1784 != _1764;
        bool _1788 = isnan(_1784);
        bool _1790 = _1786 || _1788;
        bool _1792 = isnan(_1764);
        bool _1794 = _1790 || _1792;
        float _1796 = -_1780;
        float _1798 = fma(_1202, _1796, _1774);
        bool _1800 = _1798 == _1774;
        bool _1802 = !_1794;
        bool _1804 = _1800 && _1802;
        bool _1806 = !_1804;
        int _1808 = as_type<int>(_1784);
        int _1810 = as_type<int>(_1768);
        int _1812 = as_type<int>(_1778);
        _1704 = _1764;
        _1706 = _1774;
        _1288 = _1806 ? (-1) : 0;
        _1708 = _1756;
        _1710 = _1776;
        _1390 = _1804;
        if (!_1804)
        {
            float _1814 = _1756 + _1784;
            _1696 = _1814;
        }
        float _1816 = _1696;
        _1700 = _1816;
        if (!_1804)
        {
            float _1818 = _1768 + _1798;
            _1698 = _1818;
        }
        float _1820 = _1698;
        _1702 = _1820;
        if (_1804)
        {
            _1808 = as_type<int>(_1100);
        }
        int _1822 = _1808;
        int _1824 = _1822;
        if (_1804)
        {
            _1810 = as_type<int>(_1106);
        }
        int _1826 = _1810;
        int _1828 = _1826;
        if (!_1804)
        {
            _1824 = 0;
            _1828 = 0;
        }
        int _1830 = _1824;
        int _1832 = _1828;
        _1412 = _1830;
        _1416 = _1832;
        if (_1804)
        {
            _1812 = as_type<int>(_1112);
        }
        int _1834 = _1812;
        _1310 = _1834;
        if (!_1804)
        {
            _1408 = 1;
        }
        int _1836 = _1408;
        _1410 = _1836;
        if (!_1804)
        {
            _1310 = 0;
        }
    }
    int _1838 = _1410;
    float _1840 = _1700;
    float _1842 = _1702;
    float _1844 = _1704;
    float _1846 = _1706;
    int _1848 = _1288;
    float _1850 = _1708;
    float _1852 = _1710;
    bool _1854 = _1390;
    int _1856 = _1412;
    int _1858 = _1416;
    int _1860 = _1310;
    int _1862 = _1838 & 1;
    bool _1864 = _1862 != 0;
    float _1866 = _700 + _1042;
    float _1868 = _682 + _1044;
    float _1870 = _724 + _1046;
    float _1872 = -_1072;
    float _1874 = _1866 + _1872;
    bool _1876 = _1854;
    int _1878 = _1838;
    float _1880 = _1850;
    float _1882 = _1844;
    float _1884 = _1852;
    float _1886 = _1846;
    if (!_1864)
    {
        _1712 = _1090;
    }
    float _1888 = _1712;
    float _1890 = as_type<float>(_1680);
    float _1892 = as_type<float>(_1680);
    float _1894 = _1888;
    if (!_1864)
    {
        _1714 = _1078;
    }
    float _1896 = _1714;
    float _1898 = _1896;
    if (!_1864)
    {
        _1716 = _1084;
    }
    float _1900 = _1716;
    float _1902 = _1900;
    if (!_1864)
    {
        _1718 = _1096;
    }
    float _1904 = _1718;
    float _1906 = _1904;
    if (!_1864)
    {
        _710 = _1244;
    }
    float _1908 = _710;
    float _1910 = _1908;
    float _1912 = _1908;
    if (!_1864)
    {
        _1876 = false;
    }
    bool _1914 = _1876;
    bool _1916 = _1914;
    if (!_1864)
    {
        _686 = _1250;
    }
    float _1918 = _686;
    float _1920 = _1918;
    float _1922 = _1918;
    if (!_1864)
    {
        _744 = _1256;
    }
    float _1924 = _744;
    float _1926 = _1924;
    float _1928 = _1924;
    if (!_1864)
    {
        _1878 = as_type<int>(_1262);
    }
    int _1930 = _1878;
    int _1932 = _1930;
    if (!_1864)
    {
        _1720 = as_type<int>(_1058);
    }
    int _1934 = _1720;
    int _1936 = _1934;
    if (!_1864)
    {
        _1722 = as_type<int>(_1200);
    }
    int _1938 = _1722;
    int _1940 = 0;
    int _1942 = _1938;
    if (!_1864)
    {
        _1940 = as_type<int>(_1070);
    }
    int _1944 = _1940;
    bool _1946 = !_1864;
    int _1948 = _1944;
    int _1950 = _1944;
    if (!_1946)
    {
        float _1952 = fma(_1840, 6.2500002968590706586837768554688e-05, 0.5);
        float _1954 = fma(_1842, 6.2500002968590706586837768554688e-05, 0.5);
        float _1956 = fma(_1840, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
        float _1958 = fma(_1842, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
        float _1960 = fma(_1842, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
        float2 _8370 = float2(_1952, _1954);
        float2 _1964 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_8370, float2(0.0), isnan(_8370)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_8370, float2(0.0), isnan(_8370)), level(0.0)).xy;
        float _1966 = _1964.x;
        float _1968 = _1964.y;
        float _1970 = fma(_1840, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
        float _1972 = fma(_1840, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
        float _1974 = fma(_1842, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
        float2 _8391 = float2(_1956, _1958);
        float _1976 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_8391, float2(0.0), isnan(_8391)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_8391, float2(0.0), isnan(_8391)), level(0.0)).x;
        float2 _8399 = float2(_1956, _1960);
        float _1978 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_8399, float2(0.0), isnan(_8399)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_8399, float2(0.0), isnan(_8399)), level(0.0)).x;
        float2 _8407 = float2(_1970, _1958);
        float _1980 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_8407, float2(0.0), isnan(_8407)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_8407, float2(0.0), isnan(_8407)), level(0.0)).x;
        float2 _8415 = float2(_1972, _1954);
        float2 _1982 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_8415, float2(0.0), isnan(_8415)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_8415, float2(0.0), isnan(_8415)), level(0.0)).xy;
        float _1984 = _1982.x;
        float _1986 = _1982.y;
        float2 _8427 = float2(_1952, _1974);
        float2 _1988 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_8427, float2(0.0), isnan(_8427)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_8427, float2(0.0), isnan(_8427)), level(0.0)).xy;
        float _1990 = _1988.x;
        float _1992 = _1988.y;
        float2 _8439 = float2(_1970, _1960);
        float _1994 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_8439, float2(0.0), isnan(_8439)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_8439, float2(0.0), isnan(_8439)), level(0.0)).x;
        float _1996 = -_1968;
        float _1998 = _1966 + _1996;
        float _2000 = _1998 * 2000.0;
        float _2002 = abs(_2000);
        bool _2004 = _2002 >= 2.0;
        bool _2006 = isnan(_2002);
        bool _2008 = _2004 || _2006;
        bool _2010 = isnan(2.0);
        bool _2012 = _2008 || _2010;
        float _2014 = _2000;
        float _2016 = _1956;
        if (_2012)
        {
            int _2018 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 4;
            uint _2020 = uint(int(uint(_2018) >> uint(2)));
            float _2022 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_2020)]);
            _2014 = _2022;
        }
        float _2024 = _2014;
        float _2026 = -_1966;
        float _2028 = _2026 + _1976;
        float _2030 = -_1966;
        float _2032 = _2030 + _1978;
        float _2034 = _2028 * 2000.0;
        float _2036 = _2032 * 2000.0;
        float _2038 = -_1966;
        float _2040 = _2038 + _1984;
        float _2042 = -_1966;
        float _2044 = _2042 + _1980;
        float _2046 = abs(_2034);
        float _2048 = abs(_2036);
        float _2050 = precise::max(_2046, _2048);
        float _2052 = _1966 * 2000.0;
        float _2054 = -_1966;
        float _2056 = _2054 + _1990;
        float _2058 = _2040 * 1000.0;
        float _2060 = _2044 * 2000.0;
        float _2062 = _2024;
        float _2064 = _2052;
        int _2066 = as_type<int>(_2060);
        if (_2012)
        {
            float _2068 = _2052 + (-2.0);
            _2016 = _2068;
        }
        float _2070 = _2016;
        float _2072 = _2056 * 1000.0;
        float _2074 = -_1966;
        float _2076 = _2074 + _1994;
        float _2078 = abs(_2060);
        float _2080 = precise::max(_2050, _2078);
        float _2082 = _2076 * 2000.0;
        float _2084 = abs(_2082);
        float _2086 = precise::max(_2080, _2084);
        int _2088 = as_type<int>(_2082);
        if (_2012)
        {
            float _2090 = _2024 + 10.0;
            _2062 = _2090;
        }
        float _2092 = _2062;
        bool _2094 = _2092 < _2070;
        bool _2096 = !_2012;
        bool _2098 = _2094 || _2096;
        float _2100 = fma(_2058, _2058, 0.0625);
        float _2102 = fma(_2072, _2072, _2100);
        float _2104 = rsqrt(_2102);
        float _2106 = _2104 * 0.25;
        float _2108 = _2058 * _2104;
        float _2110 = _2072 * _2104;
        bool _2112 = _2106 < 0.891006529331207275390625;
        bool _2114 = _2112 || _2098;
        bool _2116 = _2086 >= 2.0;
        bool _2118 = isnan(_2086);
        bool _2120 = _2116 || _2118;
        bool _2122 = isnan(2.0);
        bool _2124 = _2120 || _2122;
        bool _2126 = _2124 || _2114;
        bool _2128 = !_2126;
        float _2130 = _2104;
        float _2132 = _2106;
        float _2134 = _2108;
        float _2166;
        float _2168;
        float _2170;
        float _2172;
        if (!_2128)
        {
            float _2136 = -_1968;
            float _2138 = _2136 + _1986;
            float _2140 = -_1968;
            float _2142 = _2140 + _1992;
            float _2144 = _1968 * 2000.0;
            float _2146 = _2138 * 1000.0;
            float _2148 = _2142 * 1000.0;
            float _2150 = fma(_2146, _2146, 0.0625);
            float _2152 = fma(_2148, _2148, _2150);
            float _2154 = rsqrt(_2152);
            float _2156 = -_2148;
            float _2158 = fma(_2156, _2154, -0.0);
            float _2160 = -_2146;
            float _2162 = fma(_2160, _2154, -0.0);
            float _2164 = _2154 * 0.25;
            _2166 = _2144;
            _2168 = _2162;
            _2170 = _2158;
            _2172 = _2164;
            _2174 = true;
        }
        else
        {
            float _2176 = _2110 * _2110;
            float _2178 = 1.0 / _2106;
            float _2180 = -_2108;
            float _2182 = (-0.0) + _2180;
            float _2184 = fma(_2108, _2108, _2176);
            float _2186 = sqrt(_2184);
            bool _2188 = _2186 > 9.9999997473787516355514526367188e-05;
            float _2190 = _2186 * _2178;
            float _2192 = _2176;
            _2168 = _2182;
            _2172 = _2106;
            if (_2188)
            {
                float _2194 = abs(_2108);
                float _2196 = abs(_2110);
                float _2198 = precise::max(_2194, _2196);
                _2130 = _2198;
            }
            float _2200 = _2130;
            float _2202 = -_2110;
            float _2204 = (-0.0) + _2202;
            _2170 = _2204;
            if (!_2188)
            {
                _2192 = 0.0;
            }
            float _2206 = _2192;
            float _2208 = _2200;
            float _2210 = _2206;
            if (_2188)
            {
                float _2212 = 1.0 / _2200;
                _2208 = _2212;
            }
            float _2214 = _2208;
            if (_2188)
            {
                float _2216 = _2186 * _2214;
                _2210 = _2216;
            }
            float _2218 = _2210;
            float _2220 = _2218 * 0.9649016857147216796875;
            float _2222 = -_2220;
            float _2224 = fma(_2222, _2190, _2052);
            _2166 = _2224;
        }
        _2174 = false;
        float _2226 = _2166;
        float _2228 = _2168;
        float _2230 = _2170;
        float _2232 = _2172;
        float2 _8748 = float2(_1952, _1954);
        float _2234 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8748, float2(0.0), isnan(_8748)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8748, float2(0.0), isnan(_8748)), level(0.0)).y;
        float _2236 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[81]);
        bool _2238 = as_type<float>(_1680) >= _2226;
        int _2240 = (_2238 ? (-1) : 0) | _1848;
        float _2242 = 0.0 + _2236;
        float _2244 = precise::clamp(_2242, 0.0, 1.0);
        bool _2246 = _1240 >= _2244;
        int _2248 = (_2246 ? (-1) : 0) & _2240;
        int _2250 = ~_2248;
        float _2252 = _2226;
        float _2254 = _2226;
        float _2316;
        float _2318;
        float _2320;
        float _2322;
        float _2324;
        float _2326;
        float _2328;
        float _2330;
        float _2332;
        bool _2334;
        float _2336;
        float _2338;
        float _2340;
        float _2342;
        int _2344;
        if (!(_2250 != 0))
        {
            float _2256 = _1228 * 6.283185482025146484375;
            float _2258 = _1222 * 6.283185482025146484375;
            float _2260 = _1234 * 6.283185482025146484375;
            if (_1848 != 0)
            {
                float _2262 = fma(_1228, _1202, _2226);
                _1890 = _2262;
            }
            float _2264 = _1890;
            float _2266 = _2256 * _2256;
            float _2268 = fma(_2258, _2258, _2266);
            float _2270 = fma(_2260, _2260, _2268);
            float _2272 = sqrt(_2270);
            float _2274 = rsqrt(_2270);
            float _2276 = _2272 * 0.5;
            bool _2278 = _2272 != 0.0;
            bool _2280 = isnan(_2272);
            bool _2282 = _2278 || _2280;
            bool _2284 = isnan(0.0);
            bool _2286 = _2282 || _2284;
            float _2288 = _2276 * 0.15915493667125701904296875;
            float _2290 = _2288 * 6.283185482025146484375;
            float _2292 = sin(_2290);
            float _2294 = _2258 * _2274;
            float _2296 = _2256 * _2274;
            float _2298 = _2260 * _2274;
            float _2300 = _2286 ? _2294 : 0.0;
            float _2302 = _2288 * 6.283185482025146484375;
            float _2304 = cos(_2302);
            float _2306 = _2286 ? _2296 : 0.0;
            float _2308 = _2286 ? _2298 : 0.0;
            float _2310 = _2300 * _2292;
            float _2312 = _2306 * _2292;
            float _2314 = _2308 * _2292;
            _2316 = _2306;
            _2318 = _2308;
            _2320 = _2270;
            _2322 = _2288;
            _2324 = _2292;
            _2326 = _2264;
            _2328 = _2274;
            _2330 = _2272;
            _2332 = _2264;
            _2334 = _2286;
            _2336 = _2312;
            _2338 = _2314;
            _2340 = _2310;
            _2342 = _2304;
            _2344 = 0;
            _2346 = true;
        }
        else
        {
            float _2348 = _2228 * _2228;
            float _2350 = fma(_2230, _2230, _2348);
            float _2352 = sqrt(_2350);
            float _2354 = precise::max(_2352, -1.0);
            float _2356 = precise::min(_2354, 1.0);
            float _2358 = abs(_2356);
            float _2360 = fma(_2358, -0.5, 0.5);
            int _2362 = as_type<int>(_2360) + (-218103808);
            bool _2364 = uint(_2362) >= 1920991232u;
            bool _2366 = !_2364;
            int _2388;
            if (!_2366)
            {
                int _2368 = 1056964608;
                int _2370 = as_type<int>(_1228);
                int _2372 = as_type<int>(_2360);
                int _2374 = 8688;
                int _2376;
                int _2378;
                int _2380;
                int _2382;
                int _2384;
                int _2386;
                _71(_2368, _2370, _2372, _2374, _2376, _2378, _2380, _2382, _2384, _2386);
                _2388 = _2380;
                _2390 = true;
            }
            else
            {
                float _2392 = rsqrt(_2360);
                float _2394 = _2360 * _2392;
                float _2396 = _2392 * 0.5;
                float _2398 = -_2394;
                float _2400 = 0.0 + _2398;
                float _2402 = fma(_2396, _2400, 0.5);
                float _2404 = fma(_2394, _2402, _2394);
                float _2406 = -_2404;
                float _2408 = 0.0 + _2406;
                float _2410 = fma(_2404, _2408, _2360);
                float _2412 = fma(_2396, _2410, _2404);
                _2388 = as_type<int>(_2412);
            }
            _2390 = false;
            int _2414 = _2388;
            float _2416 = abs(_2356);
            bool _2418 = _2416 > 0.569999992847442626953125;
            float _2420 = _2352 + 9.9999997473787516355514526367188e-06;
            float _2422 = _1234 * 6.283185482025146484375;
            float _2424 = abs(_2356);
            float _2426 = _2418 ? as_type<float>(_2414) : _2424;
            float _2428 = -_2226;
            float _2430 = fma(_2234, 2000.0, _2428);
            float _2432 = 1.0 / _2420;
            float _2434 = _2422 * _2232;
            float _2436 = _2426 * _2426;
            float _2438 = _2422 * _2228;
            float _2440 = _2422 * _2230;
            float _2442 = _2434 * _2434;
            float _2444 = fma(_2436, 0.0517513789236545562744140625, 0.01816697604954242706298828125);
            float _2446 = fma(_2438, _2438, _2442);
            float _2448 = fma(_2436, _2444, 0.0467568598687648773193359375);
            float _2450 = fma(_2440, _2440, _2446);
            float _2452 = fma(_2436, _2448, 0.074846573173999786376953125);
            float _2454 = -_2230;
            float _2456 = _2432 * _2454;
            float _2458 = sqrt(_2450);
            float _2460 = fma(_2436, _2452, 0.166670143604278564453125);
            float _2462 = _2436 * _2460;
            float _2464 = rsqrt(_2450);
            float _2466 = fma(_2426, _2462, _2426);
            float _2468 = _2466;
            _2132 = _2430;
            if (_2418)
            {
                float _2470 = fma(_2466, -2.0, 1.57079637050628662109375);
                _2468 = _2470;
            }
            float _2472 = _2468;
            bool _2474 = _2356 >= 0.0;
            bool _2476 = isnan(_2356);
            bool _2478 = _2474 || _2476;
            bool _2480 = isnan(0.0);
            bool _2482 = _2478 || _2480;
            float _2484 = _2432 * _2228;
            float _2486 = _2458 * 0.5;
            bool _2488 = _2458 != 0.0;
            bool _2490 = isnan(_2458);
            bool _2492 = _2488 || _2490;
            bool _2494 = isnan(0.0);
            bool _2496 = _2492 || _2494;
            bool _2498 = !_2482;
            float _2500 = -_2472;
            float _2502 = _2498 ? _2500 : _2472;
            float _2504 = _2486 * 0.15915493667125701904296875;
            float _2506 = abs(_2430);
            bool _2508 = _2506 >= 2.0;
            bool _2510 = isnan(_2506);
            bool _2512 = _2508 || _2510;
            bool _2514 = isnan(2.0);
            bool _2516 = _2512 || _2514;
            float _2518 = _2502 * _2484;
            float _2520 = _2502 * _2456;
            float _2522 = _2504 * 6.283185482025146484375;
            float _2524 = sin(_2522);
            float _2526 = _2438 * _2464;
            float _2528 = _2518 * _2518;
            float _2530 = _2440 * _2464;
            float _2532 = _2434 * _2464;
            bool _2534 = _2232 <= 0.891006529331207275390625;
            bool _2536 = !_2516;
            bool _2538 = _2534 || _2536;
            float _2540 = fma(_2520, _2520, _2528);
            float _2542 = _2496 ? _2526 : 0.0;
            float _2544 = _2504 * 6.283185482025146484375;
            float _2546 = cos(_2544);
            float _2548 = _2496 ? _2530 : 0.0;
            float _2550 = _2496 ? _2532 : 0.0;
            float _2552 = sqrt(_2540);
            float _2554 = _2542 * _2524;
            float _2556 = _2550 * _2524;
            _2316 = _2554;
            _2326 = _2542;
            _2328 = _2556;
            _2330 = _2548;
            _2064 = _2546;
            _2066 = as_type<int>(_2504);
            _2334 = _2538;
            _2344 = 1065353216;
            if (_2538)
            {
                float _2558 = _2226 + (-1000.0);
                _2252 = _2558;
            }
            float _2560 = _2252;
            float _2562 = rsqrt(_2540);
            float _2564 = _2552 * 0.5;
            bool _2566 = _2552 != 0.0;
            bool _2568 = isnan(_2552);
            bool _2570 = _2566 || _2568;
            bool _2572 = isnan(0.0);
            bool _2574 = _2570 || _2572;
            float _2576 = _2548 * _2524;
            float _2578 = _2564 * 0.15915493667125701904296875;
            float _2580 = _2578 * 6.283185482025146484375;
            float _2582 = sin(_2580);
            float _2584 = _2520 * _2562;
            float _2586 = _2518 * _2562;
            float _2588 = _2574 ? _2584 : 0.0;
            float _2590 = _2578 * 6.283185482025146484375;
            float _2592 = cos(_2590);
            float _2594 = _2574 ? _2586 : 0.0;
            float _2596 = _2588 * _2582;
            float _2598 = _2594 * _2582;
            float _2600 = _2598 * _2554;
            float _2602 = _2598 * _2576;
            float _2604 = _2592 * _2554;
            float _2606 = _2592 * _2576;
            float _2608 = fma(_2596, _2554, _2602);
            float _2610 = fma(_2596, _2546, _2604);
            float _2612 = fma(_2598, _2546, _2606);
            float _2614 = fma(_2598, _2556, _2610);
            float _2616 = -_2600;
            float _2618 = fma(_2596, _2576, _2616);
            float _2620 = -_2596;
            float _2622 = fma(_2620, _2556, _2612);
            float _2624 = fma(_2592, _2556, _2618);
            float _2626 = -_2608;
            float _2628 = fma(_2592, _2546, _2626);
            _2254 = _2560;
            _2318 = _2618;
            _2320 = _2576;
            _2322 = _2596;
            _2324 = _2600;
            _2134 = _2604;
            _2332 = _2560;
            _2336 = _2624;
            _2338 = _2622;
            _2340 = _2614;
            _2342 = _2628;
        }
        _2346 = false;
        float _2630 = _2254;
        float _2632 = _2316;
        float _2634 = _2318;
        float _2636 = _2320;
        float _2638 = _2322;
        float _2640 = _2324;
        float _2642 = _2326;
        float _2644 = _2328;
        float _2646 = _2330;
        float _2648 = _2064;
        float _2650 = _2132;
        float _2652 = _2134;
        int _2654 = _2066;
        float _2656 = _2332;
        bool _2658 = _2334;
        float _2660 = _2336;
        float _2662 = _2338;
        float _2664 = _2340;
        float _2666 = _2342;
        int _2668 = _2344;
        bool _2670 = !_1120;
        bool _2672 = _2658;
        int _2674 = _2654;
        _1432 = _2630;
        _1434 = _2632;
        _1436 = _2634;
        _1438 = _2636;
        _1266 = _2638;
        _1268 = _2640;
        _1892 = _2642;
        _1270 = _2644;
        _1880 = _2646;
        _1882 = _2648;
        _1884 = _2650;
        _1886 = _2652;
        _1902 = _2660;
        _1894 = _2662;
        _1898 = _2664;
        _1906 = _2666;
        _1932 = _2668;
        if (!_2670)
        {
            float _2676 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _2678 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _2680 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _2682 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _2684 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[28]);
            float _2686 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[29]);
            float _2688 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[30]);
            float _2690 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[31]);
            float _2692 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _2694 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _2696 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _2698 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _2700 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _2702 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _2704 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _2706 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _2708 = _2682 * _2686;
            float _2710 = _2682 * _2688;
            float _2712 = _2682 * _2684;
            float _2714 = _2698 * _2680;
            float _2716 = _2698 * _2678;
            float _2718 = _2698 * _2676;
            float _2720 = _2698 * _2688;
            float _2722 = _2698 * _2686;
            float _2724 = _2698 * _2684;
            float _2726 = -_2708;
            float _2728 = fma(_2678, _2690, _2726);
            float _2730 = -_2714;
            float _2732 = fma(_2696, _2682, _2730);
            float _2734 = -_2716;
            float _2736 = fma(_2694, _2682, _2734);
            float _2738 = -_2718;
            float _2740 = fma(_2692, _2682, _2738);
            float _2742 = _2680 * _2686;
            float _2744 = _2680 * _2684;
            float _2746 = _2696 * _2686;
            float _2748 = _2696 * _2684;
            float _2750 = -_2710;
            float _2752 = fma(_2680, _2690, _2750);
            float _2754 = -_2712;
            float _2756 = fma(_2676, _2690, _2754);
            float _2758 = -_2720;
            float _2760 = fma(_2696, _2690, _2758);
            float _2762 = -_2722;
            float _2764 = fma(_2694, _2690, _2762);
            float _2766 = -_2724;
            float _2768 = fma(_2692, _2690, _2766);
            float _2770 = _2678 * _2684;
            float _2772 = -_2742;
            float _2774 = fma(_2678, _2688, _2772);
            float _2776 = -_2744;
            float _2778 = fma(_2676, _2688, _2776);
            float _2780 = -_2746;
            float _2782 = fma(_2694, _2688, _2780);
            float _2784 = -_2748;
            float _2786 = fma(_2692, _2688, _2784);
            float _2788 = _2696 * _2678;
            float _2790 = _2696 * _2676;
            float _2792 = -_2770;
            float _2794 = fma(_2676, _2686, _2792);
            float _2796 = _2694 * _2676;
            float _2798 = -_2788;
            float _2800 = fma(_2694, _2680, _2798);
            float _2802 = -_2790;
            float _2804 = fma(_2692, _2680, _2802);
            float _2806 = _2696 * _2756;
            float _2808 = -_2796;
            float _2810 = fma(_2692, _2678, _2808);
            float _2812 = _2696 * _2728;
            float _2814 = _2694 * _2684;
            float _2816 = -_2806;
            float _2818 = fma(_2692, _2752, _2816);
            float _2820 = _2694 * _2756;
            float _2822 = _2694 * _2778;
            float _2824 = -_2812;
            float _2826 = fma(_2694, _2752, _2824);
            float _2828 = fma(_2698, _2778, _2818);
            float _2830 = -_2814;
            float _2832 = fma(_2692, _2686, _2830);
            float _2834 = -_2820;
            float _2836 = fma(_2692, _2728, _2834);
            float _2838 = -_2822;
            float _2840 = fma(_2692, _2774, _2838);
            float _2842 = fma(_2698, _2774, _2826);
            float _2844 = _2702 * _2828;
            float _2846 = _2704 * _2728;
            float _2848 = fma(_2698, _2794, _2836);
            float _2850 = fma(_2696, _2794, _2840);
            float _2852 = -_2844;
            float _2854 = fma(_2700, _2842, _2852);
            float _2856 = -_2846;
            float _2858 = fma(_2702, _2752, _2856);
            float _2860 = _2704 * _2756;
            float _2862 = _2702 * _2756;
            float _2864 = fma(_2704, _2848, _2854);
            float _2866 = _2704 * _2768;
            float _2868 = _2704 * _2736;
            float _2870 = -_2862;
            float _2872 = fma(_2700, _2728, _2870);
            float _2874 = -_2706;
            float _2876 = fma(_2874, _2850, _2864);
            float _2878 = -_2866;
            float _2880 = fma(_2700, _2760, _2878);
            float _2882 = -_2860;
            float _2884 = fma(_2700, _2752, _2882);
            float _2886 = _2704 * _2740;
            float _2888 = 1.0 / _2876;
            float _2890 = _2704 * _2764;
            float _2892 = _2702 * _2768;
            float _2894 = fma(_2706, _2774, _2858);
            float _2896 = fma(_2706, _2794, _2872);
            float _2898 = -_2868;
            float _2900 = fma(_2702, _2732, _2898);
            float _2902 = -_2886;
            float _2904 = fma(_2700, _2732, _2902);
            float _2906 = -_2890;
            float _2908 = fma(_2702, _2760, _2906);
            float _2910 = -_2892;
            float _2912 = fma(_2700, _2764, _2910);
            float _2914 = fma(_2706, _2778, _2884);
            float _2916 = _2702 * _2740;
            float _2918 = fma(_2706, _2782, _2908);
            float _2920 = fma(_2706, _2786, _2880);
            float _2922 = fma(_2706, _2832, _2912);
            float _2924 = -_2916;
            float _2926 = fma(_2700, _2736, _2924);
            float _2928 = fma(_2706, _2800, _2900);
            float _2930 = _2842 * _2888;
            float _2932 = _2894 * _2888;
            float _2934 = _2828 * _2888;
            float _2936 = _2896 * _2888;
            float _2938 = _2914 * _2888;
            float _2940 = _2848 * _2888;
            float _2942 = _2934 * _1840;
            float _2944 = _2932 * _2656;
            float _2946 = _2936 * _2656;
            float _2948 = _2918 * _2888;
            float _2950 = -_2942;
            float _2952 = fma(_2938, _2656, _2950);
            float _2954 = -_2944;
            float _2956 = fma(_2930, _1840, _2954);
            float _2958 = -_2946;
            float _2960 = fma(_2940, _1840, _2958);
            float _2962 = _2920 * _2888;
            float _2964 = _2922 * _2888;
            float _2966 = fma(_2706, _2804, _2904);
            float _2968 = fma(_2706, _2810, _2926);
            float _2970 = fma(_2948, _1842, _2956);
            float _2972 = -_2962;
            float _2974 = fma(_2972, _1842, _2952);
            float _2976 = fma(_2964, _1842, _2960);
            float _2978 = -_2928;
            float _2980 = fma(_2978, _2888, _2970);
            float _2982 = fma(_2966, _2888, _2974);
            float _2984 = -_2968;
            float _2986 = fma(_2984, _2888, _2976);
            _1432 = _2930;
            _1434 = _2970;
            _1436 = _2942;
            _1438 = _2976;
            _1266 = _2940;
            _1268 = _2892;
            _1892 = _2894;
            _1270 = _2794;
            _1880 = _2948;
            _1882 = _2888;
            _1884 = _2928;
            _1886 = _2698;
            _1916 = true;
            _1936 = as_type<int>(_2980);
            _1950 = as_type<int>(_2986);
            _1942 = as_type<int>(_2982);
            _1928 = 0.0;
            _1922 = 0.0;
            _1912 = 0.0;
            _2988 = true;
        }
        else
        {
            bool _2990 = !_1208;
            if (!_2990)
            {
                float _2992 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                uint _2994 = uint(int(uint(_164) >> uint(2)));
                float _2996 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2994)]);
                int _2998 = _164 + 4;
                uint _3000 = uint(int(uint(_2998) >> uint(2)));
                float _3002 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3000)]);
                int _3004 = _164 + 8;
                uint _3006 = uint(int(uint(_3004) >> uint(2)));
                float _3008 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3006)]);
                uint _3010 = uint(int(uint(_164) >> uint(2)));
                float _3012 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3010)]);
                int _3014 = _164 + 4;
                uint _3016 = uint(int(uint(_3014) >> uint(2)));
                float _3018 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3016)]);
                int _3020 = _164 + 8;
                uint _3022 = uint(int(uint(_3020) >> uint(2)));
                float _3024 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3022)]);
                uint _3026 = uint(int(uint(_164) >> uint(2)));
                float _3028 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3026)]);
                int _3030 = _164 + 4;
                uint _3032 = uint(int(uint(_3030) >> uint(2)));
                float _3034 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3032)]);
                int _3036 = _164 + 8;
                uint _3038 = uint(int(uint(_3036) >> uint(2)));
                float _3040 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3038)]);
                float _3042 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _3044 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _3046 = _3008 * _3012;
                float _3048 = _3008 * _3018;
                float _3050 = -_3046;
                float _3052 = fma(_2996, _3024, _3050);
                float _3054 = _3002 * _3012;
                float _3056 = -_3048;
                float _3058 = fma(_3002, _3024, _3056);
                float _3060 = _3034 * _3052;
                float _3062 = -_3054;
                float _3064 = fma(_2996, _3018, _3062);
                float _3066 = -_3060;
                float _3068 = fma(_3028, _3058, _3066);
                float _3070 = fma(_3040, _3064, _3068);
                float _3072 = _2992 * _3024;
                float _3074 = 1.0 / _3070;
                float _3076 = _2992 * _3018;
                float _3078 = _2992 * _3012;
                float _3080 = _3040 * _3012;
                float _3082 = _3034 * _3024;
                float _3084 = -_3072;
                float _3086 = fma(_3008, _3042, _3084);
                float _3088 = -_3076;
                float _3090 = fma(_3002, _3042, _3088);
                float _3092 = -_3078;
                float _3094 = fma(_2996, _3042, _3092);
                float _3096 = -_2996;
                float _3098 = fma(_3096, _3024, _3046);
                float _3100 = -_3080;
                float _3102 = fma(_3028, _3024, _3100);
                float _3104 = -_3082;
                float _3106 = fma(_3040, _3018, _3104);
                float _3108 = _3028 * _3018;
                float _3110 = _3028 * _3008;
                float _3112 = _3034 * _2996;
                float _3114 = _3040 * _3002;
                float _3116 = -_3108;
                float _3118 = fma(_3034, _3012, _3116);
                float _3120 = -_3110;
                float _3122 = fma(_3040, _2996, _3120);
                float _3124 = _3040 * _3090;
                float _3126 = -_3112;
                float _3128 = fma(_3028, _3002, _3126);
                float _3130 = _3106 * _3074;
                float _3132 = _3102 * _3074;
                float _3134 = _3040 * _3094;
                float _3136 = _3118 * _3074;
                float _3138 = -_3114;
                float _3140 = fma(_3034, _3008, _3138);
                float _3142 = _3034 * _3094;
                float _3144 = -_3124;
                float _3146 = fma(_3034, _3086, _3144);
                float _3148 = _3130 * _2656;
                float _3150 = _3132 * _2656;
                float _3152 = _3098 * _3074;
                float _3154 = _3058 * _3074;
                float _3156 = _3136 * _2656;
                float _3158 = _3064 * _3074;
                float _3160 = fma(_3152, _1840, _3150);
                float _3162 = fma(_3154, _1840, _3148);
                float _3164 = -_3134;
                float _3166 = fma(_3028, _3086, _3164);
                float _3168 = fma(_3158, _1840, _3156);
                float _3170 = _3122 * _3074;
                float _3172 = _3140 * _3074;
                float _3174 = _3128 * _3074;
                float _3176 = -_3142;
                float _3178 = fma(_3028, _3090, _3176);
                float _3180 = fma(_3170, _1842, _3160);
                float _3182 = fma(_3172, _1842, _3162);
                float _3184 = fma(_3044, _3052, _3166);
                float _3186 = fma(_3044, _3058, _3146);
                float _3188 = fma(_3174, _1842, _3168);
                float _3190 = fma(_3044, _3064, _3178);
                float _3192 = fma(_3184, _3074, _3180);
                float _3194 = -_3186;
                float _3196 = fma(_3194, _3074, _3182);
                float _3198 = -_3190;
                float _3200 = fma(_3198, _3074, _3188);
                _1432 = _3182;
                _1434 = _3134;
                _1436 = _3170;
                _1438 = _3140;
                _1266 = _3188;
                _1268 = _3122;
                _1892 = _3118;
                _1270 = _3168;
                _1880 = _3028;
                _1882 = _3186;
                _1884 = _3040;
                _1886 = _3162;
                _1916 = true;
                _1936 = as_type<int>(_3196);
                _1950 = as_type<int>(_3200);
                _1942 = as_type<int>(_3192);
                _1928 = 0.0;
                _1922 = 0.0;
                _1912 = 0.0;
                _2988 = true;
            }
            else
            {
                if (!_1282)
                {
                    _2672 = true;
                }
                bool _3202 = _2672;
                _1916 = _3202;
                if (!_1282)
                {
                    _1920 = 0.0;
                    _1910 = 0.0;
                }
                float _3204 = _1920;
                float _3206 = _1910;
                _1922 = _3204;
                _1912 = _3206;
                if (!_1282)
                {
                    _1926 = 0.0;
                }
                float _3208 = _1926;
                _1928 = _3208;
                if (!_1282)
                {
                    _2088 = as_type<int>(_1840);
                }
                int _3210 = _2088;
                _1936 = _3210;
                if (!_1282)
                {
                    _2674 = as_type<int>(_2656);
                }
                int _3212 = _2674;
                _1942 = _3212;
                if (!_1282)
                {
                    _1948 = as_type<int>(_1842);
                }
                int _3214 = _1948;
                bool _3216 = !_1282;
                _1950 = _3214;
                if (!_3216)
                {
                    uint _3218 = uint(int(uint(_164) >> uint(2)));
                    float _3220 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3218)]);
                    int _3222 = _164 + 4;
                    uint _3224 = uint(int(uint(_3222) >> uint(2)));
                    float _3226 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3224)]);
                    int _3228 = _164 + 8;
                    uint _3230 = uint(int(uint(_3228) >> uint(2)));
                    float _3232 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3230)]);
                    int _3234 = _164 + 12;
                    uint _3236 = uint(int(uint(_3234) >> uint(2)));
                    float _3238 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3236)]);
                    uint _3240 = uint(int(uint(_164) >> uint(2)));
                    float _3242 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3240)]);
                    int _3244 = _164 + 4;
                    uint _3246 = uint(int(uint(_3244) >> uint(2)));
                    float _3248 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3246)]);
                    int _3250 = _164 + 8;
                    uint _3252 = uint(int(uint(_3250) >> uint(2)));
                    float _3254 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3252)]);
                    int _3256 = _164 + 12;
                    uint _3258 = uint(int(uint(_3256) >> uint(2)));
                    float _3260 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3258)]);
                    uint _3262 = uint(int(uint(_164) >> uint(2)));
                    float _3264 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3262)]);
                    int _3266 = _164 + 4;
                    uint _3268 = uint(int(uint(_3266) >> uint(2)));
                    float _3270 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3268)]);
                    int _3272 = _164 + 8;
                    uint _3274 = uint(int(uint(_3272) >> uint(2)));
                    float _3276 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3274)]);
                    int _3278 = _164 + 12;
                    uint _3280 = uint(int(uint(_3278) >> uint(2)));
                    float _3282 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3280)]);
                    float _3284 = _3232 * _3242;
                    float _3286 = _3232 * _3248;
                    float _3288 = _3226 * _3242;
                    float _3290 = _3254 * _3238;
                    float _3292 = -_3284;
                    float _3294 = fma(_3220, _3254, _3292);
                    float _3296 = -_3286;
                    float _3298 = fma(_3226, _3254, _3296);
                    float _3300 = -_3288;
                    float _3302 = fma(_3220, _3248, _3300);
                    float _3304 = _3270 * _3254;
                    float _3306 = _3270 * _3294;
                    float _3308 = _3248 * _3238;
                    float _3310 = _3242 * _3238;
                    float _3312 = -_3304;
                    float _3314 = fma(_3276, _3248, _3312);
                    float _3316 = -_3306;
                    float _3318 = fma(_3264, _3298, _3316);
                    float _3320 = _3264 * _3248;
                    float _3322 = _3276 * _3226;
                    float _3324 = _3264 * _3232;
                    float _3326 = fma(_3276, _3302, _3318);
                    float _3328 = -_3290;
                    float _3330 = fma(_3232, _3260, _3328);
                    float _3332 = -_3308;
                    float _3334 = fma(_3226, _3260, _3332);
                    float _3336 = -_3310;
                    float _3338 = fma(_3220, _3260, _3336);
                    float _3340 = _3276 * _3242;
                    float _3342 = -_3320;
                    float _3344 = fma(_3270, _3242, _3342);
                    float _3346 = 1.0 / _3326;
                    float _3348 = -_3322;
                    float _3350 = fma(_3270, _3232, _3348);
                    float _3352 = -_3220;
                    float _3354 = fma(_3352, _3254, _3284);
                    float _3356 = -_3324;
                    float _3358 = fma(_3276, _3220, _3356);
                    float _3360 = _3270 * _3220;
                    float _3362 = _3276 * _3334;
                    float _3364 = _3276 * _3338;
                    float _3366 = _3270 * _3338;
                    float _3368 = -_3340;
                    float _3370 = fma(_3264, _3254, _3368);
                    float _3372 = -_3360;
                    float _3374 = fma(_3264, _3226, _3372);
                    float _3376 = -_3362;
                    float _3378 = fma(_3270, _3330, _3376);
                    float _3380 = -_3364;
                    float _3382 = fma(_3264, _3330, _3380);
                    float _3384 = -_3366;
                    float _3386 = fma(_3264, _3334, _3384);
                    float _3388 = fma(_3298, _3282, _3378);
                    float _3390 = fma(_3294, _3282, _3382);
                    float _3392 = _3314 * _3346;
                    float _3394 = _3370 * _3346;
                    float _3396 = _3344 * _3346;
                    float _3398 = _3354 * _3346;
                    float _3400 = _3392 * _2656;
                    float _3402 = _3394 * _2656;
                    float _3404 = _3396 * _2656;
                    float _3406 = _3298 * _3346;
                    float _3408 = _3302 * _3346;
                    float _3410 = fma(_3398, _1840, _3402);
                    float _3412 = _3358 * _3346;
                    float _3414 = fma(_3406, _1840, _3400);
                    float _3416 = fma(_3408, _1840, _3404);
                    float _3418 = _3350 * _3346;
                    float _3420 = _3374 * _3346;
                    float _3422 = fma(_3302, _3282, _3386);
                    float _3424 = fma(_3412, _1842, _3410);
                    float _3426 = fma(_3418, _1842, _3414);
                    float _3428 = fma(_3420, _1842, _3416);
                    float _3430 = fma(_3390, _3346, _3424);
                    float _3432 = -_3388;
                    float _3434 = fma(_3432, _3346, _3426);
                    float _3436 = -_3422;
                    float _3438 = fma(_3436, _3346, _3428);
                    _1432 = _3388;
                    _1434 = _3426;
                    _1436 = _3422;
                    _1438 = _3424;
                    _1266 = _3418;
                    _1268 = _3360;
                    _1892 = _3408;
                    _1270 = _3340;
                    _1880 = _3264;
                    _1882 = _3270;
                    _1884 = _3390;
                    _1886 = _3282;
                    _1916 = true;
                    _1936 = as_type<int>(_3434);
                    _1950 = as_type<int>(_3438);
                    _1942 = as_type<int>(_3430);
                    _1928 = 0.0;
                    _1922 = 0.0;
                    _1912 = 0.0;
                }
            }
        }
    }
    _2988 = false;
    float _3440 = _1432;
    float _3442 = _1434;
    float _3444 = _1436;
    float _3446 = _1438;
    float _3448 = _1266;
    float _3450 = _1268;
    float _3452 = _1892;
    float _3454 = _1270;
    float _3456 = _1880;
    float _3458 = _1882;
    float _3460 = _1884;
    float _3462 = _1886;
    bool _3464 = _1916;
    int _3466 = _1936;
    int _3468 = _1950;
    float _3470 = _1902;
    float _3472 = _1894;
    int _3474 = _1942;
    float _3476 = _1898;
    float _3478 = _1906;
    float _3480 = _1928;
    float _3482 = _1922;
    float _3484 = _1912;
    int _3486 = _1932;
    float _3488 = _3440;
    float _3490 = _3442;
    float _3492 = _3444;
    float _3494 = _3446;
    if (_1120)
    {
        float _3496 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _3498 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _3500 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _3502 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _3488 = _3496;
        _3490 = _3498;
        _3492 = _3500;
        _3494 = _3502;
    }
    float _3504 = _3488;
    float _3506 = _3490;
    float _3508 = _3492;
    float _3510 = _3494;
    float _3512 = _3448;
    float _3514 = _3450;
    float _3516 = _3452;
    float _3518 = _3454;
    if (_1120)
    {
        float _3520 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _3522 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _3524 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _3526 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _3512 = _3520;
        _3514 = _3522;
        _3516 = _3524;
        _3518 = _3526;
    }
    float _3528 = _3512;
    float _3530 = _3514;
    float _3532 = _3516;
    float _3534 = _3518;
    float _3536 = _3456;
    float _3538 = _3458;
    float _3540 = _3460;
    float _3542 = _3462;
    if (_1120)
    {
        float _3544 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _3546 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _3548 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _3550 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _3536 = _3544;
        _3538 = _3546;
        _3540 = _3548;
        _3542 = _3550;
    }
    float _3552 = _3536;
    float _3554 = _3538;
    float _3556 = _3540;
    float _3558 = _3542;
    float _3560 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _3562 = _3464 ? as_type<float>(_3466) : _1868;
    float _3564 = _3464 ? as_type<float>(_3468) : _1070;
    float _3566 = _3464 ? as_type<float>(_3468) : _1870;
    float _3568 = _3464 ? as_type<float>(_1856) : _1100;
    float _3570 = _3464 ? as_type<float>(_1856) : _704;
    float _3572 = _3464 ? as_type<float>(_1858) : _1106;
    float _3574 = _3470 * _3470;
    float _3576 = _3464 ? as_type<float>(_1858) : _726;
    float _3578 = _3472 * _3472;
    float _3580 = _3464 ? as_type<float>(_3474) : _1200;
    float _3582 = _3464 ? as_type<float>(_3474) : _1874;
    float _3584 = _3576 * 59.999996185302734375;
    float _3586 = _3464 ? as_type<float>(_3466) : _1058;
    float _3588 = fma(_3574, -2.0, 1.0);
    float _3590 = _3464 ? as_type<float>(_1860) : _1112;
    float _3592 = _3476 * _3476;
    float _3594 = _3464 ? as_type<float>(_1860) : _728;
    float _3596 = fma(_3578, -2.0, 1.0);
    float _3598 = _3478 * 2.0;
    float _3600 = fma(_3592, -2.0, 1.0);
    float _3602 = fma(_3578, -2.0, _3588);
    float _3604 = _3570 * 59.999996185302734375;
    float _3606 = fma(_3592, -2.0, _3596);
    float _3608 = _3476 * 2.0;
    float _3610 = _3598 * _3472;
    float _3612 = _3470 * 2.0;
    float _3614 = _3598 * _3476;
    float _3616 = _3472 * 2.0;
    float _3618 = _3598 * _3470;
    float _3620 = _3594 * 59.999996185302734375;
    float _3622 = fma(_3608, _3470, _3610);
    float _3624 = -_3610;
    float _3626 = fma(_3608, _3470, _3624);
    float _3628 = fma(_3612, _3472, _3614);
    float _3630 = -_3618;
    float _3632 = fma(_3616, _3476, _3630);
    float _3634 = -_3614;
    float _3636 = fma(_3612, _3472, _3634);
    float _3638 = fma(_3574, -2.0, _3600);
    float _3640 = fma(_3616, _3476, _3618);
    float _3642 = _3510;
    float _3644 = _3598;
    float _3646 = _3580;
    float _3648 = _3564;
    float _3650 = _3570;
    float _3652 = _3506;
    float _3654 = _3582;
    if (_1120)
    {
        float _3656 = _3584 * _3506;
        _3642 = _3656;
    }
    float _3658 = _3642;
    float _3660 = _3534;
    float _3662 = _3658;
    float _3664 = _3530;
    if (_1120)
    {
        float _3666 = _3584 * _3530;
        _3660 = _3666;
    }
    float _3668 = _3660;
    float _3670 = _3558;
    float _3672 = _3668;
    float _3674 = _3554;
    if (_1120)
    {
        float _3676 = _3584 * _3554;
        _3670 = _3676;
    }
    float _3678 = _3670;
    if (_1120)
    {
        float _3680 = fma(_3604, _3504, _3658);
        _3662 = _3680;
    }
    float _3682 = _3662;
    if (_1120)
    {
        float _3684 = fma(_3604, _3528, _3668);
        _3672 = _3684;
    }
    float _3686 = _3672;
    if (_1120)
    {
        float _3688 = fma(_3604, _3552, _3678);
        _3644 = _3688;
    }
    float _3690 = _3644;
    float _3692 = fma(_3572, _3560, _3580);
    float _3694 = fma(_3590, _3560, _3564);
    float _3696 = fma(_3568, _3560, _3586);
    if (_1120)
    {
        float _3698 = fma(_3620, _3508, _3682);
        _3646 = _3698;
    }
    float _3700 = _3646;
    float _3702 = _3700;
    float _3704 = _3700;
    if (_1120)
    {
        float _3706 = fma(_3620, _3532, _3686);
        _3648 = _3706;
    }
    float _3708 = _3648;
    float _3710 = _3708;
    float _3712 = _3708;
    if (_1120)
    {
        float _3714 = fma(_3620, _3556, _3690);
        _3650 = _3714;
    }
    float _3716 = _3650;
    float _3718 = _3716;
    float _3720 = _3716;
    if (!_1120)
    {
        bool _3722 = !_1208;
        if (!_3722)
        {
            uint _3724 = uint(int(uint(_164) >> uint(2)));
            float _3726 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3724)]);
            int _3728 = _164 + 4;
            uint _3730 = uint(int(uint(_3728) >> uint(2)));
            float _3732 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3730)]);
            int _3734 = _164 + 8;
            uint _3736 = uint(int(uint(_3734) >> uint(2)));
            float _3738 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3736)]);
            uint _3740 = uint(int(uint(_164) >> uint(2)));
            float _3742 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3740)]);
            int _3744 = _164 + 4;
            uint _3746 = uint(int(uint(_3744) >> uint(2)));
            float _3748 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3746)]);
            int _3750 = _164 + 8;
            uint _3752 = uint(int(uint(_3750) >> uint(2)));
            float _3754 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3752)]);
            uint _3756 = uint(int(uint(_164) >> uint(2)));
            float _3758 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3756)]);
            int _3760 = _164 + 4;
            uint _3762 = uint(int(uint(_3760) >> uint(2)));
            float _3764 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3762)]);
            int _3766 = _164 + 8;
            uint _3768 = uint(int(uint(_3766) >> uint(2)));
            float _3770 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3768)]);
            float _3772 = _3732 * _3584;
            float _3774 = _3748 * _3584;
            float _3776 = _3764 * _3584;
            float _3778 = fma(_3726, _3604, _3772);
            float _3780 = fma(_3742, _3604, _3774);
            float _3782 = fma(_3758, _3604, _3776);
            float _3784 = fma(_3738, _3620, _3778);
            float _3786 = fma(_3754, _3620, _3780);
            float _3788 = fma(_3770, _3620, _3782);
            _3712 = _3786;
            _3720 = _3788;
            _3704 = _3784;
            _3790 = true;
        }
        else
        {
            if (!_1282)
            {
                _3702 = _3604;
            }
            float _3792 = _3702;
            _3704 = _3792;
            if (!_1282)
            {
                _3710 = _3584;
            }
            float _3794 = _3710;
            _3712 = _3794;
            if (!_1282)
            {
                _3718 = _3620;
            }
            float _3796 = _3718;
            bool _3798 = !_1282;
            _3720 = _3796;
            if (!_3798)
            {
                uint _3800 = uint(int(uint(_164) >> uint(2)));
                float _3802 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3800)]);
                int _3804 = _164 + 4;
                uint _3806 = uint(int(uint(_3804) >> uint(2)));
                float _3808 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3806)]);
                int _3810 = _164 + 8;
                uint _3812 = uint(int(uint(_3810) >> uint(2)));
                float _3814 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3812)]);
                uint _3816 = uint(int(uint(_164) >> uint(2)));
                float _3818 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3816)]);
                int _3820 = _164 + 4;
                uint _3822 = uint(int(uint(_3820) >> uint(2)));
                float _3824 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3822)]);
                int _3826 = _164 + 8;
                uint _3828 = uint(int(uint(_3826) >> uint(2)));
                float _3830 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3828)]);
                uint _3832 = uint(int(uint(_164) >> uint(2)));
                float _3834 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3832)]);
                int _3836 = _164 + 4;
                uint _3838 = uint(int(uint(_3836) >> uint(2)));
                float _3840 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3838)]);
                int _3842 = _164 + 8;
                uint _3844 = uint(int(uint(_3842) >> uint(2)));
                float _3846 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3844)]);
                float _3848 = _3808 * _3584;
                float _3850 = _3824 * _3584;
                float _3852 = _3840 * _3584;
                float _3854 = fma(_3802, _3604, _3848);
                float _3856 = fma(_3818, _3604, _3850);
                float _3858 = fma(_3834, _3604, _3852);
                float _3860 = fma(_3814, _3620, _3854);
                float _3862 = fma(_3830, _3620, _3856);
                float _3864 = fma(_3846, _3620, _3858);
                _3712 = _3862;
                _3720 = _3864;
                _3704 = _3860;
            }
        }
    }
    _3790 = false;
    float _3866 = _3712;
    float _3868 = _3720;
    float _3870 = _3704;
    float _3872 = _1234 * 19.23889923095703125;
    float _3874 = _1240 * 19.23889923095703125;
    float _3876 = -_3696;
    float _3878 = _3876 + _3562;
    float _3880 = -_3692;
    float _3882 = _3880 + _3582;
    float _3884 = _3872 * 0.15915493667125701904296875;
    float _3886 = _3874 * 0.15915493667125701904296875;
    float _3888 = _1116 * 0.5;
    if (_1120)
    {
        float _3890 = _3882 * _3506;
        _3652 = _3890;
    }
    float _3892 = _3652;
    float _3894 = _3892;
    if (_1120)
    {
        float _3896 = _3882 * _3554;
        _3674 = _3896;
    }
    float _3898 = _3674;
    float _3900 = _3886 * 6.283185482025146484375;
    float _3902 = sin(_3900);
    float _3904 = _3898;
    if (_1120)
    {
        float _3906 = _3882 * _3530;
        _3664 = _3906;
    }
    float _3908 = _3664;
    float _3910 = _3908;
    if (_1120)
    {
        float _3912 = fma(_3878, _3504, _3892);
        _3894 = _3912;
    }
    float _3914 = _3894;
    float _3916 = -_3694;
    float _3918 = _3916 + _3566;
    float _3920 = _3914;
    if (_1120)
    {
        float _3922 = fma(_3878, _3552, _3898);
        _3904 = _3922;
    }
    float _3924 = _3904;
    float _3926 = precise::max(_3888, 0.001000000047497451305389404296875);
    if (_1120)
    {
        float _3928 = fma(_3878, _3528, _3908);
        _3910 = _3928;
    }
    float _3930 = _3910;
    float _3932 = precise::max(_1114, 0.001000000047497451305389404296875);
    float _3934 = _3884 * 6.283185482025146484375;
    float _3936 = sin(_3934);
    if (_1120)
    {
        float _3938 = fma(_3918, _3508, _3914);
        _3654 = _3938;
    }
    float _3940 = _3654;
    float _3942 = _3940;
    float _3944 = _3940;
    if (_1120)
    {
        float _3946 = fma(_3918, _3556, _3924);
        _3920 = _3946;
    }
    float _3948 = _3920;
    float _3950 = precise::min(_3926, 10000.0);
    float _3952 = precise::min(_3932, 10000.0);
    float _3954 = _3902 * 34873.41015625;
    float _3956 = _3936 * 34873.41015625;
    float _3958 = _3936;
    float _3960 = _3948;
    float _3962 = _3948;
    if (_1120)
    {
        float _3964 = fma(_3918, _3532, _3930);
        _3958 = _3964;
    }
    float _3966 = _3958;
    float _3968 = floor(_3956);
    float _3970 = -_3968;
    float _3972 = _3956 + _3970;
    float _3974 = _3966;
    float _3976 = _3966;
    if (!_1120)
    {
        bool _3978 = !_1208;
        if (!_3978)
        {
            uint _3980 = uint(int(uint(_164) >> uint(2)));
            float _3982 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3980)]);
            int _3984 = _164 + 4;
            uint _3986 = uint(int(uint(_3984) >> uint(2)));
            float _3988 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3986)]);
            int _3990 = _164 + 8;
            uint _3992 = uint(int(uint(_3990) >> uint(2)));
            float _3994 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3992)]);
            uint _3996 = uint(int(uint(_164) >> uint(2)));
            float _3998 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3996)]);
            int _4000 = _164 + 4;
            uint _4002 = uint(int(uint(_4000) >> uint(2)));
            float _4004 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4002)]);
            int _4006 = _164 + 8;
            uint _4008 = uint(int(uint(_4006) >> uint(2)));
            float _4010 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4008)]);
            uint _4012 = uint(int(uint(_164) >> uint(2)));
            float _4014 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4012)]);
            int _4016 = _164 + 4;
            uint _4018 = uint(int(uint(_4016) >> uint(2)));
            float _4020 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4018)]);
            int _4022 = _164 + 8;
            uint _4024 = uint(int(uint(_4022) >> uint(2)));
            float _4026 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4024)]);
            float _4028 = _3988 * _3882;
            float _4030 = _4004 * _3882;
            float _4032 = fma(_3982, _3878, _4028);
            float _4034 = _4020 * _3882;
            float _4036 = fma(_3998, _3878, _4030);
            float _4038 = fma(_4014, _3878, _4034);
            float _4040 = fma(_3994, _3918, _4032);
            float _4042 = fma(_4010, _3918, _4036);
            float _4044 = fma(_4026, _3918, _4038);
            _3976 = _4042;
            _3962 = _4044;
            _3944 = _4040;
            _4046 = true;
        }
        else
        {
            if (!_1282)
            {
                _3942 = _3878;
            }
            float _4048 = _3942;
            _3944 = _4048;
            if (!_1282)
            {
                _3974 = _3882;
            }
            float _4050 = _3974;
            _3976 = _4050;
            if (!_1282)
            {
                _3960 = _3918;
            }
            float _4052 = _3960;
            bool _4054 = !_1282;
            _3962 = _4052;
            if (!_4054)
            {
                uint _4056 = uint(int(uint(_164) >> uint(2)));
                float _4058 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4056)]);
                int _4060 = _164 + 4;
                uint _4062 = uint(int(uint(_4060) >> uint(2)));
                float _4064 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4062)]);
                int _4066 = _164 + 8;
                uint _4068 = uint(int(uint(_4066) >> uint(2)));
                float _4070 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4068)]);
                uint _4072 = uint(int(uint(_164) >> uint(2)));
                float _4074 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4072)]);
                int _4076 = _164 + 4;
                uint _4078 = uint(int(uint(_4076) >> uint(2)));
                float _4080 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4078)]);
                int _4082 = _164 + 8;
                uint _4084 = uint(int(uint(_4082) >> uint(2)));
                float _4086 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4084)]);
                uint _4088 = uint(int(uint(_164) >> uint(2)));
                float _4090 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4088)]);
                int _4092 = _164 + 4;
                uint _4094 = uint(int(uint(_4092) >> uint(2)));
                float _4096 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4094)]);
                int _4098 = _164 + 8;
                uint _4100 = uint(int(uint(_4098) >> uint(2)));
                float _4102 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4100)]);
                float _4104 = _4064 * _3882;
                float _4106 = _4080 * _3882;
                float _4108 = fma(_4058, _3878, _4104);
                float _4110 = _4096 * _3882;
                float _4112 = fma(_4074, _3878, _4106);
                float _4114 = fma(_4090, _3878, _4110);
                float _4116 = fma(_4070, _3918, _4108);
                float _4118 = fma(_4086, _3918, _4112);
                float _4120 = fma(_4102, _3918, _4114);
                _3976 = _4118;
                _3962 = _4120;
                _3944 = _4116;
            }
        }
    }
    _4046 = false;
    float _4122 = _3976;
    float _4124 = _3962;
    float _4126 = _3944;
    float _4128 = 1.0 / _3560;
    float _4130 = _3950 * 0.5;
    float _4132 = _3950 * _3950;
    float _4134 = _3638 * 0.980571091175079345703125;
    float _4136 = fma(_4130, _4130, _4132);
    float _4138 = floor(_3954);
    float _4140 = fma(_3628, 0.19611422717571258544921875, _4134);
    float _4142 = _4136 * 0.083333335816860198974609375;
    float _4144 = _3606 * _4142;
    float _4146 = _4128 * (-59.999996185302734375);
    float _4148 = _3626 * _4144;
    float _4150 = fma(_4122, _4146, _3866);
    float _4152 = _3636 * 0.100000001490116119384765625;
    float _4154 = fma(_4124, _4146, _3868);
    float _4156 = _3622 * (-0.20000000298023223876953125);
    float _4158 = -_4138;
    float _4160 = _4158 + _3954;
    float _4162 = fma(_3622, 0.20000000298023223876953125, _4152);
    float _4164 = fma(_4126, _4146, _3870);
    float _4166 = _4156 * _3480;
    float _4168 = fma(_4160, 0.800000011920928955078125, 0.20000000298023223876953125);
    float _4170 = _3638 * 0.100000001490116119384765625;
    float _4172 = _3632 * (-0.20000000298023223876953125);
    float _4174 = _3950 * 0.300000011920928955078125;
    float _4176 = fma(_3632, 0.20000000298023223876953125, _4170);
    float _4178 = _4162 * _3480;
    float _4180 = -_4166;
    float _4182 = fma(_4172, _3482, _4180);
    float _4184 = _4174 * _4174;
    float _4186 = fma(_4174, _4174, _4132);
    float _4188 = -_4178;
    float _4190 = fma(_4176, _3482, _4188);
    float _4192 = _4164 + _4182;
    float _4194 = _3640 * 0.100000001490116119384765625;
    float _4196 = fma(_4130, _4130, _4184);
    float _4198 = _4164 + _4190;
    float _4200 = fma(_3972, _3972, 0.0400000028312206268310546875);
    float _4202 = _3602 * (-0.20000000298023223876953125);
    float _4204 = fma(_3602, 0.20000000298023223876953125, _4194);
    float _4206 = _4172 * _3484;
    float _4208 = fma(_4168, _4168, _4200);
    float _4210 = _4176 * _3484;
    float _4212 = _4202 * _3482;
    float _4214 = -_4206;
    float _4216 = fma(_4202, _3480, _4214);
    float _4218 = _4186 * 0.083333335816860198974609375;
    float _4220 = -_4210;
    float _4222 = fma(_4204, _3480, _4220);
    float _4224 = sqrt(_4208);
    float _4226 = _4204 * _3482;
    float _4228 = -_4212;
    float _4230 = fma(_4156, _3484, _4228);
    float _4232 = _4150 + _4216;
    float _4234 = _3626 * _4142;
    float _4236 = -_4226;
    float _4238 = fma(_4162, _3484, _4236);
    float _4240 = _4154 + _4230;
    float _4242 = _4150 + _4222;
    float _4244 = _3626 * _4234;
    float _4246 = _4154 + _4238;
    float _4248 = _4232 * _4232;
    float _4250 = _3606 * _4234;
    float _4252 = _3602 * _4218;
    float _4254 = _3628 * _4234;
    float _4256 = fma(_4192, _4192, _4248);
    float _4258 = _4242 * _4242;
    float _4260 = _4224 + 9.9999997473787516355514526367188e-06;
    float _4262 = fma(_3602, _4252, _4244);
    float _4264 = fma(_3622, _4252, _4250);
    float _4266 = fma(_3632, _4252, _4254);
    float _4268 = _3622 * _4218;
    float _4270 = _3606 * _4144;
    float _4272 = _3628 * _4144;
    float _4274 = _3628 * _4142;
    float _4276 = 1.0 / _4260;
    float _4278 = fma(_4198, _4198, _4258);
    float _4280 = fma(_3602, _4268, _4148);
    float _4282 = fma(_3622, _4268, _4270);
    float _4284 = fma(_3632, _4268, _4272);
    float _4286 = _4196 * 0.083333335816860198974609375;
    float _4288 = _3606 * _4274;
    float _4290 = fma(_4240, _4240, _4256);
    float _4292 = _3632 * _4218;
    float _4294 = fma(_4246, _4246, _4278);
    float _4296 = _3626 * _4274;
    float _4298 = rsqrt(_4290);
    float _4300 = fma(_3622, _4292, _4288);
    float _4302 = _3640 * _4286;
    float _4304 = fma(_3602, _4292, _4296);
    float _4306 = _3640 * 0.980571091175079345703125;
    float _4308 = _3628 * _4274;
    float _4310 = _4276 * _3972;
    float _4312 = fma(_3640, _4302, _4262);
    float _4314 = rsqrt(_4294);
    float _4316 = fma(_3636, _4302, _4264);
    float _4318 = fma(_3626, 0.19611422717571258544921875, _4306);
    float _4320 = fma(_3632, _4292, _4308);
    float _4322 = _3626 * _4310;
    float _4324 = _3636 * 0.980571091175079345703125;
    float _4326 = _3606 * _4310;
    float _4328 = _3628 * _4310;
    float _4330 = sqrt(_4290);
    float _4332 = _4276 * 0.20000000298023223876953125;
    float _4334 = fma(_3638, _4302, _4266);
    float _4336 = _4232 * _4298;
    float _4338 = fma(_3606, 0.19611422717571258544921875, _4324);
    float _4340 = -_4276;
    float _4342 = _4168 * _4340;
    float _4344 = fma(_3622, _4332, _4326);
    float _4346 = _4192 * _4298;
    float _4348 = sqrt(_4294);
    float _4350 = _4242 * _4314;
    float _4352 = _4198 * _4314;
    float _4354 = fma(_3602, _4332, _4322);
    float _4356 = fma(_3632, _4332, _4328);
    float _4358 = fma(_3636, _4342, _4344);
    float _4360 = _4240 * _4298;
    float _4362 = _4246 * _4314;
    bool _4364 = _4330 != 0.0;
    bool _4366 = isnan(_4330);
    bool _4368 = _4364 || _4366;
    bool _4370 = isnan(0.0);
    bool _4372 = _4368 || _4370;
    float _4374 = fma(_3640, _4342, _4354);
    float _4376 = fma(_3638, _4342, _4356);
    float _4378 = _4372 ? _4336 : 0.0;
    float _4380 = _4372 ? _4346 : 0.0;
    bool _4382 = _4348 != 0.0;
    bool _4384 = isnan(_4348);
    bool _4386 = _4382 || _4384;
    bool _4388 = isnan(0.0);
    bool _4390 = _4386 || _4388;
    float _4392 = _4378 * _4358;
    float _4394 = _4372 ? _4360 : 0.0;
    float _4396 = _4390 ? _4350 : 0.0;
    float _4398 = fma(_4380, _4374, _4392);
    float _4400 = _4390 ? _4352 : 0.0;
    float _4402 = 1.0 / _3952;
    float _4404 = _4390 ? _4362 : 0.0;
    float _4406 = _4396 * _4338;
    float _4408 = fma(_4394, _4376, _4398);
    float _4410 = fma(_4400, _4318, _4406);
    float _4412 = _4290 * _4408;
    float _4414 = _3636 * _4286;
    float _4416 = _3638 * _4286;
    float _4418 = fma(_4404, _4140, _4410);
    float _4420 = _4358 * _4412;
    float _4422 = fma(_3636, _4414, _4282);
    float _4424 = _4374 * _4412;
    float _4426 = _4294 * _4418;
    float _4428 = _4376 * _4412;
    float _4430 = fma(_3638, _4414, _4284);
    float _4432 = fma(_3636, _4416, _4300);
    float _4434 = _4338 * _4426;
    float _4436 = _4318 * _4426;
    float _4438 = _4140 * _4426;
    float _4440 = fma(_3640, _4414, _4280);
    float _4442 = -_4434;
    float _4444 = -_4420;
    float _4446 = _4442 + _4444;
    float _4448 = -_4436;
    float _4450 = -_4424;
    float _4452 = _4448 + _4450;
    float _4454 = -_4438;
    float _4456 = -_4428;
    float _4458 = _4454 + _4456;
    float _4460 = fma(_3638, _4416, _4320);
    float _4462 = _4446 * _4402;
    float _4464 = _4452 * _4402;
    float _4466 = _4458 * _4402;
    float _4468 = _4422 * _4334;
    float _4470 = _4462 * _4462;
    float _4472 = _4316 * _3482;
    float _4474 = fma(_3640, _4416, _4304);
    float _4476 = _4432 * _3482;
    float _4478 = fma(_4464, _4464, _4470);
    float _4480 = _4432 * _4430;
    float _4482 = -_4468;
    float _4484 = fma(_4316, _4430, _4482);
    float _4486 = fma(_4312, _3484, _4472);
    float _4488 = fma(_4466, _4466, _4478);
    float _4490 = _4316 * _4460;
    float _4492 = _4432 * _4334;
    float _4494 = _4422 * _3482;
    float _4496 = sqrt(_4488);
    float _4498 = fma(_4474, _3484, _4476);
    float _4500 = -_4480;
    float _4502 = fma(_4422, _4460, _4500);
    float _4504 = fma(_4334, _3480, _4486);
    float _4506 = -_4492;
    float _4508 = _4490 + _4506;
    float _4510 = fma(_4440, _3484, _4494);
    float _4512 = fma(_4460, _3480, _4498);
    float _4514 = _4504 * _3480;
    float _4516 = _4440 * _4508;
    float _4518 = fma(_4430, _3480, _4510);
    float _4520 = _4512 * _3482;
    float _4522 = -_4514;
    float _4524 = fma(_4512, _3484, _4522);
    float _4526 = -_4516;
    float _4528 = fma(_4312, _4502, _4526);
    float _4530 = _4518 * _3484;
    float _4532 = -_4520;
    float _4534 = fma(_4518, _3480, _4532);
    float _4536 = -_4438;
    float _4538 = _4204 * _4536;
    bool _4540 = _4496 > 80.0;
    float _4542 = fma(_4474, _4484, _4528);
    float _4544 = -_4530;
    float _4546 = fma(_4504, _3482, _4544);
    float _4548 = -_4436;
    float _4550 = -_4538;
    float _4552 = fma(_4176, _4548, _4550);
    float _4554 = -_4434;
    float _4556 = _4176 * _4554;
    float _4558 = -_4428;
    float _4560 = _4202 * _4558;
    bool _4562 = _4542 != 0.0;
    bool _4564 = isnan(_4542);
    bool _4566 = _4562 || _4564;
    bool _4568 = isnan(0.0);
    bool _4570 = _4566 || _4568;
    float _4572 = -_4436;
    float _4574 = _4162 * _4572;
    float _4576 = -_4420;
    float _4578 = _4172 * _4576;
    float _4580 = -_4438;
    float _4582 = -_4556;
    float _4584 = fma(_4162, _4580, _4582);
    float _4586 = -_4424;
    float _4588 = -_4560;
    float _4590 = fma(_4172, _4586, _4588);
    float _4592 = -_4424;
    float _4594 = _4156 * _4592;
    float _4596 = -_4428;
    float _4598 = -_4578;
    float _4600 = fma(_4156, _4596, _4598);
    float _4602 = _4424;
    float _4604 = _4590;
    float _4606 = _4578;
    float _4608 = _4316;
    float _4610 = _4422;
    float _4612 = _4312;
    float _4614 = _4432;
    float _4616 = _4440;
    float _4618 = _4474;
    float _4620 = _4334;
    float _4622 = _4584;
    float _4624 = _4464;
    float _4626 = _4462;
    if (_4540)
    {
        float _4628 = rsqrt(_4488);
        _4602 = _4628;
    }
    float _4630 = _4602;
    float _4632 = _4552 + _4590;
    float _4634 = -_4434;
    float _4636 = -_4574;
    float _4638 = fma(_4204, _4634, _4636);
    float _4640 = -_4420;
    float _4642 = -_4594;
    float _4644 = fma(_4202, _4640, _4642);
    float _4646 = _4584 + _4600;
    float _4648 = _4632 + _4524;
    float _4650 = _4644;
    if (!_4570)
    {
        _4604 = _4430;
    }
    float _4652 = _4604;
    float _4654 = _4652;
    if (!_4570)
    {
        _4606 = _4460;
    }
    float _4656 = _4606;
    bool _4658 = !_4570;
    float _4660 = _4656;
    if (!_4658)
    {
        float _4662 = 1.0 / _4542;
        float _4664 = _4440 * _4460;
        float _4666 = _4312 * _4430;
        float _4668 = _4312 * _4432;
        float _4670 = _4474 * _4422;
        float _4672 = _4474 * _4334;
        float _4674 = _4440 * _4316;
        float _4676 = -_4664;
        float _4678 = fma(_4474, _4430, _4676);
        float _4680 = -_4666;
        float _4682 = fma(_4440, _4334, _4680);
        float _4684 = -_4490;
        float _4686 = _4684 + _4492;
        float _4688 = -_4668;
        float _4690 = fma(_4474, _4316, _4688);
        float _4692 = -_4670;
        float _4694 = fma(_4440, _4432, _4692);
        float _4696 = -_4672;
        float _4698 = fma(_4312, _4460, _4696);
        float _4700 = -_4674;
        float _4702 = fma(_4312, _4422, _4700);
        float _4704 = _4678 * _4662;
        float _4706 = _4682 * _4662;
        float _4708 = _4502 * _4662;
        float _4710 = _4686 * _4662;
        float _4712 = _4484 * _4662;
        float _4714 = _4694 * _4662;
        float _4716 = _4698 * _4662;
        float _4718 = _4690 * _4662;
        float _4720 = _4702 * _4662;
        _4608 = _4710;
        _4610 = _4716;
        _4612 = _4708;
        _4614 = _4718;
        _4616 = _4704;
        _4618 = _4714;
        _4660 = _4720;
        _4620 = _4712;
        _4654 = _4706;
        _4622 = _4694;
    }
    float _4722 = _4608;
    float _4724 = _4610;
    float _4726 = _4612;
    float _4728 = _4614;
    float _4730 = _4616;
    float _4732 = _4618;
    float _4734 = _4660;
    float _4736 = _4620;
    float _4738 = _4654;
    float _4740 = _4622;
    float _4742 = _4638 + _4644;
    float _4744 = _4646 + _4534;
    float _4746 = _4648 * _4722;
    float _4748 = _4648 * _4724;
    float _4750 = _4746;
    float _4752 = _4738;
    float _4754 = _4740;
    if (_4540)
    {
        float _4756 = _4630 * 80.0;
        _4650 = _4756;
    }
    float _4758 = _4650;
    float _4760 = _4742 + _4546;
    float _4762 = fma(_4744, _4726, _4746);
    float _4764 = _4648 * _4728;
    float _4766 = fma(_4744, _4730, _4748);
    if (!_4540)
    {
        _4750 = _4466;
    }
    float _4768 = _4750;
    float _4770 = _4768;
    if (_4540)
    {
        float _4772 = _4464 * _4758;
        _4624 = _4772;
    }
    float _4774 = _4624;
    float _4776 = _3560 * 0.01666666753590106964111328125;
    if (_4540)
    {
        float _4778 = _4462 * _4758;
        _4626 = _4778;
    }
    float _4780 = _4626;
    if (_4540)
    {
        float _4782 = _4466 * _4758;
        _4770 = _4782;
    }
    float _4784 = _4770;
    float _4786 = fma(_4744, _4732, _4764);
    float _4788 = fma(_4776, _4774, _3870);
    float _4790 = fma(_4776, _4780, _3866);
    float _4792 = fma(_4776, _4784, _3868);
    float _4794 = fma(_4760, _4734, _4786);
    float _4796 = fma(_4760, _4736, _4762);
    float _4798 = fma(_4760, _4738, _4766);
    float _4800 = _4788 * 0.01666666753590106964111328125;
    float _4802 = _4790 * 0.01666666753590106964111328125;
    float _4804 = _4792 * 0.01666666753590106964111328125;
    bool _4806 = !_1120;
    float _4808 = _4792;
    float _4810 = _4798;
    float _4812 = _4796;
    float _4814 = _4794;
    float _4936;
    float _4938;
    float _4940;
    if (!_4806)
    {
        float _4816 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _4818 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _4820 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _4822 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _4824 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _4826 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _4828 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _4830 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _4832 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _4834 = _4820 * _4822;
        float _4836 = _4820 * _4824;
        float _4838 = _4818 * _4822;
        float _4840 = -_4834;
        float _4842 = fma(_4816, _4826, _4840);
        float _4844 = -_4836;
        float _4846 = fma(_4818, _4826, _4844);
        float _4848 = -_4838;
        float _4850 = fma(_4816, _4824, _4848);
        float _4852 = _4830 * _4816;
        float _4854 = _4830 * _4842;
        float _4856 = _4832 * _4818;
        float _4858 = _4828 * _4824;
        float _4860 = -_4852;
        float _4862 = fma(_4828, _4818, _4860);
        float _4864 = -_4854;
        float _4866 = fma(_4828, _4846, _4864);
        float _4868 = _4830 * _4826;
        float _4870 = _4832 * _4822;
        float _4872 = _4828 * _4820;
        float _4874 = fma(_4832, _4850, _4866);
        float _4876 = -_4868;
        float _4878 = fma(_4832, _4824, _4876);
        float _4880 = -_4870;
        float _4882 = fma(_4828, _4826, _4880);
        float _4884 = -_4858;
        float _4886 = fma(_4830, _4822, _4884);
        float _4888 = 1.0 / _4874;
        float _4890 = -_4872;
        float _4892 = fma(_4832, _4816, _4890);
        float _4894 = -_4816;
        float _4896 = fma(_4894, _4826, _4834);
        float _4898 = -_4856;
        float _4900 = fma(_4830, _4820, _4898);
        float _4902 = _4878 * _4888;
        float _4904 = _4882 * _4888;
        float _4906 = _4886 * _4888;
        float _4908 = _4800 * _4888;
        float _4910 = _4802 * _4902;
        float _4912 = _4802 * _4904;
        float _4914 = _4802 * _4906;
        float _4916 = _4896 * _4888;
        float _4918 = _4900 * _4888;
        float _4920 = _4892 * _4888;
        float _4922 = _4862 * _4888;
        float _4924 = fma(_4846, _4908, _4910);
        float _4926 = fma(_4800, _4916, _4912);
        float _4928 = fma(_4850, _4908, _4914);
        float _4930 = fma(_4804, _4918, _4924);
        float _4932 = fma(_4804, _4920, _4926);
        float _4934 = fma(_4804, _4922, _4928);
        _4936 = _4932;
        _4938 = _4930;
        _4940 = _4934;
        _4942 = true;
    }
    else
    {
        bool _4944 = _1206 != 0;
        bool _4946 = _1280 != 0;
        bool _4948 = _4946 || _4944;
        if (!_4948)
        {
            _4808 = _4800;
        }
        float _4950 = _4808;
        _4938 = _4950;
        if (!_4948)
        {
            _4752 = _4802;
        }
        float _4952 = _4752;
        _4936 = _4952;
        if (!_4948)
        {
            _4754 = _4804;
        }
        float _4954 = _4754;
        bool _4956 = !_4948;
        _4940 = _4954;
        if (!_4956)
        {
            uint _4958 = uint(int(uint(_164) >> uint(2)));
            float _4960 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4958)]);
            int _4962 = _164 + 4;
            uint _4964 = uint(int(uint(_4962) >> uint(2)));
            float _4966 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4964)]);
            int _4968 = _164 + 8;
            uint _4970 = uint(int(uint(_4968) >> uint(2)));
            float _4972 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4970)]);
            uint _4974 = uint(int(uint(_164) >> uint(2)));
            float _4976 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4974)]);
            int _4978 = _164 + 4;
            uint _4980 = uint(int(uint(_4978) >> uint(2)));
            float _4982 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4980)]);
            int _4984 = _164 + 8;
            uint _4986 = uint(int(uint(_4984) >> uint(2)));
            float _4988 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4986)]);
            uint _4990 = uint(int(uint(_164) >> uint(2)));
            float _4992 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4990)]);
            int _4994 = _164 + 4;
            uint _4996 = uint(int(uint(_4994) >> uint(2)));
            float _4998 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4996)]);
            int _5000 = _164 + 8;
            uint _5002 = uint(int(uint(_5000) >> uint(2)));
            float _5004 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5002)]);
            float _5006 = _4972 * _4976;
            float _5008 = _4972 * _4982;
            float _5010 = _4966 * _4976;
            float _5012 = -_5006;
            float _5014 = fma(_4960, _4988, _5012);
            float _5016 = -_5008;
            float _5018 = fma(_4966, _4988, _5016);
            float _5020 = -_5010;
            float _5022 = fma(_4960, _4982, _5020);
            float _5024 = _4998 * _4960;
            float _5026 = _4998 * _5014;
            float _5028 = _5004 * _4966;
            float _5030 = _4992 * _4982;
            float _5032 = -_5024;
            float _5034 = fma(_4992, _4966, _5032);
            float _5036 = -_5026;
            float _5038 = fma(_4992, _5018, _5036);
            float _5040 = _4998 * _4988;
            float _5042 = _5004 * _4976;
            float _5044 = -_5028;
            float _5046 = fma(_4998, _4972, _5044);
            float _5048 = fma(_5004, _5022, _5038);
            float _5050 = -_5040;
            float _5052 = fma(_5004, _4982, _5050);
            float _5054 = -_5042;
            float _5056 = fma(_4992, _4988, _5054);
            float _5058 = -_5030;
            float _5060 = fma(_4998, _4976, _5058);
            float _5062 = 1.0 / _5048;
            float _5064 = _4992 * _4972;
            float _5066 = -_4960;
            float _5068 = fma(_5066, _4988, _5006);
            float _5070 = -_5064;
            float _5072 = fma(_5004, _4960, _5070);
            float _5074 = _5052 * _5062;
            float _5076 = _5056 * _5062;
            float _5078 = _5060 * _5062;
            float _5080 = _4800 * _5062;
            float _5082 = _5074 * _4802;
            float _5084 = _5076 * _4802;
            float _5086 = _5078 * _4802;
            float _5088 = _5068 * _5062;
            float _5090 = _5046 * _5062;
            float _5092 = _5072 * _5062;
            float _5094 = _5034 * _5062;
            float _5096 = fma(_5018, _5080, _5082);
            float _5098 = fma(_5088, _4800, _5084);
            float _5100 = fma(_5022, _5080, _5086);
            float _5102 = fma(_5090, _4804, _5096);
            float _5104 = fma(_5092, _4804, _5098);
            float _5106 = fma(_5094, _4804, _5100);
            _4936 = _5104;
            _4938 = _5102;
            _4940 = _5106;
        }
    }
    _4942 = false;
    float _5108 = _4936;
    float _5110 = _4938;
    float _5112 = _4940;
    float _5114 = _4798 * _4798;
    float _5116 = _3560 * (-0.0291463173925876617431640625);
    float _5118 = fma(_4796, _4796, _5114);
    float _5120 = exp2(_5116);
    float _5122 = fma(_4794, _4794, _5118);
    float _5124 = sqrt(_5122);
    float _5126 = _5124 * 0.01666666753590106964111328125;
    bool _5128 = _5126 > 1.57079637050628662109375;
    float _5130 = _5126;
    if (_5128)
    {
        float _5132 = rsqrt(_5122);
        _5130 = _5132;
    }
    float _5134 = _5130;
    float _5136 = _5134;
    if (_5128)
    {
        float _5138 = _5134 * 94.24777984619140625;
        _5136 = _5138;
    }
    float _5140 = _5136;
    if (_5128)
    {
        float _5142 = _4798 * _5140;
        _4810 = _5142;
    }
    float _5144 = _4810;
    if (_5128)
    {
        float _5146 = _4796 * _5140;
        _4812 = _5146;
    }
    float _5148 = _4812;
    if (_5128)
    {
        float _5150 = _4794 * _5140;
        _4814 = _5150;
    }
    float _5152 = _4814;
    float _5154 = fma(_4776, _5144, _3482);
    float _5156 = fma(_4776, _5148, _3484);
    float _5158 = fma(_4776, _5152, _3480);
    float _5160 = _5154 * _5120;
    float _5162 = _5156 * _5120;
    float _5164 = _5158 * _5120;
    float _5166 = _5160 * _5160;
    float _5168 = fma(_5162, _5162, _5166);
    float _5170 = fma(_5164, _5164, _5168);
    float _5172 = sqrt(_5170);
    bool _5174 = _5172 > 31.4159259796142578125;
    float _5176 = _5172;
    float _5178 = _5160;
    float _5180 = _5162;
    float _5182 = _5164;
    if (_5174)
    {
        float _5184 = rsqrt(_5170);
        _5176 = _5184;
    }
    float _5186 = _5176;
    float _5188 = _5186;
    if (_5174)
    {
        float _5190 = _5186 * 31.4159259796142578125;
        _5188 = _5190;
    }
    float _5192 = _5188;
    if (_5174)
    {
        float _5194 = _5160 * _5192;
        _5178 = _5194;
    }
    float _5196 = _5178;
    if (_5174)
    {
        float _5198 = _5162 * _5192;
        _5180 = _5198;
    }
    float _5200 = _5180;
    if (_5174)
    {
        float _5202 = _5164 * _5192;
        _5182 = _5202;
    }
    float _5204 = _5182;
    float _5206 = _4776 * _5196;
    float _5208 = _4776 * _5200;
    float _5210 = _4776 * _5204;
    float _5212 = _5206 * _5206;
    float _5214 = fma(_5208, _5208, _5212);
    float _5216 = fma(_5210, _5210, _5214);
    float _5218 = sqrt(_5216);
    float _5220 = rsqrt(_5216);
    float _5222 = _5218 * 0.5;
    bool _5224 = _5218 != 0.0;
    bool _5226 = isnan(_5218);
    bool _5228 = _5224 || _5226;
    bool _5230 = isnan(0.0);
    bool _5232 = _5228 || _5230;
    float _5234 = _5222 * 0.15915493667125701904296875;
    float _5236 = _5234 * 6.283185482025146484375;
    float _5238 = sin(_5236);
    float _5240 = _5210 * _5220;
    float _5242 = _5206 * _5220;
    float _5244 = _5208 * _5220;
    float _5246 = _5232 ? _5240 : 0.0;
    float _5248 = _5232 ? _5242 : 0.0;
    float _5250 = _5234 * 6.283185482025146484375;
    float _5252 = cos(_5250);
    float _5254 = _5232 ? _5244 : 0.0;
    float _5256 = _5246 * _5238;
    float _5258 = _5248 * _5238;
    float _5260 = _5254 * _5238;
    float _5262 = _5256 * _3470;
    float _5264 = _5258 * _3476;
    float _5266 = _5258 * _3470;
    float _5268 = _5258 * _3478;
    float _5270 = -_5262;
    float _5272 = fma(_5258, _3472, _5270);
    float _5274 = -_5264;
    float _5276 = fma(_5260, _3470, _5274);
    float _5278 = _5260 * _3478;
    float _5280 = _5260 * _3472;
    float _5282 = _5256 * _3478;
    float _5284 = fma(_5260, _3476, _5266);
    float _5286 = fma(_5252, _3476, _5278);
    float _5288 = fma(_5252, _3470, _5268);
    float _5290 = -_5280;
    float _5292 = fma(_5256, _3476, _5290);
    float _5294 = fma(_5252, _3472, _5282);
    float _5296 = fma(_5256, _3472, _5284);
    float _5298 = _5286 + _5272;
    float _5300 = _5288 + _5292;
    float _5302 = _5294 + _5276;
    float _5304 = -_5296;
    float _5306 = fma(_5252, _3478, _5304);
    uint _5308 = uint(int(uint(_1052) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_5308)] = as_type<uint>(_5298);
    int _5310 = _1052 + 4;
    uint _5312 = uint(int(uint(_5310) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_5312)] = as_type<uint>(_5300);
    int _5314 = _1052 + 8;
    uint _5316 = uint(int(uint(_5314) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_5316)] = as_type<uint>(_5302);
    int _5318 = _1052 + 12;
    uint _5320 = uint(int(uint(_5318) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_5320)] = as_type<uint>(_5306);
    uint _5322 = uint(int(uint(_1204) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_5322)] = as_type<uint>(_5200);
    int _5324 = _1204 + 4;
    uint _5326 = uint(int(uint(_5324) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_5326)] = as_type<uint>(_5196);
    int _5328 = _1204 + 8;
    uint _5330 = uint(int(uint(_5328) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_5330)] = as_type<uint>(_5204);
    int _5332 = _1204 + 12;
    uint _5334 = uint(int(uint(_5332) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_5334)] = uint(_3486);
    float _5336 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[71]);
    int _5338 = _164 + 4;
    int _5340 = _164 + 8;
    uint _5342 = uint(int(uint(_186) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_5342)] = as_type<uint>(_554);
    float _5344 = -_168;
    float _5346 = _5344 + _3696;
    float _5348 = -_180;
    float _5350 = _5348 + _3694;
    uint _5352 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_5352)] = as_type<uint>(_3696);
    float _5354 = _5108 * _5108;
    float _5356 = _3692 + _5336;
    float _5358 = -_174;
    float _5360 = _5358 + _5356;
    uint _5362 = uint(int(uint(_5338) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_5362)] = as_type<uint>(_5356);
    uint _5364 = uint(int(uint(_5340) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_5364)] = as_type<uint>(_3694);
    uint _5366 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_5366)] = as_type<uint>(_5110);
    uint _5368 = uint(int(uint(_5338) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_5368)] = as_type<uint>(_5108);
    uint _5370 = uint(int(uint(_5340) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_5370)] = as_type<uint>(_5112);
    uint _5372 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_5372)] = as_type<uint>(_5346);
    uint _5374 = uint(int(uint(_5338) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_5374)] = as_type<uint>(_5360);
    uint _5376 = uint(int(uint(_5340) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_5376)] = as_type<uint>(_5350);
    float _5378 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _5380 = _5360 * _5360;
    float _5382 = fma(_5110, _5110, _5354);
    float _5384 = fma(_5346, _5346, _5380);
    float _5386 = fma(_5112, _5112, _5382);
    float _5388 = fma(_5350, _5350, _5384);
    float _5390 = sqrt(_5386);
    float _5392 = sqrt(_5388);
    bool _5394 = _5392 >= 9.9999999747524270787835121154785e-07;
    bool _5396 = isnan(_5392);
    bool _5398 = _5394 || _5396;
    bool _5400 = isnan(9.9999999747524270787835121154785e-07);
    bool _5402 = _5398 || _5400;
    if (!_5402)
    {
        bool _5404 = _530 != _282;
        bool _5406 = isnan(_530);
        bool _5408 = _5404 || _5406;
        bool _5410 = isnan(_282);
        bool _5412 = _5408 || _5410;
        _5414 = _5412;
        if (!_5414)
        {
            float _5416 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _5418 = _5416 > 0.0;
            bool _5420 = !_5418;
            if (!_5420)
            {
                float _5422 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _5424 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _5426 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _5428 = _5424 * _5424;
                float _5430 = fma(_5422, _5422, _5428);
                float _5432 = fma(_5426, _5426, _5430);
                float _5434 = rsqrt(_5432);
                float _5436 = _5434 * 9.9999999747524270787835121154785e-07;
                float _5438 = _5422 * _5436;
                float _5440 = _5424 * _5436;
                float _5442 = _5426 * _5436;
                _320 = as_type<int>(_5438);
                _322 = as_type<int>(_5440);
                _324 = as_type<int>(_5442);
                _5414 = true;
            }
            else
            {
                bool _5444 = _5390 >= 9.9999999747524270787835121154785e-07;
                bool _5446 = isnan(_5390);
                bool _5448 = _5444 || _5446;
                bool _5450 = isnan(9.9999999747524270787835121154785e-07);
                bool _5452 = _5448 || _5450;
                if (!_5452)
                {
                    float _5454 = _5356 * _5356;
                    float _5456 = fma(_3696, _3696, _5454);
                    float _5458 = fma(_3694, _3694, _5456);
                    float _5460 = sqrt(_5458);
                    bool _5462 = _5460 >= 9.9999999747524270787835121154785e-07;
                    bool _5464 = isnan(_5460);
                    bool _5466 = _5462 || _5464;
                    bool _5468 = isnan(9.9999999747524270787835121154785e-07);
                    bool _5470 = _5466 || _5468;
                    float _5472 = _5460;
                    if (_5470)
                    {
                        float _5474 = rsqrt(_5458);
                        _5472 = _5474;
                    }
                    float _5476 = _5472;
                    if (!_5470)
                    {
                        _308 = 0;
                    }
                    int _5478 = _308;
                    int _5480 = _5478;
                    if (!_5470)
                    {
                        _310 = 897988541;
                    }
                    int _5482 = _310;
                    int _5484 = _5482;
                    if (!_5470)
                    {
                        _312 = 0;
                    }
                    int _5486 = _312;
                    float _5488 = _5476;
                    int _5490 = _5486;
                    if (_5470)
                    {
                        float _5492 = _5476 * 9.9999999747524270787835121154785e-07;
                        _5488 = _5492;
                    }
                    float _5494 = _5488;
                    if (_5470)
                    {
                        float _5496 = _3696 * _5494;
                        _5480 = as_type<int>(_5496);
                    }
                    int _5498 = _5480;
                    _320 = _5498;
                    if (_5470)
                    {
                        float _5500 = _5356 * _5494;
                        _5484 = as_type<int>(_5500);
                    }
                    int _5502 = _5484;
                    _322 = _5502;
                    if (_5470)
                    {
                        float _5504 = _3694 * _5494;
                        _5490 = as_type<int>(_5504);
                    }
                    int _5506 = _5490;
                    _324 = _5506;
                    _5414 = true;
                }
                else
                {
                    float _5508 = rsqrt(_5386);
                    float _5510 = _5508 * 9.9999999747524270787835121154785e-07;
                    float _5512 = _5110 * _5510;
                    float _5514 = _5108 * _5510;
                    float _5516 = _5112 * _5510;
                    _320 = as_type<int>(_5512);
                    _322 = as_type<int>(_5514);
                    _324 = as_type<int>(_5516);
                    _5414 = true;
                }
            }
        }
    }
    else
    {
        float _5518 = _5390 * _5378;
        bool _5520 = _5518 >= 0.001000000047497451305389404296875;
        bool _5522 = isnan(_5518);
        bool _5524 = _5520 || _5522;
        bool _5526 = isnan(0.001000000047497451305389404296875);
        bool _5528 = _5524 || _5526;
        bool _5530 = _5518 > 0.0;
        bool _5532 = !_5528;
        bool _5534 = _5530 && _5532;
        bool _5536 = _5392 < 0.001000000047497451305389404296875;
        bool _5538 = _5536 && _5534;
        if (!_5538)
        {
            _314 = as_type<int>(_5346);
        }
        int _5540 = _314;
        int _5542 = _5540;
        if (_5538)
        {
            float _5544 = _5378 * _5110;
            _5542 = as_type<int>(_5544);
        }
        int _5546 = _5542;
        _320 = _5546;
        if (!_5538)
        {
            _316 = as_type<int>(_5360);
        }
        int _5548 = _316;
        int _5550 = _5548;
        if (_5538)
        {
            float _5552 = _5378 * _5108;
            _5550 = as_type<int>(_5552);
        }
        int _5554 = _5550;
        _322 = _5554;
        if (!_5538)
        {
            _318 = as_type<int>(_5350);
        }
        int _5556 = _318;
        _324 = _5556;
        if (_5538)
        {
            float _5558 = _5378 * _5112;
            _324 = as_type<int>(_5558);
        }
    }
    _5414 = false;
    int _5560 = _320;
    int _5562 = _322;
    int _5564 = _324;
    uint _5566 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_5566)] = uint(_5560);
    uint _5568 = uint(int(uint(_5338) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_5568)] = uint(_5562);
    uint _5570 = uint(int(uint(_5340) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_5570)] = uint(_5564);
}

