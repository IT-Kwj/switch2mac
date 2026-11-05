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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    device _23* cp_s14 [[id(15)]];
    device _23* cp_s15 [[id(16)]];
    texture2d_array<float> cp_t_tcb_16 [[id(17)]];
    sampler cp_t_tcb_16Smplr [[id(18)]];
    texture2d_array<float> cp_t_tcb_14 [[id(19)]];
    sampler cp_t_tcb_14Smplr [[id(20)]];
    texture2d<float> cp_t_tcb_2A [[id(21)]];
    sampler cp_t_tcb_2ASmplr [[id(22)]];
    texture2d<float> cp_t_tcb_2C [[id(23)]];
    sampler cp_t_tcb_2CSmplr [[id(24)]];
    texture2d<float> cp_t_tcb_26 [[id(25)]];
    sampler cp_t_tcb_26Smplr [[id(26)]];
    sampler cp_t_tcb_14Smplr_w [[id(27)]];
    sampler cp_t_tcb_2ASmplr_w [[id(28)]];
    sampler cp_t_tcb_2CSmplr_w [[id(29)]];
    sampler cp_t_tcb_26Smplr_w [[id(30)]];
    constant dm_border_t* dm_border [[id(31)]];
};

static inline __attribute__((always_inline))
void _87(thread const int& _24886, thread const int& _24887, thread const int& _24888, thread const int& _24889, thread int& _24890, thread int& _24891, thread int& _24892, thread int& _24893, thread int& _24894)
{
    float _24897 = as_type<float>(_24888) + 0.0;
    bool _24899 = _24897 != 0.0;
    bool _24901 = isnan(_24897);
    bool _24903 = _24899 || _24901;
    bool _24905 = isnan(0.0);
    bool _24907 = _24903 || _24905;
    int _24909 = as_type<int>(_24897);
    int _24911 = _24887;
    int _24913 = _24907 ? (-1) : 0;
    if (!_24907)
    {
        float _24915 = as_type<float>(_24888) * 1.0;
        _24909 = as_type<int>(_24915);
    }
    int _24917 = _24909;
    bool _24919 = !_24907;
    int _24921 = _24917;
    if (!_24919)
    {
        float _24923 = as_type<float>(_24888) + 0.0;
        bool _24925 = _24923 >= 0.0;
        bool _24927 = isnan(_24923);
        bool _24929 = _24925 || _24927;
        bool _24931 = isnan(0.0);
        bool _24933 = _24929 || _24931;
        int _24935 = as_type<int>(_24923);
        _24913 = _24933 ? (-1) : 0;
        if (!_24933)
        {
            _24935 = 2147483647;
        }
        int _24937 = _24935;
        bool _24939 = !_24933;
        _24921 = _24937;
        if (!_24939)
        {
            float _24941 = as_type<float>(_24888) + 0.0;
            bool _24943 = _24941 > as_type<float>(0x7f800000u /* inf */);
            bool _24945 = isnan(_24941);
            bool _24947 = _24943 || _24945;
            bool _24949 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _24951 = _24947 || _24949;
            int _24953 = as_type<int>(_24941);
            _24913 = _24951 ? (-1) : 0;
            if (_24951)
            {
                float _24955 = as_type<float>(_24888) + 1.0;
                _24953 = as_type<int>(_24955);
            }
            int _24957 = _24953;
            _24921 = _24957;
            if (!_24951)
            {
                float _24959 = 0.0 + as_type<float>(_24888);
                bool _24961 = _24959 != as_type<float>(0x7f800000u /* inf */);
                bool _24963 = isnan(_24959);
                bool _24965 = _24961 || _24963;
                bool _24967 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _24969 = _24965 || _24967;
                int _24971 = as_type<int>(_24959);
                _24913 = _24969 ? (-1) : 0;
                if (!_24969)
                {
                    _24971 = _24888;
                }
                int _24973 = _24971;
                bool _24975 = !_24969;
                _24921 = _24973;
                if (!_24975)
                {
                    float _24977 = as_type<float>(_24888) * 18446744073709551616.0;
                    float _24979 = rsqrt(_24977);
                    float _24981 = _24977 * _24979;
                    float _24983 = _24979 * 0.5;
                    float _24985 = -_24981;
                    float _24987 = 0.0 + _24985;
                    float _24989 = fma(_24983, _24987, 0.5);
                    float _24991 = fma(_24981, _24989, _24981);
                    float _24993 = -_24991;
                    float _24995 = 0.0 + _24993;
                    float _24997 = fma(_24991, _24995, _24977);
                    float _24999 = fma(_24983, _24997, _24991);
                    float _25001 = _24999 * 2.3283064365386962890625e-10;
                    _24921 = as_type<int>(_25001);
                    _24911 = as_type<int>(_24991);
                }
            }
        }
    }
    int _25003 = _24921;
    int _25005 = _24911;
    int _25007 = _24913;
    _24890 = _25003;
    _24891 = _24889;
    _24892 = 0;
    _24893 = _25005;
    _24894 = _25007;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _9852 = false;
    bool _8214 = false;
    bool _7918 = false;
    bool _7530 = false;
    bool _6882 = false;
    bool _6714 = false;
    bool _6358 = false;
    bool _5422 = false;
    bool _5164 = false;
    bool _4786 = false;
    bool _3900 = false;
    bool _3244 = false;
    bool _3286 = false;
    bool _3074 = false;
    bool _830 = false;
    float _91 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _93 = as_type<float>(gl_LocalInvocationID.x);
    float _95 = as_type<float>(gl_WorkGroupID.x);
    int _97 = as_type<int>(_95) << 5;
    int _99 = _97 + as_type<int>(_93);
    float _101 = trunc(_91);
    int _103 = int(_101);
    bool _107 = _99 >= _103;
    int _109 = 0;
    if (_107)
    {
        _109 = 0;
    }
    int _111 = _109;
    int _113 = _111;
    int _115 = _111;
    if (!_107)
    {
        int _117 = _99 << 4;
        int _119 = _117 + 12;
        uint _122 = uint(int(uint(_119) >> uint(2)));
        float _124 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_122)]);
        float _126 = trunc(_124);
        int _128 = int(_126);
        bool _130 = _128 >= 1;
        int _132 = _130 ? (-1) : 0;
        if (!_130)
        {
            _113 = 0;
        }
        int _134 = _113;
        bool _136 = !_130;
        _115 = _134;
        if (!_136)
        {
            float _138 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _140 = uint(int(uint(_119) >> uint(2)));
            float _142 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_140)]);
            float _144 = float(_128);
            float _146 = -_142;
            float _148 = _138 + _146;
            bool _150 = _148 > _144;
            int _152 = as_type<int>(_138);
            if (!_150)
            {
                bool _154 = _138 >= _142;
                bool _156 = isnan(_138);
                bool _158 = _154 || _156;
                bool _160 = isnan(_142);
                bool _162 = _158 || _160;
                _132 = _162 ? (-1) : 0;
            }
            int _164 = _132;
            if (_150)
            {
                _152 = 0;
            }
            int _166 = _152;
            _115 = _166;
            if (!_150)
            {
                int _168 = ~_164;
                int _170 = (_168 != 0) ? 0 : 1;
                _115 = _170;
            }
        }
    }
    int _172 = _115;
    int _174 = _172 & 1;
    bool _176 = _174 != 0;
    if (!_176)
    {
        return;
    }
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _180 = _99 << 4;
    uint _182 = uint(int(uint(_180) >> uint(2)));
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_182)]);
    int _186 = _180 + 4;
    uint _188 = uint(int(uint(_186) >> uint(2)));
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_188)]);
    int _192 = _180 + 8;
    uint _194 = uint(int(uint(_192) >> uint(2)));
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_194)]);
    int _198 = as_type<int>(_178) & 512;
    bool _200 = _198 != 0;
    int _202 = _180 + 12;
    uint _204 = uint(int(uint(_180) >> uint(2)));
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_204)]);
    int _208 = _180 + 4;
    uint _210 = uint(int(uint(_208) >> uint(2)));
    float _212 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_210)]);
    int _214 = _180 + 8;
    uint _216 = uint(int(uint(_214) >> uint(2)));
    float _218 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_216)]);
    uint _220 = uint(int(uint(_180) >> uint(2)));
    float _222 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_220)]);
    int _224 = _180 + 4;
    uint _226 = uint(int(uint(_224) >> uint(2)));
    float _228 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_226)]);
    int _230 = _180 + 8;
    uint _232 = uint(int(uint(_230) >> uint(2)));
    float _234 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_232)]);
    float _236 = 0.0;
    float _238 = 0.0;
    float _240 = 0.0;
    if (_200)
    {
        float _242 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _244 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _246 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _236 = _242;
        _238 = _244;
        _240 = _246;
    }
    float _248 = _236;
    float _250 = _238;
    float _252 = _240;
    float _254 = 0.0;
    float _256 = 0.0;
    float _258 = 0.0;
    if (_200)
    {
        float _260 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _262 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _264 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _254 = _260;
        _256 = _262;
        _258 = _264;
    }
    float _266 = _254;
    float _268 = _256;
    float _270 = _258;
    float _272 = 0.0;
    float _274 = 0.0;
    float _276 = 0.0;
    if (_200)
    {
        float _278 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _280 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _282 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _272 = _278;
        _274 = _280;
        _276 = _282;
    }
    float _284 = _272;
    float _286 = _274;
    float _288 = _276;
    uint _290 = uint(int(uint(_180) >> uint(2)));
    float _292 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_290)]);
    int _294 = _180 + 4;
    uint _296 = uint(int(uint(_294) >> uint(2)));
    float _298 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_296)]);
    uint _300 = uint(int(uint(_202) >> uint(2)));
    float _302 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_300)]);
    uint _304 = uint(int(uint(_202) >> uint(2)));
    float _306 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_304)]);
    float _308 = _268;
    float _310 = _250;
    float _312 = _286;
    float _314 = _266;
    float _316 = _284;
    float _318 = _270;
    float _320 = _288;
    float _322 = _266;
    float _324 = _268;
    float _326 = _270;
    float _328 = _248;
    float _330 = _250;
    float _332 = _252;
    float _334 = _284;
    float _336 = _286;
    float _338 = _288;
    float _340 = _206;
    float _342 = _212;
    float _344 = _218;
    float _346 = _302;
    int _348 = as_type<int>(_222);
    int _350 = as_type<int>(_228);
    int _352 = as_type<int>(_234);
    int _354 = as_type<int>(_222);
    int _356 = as_type<int>(_228);
    int _358 = as_type<int>(_234);
    int _360 = as_type<int>(_222);
    int _362 = as_type<int>(_228);
    int _364 = as_type<int>(_234);
    if (!_200)
    {
        int _366 = _180 + 4;
        int _368 = _180 + 8;
        uint _370 = uint(int(uint(_180) >> uint(2)));
        float _372 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_370)]);
        uint _374 = uint(int(uint(_366) >> uint(2)));
        float _376 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_374)]);
        uint _378 = uint(int(uint(_368) >> uint(2)));
        float _380 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_378)]);
        uint _382 = uint(int(uint(_366) >> uint(2)));
        float _384 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_382)]);
        uint _386 = uint(int(uint(_180) >> uint(2)));
        float _388 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_386)]);
        uint _390 = uint(int(uint(_368) >> uint(2)));
        float _392 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_390)]);
        uint _394 = uint(int(uint(_366) >> uint(2)));
        float _396 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_394)]);
        uint _398 = uint(int(uint(_180) >> uint(2)));
        float _400 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_398)]);
        uint _402 = uint(int(uint(_368) >> uint(2)));
        float _404 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_402)]);
        float _406 = _372 * _372;
        float _408 = _376 * _376;
        float _410 = _380 * _380;
        float _412 = fma(_384, _384, _408);
        float _414 = fma(_388, _388, _406);
        float _416 = fma(_392, _392, _410);
        float _418 = fma(_396, _396, _412);
        float _420 = fma(_400, _400, _414);
        float _422 = sqrt(_418);
        float _424 = fma(_404, _404, _416);
        float _426 = sqrt(_420);
        float _428 = sqrt(_424);
        bool _430 = _422 > 0.0;
        bool _432 = _426 > 0.0;
        bool _434 = _428 > 0.0;
        float _436 = _252;
        float _438 = _410;
        if (_430)
        {
            float _440 = rsqrt(_418);
            _436 = _440;
        }
        float _442 = _436;
        float _444 = as_type<float>(_368);
        if (_432)
        {
            float _446 = rsqrt(_420);
            _444 = _446;
        }
        float _448 = _444;
        float _450 = 0.0;
        if (_434)
        {
            float _452 = rsqrt(_424);
            _450 = _452;
        }
        float _454 = _450;
        if (!_430)
        {
            _308 = 0.0;
        }
        float _456 = _308;
        float _458 = _456;
        float _460 = _442;
        if (_430)
        {
            float _462 = _376 * _442;
            _458 = _462;
        }
        float _464 = _458;
        _324 = _464;
        if (!_430)
        {
            _310 = 0.0;
        }
        float _466 = _310;
        float _468 = _466;
        if (_430)
        {
            float _470 = _384 * _442;
            _468 = _470;
        }
        float _472 = _468;
        _330 = _472;
        if (!_430)
        {
            _312 = 0.0;
        }
        float _474 = _312;
        float _476 = _474;
        if (_430)
        {
            float _478 = _396 * _442;
            _476 = _478;
        }
        float _480 = _476;
        _336 = _480;
        if (!_432)
        {
            _314 = 0.0;
        }
        float _482 = _314;
        float _484 = _482;
        if (_432)
        {
            float _486 = _372 * _448;
            _484 = _486;
        }
        float _488 = _484;
        _322 = _488;
        if (!_432)
        {
            _438 = 0.0;
        }
        float _490 = _438;
        float _492 = _490;
        if (_432)
        {
            float _494 = _388 * _448;
            _492 = _494;
        }
        float _496 = _492;
        _328 = _496;
        if (!_432)
        {
            _316 = 0.0;
        }
        float _498 = _316;
        float _500 = _498;
        if (_432)
        {
            float _502 = _400 * _448;
            _500 = _502;
        }
        float _504 = _500;
        _334 = _504;
        if (!_434)
        {
            _318 = 0.0;
        }
        float _506 = _318;
        float _508 = _506;
        if (!_434)
        {
            _460 = 0.0;
        }
        float _510 = _460;
        float _512 = _510;
        if (_434)
        {
            float _514 = _380 * _454;
            _508 = _514;
        }
        float _516 = _508;
        _326 = _516;
        if (!_434)
        {
            _320 = 0.0;
        }
        float _518 = _320;
        _338 = _518;
        if (_434)
        {
            float _520 = _392 * _454;
            _512 = _520;
        }
        float _522 = _512;
        _332 = _522;
        if (_434)
        {
            float _524 = _404 * _454;
            _338 = _524;
        }
    }
    float _526 = _322;
    float _528 = _324;
    float _530 = _326;
    float _532 = _328;
    float _534 = _330;
    float _536 = _332;
    float _538 = _334;
    float _540 = _336;
    float _542 = _338;
    float _544 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _546 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _548 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _550 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _552 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _554 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _556 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _558 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _560 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _562 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _564 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _566 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _568 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _570 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    uint _572 = uint(int(uint(_202) >> uint(2)));
    float _574 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_572)]);
    bool _576 = _546 > 0.0;
    float _578 = abs(_544);
    float _580 = log2(_578);
    bool _582 = _548 > 0.0;
    float _584 = 0.0;
    float _586 = _544;
    float _588 = _562;
    bool _590 = _582;
    float _592 = _560;
    float _594 = _564;
    float _596 = _566;
    float _598 = _568;
    float _600 = _570;
    float _602 = _546;
    if (_576)
    {
        float _604 = 1.0 / _546;
        _584 = _604;
    }
    float _606 = _584;
    float _608 = _552 * _556;
    float _610 = _550 * _556;
    float _612 = _554 * _556;
    float _614 = -_306;
    float _616 = _558 + _614;
    float _618 = _560 * _580;
    float _620 = _608 * _526;
    float _622 = _608 * _528;
    float _624 = _608 * _530;
    float _626 = _562 * _548;
    float _628 = exp2(_618);
    float _630 = _606;
    float _632 = _618;
    float _634 = _610;
    float _636 = _616;
    if (_576)
    {
        float _638 = _616 * _606;
        _586 = _638;
    }
    float _640 = _586;
    float _642 = fma(_610, _532, _620);
    float _644 = fma(_610, _534, _622);
    if (_582)
    {
        float _646 = -_626;
        float _648 = fma(_292, _646, _562);
        _588 = _648;
    }
    float _650 = _588;
    float _652 = _650;
    if (_576)
    {
        float _654 = precise::min(_640, 1.0);
        _630 = _654;
    }
    float _656 = _630;
    float _658 = fma(_610, _536, _624);
    float _660 = fma(_612, _538, _642);
    float _662 = fma(_612, _540, _644);
    float _664 = _658;
    if (_576)
    {
        float _666 = _656 * _650;
        _652 = _666;
    }
    float _668 = _652;
    float _670 = fma(_612, _542, _658);
    float _672 = _302 * _560;
    float _674 = _560 * _660;
    float _676 = _560 * _662;
    float _678 = _560 * _668;
    float _680 = _560 * _670;
    float _682 = fma(_206, _628, _674);
    float _684 = fma(_206, _672, _184);
    float _686 = fma(_212, _628, _676);
    float _688 = fma(_212, _672, _190);
    float _690 = _564 * _678;
    float _692 = _566 * _678;
    float _694 = fma(_218, _672, _196);
    float _696 = fma(_218, _628, _680);
    float _698 = _568 * _678;
    bool _700 = !_200;
    float _702 = _674;
    float _704 = _690;
    float _706 = _698;
    float _828;
    if (!_700)
    {
        float _708 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _710 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _712 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _714 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _716 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _718 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _720 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _722 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _724 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _726 = _712 * _714;
        float _728 = _712 * _716;
        float _730 = _710 * _714;
        float _732 = -_726;
        float _734 = fma(_708, _718, _732);
        float _736 = -_728;
        float _738 = fma(_710, _718, _736);
        float _740 = -_730;
        float _742 = fma(_708, _716, _740);
        float _744 = _722 * _708;
        float _746 = _722 * _734;
        float _748 = _724 * _710;
        float _750 = _720 * _716;
        float _752 = -_744;
        float _754 = fma(_720, _710, _752);
        float _756 = -_746;
        float _758 = fma(_720, _738, _756);
        float _760 = _722 * _718;
        float _762 = _724 * _714;
        float _764 = _720 * _712;
        float _766 = fma(_724, _742, _758);
        float _768 = -_760;
        float _770 = fma(_724, _716, _768);
        float _772 = -_762;
        float _774 = fma(_720, _718, _772);
        float _776 = -_750;
        float _778 = fma(_722, _714, _776);
        float _780 = -_764;
        float _782 = fma(_724, _708, _780);
        float _784 = -_708;
        float _786 = fma(_784, _718, _726);
        float _788 = 1.0 / _766;
        float _790 = -_748;
        float _792 = fma(_722, _712, _790);
        float _794 = _770 * _788;
        float _796 = _774 * _788;
        float _798 = _778 * _788;
        float _800 = _690 * _788;
        float _802 = _692 * _794;
        float _804 = _692 * _796;
        float _806 = _786 * _788;
        float _808 = _692 * _798;
        float _810 = _792 * _788;
        float _812 = _782 * _788;
        float _814 = fma(_738, _800, _802);
        float _816 = fma(_690, _806, _804);
        float _818 = _754 * _788;
        float _820 = fma(_742, _800, _808);
        float _822 = fma(_698, _810, _814);
        float _824 = fma(_698, _812, _816);
        float _826 = fma(_698, _818, _820);
        _340 = _812;
        _342 = _816;
        _344 = _818;
        _592 = _820;
        _594 = _814;
        _596 = _800;
        _598 = _718;
        _600 = _726;
        _346 = _720;
        _702 = _722;
        _632 = _724;
        _634 = _788;
        _828 = _824;
        _704 = _822;
        _706 = _826;
        _602 = _782;
        _830 = true;
    }
    else
    {
        int _832 = as_type<int>(_178) & 1024;
        bool _834 = _832 != 0;
        if (_834)
        {
            _590 = true;
        }
        bool _836 = _590;
        bool _838 = _836;
        if (!_834)
        {
            int _840 = as_type<int>(_178) & 2048;
            bool _842 = _840 != 0;
            _838 = _842;
        }
        bool _844 = _838;
        if (!_844)
        {
            _664 = _692;
        }
        float _846 = _664;
        bool _848 = !_844;
        _828 = _846;
        if (!_848)
        {
            uint _850 = uint(int(uint(_180) >> uint(2)));
            float _852 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_850)]);
            int _854 = _180 + 4;
            uint _856 = uint(int(uint(_854) >> uint(2)));
            float _858 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_856)]);
            int _860 = _180 + 8;
            uint _862 = uint(int(uint(_860) >> uint(2)));
            float _864 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_862)]);
            uint _866 = uint(int(uint(_180) >> uint(2)));
            float _868 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_866)]);
            int _870 = _180 + 4;
            uint _872 = uint(int(uint(_870) >> uint(2)));
            float _874 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_872)]);
            int _876 = _180 + 8;
            uint _878 = uint(int(uint(_876) >> uint(2)));
            float _880 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_878)]);
            uint _882 = uint(int(uint(_180) >> uint(2)));
            float _884 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_882)]);
            int _886 = _180 + 4;
            uint _888 = uint(int(uint(_886) >> uint(2)));
            float _890 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_888)]);
            int _892 = _180 + 8;
            uint _894 = uint(int(uint(_892) >> uint(2)));
            float _896 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_894)]);
            float _898 = _864 * _868;
            float _900 = _864 * _874;
            float _902 = _858 * _868;
            float _904 = -_898;
            float _906 = fma(_852, _880, _904);
            float _908 = -_900;
            float _910 = fma(_858, _880, _908);
            float _912 = -_902;
            float _914 = fma(_852, _874, _912);
            float _916 = _890 * _852;
            float _918 = _890 * _906;
            float _920 = _896 * _858;
            float _922 = _884 * _874;
            float _924 = -_916;
            float _926 = fma(_884, _858, _924);
            float _928 = -_918;
            float _930 = fma(_884, _910, _928);
            float _932 = _890 * _880;
            float _934 = _896 * _868;
            float _936 = _884 * _864;
            float _938 = fma(_896, _914, _930);
            float _940 = -_932;
            float _942 = fma(_896, _874, _940);
            float _944 = -_934;
            float _946 = fma(_884, _880, _944);
            float _948 = -_922;
            float _950 = fma(_890, _868, _948);
            float _952 = -_936;
            float _954 = fma(_896, _852, _952);
            float _956 = -_852;
            float _958 = fma(_956, _880, _898);
            float _960 = 1.0 / _938;
            float _962 = -_920;
            float _964 = fma(_890, _864, _962);
            float _966 = _942 * _960;
            float _968 = _946 * _960;
            float _970 = _950 * _960;
            float _972 = _690 * _960;
            float _974 = _692 * _966;
            float _976 = _692 * _968;
            float _978 = _958 * _960;
            float _980 = _692 * _970;
            float _982 = _964 * _960;
            float _984 = _954 * _960;
            float _986 = fma(_910, _972, _974);
            float _988 = fma(_690, _978, _976);
            float _990 = _926 * _960;
            float _992 = fma(_914, _972, _980);
            float _994 = fma(_698, _982, _986);
            float _996 = fma(_698, _984, _988);
            float _998 = fma(_698, _990, _992);
            _340 = _984;
            _342 = _988;
            _344 = _990;
            _592 = _992;
            _594 = _986;
            _596 = _972;
            _598 = _880;
            _600 = _898;
            _346 = _884;
            _702 = _890;
            _632 = _896;
            _634 = _960;
            _828 = _996;
            _704 = _994;
            _706 = _998;
            _602 = _954;
        }
    }
    _830 = false;
    float _1000 = _340;
    float _1002 = _342;
    float _1004 = _344;
    float _1006 = _592;
    float _1008 = _594;
    float _1010 = _596;
    float _1012 = _598;
    float _1014 = _600;
    float _1016 = _346;
    float _1018 = _702;
    float _1020 = _632;
    float _1022 = _634;
    float _1024 = _828;
    float _1026 = _704;
    float _1028 = _706;
    float _1030 = _602;
    uint _1032 = uint(int(uint(_202) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1032)] = as_type<uint>(_574);
    float _1034 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _1036 = as_type<int>(_1034) & 512;
    bool _1038 = _1036 != 0;
    int _1040 = as_type<int>(_1034) & 1024;
    bool _1042 = _1040 != 0;
    float _1044 = _1000;
    float _1046 = _1002;
    float _1048 = _1004;
    float _1050 = _1006;
    float _1052 = _1028;
    float _1054 = _1030;
    float _1056 = _1026;
    bool _1058 = false;
    if (_1038)
    {
        float _1060 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1062 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1064 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1066 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1044 = _1060;
        _1046 = _1062;
        _1048 = _1064;
        _1050 = _1066;
    }
    float _1068 = _1044;
    float _1070 = _1046;
    float _1072 = _1048;
    float _1074 = _1050;
    float _1076 = _1008;
    float _1078 = _1010;
    float _1080 = _1012;
    float _1082 = _1014;
    if (_1038)
    {
        float _1084 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1086 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1088 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1090 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1076 = _1084;
        _1078 = _1086;
        _1080 = _1088;
        _1082 = _1090;
    }
    float _1092 = _1076;
    float _1094 = _1078;
    float _1096 = _1080;
    float _1098 = _1082;
    float _1100 = _1016;
    float _1102 = _1018;
    float _1104 = _1020;
    float _1106 = _1022;
    if (_1038)
    {
        float _1108 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1110 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1112 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1114 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1100 = _1108;
        _1102 = _1110;
        _1104 = _1112;
        _1106 = _1114;
    }
    float _1116 = _1100;
    float _1118 = _1102;
    float _1120 = _1104;
    float _1122 = _1106;
    float _1124 = _688 + _1024;
    float _1126 = _684 + _1026;
    float _1128 = _694 + _1028;
    if (!_1038)
    {
        _1052 = 0.0;
    }
    float _1130 = _1052;
    float _1132 = 0.0;
    float _1134 = _1130;
    if (!_1038)
    {
        _1132 = 0.0;
    }
    float _1136 = _1132;
    float _1138 = _1136;
    if (!_1038)
    {
        _1054 = 0.0;
    }
    float _1140 = _1054;
    int _1142 = as_type<int>(_1034) & 2048;
    bool _1144 = _1142 != 0;
    float _1146 = _1068;
    float _1148 = _1140;
    if (_1038)
    {
        float _1150 = _1124 * _1070;
        _1056 = _1150;
    }
    float _1152 = _1056;
    float _1154 = _1094;
    float _1156 = _1118;
    float _1158 = _1116;
    float _1160 = _1096;
    if (_1038)
    {
        float _1162 = _1124 * _1094;
        _1154 = _1162;
    }
    float _1164 = _1154;
    float _1166 = _1164;
    if (_1038)
    {
        float _1168 = fma(_1126, _1068, _1152);
        _1146 = _1168;
    }
    float _1170 = _1146;
    float _1172 = _1170;
    if (_1038)
    {
        float _1174 = _1124 * _1118;
        _1156 = _1174;
    }
    float _1176 = _1156;
    if (_1038)
    {
        float _1178 = fma(_1126, _1092, _1164);
        _1166 = _1178;
    }
    float _1180 = _1166;
    if (_1038)
    {
        float _1182 = fma(_1128, _1072, _1170);
        _1172 = _1182;
    }
    float _1184 = _1172;
    if (_1038)
    {
        float _1186 = fma(_1126, _1116, _1176);
        _1158 = _1186;
    }
    float _1188 = _1158;
    float _1190 = _1188;
    if (_1038)
    {
        float _1192 = fma(_1128, _1096, _1180);
        _1160 = _1192;
    }
    float _1194 = _1160;
    if (_1038)
    {
        float _1196 = _1074 + _1184;
        _1134 = _1196;
    }
    float _1198 = _1134;
    float _1200 = _1198;
    if (_1038)
    {
        float _1202 = fma(_1128, _1120, _1188);
        _1190 = _1202;
    }
    float _1204 = _1190;
    if (_1038)
    {
        float _1206 = _1098 + _1194;
        _1138 = _1206;
    }
    float _1208 = _1138;
    float _1210 = _1208;
    if (_1038)
    {
        float _1212 = _1122 + _1204;
        _1148 = _1212;
    }
    float _1214 = _1148;
    bool _1216 = !_1042;
    float _1218 = _1214;
    if (!_1216)
    {
        float _1220 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1222 = uint(int(uint(_180) >> uint(2)));
        float _1224 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1222)]);
        int _1226 = _180 + 4;
        uint _1228 = uint(int(uint(_1226) >> uint(2)));
        float _1230 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1228)]);
        int _1232 = _180 + 8;
        uint _1234 = uint(int(uint(_1232) >> uint(2)));
        float _1236 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1234)]);
        uint _1238 = uint(int(uint(_180) >> uint(2)));
        float _1240 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1238)]);
        int _1242 = _180 + 4;
        uint _1244 = uint(int(uint(_1242) >> uint(2)));
        float _1246 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1244)]);
        int _1248 = _180 + 8;
        uint _1250 = uint(int(uint(_1248) >> uint(2)));
        float _1252 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1250)]);
        uint _1254 = uint(int(uint(_180) >> uint(2)));
        float _1256 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1254)]);
        int _1258 = _180 + 4;
        uint _1260 = uint(int(uint(_1258) >> uint(2)));
        float _1262 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1260)]);
        int _1264 = _180 + 8;
        uint _1266 = uint(int(uint(_1264) >> uint(2)));
        float _1268 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1266)]);
        float _1270 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1272 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1274 = _1124 * _1230;
        float _1276 = _1124 * _1246;
        float _1278 = _1124 * _1262;
        float _1280 = fma(_1126, _1224, _1274);
        float _1282 = fma(_1126, _1240, _1276);
        float _1284 = fma(_1126, _1256, _1278);
        float _1286 = fma(_1128, _1236, _1280);
        float _1288 = fma(_1128, _1252, _1282);
        float _1290 = fma(_1128, _1268, _1284);
        float _1292 = _1220 + _1286;
        float _1294 = _1270 + _1288;
        float _1296 = _1272 + _1290;
        _1210 = _1294;
        _1200 = _1292;
        _1218 = _1296;
    }
    float _1298 = _1210;
    float _1300 = _1200;
    float _1302 = _1218;
    bool _1304 = !_1144;
    float _1306 = _1298;
    float _1308 = _1300;
    float _1310 = _1302;
    if (!_1304)
    {
        uint _1312 = uint(int(uint(_180) >> uint(2)));
        float _1314 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1312)]);
        int _1316 = _180 + 4;
        uint _1318 = uint(int(uint(_1316) >> uint(2)));
        float _1320 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1318)]);
        int _1322 = _180 + 8;
        uint _1324 = uint(int(uint(_1322) >> uint(2)));
        float _1326 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1324)]);
        int _1328 = _180 + 12;
        uint _1330 = uint(int(uint(_1328) >> uint(2)));
        float _1332 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1330)]);
        uint _1334 = uint(int(uint(_180) >> uint(2)));
        float _1336 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1334)]);
        int _1338 = _180 + 4;
        uint _1340 = uint(int(uint(_1338) >> uint(2)));
        float _1342 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1340)]);
        int _1344 = _180 + 8;
        uint _1346 = uint(int(uint(_1344) >> uint(2)));
        float _1348 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1346)]);
        int _1350 = _180 + 12;
        uint _1352 = uint(int(uint(_1350) >> uint(2)));
        float _1354 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1352)]);
        uint _1356 = uint(int(uint(_180) >> uint(2)));
        float _1358 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1356)]);
        int _1360 = _180 + 4;
        uint _1362 = uint(int(uint(_1360) >> uint(2)));
        float _1364 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1362)]);
        int _1366 = _180 + 8;
        uint _1368 = uint(int(uint(_1366) >> uint(2)));
        float _1370 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1368)]);
        int _1372 = _180 + 12;
        uint _1374 = uint(int(uint(_1372) >> uint(2)));
        float _1376 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1374)]);
        float _1378 = _1124 * _1320;
        float _1380 = _1124 * _1342;
        float _1382 = _1124 * _1364;
        float _1384 = fma(_1126, _1314, _1378);
        float _1386 = fma(_1126, _1336, _1380);
        float _1388 = fma(_1126, _1358, _1382);
        float _1390 = fma(_1128, _1326, _1384);
        float _1392 = fma(_1128, _1348, _1386);
        float _1394 = fma(_1128, _1370, _1388);
        float _1396 = _1390 + _1332;
        float _1398 = _1392 + _1354;
        float _1400 = _1394 + _1376;
        _1306 = _1398;
        _1308 = _1396;
        _1310 = _1400;
    }
    float _1402 = _1306;
    float _1404 = _1308;
    float _1406 = _1310;
    float _1408 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _1410 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _1412 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _1414 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _1416 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1418 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1420 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[70]);
    float _1422 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1424 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1426 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1428 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1430 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1432 = _1410 * _1402;
    float _1434 = fma(_1408, _1404, _1432);
    float _1436 = fma(_1412, _1406, _1434);
    float _1438 = _1414 + _1436;
    float _1440 = -_1438;
    bool _1442 = _1416 >= _1440;
    bool _1444 = isnan(_1416);
    bool _1446 = _1442 || _1444;
    bool _1448 = isnan(_1440);
    bool _1450 = _1446 || _1448;
    float _1452 = -_1438;
    bool _1454 = _1418 >= _1452;
    bool _1456 = isnan(_1418);
    bool _1458 = _1454 || _1456;
    bool _1460 = isnan(_1452);
    bool _1462 = _1458 || _1460;
    int _1464 = _1450 ? 0 : 1;
    int _1466 = 2;
    float _1468 = _1404;
    if (_1450)
    {
        _1466 = 1;
    }
    int _1470 = _1466;
    int _1472 = _1470;
    if (_1462)
    {
        _1472 = _1464;
    }
    int _1474 = _1472;
    int _1476 = _1474 << 6;
    int _1478 = _1476 + 96;
    uint _1480 = uint(int(uint(_1478) >> uint(2)));
    float _1482 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1480)]);
    int _1484 = _1478 + 4;
    uint _1486 = uint(int(uint(_1484) >> uint(2)));
    float _1488 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1486)]);
    int _1490 = _1478 + 8;
    uint _1492 = uint(int(uint(_1490) >> uint(2)));
    float _1494 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1492)]);
    int _1496 = _1478 + 12;
    uint _1498 = uint(int(uint(_1496) >> uint(2)));
    float _1500 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1498)]);
    int _1502 = _1476 + 48;
    int _1504 = _1476 + 64;
    uint _1506 = uint(int(uint(_1502) >> uint(2)));
    float _1508 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1506)]);
    int _1510 = _1502 + 4;
    uint _1512 = uint(int(uint(_1510) >> uint(2)));
    float _1514 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1512)]);
    int _1516 = _1502 + 8;
    uint _1518 = uint(int(uint(_1516) >> uint(2)));
    float _1520 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1518)]);
    int _1522 = _1502 + 12;
    uint _1524 = uint(int(uint(_1522) >> uint(2)));
    float _1526 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1524)]);
    uint _1528 = uint(int(uint(_1504) >> uint(2)));
    float _1530 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1528)]);
    int _1532 = _1504 + 4;
    uint _1534 = uint(int(uint(_1532) >> uint(2)));
    float _1536 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1534)]);
    int _1538 = _1504 + 8;
    uint _1540 = uint(int(uint(_1538) >> uint(2)));
    float _1542 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1540)]);
    int _1544 = _1504 + 12;
    uint _1546 = uint(int(uint(_1544) >> uint(2)));
    float _1548 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1546)]);
    int _1550 = _1476 + 80;
    float _1552 = _1420 + 1.0;
    float _1554 = _1552 + _1402;
    uint _1556 = uint(int(uint(_1550) >> uint(2)));
    float _1558 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1556)]);
    int _1560 = _1550 + 4;
    uint _1562 = uint(int(uint(_1560) >> uint(2)));
    float _1564 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1562)]);
    int _1566 = _1550 + 8;
    uint _1568 = uint(int(uint(_1566) >> uint(2)));
    float _1570 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1568)]);
    int _1572 = _1550 + 12;
    uint _1574 = uint(int(uint(_1572) >> uint(2)));
    float _1576 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1574)]);
    float _1578 = _1554 * _1424;
    float _1580 = fma(_1422, _1404, _1578);
    float _1582 = fma(_1426, _1406, _1580);
    float _1584 = _1428 + _1582;
    float _1586 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _1588 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _1590 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _1592 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _1594 = trunc(_1584);
    int _1596 = int(_1594);
    int _1598 = ~as_type<int>(_1430);
    int _1600 = _1596 + _1598;
    int _1602 = _1600 + 1;
    float _1604 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    bool _1606 = _1602 >= 0;
    int _1608 = as_type<int>(_1402);
    float _1610 = as_type<float>(_1474);
    if (_1606)
    {
        float _1612 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1608 = as_type<int>(_1612);
    }
    int _1614 = _1608;
    float _1616 = _1554 * _1488;
    float _1618 = fma(_1482, _1404, _1616);
    float _1620 = fma(_1494, _1406, _1618);
    float _1622 = _1500 + _1620;
    float _1624 = _1554 * _1514;
    float _1626 = 1.0 / _1622;
    float _1628 = fma(_1508, _1404, _1624);
    float _1630 = _1554 * _1536;
    float _1632 = fma(_1520, _1406, _1628);
    float _1634 = fma(_1530, _1404, _1630);
    float _1636 = _1526 + _1632;
    float _1638 = fma(_1542, _1406, _1634);
    float _1640 = _1636 * _1626;
    float _1642 = _1548 + _1638;
    bool _1644 = _1640 >= 0.0;
    float _1646 = _1642 * _1626;
    bool _1648 = _1640 <= 1.0;
    bool _1650 = _1648 && _1644;
    bool _1652 = _1646 >= 0.0;
    bool _1654 = _1652 && _1650;
    bool _1656 = _1646 <= 1.0;
    bool _1658 = _1656 && _1654;
    float _1660 = _1554 * _1564;
    float _1662 = fma(_1558, _1404, _1660);
    int _1664 = _1658 ? (-1) : 0;
    if (_1658)
    {
        float _1666 = float(_1474);
        _1610 = _1666;
    }
    float _1668 = _1610;
    float _1670 = _1622;
    if (_1658)
    {
        float _1672 = rint(_1668);
        float _1674 = precise::max(_1672, 0.0);
        uint _1676 = uint(_1674);
        uint _1678 = clamp(_1676, 0u, 65535u);
        _1670 = as_type<float>(_1678);
    }
    float _1680 = _1670;
    float _1682 = fma(_1570, _1406, _1662);
    float _1684 = _1576 + _1682;
    float _1686 = _1684 * _1626;
    float _1688 = _1680;
    if (_1658)
    {
        float3 _12487 = float3(_1640, _1646, float(as_type<int>(_1680)));
        float3 _12491 = select(_12487, float3(0.0), isnan(_12487));
        float _1690 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _12491.xy, uint(rint(_12491.z)), _1686, level(0.0));
        _1688 = _1690;
    }
    float _1692 = _1688;
    float _1694 = _1554 * _1588;
    float _1696 = fma(_1586, _1404, _1694);
    float _1698 = fma(_1590, _1406, _1696);
    float _1700 = _1592 + _1698;
    float _1702 = trunc(_1700);
    int _1704 = int(_1702);
    bool _1706 = _1614 <= _1602;
    bool _1708 = !_1606;
    bool _1710 = _1706 || _1708;
    int _1712 = ~as_type<int>(_1604);
    int _1714 = _1704 + _1712;
    int _1716 = _1714 + 1;
    bool _1718 = _1716 < 0;
    bool _1720 = _1718 || _1710;
    int _1722 = as_type<int>(_1696);
    float _1724 = as_type<float>(_1704);
    if (!_1720)
    {
        float _1726 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1722 = as_type<int>(_1726);
    }
    int _1728 = _1722;
    bool _1730 = _1728 <= _1716;
    bool _1732 = _1730 || _1720;
    if (_1732)
    {
        _1724 = 1.0;
    }
    float _1734 = _1724;
    float _1736 = _1734;
    if (!_1732)
    {
        float _1738 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1740 = _1716 * as_type<int>(_1738);
        int _1742 = _1740 + _1602;
        int _1744 = _1742 << 2;
        uint _1746 = uint(int(uint(_1742) >> uint(2)));
        int _1748 = 12 & _1744;
        int _1750 = int(_1746) << 4;
        int _1752 = _1750 + _1748;
        int _1754 = _1752 + 400;
        uint _1756 = uint(int(uint(_1754) >> uint(2)));
        float _1758 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1756)]);
        float _1760 = floor(_1700);
        float _1762 = floor(_1584);
        float _1764 = -_1760;
        float _1766 = _1700 + _1764;
        float _1768 = -_1762;
        float _1770 = _1584 + _1768;
        float _1772 = rint(_1758);
        float _1774 = precise::max(_1772, 0.0);
        uint _1776 = uint(_1774);
        uint _1778 = clamp(_1776, 0u, 65535u);
        float3 _12626 = float3(_1770, _1766, float(int(_1778)));
        float3 _12628 = select(_12626, float3(0.0), isnan(_12626));
        float _1780 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _12628.xy, uint(rint(_12628.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _12628.xy, uint(rint(_12628.z)), level(0.0)).x;
        int _1782 = _1742 << 4;
        int _1784 = _1782 + 2048;
        uint _1786 = uint(int(uint(_1784) >> uint(2)));
        float _1788 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1786)]);
        int _1790 = _1784 + 4;
        uint _1792 = uint(int(uint(_1790) >> uint(2)));
        float _1794 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1792)]);
        int _1796 = _1784 + 8;
        uint _1798 = uint(int(uint(_1796) >> uint(2)));
        float _1800 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1798)]);
        int _1802 = _1784 + 12;
        uint _1804 = uint(int(uint(_1802) >> uint(2)));
        float _1806 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1804)]);
        float _1808 = _1554 * _1794;
        float _1810 = fma(_1788, _1404, _1808);
        float _1812 = fma(_1800, _1406, _1810);
        float _1814 = _1806 + _1812;
        float _1816 = precise::clamp(_1814, 0.0, 1.0);
        float _1818 = -_1816;
        float _1820 = _1818 + _1780;
        float _1822 = fma(_1820, 500.0, 1.5);
        float _1824 = exp2(_1822);
        float _1826 = 0.0 + _1824;
        float _1828 = precise::clamp(_1826, 0.0, 1.0);
        _1468 = 500.0;
        _1736 = _1828;
    }
    float _1830 = _1468;
    float _1832 = _1736;
    uint _1834 = uint(int(uint(_180) >> uint(2)));
    float _1836 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1834)]);
    float _1838 = _1830;
    if (!_1658)
    {
        _1838 = 1.0;
    }
    float _1840 = _1838;
    bool _1842 = _616 > 0.001000000047497451305389404296875;
    bool _1844 = isnan(_616);
    bool _1846 = _1842 || _1844;
    bool _1848 = isnan(0.001000000047497451305389404296875);
    bool _1850 = _1846 || _1848;
    float _1852 = _1840;
    if (_1658)
    {
        bool _1854 = _1692 >= _1686;
        bool _1856 = isnan(_1692);
        bool _1858 = _1854 || _1856;
        bool _1860 = isnan(_1686);
        bool _1862 = _1858 || _1860;
        float _1864 = float(_1862);
        _1852 = _1864;
    }
    float _1866 = _1852;
    float _1868 = -_1866;
    float _1870 = fma(_1868, _1832, 1.0);
    float _1872 = -_1836;
    float _1874 = _1870 + _1872;
    float _1876 = _1870;
    if (_1850)
    {
        float _1878 = fma(_1874, 0.0500000007450580596923828125, _1836);
        _1876 = _1878;
    }
    float _1880 = _1876;
    float _1882 = precise::max(0.0, _1880);
    float _1884 = precise::min(_1882, 0.999000012874603271484375);
    uint _1886 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1886)] = as_type<uint>(_1884);
    float _1888 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    uint _1890 = uint(int(uint(_180) >> uint(2)));
    float _1892 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1890)]);
    int _1894 = _180 + 4;
    uint _1896 = uint(int(uint(_1894) >> uint(2)));
    float _1898 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1896)]);
    int _1900 = _180 + 8;
    uint _1902 = uint(int(uint(_1900) >> uint(2)));
    float _1904 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1902)]);
    int _1906 = _180 + 12;
    uint _1908 = uint(int(uint(_1906) >> uint(2)));
    float _1910 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1908)]);
    float _1912 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[71]);
    int _1914 = _99 << 5;
    float _1916 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[82]);
    uint _1918 = uint(int(uint(_1914) >> uint(2)));
    float _1920 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1918)]);
    int _1922 = _1914 + 4;
    uint _1924 = uint(int(uint(_1922) >> uint(2)));
    float _1926 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1924)]);
    int _1928 = _1914 + 8;
    uint _1930 = uint(int(uint(_1928) >> uint(2)));
    float _1932 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1930)]);
    int _1934 = _1914 + 12;
    uint _1936 = uint(int(uint(_1934) >> uint(2)));
    float _1938 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1936)]);
    float _1940 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[80]);
    float _1942 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[79]);
    float _1944 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[2607]);
    int _1946 = as_type<int>(_1888) & 512;
    bool _1948 = _1946 != 0;
    float _1950 = _1646;
    float _1952 = _1686;
    float _1954 = _1692;
    float _1956 = _1640;
    float _1958 = as_type<float>(_1914);
    if (_1948)
    {
        float _1960 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1962 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1964 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1966 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1950 = _1960;
        _1952 = _1962;
        _1954 = _1964;
        _1956 = _1966;
    }
    float _1968 = _1950;
    float _1970 = _1952;
    float _1972 = _1954;
    float _1974 = _1956;
    float _1976 = 0.0;
    float _1978 = 0.0;
    float _1980 = 0.0;
    float _1982 = 0.0;
    if (_1948)
    {
        float _1984 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1986 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1988 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1990 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1976 = _1984;
        _1978 = _1986;
        _1980 = _1988;
        _1982 = _1990;
    }
    float _1992 = _1976;
    float _1994 = _1978;
    float _1996 = _1980;
    float _1998 = _1982;
    float _2000 = 0.0;
    float _2002 = 0.0;
    float _2004 = 0.0;
    float _2006 = 0.0;
    if (_1948)
    {
        float _2008 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _2010 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _2012 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _2014 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _2000 = _2008;
        _2002 = _2010;
        _2004 = _2012;
        _2006 = _2014;
    }
    float _2016 = _2000;
    float _2018 = _2002;
    float _2020 = _2004;
    float _2022 = _2006;
    float _2024 = -_1912;
    float _2026 = _1898 + _2024;
    int _2028 = _1914 + 16;
    uint _2030 = uint(int(uint(_180) >> uint(2)));
    float _2032 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_2030)]);
    int _2034 = _180 + 4;
    uint _2036 = uint(int(uint(_2034) >> uint(2)));
    float _2038 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_2036)]);
    int _2040 = _180 + 8;
    uint _2042 = uint(int(uint(_2040) >> uint(2)));
    float _2044 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_2042)]);
    int _2046 = _180 + 12;
    uint _2048 = uint(int(uint(_2046) >> uint(2)));
    float _2050 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_2048)]);
    float _2052 = precise::max(0.0, _1916);
    uint _2054 = uint(int(uint(_2028) >> uint(2)));
    float _2056 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_2054)]);
    int _2058 = _2028 + 4;
    uint _2060 = uint(int(uint(_2058) >> uint(2)));
    float _2062 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_2060)]);
    int _2064 = _2028 + 8;
    uint _2066 = uint(int(uint(_2064) >> uint(2)));
    float _2068 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_2066)]);
    int _2070 = _2028 + 12;
    uint _2072 = uint(int(uint(_2070) >> uint(2)));
    float _2074 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_2072)]);
    float _2076 = 0.0;
    float _2078 = _1910;
    int _2080 = as_type<int>(_1898);
    float _2082 = _1920;
    float _2084 = _1926;
    float _2086 = _1932;
    float _2088 = _1938;
    float _2090 = as_type<float>(_2028);
    if (!_1948)
    {
        _2076 = 0.0;
    }
    float _2092 = _2076;
    uint _2094 = uint(int(uint(_180) >> uint(2)));
    float _2096 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2094)]);
    float _2098 = _2092;
    if (!_1948)
    {
        _2078 = 0.0;
    }
    float _2100 = _2078;
    int _2102 = _180 + 8;
    uint _2104 = uint(int(uint(_2102) >> uint(2)));
    float _2106 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2104)]);
    bool _2108 = _2052 != 0.0;
    bool _2110 = isnan(_2052);
    bool _2112 = _2108 || _2110;
    bool _2114 = isnan(0.0);
    bool _2116 = _2112 || _2114;
    uint _2118 = uint(int(uint(_180) >> uint(2)));
    float _2120 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_2118)]);
    int _2122 = _180 + 4;
    uint _2124 = uint(int(uint(_2122) >> uint(2)));
    float _2126 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_2124)]);
    int _2128 = _180 + 8;
    uint _2130 = uint(int(uint(_2128) >> uint(2)));
    float _2132 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_2130)]);
    int _2134 = _180 + 12;
    uint _2136 = uint(int(uint(_2134) >> uint(2)));
    float _2138 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_2136)]);
    float _2140 = _1970;
    float _2142 = _1994;
    float _2144 = _2018;
    float _2146 = _1972;
    float _2148 = _1996;
    float _2150 = _2020;
    float _2152 = _2016;
    float _2154 = _2100;
    float _2156 = _2022;
    float _2158 = _1992;
    float _2160 = _1998;
    float _2162 = _1974;
    if (_1948)
    {
        float _2164 = _2026 * _1970;
        _2140 = _2164;
    }
    float _2166 = _2140;
    float _2168 = _2166;
    if (_1948)
    {
        float _2170 = fma(_1892, _1968, _2166);
        _2168 = _2170;
    }
    float _2172 = _2168;
    int _2174 = as_type<int>(_1888) & 1024;
    bool _2176 = _2174 != 0;
    if (_1948)
    {
        float _2178 = _2026 * _1994;
        _2142 = _2178;
    }
    float _2180 = _2142;
    float _2182 = _2180;
    if (_1948)
    {
        float _2184 = _2026 * _2018;
        _2144 = _2184;
    }
    float _2186 = _2144;
    float _2188 = _2186;
    if (_1948)
    {
        float _2190 = fma(_1892, _1992, _2180);
        _2182 = _2190;
    }
    float _2192 = _2182;
    float _2194 = _2192;
    if (_1948)
    {
        float _2196 = fma(_1892, _2016, _2186);
        _2188 = _2196;
    }
    float _2198 = _2188;
    float _2200 = _2198;
    if (_1948)
    {
        float _2202 = fma(_1904, _1972, _2172);
        _2146 = _2202;
    }
    float _2204 = _2146;
    if (_1948)
    {
        float _2206 = fma(_1904, _1996, _2192);
        _2148 = _2206;
    }
    float _2208 = _2148;
    float _2210 = _2208;
    if (_1948)
    {
        float _2212 = fma(_1904, _2020, _2198);
        _2150 = _2212;
    }
    float _2214 = _2150;
    float _2216 = _2214;
    if (!_1948)
    {
        _2152 = 0.0;
    }
    float _2218 = _2152;
    float _2220 = _2218;
    if (_1948)
    {
        float _2222 = _1998 + _2208;
        _2098 = _2222;
    }
    float _2224 = _2098;
    int _2226 = as_type<int>(_1888) & 2048;
    bool _2228 = _2226 != 0;
    float _2230 = _2224;
    if (_1948)
    {
        float _2232 = _1974 + _2204;
        _2220 = _2232;
    }
    float _2234 = _2220;
    float _2236 = _2234;
    if (_1948)
    {
        float _2238 = _2022 + _2214;
        _2154 = _2238;
    }
    float _2240 = _2154;
    float _2242 = _1920 + _1926;
    bool _2244 = !_2176;
    int _2246 = 0;
    int _2248 = 0;
    float _2250 = _2240;
    int _2252 = as_type<int>(_2050);
    float _2254 = _2242;
    float _2256 = _2056;
    float _2258 = _2062;
    float _2260 = _2068;
    float _2262 = _2074;
    float _2264 = _2106;
    float _2266 = _2096;
    float _2268 = _1944;
    if (!_2244)
    {
        float _2270 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _2272 = uint(int(uint(_180) >> uint(2)));
        float _2274 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2272)]);
        int _2276 = _180 + 4;
        uint _2278 = uint(int(uint(_2276) >> uint(2)));
        float _2280 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2278)]);
        int _2282 = _180 + 8;
        uint _2284 = uint(int(uint(_2282) >> uint(2)));
        float _2286 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2284)]);
        int _2288 = _180 + 12;
        uint _2290 = uint(int(uint(_2288) >> uint(2)));
        float _2292 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2290)]);
        uint _2294 = uint(int(uint(_180) >> uint(2)));
        float _2296 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2294)]);
        int _2298 = _180 + 4;
        uint _2300 = uint(int(uint(_2298) >> uint(2)));
        float _2302 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2300)]);
        int _2304 = _180 + 8;
        uint _2306 = uint(int(uint(_2304) >> uint(2)));
        float _2308 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2306)]);
        int _2310 = _180 + 12;
        uint _2312 = uint(int(uint(_2310) >> uint(2)));
        float _2314 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2312)]);
        uint _2316 = uint(int(uint(_180) >> uint(2)));
        float _2318 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2316)]);
        int _2320 = _180 + 4;
        uint _2322 = uint(int(uint(_2320) >> uint(2)));
        float _2324 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2322)]);
        int _2326 = _180 + 8;
        uint _2328 = uint(int(uint(_2326) >> uint(2)));
        float _2330 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2328)]);
        int _2332 = _180 + 12;
        uint _2334 = uint(int(uint(_2332) >> uint(2)));
        float _2336 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2334)]);
        float _2338 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _2340 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _2342 = _2026 * _2280;
        float _2344 = _2026 * _2302;
        float _2346 = _2026 * _2324;
        float _2348 = fma(_1892, _2274, _2342);
        float _2350 = fma(_1892, _2296, _2344);
        float _2352 = fma(_1892, _2318, _2346);
        float _2354 = fma(_1904, _2286, _2348);
        float _2356 = fma(_1904, _2308, _2350);
        float _2358 = fma(_1904, _2330, _2352);
        float _2360 = _2270 + _2354;
        float _2362 = _2338 + _2356;
        float _2364 = _2340 + _2358;
        _2236 = _2362;
        _2200 = _2354;
        _2216 = _2286;
        _2156 = _2292;
        _2158 = _2296;
        _2194 = _2350;
        _2210 = _2356;
        _2160 = _2314;
        _2246 = as_type<int>(_2318);
        _2230 = _2360;
        _2248 = as_type<int>(_2336);
        _2162 = _2338;
        _2250 = _2364;
    }
    float _2366 = _2236;
    float _2368 = _2200;
    float _2370 = _2216;
    float _2372 = _2156;
    float _2374 = _2158;
    float _2376 = _2194;
    float _2378 = _2210;
    float _2380 = _2160;
    int _2382 = _2246;
    float _2384 = _2230;
    int _2386 = _2248;
    float _2388 = _2162;
    float _2390 = _2250;
    bool _2392 = !_2228;
    float _2394 = _2374;
    int _2396 = _2382;
    float _2398 = _2384;
    float _2400 = _2390;
    float _2402 = _2372;
    float _2404 = _2366;
    float _2406 = _2380;
    float _2408 = _2368;
    float _2410 = _2370;
    float _2412 = _2376;
    float _2414 = _2378;
    int _2416 = _2386;
    float _2418 = _2388;
    if (!_2392)
    {
        uint _2420 = uint(int(uint(_180) >> uint(2)));
        float _2422 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2420)]);
        int _2424 = _180 + 4;
        uint _2426 = uint(int(uint(_2424) >> uint(2)));
        float _2428 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2426)]);
        int _2430 = _180 + 8;
        uint _2432 = uint(int(uint(_2430) >> uint(2)));
        float _2434 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2432)]);
        int _2436 = _180 + 12;
        uint _2438 = uint(int(uint(_2436) >> uint(2)));
        float _2440 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2438)]);
        uint _2442 = uint(int(uint(_180) >> uint(2)));
        float _2444 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2442)]);
        int _2446 = _180 + 4;
        uint _2448 = uint(int(uint(_2446) >> uint(2)));
        float _2450 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2448)]);
        int _2452 = _180 + 8;
        uint _2454 = uint(int(uint(_2452) >> uint(2)));
        float _2456 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2454)]);
        int _2458 = _180 + 12;
        uint _2460 = uint(int(uint(_2458) >> uint(2)));
        float _2462 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2460)]);
        uint _2464 = uint(int(uint(_180) >> uint(2)));
        float _2466 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2464)]);
        int _2468 = _180 + 4;
        uint _2470 = uint(int(uint(_2468) >> uint(2)));
        float _2472 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2470)]);
        int _2474 = _180 + 8;
        uint _2476 = uint(int(uint(_2474) >> uint(2)));
        float _2478 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2476)]);
        int _2480 = _180 + 12;
        uint _2482 = uint(int(uint(_2480) >> uint(2)));
        float _2484 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2482)]);
        float _2486 = _2026 * _2428;
        float _2488 = _2026 * _2450;
        float _2490 = _2026 * _2472;
        float _2492 = fma(_1892, _2422, _2486);
        float _2494 = fma(_1892, _2444, _2488);
        float _2496 = fma(_1892, _2466, _2490);
        float _2498 = fma(_1904, _2434, _2492);
        float _2500 = fma(_1904, _2456, _2494);
        float _2502 = fma(_1904, _2478, _2496);
        float _2504 = _2498 + _2440;
        float _2506 = _2500 + _2462;
        float _2508 = _2502 + _2484;
        _2394 = _2444;
        _2396 = as_type<int>(_2466);
        _2398 = _2504;
        _2400 = _2508;
        _2402 = _2440;
        _2404 = _2506;
        _2406 = _2462;
        _2408 = _2492;
        _2410 = _2498;
        _2412 = _2494;
        _2414 = _2500;
        _2416 = as_type<int>(_2484);
    }
    float _2510 = _2394;
    int _2512 = _2396;
    float _2514 = _2398;
    float _2516 = _2400;
    float _2518 = _2402;
    float _2520 = _2404;
    float _2522 = _2406;
    float _2524 = _2408;
    float _2526 = _2410;
    float _2528 = _2412;
    float _2530 = _2414;
    int _2532 = _2416;
    float _2534 = _1932 + _2242;
    int _2536 = _2512;
    float _2538 = _2514;
    float _2540 = _2516;
    float _2542 = _2514;
    float _2544 = _2516;
    float _2546 = _2524;
    float _2548 = _2526;
    float _2550 = _2510;
    float _2552 = _2530;
    int _2554 = _2532;
    float _2556 = _2520;
    float _2558 = _2520;
    float _2560 = _2518;
    float _2562 = _2528;
    float _2564 = _2522;
    if (!_2116)
    {
        _1664 = 0;
    }
    int _2566 = _1664;
    int _2568 = _2566;
    if (!_2116)
    {
        _2080 = as_type<int>(_2032);
    }
    int _2570 = _2080;
    float _2572 = -_1938;
    bool _2574 = _2534 != _2572;
    bool _2576 = isnan(_2534);
    bool _2578 = _2574 || _2576;
    bool _2580 = isnan(_2572);
    bool _2582 = _2578 || _2580;
    bool _2584 = _2582;
    int _2586 = _2570;
    if (!_2116)
    {
        _2536 = as_type<int>(_2038);
    }
    int _2588 = _2536;
    int _2590 = _2582 ? 0 : 1;
    int _2592 = _2590;
    int _2594 = _2590;
    int _2596 = _2588;
    if (!_2116)
    {
        _2252 = as_type<int>(_2044);
    }
    int _2598 = _2252;
    bool _2600 = !_2116;
    int _2602 = _2598;
    if (!_2600)
    {
        uint _2604 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
        float _2606 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2604)]);
        int _2608 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 16;
        uint _2610 = uint(int(uint(_2608) >> uint(2)));
        float _2612 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2610)]);
        int _2614 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 8;
        uint _2616 = uint(int(uint(_2614) >> uint(2)));
        float _2618 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2616)]);
        int _2620 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 24;
        uint _2622 = uint(int(uint(_2620) >> uint(2)));
        float _2624 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2622)]);
        float _2626 = _2052 * 0.5;
        float _2628 = 1.0 / _2052;
        float _2630 = -_2612;
        float _2632 = fma(_2626, _2630, _2606);
        float _2634 = -_2626;
        float _2636 = _2634 + _2632;
        float _2638 = -_2624;
        float _2640 = fma(_2626, _2638, _2618);
        float _2642 = -_2636;
        float _2644 = _2642 + _2514;
        float _2646 = -_2626;
        float _2648 = _2646 + _2640;
        float _2650 = _2644 * _2628;
        float _2652 = -_2648;
        float _2654 = _2652 + _2516;
        float _2656 = floor(_2650);
        float _2658 = _2654 * _2628;
        float _2660 = floor(_2658);
        float _2662 = -_2656;
        float _2664 = fma(_2052, _2662, _2644);
        bool _2666 = _2664 != _2644;
        bool _2668 = isnan(_2664);
        bool _2670 = _2666 || _2668;
        bool _2672 = isnan(_2644);
        bool _2674 = _2670 || _2672;
        float _2676 = -_2660;
        float _2678 = fma(_2052, _2676, _2654);
        bool _2680 = _2678 == _2654;
        bool _2682 = !_2674;
        bool _2684 = _2680 && _2682;
        bool _2686 = !_2684;
        int _2688 = as_type<int>(_2658);
        int _2690 = as_type<int>(_2628);
        int _2692 = as_type<int>(_2656);
        _2568 = _2686 ? (-1) : 0;
        _2546 = _2664;
        _2548 = _2648;
        _2550 = _2678;
        _2552 = _2636;
        _2584 = _2684;
        _2418 = _2644;
        _2254 = _2654;
        if (_2684)
        {
            _2688 = as_type<int>(_2032);
        }
        int _2694 = _2688;
        int _2696 = _2694;
        if (!_2684)
        {
            float _2698 = _2636 + _2664;
            _2538 = _2698;
        }
        float _2700 = _2538;
        _2542 = _2700;
        if (_2684)
        {
            _2690 = as_type<int>(_2038);
        }
        int _2702 = _2690;
        int _2704 = _2702;
        if (!_2684)
        {
            float _2706 = _2648 + _2678;
            _2540 = _2706;
        }
        float _2708 = _2540;
        _2544 = _2708;
        if (_2684)
        {
            _2692 = as_type<int>(_2044);
        }
        int _2710 = _2692;
        _2602 = _2710;
        if (!_2684)
        {
            _2592 = 1;
        }
        int _2712 = _2592;
        _2594 = _2712;
        if (!_2684)
        {
            _2696 = 0;
        }
        int _2714 = _2696;
        _2586 = _2714;
        if (!_2684)
        {
            _2704 = 0;
        }
        int _2716 = _2704;
        _2596 = _2716;
        if (!_2684)
        {
            _2602 = 0;
        }
    }
    int _2718 = _2594;
    float _2720 = _2542;
    float _2722 = _2544;
    int _2724 = _2568;
    float _2726 = _2546;
    float _2728 = _2548;
    float _2730 = _2550;
    float _2732 = _2552;
    bool _2734 = _2584;
    float _2736 = _2418;
    int _2738 = _2586;
    int _2740 = _2596;
    int _2742 = _2602;
    float _2744 = _2254;
    int _2746 = _2718 & 1;
    bool _2748 = _2746 != 0;
    float _2750 = _1940 * 0.5;
    float _2752 = -_1912;
    float _2754 = _1124 + _2752;
    float _2756 = precise::max(_2750, 0.001000000047497451305389404296875);
    float _2758 = precise::min(_2756, 10000.0);
    float _2760 = _2736;
    bool _2762 = _2734;
    float _2764 = _2750;
    float _2766 = _2744;
    float _2768 = _2726;
    float _2770 = _2728;
    float _2772 = _2730;
    float _2774 = _2732;
    float _2776 = as_type<float>(_2742);
    float _2778 = as_type<float>(_2738);
    if (!_2748)
    {
        _2760 = _1920;
    }
    float _2780 = _2760;
    float _2782 = _2780;
    if (!_2748)
    {
        _2082 = _1926;
    }
    float _2784 = _2082;
    float _2786 = _2784;
    if (!_2748)
    {
        _2084 = _1932;
    }
    float _2788 = _2084;
    float _2790 = _2788;
    if (!_2748)
    {
        _2086 = _1938;
    }
    float _2792 = _2086;
    float _2794 = _2792;
    if (!_2748)
    {
        _2088 = _2056;
    }
    float _2796 = _2088;
    float _2798 = _2796;
    if (!_2748)
    {
        _2762 = false;
    }
    bool _2800 = _2762;
    bool _2802 = _2800;
    if (!_2748)
    {
        _2764 = _2062;
    }
    float _2804 = _2764;
    float _2806 = _2804;
    if (!_2748)
    {
        _2766 = _2068;
    }
    float _2808 = _2766;
    float _2810 = 0.0;
    float _2812 = _2808;
    if (!_2748)
    {
        _2810 = _2074;
    }
    float _2814 = _2810;
    int _2816 = 0;
    float _2818 = _2814;
    if (!_2748)
    {
        _2816 = as_type<int>(_1892);
    }
    int _2820 = _2816;
    int _2822 = _2820;
    int _2824 = _2820;
    if (!_2748)
    {
        _2554 = as_type<int>(_2026);
    }
    int _2826 = _2554;
    int _2828 = 0;
    int _2830 = _2826;
    if (!_2748)
    {
        _2828 = as_type<int>(_1904);
    }
    int _2832 = _2828;
    bool _2834 = !_2748;
    int _2836 = _2832;
    int _2838 = _2832;
    float _2840 = 0.0;
    float _2842 = 0.0;
    float _2844 = 0.0;
    if (!_2834)
    {
        float _2846 = fma(_2720, 6.2500002968590706586837768554688e-05, 0.5);
        float _2848 = fma(_2722, 6.2500002968590706586837768554688e-05, 0.5);
        float _2850 = fma(_2720, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
        float _2852 = fma(_2722, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
        float _2854 = fma(_2722, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
        float2 _14125 = float2(_2846, _2848);
        float2 _2858 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_14125, float2(0.0), isnan(_14125)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_14125, float2(0.0), isnan(_14125)), level(0.0)).xy;
        float _2860 = _2858.x;
        float _2862 = _2858.y;
        float _2864 = fma(_2720, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
        float _2866 = fma(_2720, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
        float _2868 = fma(_2722, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
        float2 _14146 = float2(_2850, _2852);
        float _2870 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_14146, float2(0.0), isnan(_14146)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_14146, float2(0.0), isnan(_14146)), level(0.0)).x;
        float2 _14154 = float2(_2850, _2854);
        float _2872 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_14154, float2(0.0), isnan(_14154)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_14154, float2(0.0), isnan(_14154)), level(0.0)).x;
        float2 _14162 = float2(_2864, _2852);
        float _2874 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_14162, float2(0.0), isnan(_14162)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_14162, float2(0.0), isnan(_14162)), level(0.0)).x;
        float2 _14170 = float2(_2866, _2848);
        float2 _2876 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_14170, float2(0.0), isnan(_14170)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_14170, float2(0.0), isnan(_14170)), level(0.0)).xy;
        float _2878 = _2876.x;
        float _2880 = _2876.y;
        float2 _14182 = float2(_2846, _2868);
        float2 _2882 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_14182, float2(0.0), isnan(_14182)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_14182, float2(0.0), isnan(_14182)), level(0.0)).xy;
        float _2884 = _2882.x;
        float _2886 = _2882.y;
        float2 _14194 = float2(_2864, _2854);
        float _2888 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_14194, float2(0.0), isnan(_14194)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_14194, float2(0.0), isnan(_14194)), level(0.0)).x;
        float _2890 = -_2862;
        float _2892 = _2860 + _2890;
        float _2894 = _2892 * 2000.0;
        float _2896 = abs(_2894);
        bool _2898 = _2896 >= 2.0;
        bool _2900 = isnan(_2896);
        bool _2902 = _2898 || _2900;
        bool _2904 = isnan(2.0);
        bool _2906 = _2902 || _2904;
        float _2908 = _2894;
        float _2910 = _2850;
        float _2912 = _2862;
        float _2914 = _2886;
        float _2916 = _2864;
        float _2918 = _2846;
        _2774 = _2848;
        if (_2906)
        {
            int _2920 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 4;
            uint _2922 = uint(int(uint(_2920) >> uint(2)));
            float _2924 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2922)]);
            _2908 = _2924;
        }
        float _2926 = _2908;
        float _2928 = _2860 * 2000.0;
        float _2930 = -_2860;
        float _2932 = _2930 + _2878;
        float _2934 = -_2860;
        float _2936 = _2934 + _2884;
        float _2938 = -_2860;
        float _2940 = _2938 + _2870;
        float _2942 = _2928;
        if (_2906)
        {
            float _2944 = _2928 + (-2.0);
            _2910 = _2944;
        }
        float _2946 = _2910;
        float _2948 = _2932 * 1000.0;
        float _2950 = _2936 * 1000.0;
        float _2952 = -_2860;
        float _2954 = _2952 + _2872;
        float _2956 = _2940 * 2000.0;
        float _2958 = -_2860;
        float _2960 = _2958 + _2874;
        float _2962 = -_2860;
        float _2964 = _2962 + _2888;
        float _2966 = _2954 * 2000.0;
        float _2968 = _2964 * 2000.0;
        float _2970 = abs(_2956);
        float _2972 = abs(_2966);
        float _2974 = precise::max(_2970, _2972);
        float _2976 = _2960 * 2000.0;
        float _2978 = abs(_2976);
        float _2980 = precise::max(_2974, _2978);
        float _2982 = abs(_2968);
        float _2984 = precise::max(_2980, _2982);
        float _2986 = _2926;
        float _2988 = _2976;
        float _2990 = _2960;
        float _2992 = _2964;
        if (_2906)
        {
            float _2994 = _2926 + 10.0;
            _2986 = _2994;
        }
        float _2996 = _2986;
        bool _2998 = _2996 < _2946;
        bool _3000 = !_2906;
        bool _3002 = _2998 || _3000;
        float _3004 = fma(_2948, _2948, 0.0625);
        float _3006 = fma(_2950, _2950, _3004);
        float _3008 = rsqrt(_3006);
        float _3010 = _3008 * 0.25;
        float _3012 = _2948 * _3008;
        float _3014 = _2950 * _3008;
        bool _3016 = _3010 < 0.891006529331207275390625;
        bool _3018 = _3016 || _3002;
        bool _3020 = _2984 >= 2.0;
        bool _3022 = isnan(_2984);
        bool _3024 = _3020 || _3022;
        bool _3026 = isnan(2.0);
        bool _3028 = _3024 || _3026;
        bool _3030 = _3028 || _3018;
        bool _3032 = !_3030;
        float _3034 = _2996;
        float _3066;
        float _3068;
        float _3070;
        float _3072;
        if (!_3032)
        {
            float _3036 = -_2862;
            float _3038 = _3036 + _2880;
            float _3040 = -_2862;
            float _3042 = _3040 + _2886;
            float _3044 = _3038 * 1000.0;
            float _3046 = _3042 * 1000.0;
            float _3048 = fma(_3044, _3044, 0.0625);
            float _3050 = fma(_3046, _3046, _3048);
            float _3052 = _2862 * 2000.0;
            float _3054 = rsqrt(_3050);
            float _3056 = -_3044;
            float _3058 = fma(_3056, _3054, -0.0);
            float _3060 = -_3046;
            float _3062 = fma(_3060, _3054, -0.0);
            float _3064 = _3054 * 0.25;
            _3066 = _3052;
            _3068 = _3062;
            _3070 = _3058;
            _3072 = _3064;
            _3074 = true;
        }
        else
        {
            float _3076 = _3014 * _3014;
            float _3078 = 1.0 / _3010;
            float _3080 = fma(_3012, _3012, _3076);
            float _3082 = sqrt(_3080);
            bool _3084 = _3082 > 9.9999997473787516355514526367188e-05;
            float _3086 = _3082 * _3078;
            float _3088 = _3076;
            if (_3084)
            {
                float _3090 = abs(_3012);
                float _3092 = abs(_3014);
                float _3094 = precise::max(_3090, _3092);
                _2912 = _3094;
            }
            float _3096 = _2912;
            float _3098 = -_3012;
            float _3100 = (-0.0) + _3098;
            _3070 = _3100;
            if (!_3084)
            {
                _3088 = 0.0;
            }
            float _3102 = _3088;
            float _3104 = -_3014;
            float _3106 = (-0.0) + _3104;
            float _3108 = _3096;
            float _3110 = _3102;
            _3068 = _3106;
            if (_3084)
            {
                float _3112 = 1.0 / _3096;
                _3108 = _3112;
            }
            float _3114 = _3108;
            if (_3084)
            {
                float _3116 = _3082 * _3114;
                _3110 = _3116;
            }
            float _3118 = _3110;
            float _3120 = _3118 * 0.9649016857147216796875;
            float _3122 = -_3120;
            float _3124 = fma(_3122, _3086, _2928);
            _3066 = _3124;
            _3072 = _3010;
        }
        _3074 = false;
        float _3126 = _3066;
        float _3128 = _3068;
        float _3130 = _3070;
        float _3132 = _3072;
        float2 _14505 = float2(_2846, _2848);
        float _3134 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_14505, float2(0.0), isnan(_14505)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_14505, float2(0.0), isnan(_14505)), level(0.0)).y;
        float _3136 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[81]);
        bool _3138 = _2520 >= _3126;
        int _3140 = (_3138 ? (-1) : 0) | _2724;
        float _3142 = 0.0 + _3136;
        float _3144 = precise::clamp(_3142, 0.0, 1.0);
        bool _3146 = _2138 >= _3144;
        int _3148 = (_3146 ? (-1) : 0) & _3140;
        int _3150 = ~_3148;
        float _3152 = _3126;
        float _3154 = _3126;
        float _3216;
        float _3218;
        float _3220;
        float _3222;
        float _3224;
        float _3226;
        float _3228;
        float _3230;
        float _3232;
        float _3234;
        float _3236;
        bool _3238;
        float _3240;
        float _3242;
        if (!(_3150 != 0))
        {
            float _3156 = _2126 * 6.283185482025146484375;
            float _3158 = _2120 * 6.283185482025146484375;
            float _3160 = _2132 * 6.283185482025146484375;
            if (_2724 != 0)
            {
                float _3162 = fma(_2126, _2052, _3126);
                _2556 = _3162;
            }
            float _3164 = _2556;
            float _3166 = _3156 * _3156;
            float _3168 = fma(_3158, _3158, _3166);
            float _3170 = fma(_3160, _3160, _3168);
            float _3172 = sqrt(_3170);
            float _3174 = rsqrt(_3170);
            float _3176 = _3172 * 0.5;
            bool _3178 = _3172 != 0.0;
            bool _3180 = isnan(_3172);
            bool _3182 = _3178 || _3180;
            bool _3184 = isnan(0.0);
            bool _3186 = _3182 || _3184;
            float _3188 = _3176 * 0.15915493667125701904296875;
            float _3190 = _3158 * _3174;
            float _3192 = _3188 * 6.283185482025146484375;
            float _3194 = sin(_3192);
            float _3196 = _3156 * _3174;
            float _3198 = _3160 * _3174;
            float _3200 = _3186 ? _3190 : 0.0;
            float _3202 = _3186 ? _3196 : 0.0;
            float _3204 = _3188 * 6.283185482025146484375;
            float _3206 = cos(_3204);
            float _3208 = _3186 ? _3198 : 0.0;
            float _3210 = _3200 * _3194;
            float _3212 = _3202 * _3194;
            float _3214 = _3208 * _3194;
            _3216 = _3208;
            _3218 = _3170;
            _3220 = _3200;
            _3222 = _3174;
            _3224 = _3164;
            _3226 = _3164;
            _3228 = _3214;
            _3230 = _3212;
            _3232 = _3206;
            _3234 = _3188;
            _3236 = _3202;
            _3238 = _3186;
            _3240 = _3210;
            _3242 = 0.0;
            _3244 = true;
        }
        else
        {
            float _3246 = _3130 * _3130;
            float _3248 = fma(_3128, _3128, _3246);
            float _3250 = sqrt(_3248);
            float _3252 = precise::max(_3250, -1.0);
            float _3254 = precise::min(_3252, 1.0);
            float _3256 = abs(_3254);
            float _3258 = fma(_3256, -0.5, 0.5);
            int _3260 = as_type<int>(_3258) + (-218103808);
            bool _3262 = uint(_3260) >= 1920991232u;
            bool _3264 = !_3262;
            int _3284;
            if (!_3264)
            {
                int _3266 = 1056964608;
                int _3268 = as_type<int>(_3144);
                int _3270 = as_type<int>(_3258);
                int _3272 = 11504;
                int _3274;
                int _3276;
                int _3278;
                int _3280;
                int _3282;
                _87(_3266, _3268, _3270, _3272, _3274, _3276, _3278, _3280, _3282);
                _3284 = _3274;
                _3286 = true;
            }
            else
            {
                float _3288 = rsqrt(_3258);
                float _3290 = _3258 * _3288;
                float _3292 = _3288 * 0.5;
                float _3294 = -_3290;
                float _3296 = 0.0 + _3294;
                float _3298 = fma(_3292, _3296, 0.5);
                float _3300 = fma(_3290, _3298, _3290);
                float _3302 = -_3300;
                float _3304 = 0.0 + _3302;
                float _3306 = fma(_3300, _3304, _3258);
                float _3308 = fma(_3292, _3306, _3300);
                _3284 = as_type<int>(_3308);
            }
            _3286 = false;
            int _3310 = _3284;
            float _3312 = abs(_3254);
            bool _3314 = _3312 > 0.569999992847442626953125;
            float _3316 = _3250 + 9.9999997473787516355514526367188e-06;
            float _3318 = _2132 * 6.283185482025146484375;
            float _3320 = abs(_3254);
            float _3322 = _3314 ? as_type<float>(_3310) : _3320;
            float _3324 = 1.0 / _3316;
            float _3326 = _3318 * _3132;
            float _3328 = _3322 * _3322;
            float _3330 = fma(_3328, 0.0517513789236545562744140625, 0.01816697604954242706298828125);
            float _3332 = fma(_3328, _3330, 0.0467568598687648773193359375);
            float _3334 = fma(_3328, _3332, 0.074846573173999786376953125);
            float _3336 = fma(_3328, _3334, 0.166670143604278564453125);
            float _3338 = _3328 * _3336;
            float _3340 = _3326 * _3326;
            float _3342 = fma(_3322, _3338, _3322);
            float _3344 = _3324 * _3130;
            float _3346 = _3342;
            _3242 = 1.0;
            if (_3314)
            {
                float _3348 = fma(_3342, -2.0, 1.57079637050628662109375);
                _3346 = _3348;
            }
            float _3350 = _3346;
            bool _3352 = _3254 >= 0.0;
            bool _3354 = isnan(_3254);
            bool _3356 = _3352 || _3354;
            bool _3358 = isnan(0.0);
            bool _3360 = _3356 || _3358;
            float _3362 = _3318 * _3130;
            float _3364 = _3318 * _3128;
            float _3366 = -_3128;
            float _3368 = _3324 * _3366;
            bool _3370 = !_3360;
            float _3372 = -_3350;
            float _3374 = _3370 ? _3372 : _3350;
            float _3376 = fma(_3362, _3362, _3340);
            float _3378 = -_3126;
            float _3380 = fma(_3134, 2000.0, _3378);
            float _3382 = _3374 * _3344;
            float _3384 = fma(_3364, _3364, _3376);
            float _3386 = _3374 * _3368;
            float _3388 = abs(_3380);
            bool _3390 = _3388 >= 2.0;
            bool _3392 = isnan(_3388);
            bool _3394 = _3390 || _3392;
            bool _3396 = isnan(2.0);
            bool _3398 = _3394 || _3396;
            float _3400 = _3382 * _3382;
            float _3402 = sqrt(_3384);
            bool _3404 = _3132 <= 0.891006529331207275390625;
            bool _3406 = !_3398;
            bool _3408 = _3404 || _3406;
            float _3410 = fma(_3386, _3386, _3400);
            float _3412 = sqrt(_3410);
            _3224 = _3380;
            _3238 = _3408;
            if (_3408)
            {
                float _3414 = _3126 + (-1000.0);
                _3152 = _3414;
            }
            float _3416 = _3152;
            float _3418 = rsqrt(_3384);
            float _3420 = _3402 * 0.5;
            bool _3422 = _3402 != 0.0;
            bool _3424 = isnan(_3402);
            bool _3426 = _3422 || _3424;
            bool _3428 = isnan(0.0);
            bool _3430 = _3426 || _3428;
            float _3432 = _3420 * 0.15915493667125701904296875;
            float _3434 = rsqrt(_3410);
            float _3436 = _3412 * 0.5;
            bool _3438 = _3412 != 0.0;
            bool _3440 = isnan(_3412);
            bool _3442 = _3438 || _3440;
            bool _3444 = isnan(0.0);
            bool _3446 = _3442 || _3444;
            float _3448 = _3436 * 0.15915493667125701904296875;
            float _3450 = _3432 * 6.283185482025146484375;
            float _3452 = sin(_3450);
            float _3454 = _3362 * _3418;
            float _3456 = _3364 * _3418;
            float _3458 = _3326 * _3418;
            float _3460 = _3430 ? _3454 : 0.0;
            float _3462 = _3448 * 6.283185482025146484375;
            float _3464 = sin(_3462);
            float _3466 = _3386 * _3434;
            float _3468 = _3382 * _3434;
            float _3470 = _3430 ? _3456 : 0.0;
            float _3472 = _3430 ? _3458 : 0.0;
            float _3474 = _3446 ? _3466 : 0.0;
            float _3476 = _3448 * 6.283185482025146484375;
            float _3478 = cos(_3476);
            float _3480 = _3460 * _3452;
            float _3482 = _3446 ? _3468 : 0.0;
            float _3484 = _3470 * _3452;
            float _3486 = _3472 * _3452;
            float _3488 = _3432 * 6.283185482025146484375;
            float _3490 = cos(_3488);
            float _3492 = _3474 * _3464;
            float _3494 = _3482 * _3464;
            float _3496 = _3494 * _3480;
            float _3498 = _3494 * _3484;
            float _3500 = _3478 * _3480;
            float _3502 = _3478 * _3484;
            float _3504 = fma(_3492, _3480, _3498);
            float _3506 = fma(_3492, _3490, _3500);
            float _3508 = fma(_3494, _3490, _3502);
            float _3510 = fma(_3494, _3486, _3506);
            float _3512 = -_3496;
            float _3514 = fma(_3492, _3484, _3512);
            float _3516 = -_3492;
            float _3518 = fma(_3516, _3486, _3508);
            float _3520 = fma(_3478, _3486, _3514);
            float _3522 = -_3504;
            float _3524 = fma(_3478, _3490, _3522);
            _3154 = _3416;
            _3216 = _3502;
            _3218 = _3492;
            _3220 = _3480;
            _3222 = _3506;
            _2914 = _3486;
            _2988 = _3504;
            _2916 = _3496;
            _2990 = _3434;
            _2942 = _3448;
            _2992 = _3418;
            _3034 = _3432;
            _2918 = _3402;
            _3226 = _3416;
            _3228 = _3518;
            _3230 = _3520;
            _3232 = _3524;
            _3234 = _3490;
            _3236 = _3478;
            _3240 = _3510;
        }
        _3244 = false;
        float _3526 = _3154;
        float _3528 = _3216;
        float _3530 = _3218;
        float _3532 = _3220;
        float _3534 = _3222;
        float _3536 = _2914;
        float _3538 = _2988;
        float _3540 = _2916;
        float _3542 = _3224;
        float _3544 = _2990;
        float _3546 = _2942;
        float _3548 = _2992;
        float _3550 = _3034;
        float _3552 = _2918;
        float _3554 = _3226;
        float _3556 = _3228;
        float _3558 = _3230;
        float _3560 = _3232;
        float _3562 = _3234;
        float _3564 = _3236;
        bool _3566 = _3238;
        float _3568 = _3240;
        float _3570 = _3242;
        bool _3572 = !_1948;
        bool _3574 = _3566;
        float _3576 = _3532;
        float _3578 = _3564;
        float _3580 = _3562;
        float _3582 = _3526;
        float _3584 = _3528;
        float _3586 = _3530;
        _2256 = _3534;
        _2258 = _3536;
        _2260 = _3538;
        _2262 = _3540;
        _2558 = _3542;
        _2768 = _3544;
        _2770 = _3546;
        _2560 = _3548;
        _2772 = _3550;
        _2562 = _3552;
        _2782 = _3568;
        _2830 = as_type<int>(_3554);
        _2818 = _3570;
        if (!_3572)
        {
            float _3588 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _3590 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _3592 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _3594 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _3596 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[28]);
            float _3598 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[29]);
            float _3600 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[30]);
            float _3602 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[31]);
            float _3604 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _3606 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _3608 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _3610 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _3612 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _3614 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _3616 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _3618 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _3620 = _3594 * _3596;
            float _3622 = _3594 * _3600;
            float _3624 = _3594 * _3598;
            float _3626 = _3590 * _3596;
            float _3628 = _3610 * _3600;
            float _3630 = _3610 * _3596;
            float _3632 = -_3620;
            float _3634 = fma(_3588, _3602, _3632);
            float _3636 = _3610 * _3598;
            float _3638 = -_3628;
            float _3640 = fma(_3608, _3602, _3638);
            float _3642 = _3610 * _3592;
            float _3644 = _3610 * _3590;
            float _3646 = -_3630;
            float _3648 = fma(_3604, _3602, _3646);
            float _3650 = _3610 * _3588;
            float _3652 = _3592 * _3596;
            float _3654 = -_3622;
            float _3656 = fma(_3592, _3602, _3654);
            float _3658 = -_3624;
            float _3660 = fma(_3590, _3602, _3658);
            float _3662 = -_3636;
            float _3664 = fma(_3606, _3602, _3662);
            float _3666 = -_3642;
            float _3668 = fma(_3608, _3594, _3666);
            float _3670 = -_3644;
            float _3672 = fma(_3606, _3594, _3670);
            float _3674 = -_3650;
            float _3676 = fma(_3604, _3594, _3674);
            float _3678 = -_3652;
            float _3680 = fma(_3588, _3600, _3678);
            float _3682 = _3608 * _3590;
            float _3684 = _3608 * _3588;
            float _3686 = -_3626;
            float _3688 = fma(_3588, _3598, _3686);
            float _3690 = _3606 * _3588;
            float _3692 = _3608 * _3634;
            float _3694 = _3606 * _3596;
            float _3696 = _3592 * _3598;
            float _3698 = _3608 * _3596;
            float _3700 = -_3682;
            float _3702 = fma(_3606, _3592, _3700);
            float _3704 = _3608 * _3660;
            float _3706 = -_3692;
            float _3708 = fma(_3604, _3656, _3706);
            float _3710 = -_3694;
            float _3712 = fma(_3604, _3598, _3710);
            float _3714 = _3608 * _3598;
            float _3716 = -_3696;
            float _3718 = fma(_3590, _3600, _3716);
            float _3720 = -_3690;
            float _3722 = fma(_3604, _3590, _3720);
            float _3724 = _3606 * _3634;
            float _3726 = _3606 * _3680;
            float _3728 = -_3704;
            float _3730 = fma(_3606, _3656, _3728);
            float _3732 = fma(_3610, _3680, _3708);
            float _3734 = -_3714;
            float _3736 = fma(_3606, _3600, _3734);
            float _3738 = -_3684;
            float _3740 = fma(_3604, _3592, _3738);
            float _3742 = -_3724;
            float _3744 = fma(_3604, _3660, _3742);
            float _3746 = -_3726;
            float _3748 = fma(_3604, _3718, _3746);
            float _3750 = fma(_3610, _3718, _3730);
            float _3752 = _3614 * _3732;
            float _3754 = -_3698;
            float _3756 = fma(_3604, _3600, _3754);
            float _3758 = _3616 * _3660;
            float _3760 = fma(_3610, _3688, _3744);
            float _3762 = -_3752;
            float _3764 = fma(_3612, _3750, _3762);
            float _3766 = fma(_3608, _3688, _3748);
            float _3768 = -_3758;
            float _3770 = fma(_3614, _3656, _3768);
            float _3772 = _3616 * _3634;
            float _3774 = fma(_3616, _3760, _3764);
            float _3776 = _3614 * _3634;
            float _3778 = _3616 * _3664;
            float _3780 = _3616 * _3648;
            float _3782 = -_3618;
            float _3784 = fma(_3782, _3766, _3774);
            float _3786 = -_3776;
            float _3788 = fma(_3612, _3660, _3786);
            float _3790 = -_3778;
            float _3792 = fma(_3614, _3640, _3790);
            float _3794 = _3616 * _3672;
            float _3796 = 1.0 / _3784;
            float _3798 = -_3780;
            float _3800 = fma(_3612, _3640, _3798);
            float _3802 = _3614 * _3648;
            float _3804 = _3616 * _3676;
            float _3806 = _3614 * _3676;
            float _3808 = fma(_3618, _3718, _3770);
            float _3810 = -_3772;
            float _3812 = fma(_3612, _3656, _3810);
            float _3814 = fma(_3618, _3688, _3788);
            float _3816 = -_3794;
            float _3818 = fma(_3614, _3668, _3816);
            float _3820 = -_3802;
            float _3822 = fma(_3612, _3664, _3820);
            float _3824 = -_3804;
            float _3826 = fma(_3612, _3668, _3824);
            float _3828 = -_3806;
            float _3830 = fma(_3612, _3672, _3828);
            float _3832 = fma(_3618, _3680, _3812);
            float _3834 = fma(_3618, _3702, _3818);
            float _3836 = fma(_3618, _3756, _3800);
            float _3838 = fma(_3618, _3736, _3792);
            float _3840 = _3808 * _3796;
            float _3842 = _3732 * _3796;
            float _3844 = _3814 * _3796;
            float _3846 = _3750 * _3796;
            float _3848 = _3840 * _3554;
            float _3850 = fma(_3618, _3712, _3822);
            float _3852 = _3832 * _3796;
            float _3854 = _3760 * _3796;
            float _3856 = _3842 * _2720;
            float _3858 = _3844 * _3554;
            float _3860 = fma(_3618, _3740, _3826);
            float _3862 = -_3848;
            float _3864 = fma(_3846, _2720, _3862);
            float _3866 = -_3856;
            float _3868 = fma(_3852, _3554, _3866);
            float _3870 = -_3858;
            float _3872 = fma(_3854, _2720, _3870);
            float _3874 = _3838 * _3796;
            float _3876 = _3836 * _3796;
            float _3878 = _3850 * _3796;
            float _3880 = fma(_3618, _3722, _3830);
            float _3882 = fma(_3874, _2722, _3864);
            float _3884 = -_3876;
            float _3886 = fma(_3884, _2722, _3868);
            float _3888 = fma(_3878, _2722, _3872);
            float _3890 = -_3834;
            float _3892 = fma(_3890, _3796, _3882);
            float _3894 = fma(_3860, _3796, _3886);
            float _3896 = -_3880;
            float _3898 = fma(_3896, _3796, _3888);
            _2256 = _3876;
            _2258 = _3836;
            _2260 = _3852;
            _2262 = _3672;
            _2558 = _3854;
            _2768 = _3760;
            _2770 = _3840;
            _2560 = _3832;
            _2772 = _3844;
            _2562 = _3834;
            _2774 = _3878;
            _2564 = _3618;
            _2802 = true;
            _2824 = as_type<int>(_3892);
            _2794 = _3560;
            _2838 = as_type<int>(_3898);
            _2790 = _3556;
            _2830 = as_type<int>(_3894);
            _2786 = _3558;
            _2840 = _3842;
            _2842 = _3766;
            _2844 = _3712;
            _2798 = 0.0;
            _2812 = 0.0;
            _2806 = 0.0;
            _3900 = true;
        }
        else
        {
            bool _3902 = !_2176;
            if (!_3902)
            {
                float _3904 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                uint _3906 = uint(int(uint(_180) >> uint(2)));
                float _3908 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3906)]);
                int _3910 = _180 + 4;
                uint _3912 = uint(int(uint(_3910) >> uint(2)));
                float _3914 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3912)]);
                int _3916 = _180 + 8;
                uint _3918 = uint(int(uint(_3916) >> uint(2)));
                float _3920 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3918)]);
                uint _3922 = uint(int(uint(_180) >> uint(2)));
                float _3924 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3922)]);
                int _3926 = _180 + 4;
                uint _3928 = uint(int(uint(_3926) >> uint(2)));
                float _3930 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3928)]);
                int _3932 = _180 + 8;
                uint _3934 = uint(int(uint(_3932) >> uint(2)));
                float _3936 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3934)]);
                uint _3938 = uint(int(uint(_180) >> uint(2)));
                float _3940 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3938)]);
                int _3942 = _180 + 4;
                uint _3944 = uint(int(uint(_3942) >> uint(2)));
                float _3946 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3944)]);
                int _3948 = _180 + 8;
                uint _3950 = uint(int(uint(_3948) >> uint(2)));
                float _3952 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3950)]);
                float _3954 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _3956 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _3958 = _3920 * _3924;
                float _3960 = _3920 * _3930;
                float _3962 = -_3958;
                float _3964 = fma(_3908, _3936, _3962);
                float _3966 = _3914 * _3924;
                float _3968 = -_3960;
                float _3970 = fma(_3914, _3936, _3968);
                float _3972 = _3946 * _3964;
                float _3974 = -_3966;
                float _3976 = fma(_3908, _3930, _3974);
                float _3978 = -_3972;
                float _3980 = fma(_3940, _3970, _3978);
                float _3982 = fma(_3952, _3976, _3980);
                float _3984 = _3904 * _3936;
                float _3986 = 1.0 / _3982;
                float _3988 = _3904 * _3930;
                float _3990 = _3904 * _3924;
                float _3992 = _3952 * _3924;
                float _3994 = _3946 * _3936;
                float _3996 = -_3984;
                float _3998 = fma(_3920, _3954, _3996);
                float _4000 = -_3988;
                float _4002 = fma(_3914, _3954, _4000);
                float _4004 = -_3990;
                float _4006 = fma(_3908, _3954, _4004);
                float _4008 = -_3908;
                float _4010 = fma(_4008, _3936, _3958);
                float _4012 = -_3992;
                float _4014 = fma(_3940, _3936, _4012);
                float _4016 = _3940 * _3930;
                float _4018 = -_3994;
                float _4020 = fma(_3952, _3930, _4018);
                float _4022 = _3952 * _3914;
                float _4024 = _3940 * _3920;
                float _4026 = _3946 * _3908;
                float _4028 = -_4016;
                float _4030 = fma(_3946, _3924, _4028);
                float _4032 = -_4022;
                float _4034 = fma(_3946, _3920, _4032);
                float _4036 = -_4024;
                float _4038 = fma(_3952, _3908, _4036);
                float _4040 = _3952 * _4002;
                float _4042 = _4020 * _3986;
                float _4044 = _4014 * _3986;
                float _4046 = -_4026;
                float _4048 = fma(_3940, _3914, _4046);
                float _4050 = _4030 * _3986;
                float _4052 = _3952 * _4006;
                float _4054 = _3946 * _4006;
                float _4056 = -_4040;
                float _4058 = fma(_3946, _3998, _4056);
                float _4060 = _4042 * _3554;
                float _4062 = _4044 * _3554;
                float _4064 = _4050 * _3554;
                float _4066 = _4010 * _3986;
                float _4068 = _3970 * _3986;
                float _4070 = _3976 * _3986;
                float _4072 = -_4052;
                float _4074 = fma(_3940, _3998, _4072);
                float _4076 = fma(_4066, _2720, _4062);
                float _4078 = fma(_4068, _2720, _4060);
                float _4080 = fma(_4070, _2720, _4064);
                float _4082 = _4038 * _3986;
                float _4084 = _4034 * _3986;
                float _4086 = _4048 * _3986;
                float _4088 = -_4054;
                float _4090 = fma(_3940, _4002, _4088);
                float _4092 = fma(_4082, _2722, _4076);
                float _4094 = fma(_4084, _2722, _4078);
                float _4096 = fma(_3956, _3964, _4074);
                float _4098 = fma(_3956, _3970, _4058);
                float _4100 = fma(_4086, _2722, _4080);
                float _4102 = fma(_3956, _3976, _4090);
                float _4104 = fma(_4096, _3986, _4092);
                float _4106 = -_4098;
                float _4108 = fma(_4106, _3986, _4094);
                float _4110 = -_4102;
                float _4112 = fma(_4110, _3986, _4100);
                _2256 = _4096;
                _2258 = _4038;
                _2260 = _4100;
                _2262 = _4092;
                _2558 = _3940;
                _2768 = _4098;
                _2770 = _3952;
                _2560 = _3998;
                _2772 = _3970;
                _2562 = _4010;
                _2774 = _3964;
                _2564 = _4002;
                _2802 = true;
                _2824 = as_type<int>(_4108);
                _2794 = _3560;
                _2838 = as_type<int>(_4112);
                _2790 = _3556;
                _2830 = as_type<int>(_4104);
                _2786 = _3558;
                _2840 = 0.0;
                _2842 = 0.0;
                _2844 = 0.0;
                _2798 = 0.0;
                _2812 = 0.0;
                _2806 = 0.0;
                _3900 = true;
            }
            else
            {
                if (!_2228)
                {
                    _3574 = true;
                }
                bool _4114 = _3574;
                _2802 = _4114;
                if (!_2228)
                {
                    _3576 = 0.0;
                }
                float _4116 = _3576;
                _2798 = _4116;
                if (!_2228)
                {
                    _3578 = 0.0;
                }
                float _4118 = _3578;
                _2806 = _4118;
                if (!_2228)
                {
                    _3580 = 0.0;
                }
                float _4120 = _3580;
                _2812 = _4120;
                if (!_2228)
                {
                    _3582 = _3558;
                }
                float _4122 = _3582;
                _2786 = _4122;
                if (!_2228)
                {
                    _3584 = _3556;
                }
                float _4124 = _3584;
                _2790 = _4124;
                if (!_2228)
                {
                    _3586 = _3560;
                }
                float _4126 = _3586;
                _2794 = _4126;
                if (!_2228)
                {
                    _2822 = as_type<int>(_2720);
                }
                int _4128 = _2822;
                _2824 = _4128;
                if (!_2228)
                {
                    _2836 = as_type<int>(_2722);
                }
                int _4130 = _2836;
                bool _4132 = !_2228;
                _2838 = _4130;
                _2840 = 0.0;
                _2842 = 0.0;
                _2844 = 0.0;
                if (!_4132)
                {
                    uint _4134 = uint(int(uint(_180) >> uint(2)));
                    float _4136 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4134)]);
                    int _4138 = _180 + 4;
                    uint _4140 = uint(int(uint(_4138) >> uint(2)));
                    float _4142 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4140)]);
                    int _4144 = _180 + 8;
                    uint _4146 = uint(int(uint(_4144) >> uint(2)));
                    float _4148 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4146)]);
                    int _4150 = _180 + 12;
                    uint _4152 = uint(int(uint(_4150) >> uint(2)));
                    float _4154 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4152)]);
                    uint _4156 = uint(int(uint(_180) >> uint(2)));
                    float _4158 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4156)]);
                    int _4160 = _180 + 4;
                    uint _4162 = uint(int(uint(_4160) >> uint(2)));
                    float _4164 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4162)]);
                    int _4166 = _180 + 8;
                    uint _4168 = uint(int(uint(_4166) >> uint(2)));
                    float _4170 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4168)]);
                    int _4172 = _180 + 12;
                    uint _4174 = uint(int(uint(_4172) >> uint(2)));
                    float _4176 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4174)]);
                    uint _4178 = uint(int(uint(_180) >> uint(2)));
                    float _4180 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4178)]);
                    int _4182 = _180 + 4;
                    uint _4184 = uint(int(uint(_4182) >> uint(2)));
                    float _4186 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4184)]);
                    int _4188 = _180 + 8;
                    uint _4190 = uint(int(uint(_4188) >> uint(2)));
                    float _4192 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4190)]);
                    int _4194 = _180 + 12;
                    uint _4196 = uint(int(uint(_4194) >> uint(2)));
                    float _4198 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4196)]);
                    float _4200 = _4148 * _4158;
                    float _4202 = _4148 * _4164;
                    float _4204 = _4142 * _4158;
                    float _4206 = _4170 * _4154;
                    float _4208 = -_4200;
                    float _4210 = fma(_4136, _4170, _4208);
                    float _4212 = -_4202;
                    float _4214 = fma(_4142, _4170, _4212);
                    float _4216 = -_4204;
                    float _4218 = fma(_4136, _4164, _4216);
                    float _4220 = _4164 * _4154;
                    float _4222 = _4186 * _4210;
                    float _4224 = _4158 * _4154;
                    float _4226 = _4186 * _4170;
                    float _4228 = -_4206;
                    float _4230 = fma(_4148, _4176, _4228);
                    float _4232 = -_4222;
                    float _4234 = fma(_4180, _4214, _4232);
                    float _4236 = -_4220;
                    float _4238 = fma(_4142, _4176, _4236);
                    float _4240 = -_4224;
                    float _4242 = fma(_4136, _4176, _4240);
                    float _4244 = _4192 * _4158;
                    float _4246 = fma(_4192, _4218, _4234);
                    float _4248 = -_4226;
                    float _4250 = fma(_4192, _4164, _4248);
                    float _4252 = _4180 * _4164;
                    float _4254 = _4192 * _4142;
                    float _4256 = _4180 * _4148;
                    float _4258 = -_4244;
                    float _4260 = fma(_4180, _4170, _4258);
                    float _4262 = 1.0 / _4246;
                    float _4264 = -_4136;
                    float _4266 = fma(_4264, _4170, _4200);
                    float _4268 = -_4252;
                    float _4270 = fma(_4186, _4158, _4268);
                    float _4272 = -_4254;
                    float _4274 = fma(_4186, _4148, _4272);
                    float _4276 = _4186 * _4136;
                    float _4278 = _4186 * _4242;
                    float _4280 = -_4256;
                    float _4282 = fma(_4192, _4136, _4280);
                    float _4284 = _4192 * _4238;
                    float _4286 = _4192 * _4242;
                    float _4288 = -_4276;
                    float _4290 = fma(_4180, _4142, _4288);
                    float _4292 = -_4278;
                    float _4294 = fma(_4180, _4238, _4292);
                    float _4296 = -_4284;
                    float _4298 = fma(_4186, _4230, _4296);
                    float _4300 = -_4286;
                    float _4302 = fma(_4180, _4230, _4300);
                    float _4304 = fma(_4218, _4198, _4294);
                    float _4306 = fma(_4214, _4198, _4298);
                    float _4308 = _4250 * _4262;
                    float _4310 = _4260 * _4262;
                    float _4312 = _4270 * _4262;
                    float _4314 = _4266 * _4262;
                    float _4316 = _4308 * _3554;
                    float _4318 = _4310 * _3554;
                    float _4320 = _4312 * _3554;
                    float _4322 = _4214 * _4262;
                    float _4324 = _4218 * _4262;
                    float _4326 = fma(_4314, _2720, _4318);
                    float _4328 = _4282 * _4262;
                    float _4330 = fma(_4322, _2720, _4316);
                    float _4332 = _4274 * _4262;
                    float _4334 = fma(_4324, _2720, _4320);
                    float _4336 = _4290 * _4262;
                    float _4338 = fma(_4328, _2722, _4326);
                    float _4340 = fma(_4332, _2722, _4330);
                    float _4342 = fma(_4210, _4198, _4302);
                    float _4344 = fma(_4336, _2722, _4334);
                    float _4346 = -_4306;
                    float _4348 = fma(_4346, _4262, _4340);
                    float _4350 = fma(_4342, _4262, _4338);
                    float _4352 = -_4304;
                    float _4354 = fma(_4352, _4262, _4344);
                    _2256 = _4322;
                    _2258 = _4276;
                    _2260 = _4332;
                    _2262 = _4244;
                    _2558 = _4324;
                    _2768 = _4186;
                    _2770 = _4342;
                    _2560 = _4198;
                    _2772 = _4314;
                    _2562 = _4214;
                    _2774 = _4308;
                    _2564 = _4200;
                    _2802 = true;
                    _2824 = as_type<int>(_4348);
                    _2794 = _3560;
                    _2838 = as_type<int>(_4354);
                    _2790 = _3556;
                    _2830 = as_type<int>(_4350);
                    _2786 = _3558;
                    _2840 = 0.0;
                    _2842 = 0.0;
                    _2844 = 0.0;
                    _2798 = 0.0;
                    _2812 = 0.0;
                    _2806 = 0.0;
                }
            }
        }
    }
    _3900 = false;
    float _4356 = _2256;
    float _4358 = _2258;
    float _4360 = _2260;
    float _4362 = _2262;
    float _4364 = _2558;
    float _4366 = _2768;
    float _4368 = _2770;
    float _4370 = _2560;
    float _4372 = _2772;
    float _4374 = _2562;
    float _4376 = _2774;
    float _4378 = _2564;
    bool _4380 = _2802;
    int _4382 = _2824;
    float _4384 = _2794;
    int _4386 = _2838;
    float _4388 = _2782;
    float _4390 = _2790;
    int _4392 = _2830;
    float _4394 = _2786;
    float _4396 = _2840;
    float _4398 = _2842;
    float _4400 = _2844;
    float _4402 = _2798;
    float _4404 = _2812;
    float _4406 = _2806;
    float _4408 = _2818;
    float _4410 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _4412 = _4356;
    float _4414 = _4358;
    float _4416 = _4360;
    float _4418 = _4362;
    float _4420 = _4398;
    float _4422 = _4396;
    float _4424 = _4400;
    float _4426 = as_type<float>(_4392);
    float _4428 = _4406;
    if (_1948)
    {
        float _4430 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _4432 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _4434 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _4436 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _4412 = _4430;
        _4414 = _4432;
        _4416 = _4434;
        _4418 = _4436;
    }
    float _4438 = _4412;
    float _4440 = _4414;
    float _4442 = _4416;
    float _4444 = _4418;
    float _4446 = _4364;
    float _4448 = _4366;
    float _4450 = _4368;
    float _4452 = _4370;
    if (_1948)
    {
        float _4454 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _4456 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _4458 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _4460 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _4446 = _4454;
        _4448 = _4456;
        _4450 = _4458;
        _4452 = _4460;
    }
    float _4462 = _4446;
    float _4464 = _4448;
    float _4466 = _4450;
    float _4468 = _4452;
    float _4470 = _4372;
    float _4472 = _4374;
    float _4474 = _4376;
    float _4476 = _4378;
    if (_1948)
    {
        float _4478 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _4480 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _4482 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _4484 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _4470 = _4478;
        _4472 = _4480;
        _4474 = _4482;
        _4476 = _4484;
    }
    float _4486 = _4470;
    float _4488 = _4472;
    float _4490 = _4474;
    float _4492 = _4476;
    float _4494 = _4380 ? as_type<float>(_4382) : _1892;
    float _4496 = _4384 * 2.0;
    float _4498 = _4380 ? as_type<float>(_4386) : _1904;
    float _4500 = _4388 * 2.0;
    float _4502 = _4380 ? as_type<float>(_2738) : _2032;
    float _4504 = _4496 * _4390;
    float _4506 = _4380 ? as_type<float>(_4382) : _1126;
    float _4508 = _4388 * _4388;
    float _4510 = _4508 * 2.0;
    float _4512 = _4380 ? as_type<float>(_2738) : _682;
    float _4514 = _4380 ? as_type<float>(_4392) : _2026;
    float _4516 = _4394 * 2.0;
    float _4518 = _4380 ? as_type<float>(_2740) : _2038;
    float _4520 = _4496 * _4388;
    float _4522 = _4380 ? as_type<float>(_4386) : _1128;
    float _4524 = fma(_4500, _4394, _4504);
    float _4526 = _4380 ? as_type<float>(_2742) : _696;
    float _4528 = -_4504;
    float _4530 = fma(_4500, _4394, _4528);
    float _4532 = _4380 ? as_type<float>(_2740) : _686;
    float _4534 = _4390 * 2.0;
    float _4536 = _4380 ? as_type<float>(_2742) : _2044;
    float _4538 = _4496 * _4394;
    float _4540 = fma(_4516, _4390, _4520);
    float _4542 = -_4520;
    float _4544 = fma(_4516, _4390, _4542);
    float _4546 = -_4510;
    float _4548 = _4546 + 1.0;
    float _4550 = _4380 ? as_type<float>(_4392) : _2754;
    float _4552 = fma(_4518, _4410, _4514);
    float _4554 = -_4538;
    float _4556 = fma(_4534, _4388, _4554);
    float _4558 = fma(_4534, _4388, _4538);
    float _4560 = fma(_4536, _4410, _4498);
    float _4562 = fma(_4502, _4410, _4494);
    float _4564 = _4534;
    float _4566 = _4536;
    float _4568 = _4438;
    float _4570 = _4548;
    float _4572 = _4496;
    float _4574 = _4502;
    float _4576 = _4494;
    float _4578 = _4440;
    float _4580 = _4442;
    float _4582 = _4444;
    float _4584 = _4532;
    float _4586 = _4526;
    if (_1948)
    {
        float _4588 = _4552 * _4440;
        _4564 = _4588;
    }
    float _4590 = _4564;
    float _4592 = _4488;
    float _4594 = _4466;
    float _4596 = _4490;
    float _4598 = _4464;
    float _4600 = _4468;
    if (_1948)
    {
        float _4602 = _4552 * _4464;
        _4566 = _4602;
    }
    float _4604 = _4566;
    if (_1948)
    {
        float _4606 = fma(_4562, _4438, _4590);
        _4568 = _4606;
    }
    float _4608 = _4568;
    float _4610 = _4394 * _4394;
    float _4612 = _4608;
    float _4614 = _4610;
    if (_1948)
    {
        float _4616 = _4552 * _4488;
        _4592 = _4616;
    }
    float _4618 = _4592;
    float _4620 = _4618;
    if (_1948)
    {
        float _4622 = fma(_4562, _4462, _4604);
        _2776 = _4622;
    }
    float _4624 = _2776;
    float _4626 = _4390 * _4390;
    float _4628 = fma(_4610, -2.0, 1.0);
    float _4630 = _4626;
    float _4632 = _4624;
    if (_1948)
    {
        float _4634 = fma(_4562, _4486, _4618);
        _4620 = _4634;
    }
    float _4636 = _4620;
    float _4638 = _4636;
    if (_1948)
    {
        float _4640 = fma(_4560, _4442, _4608);
        _4612 = _4640;
    }
    float _4642 = _4612;
    float _4644 = _4642;
    if (_1948)
    {
        float _4646 = fma(_4560, _4466, _4624);
        _4594 = _4646;
    }
    float _4648 = _4594;
    float _4650 = fma(_4626, -2.0, 1.0);
    if (_1948)
    {
        float _4652 = fma(_4560, _4490, _4636);
        _4596 = _4652;
    }
    float _4654 = _4596;
    float _4656 = fma(_4610, -2.0, _4548);
    float _4658 = fma(_4626, -2.0, _4628);
    if (_1948)
    {
        float _4660 = _4642 + _4444;
        _4420 = _4660;
    }
    float _4662 = _4420;
    float _4664 = _4662;
    float _4666 = _4662;
    if (_1948)
    {
        float _4668 = _4648 + _4468;
        _4422 = _4668;
    }
    float _4670 = _4422;
    float _4672 = _4670;
    float _4674 = _4670;
    if (_1948)
    {
        float _4676 = _4654 + _4492;
        _4424 = _4676;
    }
    float _4678 = _4424;
    float _4680 = -_4510;
    float _4682 = _4680 + _4650;
    float _4684 = _4678;
    float _4686 = _4678;
    if (!_1948)
    {
        bool _4688 = !_2176;
        if (!_4688)
        {
            float _4690 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            uint _4692 = uint(int(uint(_180) >> uint(2)));
            float _4694 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4692)]);
            int _4696 = _180 + 4;
            uint _4698 = uint(int(uint(_4696) >> uint(2)));
            float _4700 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4698)]);
            int _4702 = _180 + 8;
            uint _4704 = uint(int(uint(_4702) >> uint(2)));
            float _4706 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4704)]);
            int _4708 = _180 + 12;
            uint _4710 = uint(int(uint(_4708) >> uint(2)));
            float _4712 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4710)]);
            uint _4714 = uint(int(uint(_180) >> uint(2)));
            float _4716 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4714)]);
            int _4718 = _180 + 4;
            uint _4720 = uint(int(uint(_4718) >> uint(2)));
            float _4722 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4720)]);
            int _4724 = _180 + 8;
            uint _4726 = uint(int(uint(_4724) >> uint(2)));
            float _4728 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4726)]);
            int _4730 = _180 + 12;
            uint _4732 = uint(int(uint(_4730) >> uint(2)));
            float _4734 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4732)]);
            uint _4736 = uint(int(uint(_180) >> uint(2)));
            float _4738 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4736)]);
            int _4740 = _180 + 4;
            uint _4742 = uint(int(uint(_4740) >> uint(2)));
            float _4744 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4742)]);
            int _4746 = _180 + 8;
            uint _4748 = uint(int(uint(_4746) >> uint(2)));
            float _4750 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4748)]);
            int _4752 = _180 + 12;
            uint _4754 = uint(int(uint(_4752) >> uint(2)));
            float _4756 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4754)]);
            float _4758 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _4760 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _4762 = _4700 * _4552;
            float _4764 = _4722 * _4552;
            float _4766 = _4744 * _4552;
            float _4768 = fma(_4694, _4562, _4762);
            float _4770 = fma(_4716, _4562, _4764);
            float _4772 = fma(_4738, _4562, _4766);
            float _4774 = fma(_4706, _4560, _4768);
            float _4776 = fma(_4728, _4560, _4770);
            float _4778 = fma(_4750, _4560, _4772);
            float _4780 = _4690 + _4774;
            float _4782 = _4758 + _4776;
            float _4784 = _4760 + _4778;
            _4614 = _4694;
            _4570 = _4774;
            _4630 = _4706;
            _4632 = _4712;
            _4572 = _4716;
            _2778 = _4776;
            _4574 = _4728;
            _4576 = _4734;
            _4644 = _4738;
            _4578 = _4778;
            _4580 = _4750;
            _4582 = _4756;
            _4666 = _4780;
            _4686 = _4784;
            _4674 = _4782;
            _4786 = true;
        }
        else
        {
            if (!_2228)
            {
                _4664 = _4562;
            }
            float _4788 = _4664;
            _4666 = _4788;
            if (!_2228)
            {
                _4672 = _4552;
            }
            float _4790 = _4672;
            _4674 = _4790;
            if (!_2228)
            {
                _4684 = _4560;
            }
            float _4792 = _4684;
            bool _4794 = !_2228;
            _4686 = _4792;
            if (!_4794)
            {
                uint _4796 = uint(int(uint(_180) >> uint(2)));
                float _4798 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4796)]);
                int _4800 = _180 + 4;
                uint _4802 = uint(int(uint(_4800) >> uint(2)));
                float _4804 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4802)]);
                int _4806 = _180 + 8;
                uint _4808 = uint(int(uint(_4806) >> uint(2)));
                float _4810 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4808)]);
                int _4812 = _180 + 12;
                uint _4814 = uint(int(uint(_4812) >> uint(2)));
                float _4816 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4814)]);
                uint _4818 = uint(int(uint(_180) >> uint(2)));
                float _4820 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4818)]);
                int _4822 = _180 + 4;
                uint _4824 = uint(int(uint(_4822) >> uint(2)));
                float _4826 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4824)]);
                int _4828 = _180 + 8;
                uint _4830 = uint(int(uint(_4828) >> uint(2)));
                float _4832 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4830)]);
                int _4834 = _180 + 12;
                uint _4836 = uint(int(uint(_4834) >> uint(2)));
                float _4838 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4836)]);
                uint _4840 = uint(int(uint(_180) >> uint(2)));
                float _4842 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4840)]);
                int _4844 = _180 + 4;
                uint _4846 = uint(int(uint(_4844) >> uint(2)));
                float _4848 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4846)]);
                int _4850 = _180 + 8;
                uint _4852 = uint(int(uint(_4850) >> uint(2)));
                float _4854 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4852)]);
                int _4856 = _180 + 12;
                uint _4858 = uint(int(uint(_4856) >> uint(2)));
                float _4860 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4858)]);
                float _4862 = _4804 * _4552;
                float _4864 = _4826 * _4552;
                float _4866 = _4848 * _4552;
                float _4868 = fma(_4798, _4562, _4862);
                float _4870 = fma(_4820, _4562, _4864);
                float _4872 = fma(_4842, _4562, _4866);
                float _4874 = fma(_4810, _4560, _4868);
                float _4876 = fma(_4832, _4560, _4870);
                float _4878 = fma(_4854, _4560, _4872);
                float _4880 = _4874 + _4816;
                float _4882 = _4876 + _4838;
                float _4884 = _4878 + _4860;
                _4614 = _4798;
                _4570 = _4868;
                _4630 = _4874;
                _4632 = _4816;
                _4572 = _4820;
                _2778 = _4870;
                _4574 = _4876;
                _4576 = _4838;
                _4644 = _4842;
                _4578 = _4872;
                _4580 = _4878;
                _4582 = _4860;
                _4666 = _4880;
                _4686 = _4884;
                _4674 = _4882;
            }
        }
    }
    _4786 = false;
    float _4886 = _4614;
    float _4888 = _4570;
    float _4890 = _4630;
    float _4892 = _4632;
    float _4894 = _4572;
    float _4896 = _2778;
    float _4898 = _4574;
    float _4900 = _4576;
    float _4902 = _4644;
    float _4904 = _4578;
    float _4906 = _4580;
    float _4908 = _4582;
    float _4910 = _4666;
    float _4912 = _4686;
    float _4914 = _4674;
    float _4916 = _4886;
    float _4918 = _4888;
    float _4920 = _4890;
    float _4922 = _4892;
    if (_1948)
    {
        float _4924 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _4926 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _4928 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _4930 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _4916 = _4924;
        _4918 = _4926;
        _4920 = _4928;
        _4922 = _4930;
    }
    float _4932 = _4916;
    float _4934 = _4918;
    float _4936 = _4920;
    float _4938 = _4922;
    float _4940 = _4894;
    float _4942 = _4896;
    float _4944 = _4898;
    float _4946 = _4900;
    if (_1948)
    {
        float _4948 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _4950 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _4952 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _4954 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _4940 = _4948;
        _4942 = _4950;
        _4944 = _4952;
        _4946 = _4954;
    }
    float _4956 = _4940;
    float _4958 = _4942;
    float _4960 = _4944;
    float _4962 = _4946;
    float _4964 = _4902;
    float _4966 = _4904;
    float _4968 = _4906;
    float _4970 = _4908;
    if (_1948)
    {
        float _4972 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _4974 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _4976 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _4978 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _4964 = _4972;
        _4966 = _4974;
        _4968 = _4976;
        _4970 = _4978;
    }
    float _4980 = _4964;
    float _4982 = _4966;
    float _4984 = _4968;
    float _4986 = _4970;
    float _4988 = _4532 * 59.999996185302734375;
    float _4990 = _4512 * 59.999996185302734375;
    float _4992 = _4526 * 59.999996185302734375;
    float _4994 = _4938;
    float _4996 = _4934;
    float _4998 = _4936;
    float _5000 = _4932;
    float _5002 = _4934;
    float _5004 = _4936;
    if (_1948)
    {
        float _5006 = _4988 * _4934;
        _4994 = _5006;
    }
    float _5008 = _4994;
    float _5010 = _4962;
    float _5012 = _5008;
    float _5014 = _4958;
    float _5016 = _4960;
    float _5018 = _4956;
    float _5020 = _4958;
    float _5022 = _4960;
    if (_1948)
    {
        float _5024 = _4988 * _4958;
        _5010 = _5024;
    }
    float _5026 = _5010;
    float _5028 = _5026;
    if (_1948)
    {
        float _5030 = fma(_4990, _4932, _5008);
        _5012 = _5030;
    }
    float _5032 = _5012;
    float _5034 = _4986;
    float _5036 = _5032;
    float _5038 = _4982;
    float _5040 = _4984;
    if (_1948)
    {
        float _5042 = _4988 * _4982;
        _5034 = _5042;
    }
    float _5044 = _5034;
    float _5046 = _5044;
    if (_1948)
    {
        float _5048 = fma(_4990, _4956, _5026);
        _5028 = _5048;
    }
    float _5050 = _5028;
    float _5052 = _5050;
    if (_1948)
    {
        float _5054 = fma(_4992, _4936, _5032);
        _5036 = _5054;
    }
    float _5056 = _5036;
    float _5058 = _5056;
    float _5060 = _5056;
    if (_1948)
    {
        float _5062 = fma(_4990, _4980, _5044);
        _5046 = _5062;
    }
    float _5064 = _5046;
    float _5066 = _5064;
    if (_1948)
    {
        float _5068 = fma(_4992, _4960, _5050);
        _5052 = _5068;
    }
    float _5070 = _5052;
    float _5072 = _5070;
    float _5074 = _5070;
    if (_1948)
    {
        float _5076 = fma(_4992, _4984, _5064);
        _5066 = _5076;
    }
    float _5078 = _5066;
    float _5080 = _5078;
    float _5082 = _5078;
    if (!_1948)
    {
        bool _5084 = !_2176;
        if (!_5084)
        {
            uint _5086 = uint(int(uint(_180) >> uint(2)));
            float _5088 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5086)]);
            int _5090 = _180 + 4;
            uint _5092 = uint(int(uint(_5090) >> uint(2)));
            float _5094 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5092)]);
            int _5096 = _180 + 8;
            uint _5098 = uint(int(uint(_5096) >> uint(2)));
            float _5100 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5098)]);
            int _5102 = _180 + 12;
            uint _5104 = uint(int(uint(_5102) >> uint(2)));
            float _5106 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5104)]);
            uint _5108 = uint(int(uint(_180) >> uint(2)));
            float _5110 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_5108)]);
            int _5112 = _180 + 4;
            uint _5114 = uint(int(uint(_5112) >> uint(2)));
            float _5116 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_5114)]);
            int _5118 = _180 + 8;
            uint _5120 = uint(int(uint(_5118) >> uint(2)));
            float _5122 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_5120)]);
            uint _5124 = uint(int(uint(_180) >> uint(2)));
            float _5126 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5124)]);
            int _5128 = _180 + 4;
            uint _5130 = uint(int(uint(_5128) >> uint(2)));
            float _5132 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5130)]);
            int _5134 = _180 + 8;
            uint _5136 = uint(int(uint(_5134) >> uint(2)));
            float _5138 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5136)]);
            int _5140 = _180 + 12;
            uint _5142 = uint(int(uint(_5140) >> uint(2)));
            float _5144 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5142)]);
            float _5146 = _5094 * _4988;
            float _5148 = _5116 * _4988;
            float _5150 = _5132 * _4988;
            float _5152 = fma(_5088, _4990, _5146);
            float _5154 = fma(_5110, _4990, _5148);
            float _5156 = fma(_5126, _4990, _5150);
            float _5158 = fma(_5100, _4992, _5152);
            float _5160 = fma(_5122, _4992, _5154);
            float _5162 = fma(_5138, _4992, _5156);
            _4598 = _5152;
            _4600 = _5106;
            _4638 = _5154;
            _4584 = _5126;
            _4586 = _5138;
            _4426 = _5144;
            _5074 = _5160;
            _5060 = _5158;
            _5082 = _5162;
            _5164 = true;
        }
        else
        {
            if (!_2228)
            {
                _5058 = _4990;
            }
            float _5166 = _5058;
            _5060 = _5166;
            if (!_2228)
            {
                _5072 = _4988;
            }
            float _5168 = _5072;
            _5074 = _5168;
            if (!_2228)
            {
                _5080 = _4992;
            }
            float _5170 = _5080;
            bool _5172 = !_2228;
            _5082 = _5170;
            if (!_5172)
            {
                uint _5174 = uint(int(uint(_180) >> uint(2)));
                float _5176 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5174)]);
                int _5178 = _180 + 4;
                uint _5180 = uint(int(uint(_5178) >> uint(2)));
                float _5182 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5180)]);
                int _5184 = _180 + 8;
                uint _5186 = uint(int(uint(_5184) >> uint(2)));
                float _5188 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5186)]);
                int _5190 = _180 + 12;
                uint _5192 = uint(int(uint(_5190) >> uint(2)));
                float _5194 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5192)]);
                uint _5196 = uint(int(uint(_180) >> uint(2)));
                float _5198 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_5196)]);
                int _5200 = _180 + 4;
                uint _5202 = uint(int(uint(_5200) >> uint(2)));
                float _5204 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_5202)]);
                int _5206 = _180 + 8;
                uint _5208 = uint(int(uint(_5206) >> uint(2)));
                float _5210 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_5208)]);
                uint _5212 = uint(int(uint(_180) >> uint(2)));
                float _5214 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5212)]);
                int _5216 = _180 + 4;
                uint _5218 = uint(int(uint(_5216) >> uint(2)));
                float _5220 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5218)]);
                int _5222 = _180 + 8;
                uint _5224 = uint(int(uint(_5222) >> uint(2)));
                float _5226 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5224)]);
                int _5228 = _180 + 12;
                uint _5230 = uint(int(uint(_5228) >> uint(2)));
                float _5232 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5230)]);
                float _5234 = _5182 * _4988;
                float _5236 = _5204 * _4988;
                float _5238 = _5220 * _4988;
                float _5240 = fma(_5176, _4990, _5234);
                float _5242 = fma(_5198, _4990, _5236);
                float _5244 = fma(_5214, _4990, _5238);
                float _5246 = fma(_5188, _4992, _5240);
                float _5248 = fma(_5210, _4992, _5242);
                float _5250 = fma(_5226, _4992, _5244);
                _4598 = _5240;
                _4600 = _5194;
                _4638 = _5242;
                _4584 = _5214;
                _4586 = _5226;
                _4426 = _5232;
                _5074 = _5248;
                _5060 = _5246;
                _5082 = _5250;
            }
        }
    }
    _5164 = false;
    float _5252 = _4598;
    float _5254 = _4600;
    float _5256 = _4638;
    float _5258 = _4584;
    float _5260 = _4586;
    float _5262 = _4426;
    float _5264 = _5074;
    float _5266 = _5060;
    float _5268 = _5082;
    float _5270 = -_4552;
    float _5272 = _5270 + _4550;
    float _5274 = -_4562;
    float _5276 = _5274 + _4506;
    float _5278 = -_4560;
    float _5280 = _5278 + _4522;
    float _5282 = _5252;
    float _5284 = _5254;
    float _5286 = _5256;
    float _5288 = _5258;
    float _5290 = _5262;
    float _5292 = _5260;
    float _5294 = _5266;
    float _5296 = _5264;
    float _5298 = _5268;
    if (_1948)
    {
        float _5300 = _5272 * _4934;
        _5282 = _5300;
    }
    float _5302 = _5282;
    float _5304 = _5302;
    if (_1948)
    {
        float _5306 = _5272 * _4958;
        _5284 = _5306;
    }
    float _5308 = _5284;
    float _5310 = _5308;
    if (_1948)
    {
        float _5312 = _5272 * _4982;
        _5286 = _5312;
    }
    float _5314 = _5286;
    float _5316 = _5314;
    if (_1948)
    {
        float _5318 = fma(_5276, _4932, _5302);
        _5304 = _5318;
    }
    float _5320 = _5304;
    if (_1948)
    {
        float _5322 = fma(_5276, _4956, _5308);
        _5310 = _5322;
    }
    float _5324 = _5310;
    if (_1948)
    {
        float _5326 = fma(_5276, _4980, _5314);
        _5316 = _5326;
    }
    float _5328 = _5316;
    if (_1948)
    {
        float _5330 = fma(_5280, _4936, _5320);
        _5288 = _5330;
    }
    float _5332 = _5288;
    float _5334 = _5332;
    float _5336 = _5332;
    if (_1948)
    {
        float _5338 = fma(_5280, _4960, _5324);
        _5290 = _5338;
    }
    float _5340 = _5290;
    float _5342 = _5340;
    float _5344 = _5340;
    if (_1948)
    {
        float _5346 = fma(_5280, _4984, _5328);
        _5292 = _5346;
    }
    float _5348 = _5292;
    float _5350 = _5348;
    float _5352 = _5348;
    if (!_1948)
    {
        bool _5354 = !_2176;
        if (!_5354)
        {
            uint _5356 = uint(int(uint(_180) >> uint(2)));
            float _5358 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5356)]);
            int _5360 = _180 + 4;
            uint _5362 = uint(int(uint(_5360) >> uint(2)));
            float _5364 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5362)]);
            int _5366 = _180 + 8;
            uint _5368 = uint(int(uint(_5366) >> uint(2)));
            float _5370 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5368)]);
            uint _5372 = uint(int(uint(_180) >> uint(2)));
            float _5374 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_5372)]);
            int _5376 = _180 + 4;
            uint _5378 = uint(int(uint(_5376) >> uint(2)));
            float _5380 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_5378)]);
            int _5382 = _180 + 8;
            uint _5384 = uint(int(uint(_5382) >> uint(2)));
            float _5386 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_5384)]);
            uint _5388 = uint(int(uint(_180) >> uint(2)));
            float _5390 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5388)]);
            int _5392 = _180 + 4;
            uint _5394 = uint(int(uint(_5392) >> uint(2)));
            float _5396 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5394)]);
            int _5398 = _180 + 8;
            uint _5400 = uint(int(uint(_5398) >> uint(2)));
            float _5402 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5400)]);
            float _5404 = _5364 * _5272;
            float _5406 = _5380 * _5272;
            float _5408 = _5396 * _5272;
            float _5410 = fma(_5358, _5276, _5404);
            float _5412 = fma(_5374, _5276, _5406);
            float _5414 = fma(_5390, _5276, _5408);
            float _5416 = fma(_5370, _5280, _5410);
            float _5418 = fma(_5386, _5280, _5412);
            float _5420 = fma(_5402, _5280, _5414);
            _5336 = _5416;
            _5344 = _5418;
            _5352 = _5420;
            _5422 = true;
        }
        else
        {
            if (!_2228)
            {
                _5334 = _5276;
            }
            float _5424 = _5334;
            _5336 = _5424;
            if (!_2228)
            {
                _5342 = _5272;
            }
            float _5426 = _5342;
            _5344 = _5426;
            if (!_2228)
            {
                _5350 = _5280;
            }
            float _5428 = _5350;
            bool _5430 = !_2228;
            _5352 = _5428;
            if (!_5430)
            {
                uint _5432 = uint(int(uint(_180) >> uint(2)));
                float _5434 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5432)]);
                int _5436 = _180 + 4;
                uint _5438 = uint(int(uint(_5436) >> uint(2)));
                float _5440 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5438)]);
                int _5442 = _180 + 8;
                uint _5444 = uint(int(uint(_5442) >> uint(2)));
                float _5446 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5444)]);
                uint _5448 = uint(int(uint(_180) >> uint(2)));
                float _5450 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_5448)]);
                int _5452 = _180 + 4;
                uint _5454 = uint(int(uint(_5452) >> uint(2)));
                float _5456 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_5454)]);
                int _5458 = _180 + 8;
                uint _5460 = uint(int(uint(_5458) >> uint(2)));
                float _5462 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_5460)]);
                uint _5464 = uint(int(uint(_180) >> uint(2)));
                float _5466 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5464)]);
                int _5468 = _180 + 4;
                uint _5470 = uint(int(uint(_5468) >> uint(2)));
                float _5472 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5470)]);
                int _5474 = _180 + 8;
                uint _5476 = uint(int(uint(_5474) >> uint(2)));
                float _5478 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5476)]);
                float _5480 = _5440 * _5272;
                float _5482 = _5456 * _5272;
                float _5484 = _5472 * _5272;
                float _5486 = fma(_5434, _5276, _5480);
                float _5488 = fma(_5450, _5276, _5482);
                float _5490 = fma(_5466, _5276, _5484);
                float _5492 = fma(_5446, _5280, _5486);
                float _5494 = fma(_5462, _5280, _5488);
                float _5496 = fma(_5478, _5280, _5490);
                _5336 = _5492;
                _5344 = _5494;
                _5352 = _5496;
            }
        }
    }
    _5422 = false;
    float _5498 = _5336;
    float _5500 = _5344;
    float _5502 = _5352;
    int _5504 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 24;
    uint _5506 = uint(int(uint(_5504) >> uint(2)));
    float _5508 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_5506)]);
    int _5510 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 16;
    uint _5512 = uint(int(uint(_5510) >> uint(2)));
    float _5514 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_5512)]);
    int _5516 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 8;
    uint _5518 = uint(int(uint(_5516) >> uint(2)));
    float _5520 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_5518)]);
    uint _5522 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
    float _5524 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_5522)]);
    float _5526 = fma(_4910, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
    float _5528 = fma(_4912, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
    float _5530 = fma(_4910, 6.2500002968590706586837768554688e-05, 0.5);
    float _5532 = fma(_4912, 6.2500002968590706586837768554688e-05, 0.5);
    float _5534 = fma(_4912, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
    float _5536 = fma(_4910, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
    float _5538 = fma(_4910, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
    float _5540 = fma(_4912, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
    float _5542 = _5508 * _5508;
    float _5544 = fma(_5514, _5514, _5542);
    float _5546 = rsqrt(_5544);
    float _5548 = _5546 * (-20.0);
    float _5550 = fma(_5508, _5548, _5520);
    float _5552 = fma(_5514, _5548, _5524);
    float _5554 = _5550 * 0.5;
    float _5556 = _5552 * 0.5;
    float _5558 = floor(_5556);
    float _5560 = floor(_5554);
    float _5562 = fma(_5558, 2.0, -32.0);
    float _5564 = -_5562;
    float _5566 = _5564 + _4910;
    float _5568 = fma(_5560, 2.0, -32.0);
    float _5570 = -_5568;
    float _5572 = _5570 + _4912;
    float _5574 = _5566 * 0.015625;
    float _5576 = _5572 * 0.015625;
    float2 _18244 = float2(_5574, _5576);
    float2 _5578 = dm_bs(spvDescriptorSet0.cp_t_tcb_26.sample(spvDescriptorSet0.cp_t_tcb_26Smplr, select(_18244, float2(0.0), isnan(_18244)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_26, spvDescriptorSet0.cp_t_tcb_26Smplr_w, select(_18244, float2(0.0), isnan(_18244)), level(0.0)).xy;
    float _5580 = _5578.x;
    float _5582 = _5578.y;
    float2 _18256 = float2(_5526, _5528);
    float _5584 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_18256, float2(0.0), isnan(_18256)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_18256, float2(0.0), isnan(_18256)), level(0.0)).x;
    float2 _18264 = float2(_5530, _5532);
    float2 _5586 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_18264, float2(0.0), isnan(_18264)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_18264, float2(0.0), isnan(_18264)), level(0.0)).xy;
    float _5588 = _5586.x;
    float _5590 = _5586.y;
    float2 _18276 = float2(_5526, _5534);
    float _5592 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_18276, float2(0.0), isnan(_18276)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_18276, float2(0.0), isnan(_18276)), level(0.0)).x;
    float2 _18284 = float2(_5536, _5528);
    float _5594 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_18284, float2(0.0), isnan(_18284)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_18284, float2(0.0), isnan(_18284)), level(0.0)).x;
    float2 _18292 = float2(_5536, _5534);
    float _5596 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_18292, float2(0.0), isnan(_18292)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_18292, float2(0.0), isnan(_18292)), level(0.0)).x;
    float2 _18300 = float2(_5538, _5532);
    float _5598 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_18300, float2(0.0), isnan(_18300)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_18300, float2(0.0), isnan(_18300)), level(0.0)).x;
    float2 _18308 = float2(_5530, _5540);
    float _5600 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_18308, float2(0.0), isnan(_18308)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_18308, float2(0.0), isnan(_18308)), level(0.0)).x;
    float2 _18316 = float2(_5530, _5532);
    float _5602 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_18316, float2(0.0), isnan(_18316)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_18316, float2(0.0), isnan(_18316)), level(0.0)).y;
    float2 _18324 = float2(_5538, _5532);
    float2 _5604 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_18324, float2(0.0), isnan(_18324)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_18324, float2(0.0), isnan(_18324)), level(0.0)).xy;
    float _5606 = _5604.x;
    float _5608 = _5604.y;
    float2 _18336 = float2(_5530, _5540);
    float2 _5610 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_18336, float2(0.0), isnan(_18336)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_18336, float2(0.0), isnan(_18336)), level(0.0)).xy;
    float _5612 = _5610.x;
    float _5614 = _5610.y;
    float _5616 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[73]);
    float _5618 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[72]);
    float _5620 = _2138 * 19.23889923095703125;
    float _5622 = _5620 * 0.15915493667125701904296875;
    float _5624 = _2132 * 19.23889923095703125;
    float _5626 = _5622 * 6.283185482025146484375;
    float _5628 = sin(_5626);
    float _5630 = fma(_292, 3.1415927410125732421875, -1.57079637050628662109375);
    float _5632 = _5624 * 0.15915493667125701904296875;
    float _5634 = _5630 * 0.15915493667125701904296875;
    float _5636 = _5634 * 6.283185482025146484375;
    float _5638 = cos(_5636);
    float _5640 = _5628 * 34873.41015625;
    float _5642 = _5634 * 6.283185482025146484375;
    float _5644 = sin(_5642);
    float _5646 = _5632 * 6.283185482025146484375;
    float _5648 = sin(_5646);
    float _5650 = floor(_5640);
    float _5652 = 1.0 / _4410;
    float _5654 = _5648 * 34873.41015625;
    float _5656 = -_5650;
    float _5658 = _5656 + _5640;
    float _5660 = floor(_5654);
    float _5662 = _5582 * 14.99999904632568359375;
    float _5664 = _5580 * 14.99999904632568359375;
    float _5666 = _5662 * _5644;
    float _5668 = _5662 * _5638;
    float _5670 = _5662 * _5662;
    float _5672 = -_5588;
    float _5674 = _5672 + _5584;
    float _5676 = -_5588;
    float _5678 = _5676 + _5592;
    float _5680 = -_5666;
    float _5682 = fma(_5664, _5638, _5680);
    float _5684 = fma(_5664, _5664, _5670);
    float _5686 = _5652 * 59.999996185302734375;
    float _5688 = _5674 * 2000.0;
    float _5690 = _5678 * 2000.0;
    float _5692 = -_5588;
    float _5694 = _5692 + _5594;
    float _5696 = fma(_5664, _5644, _5668);
    float _5698 = fma(_5658, 0.800000011920928955078125, 0.20000000298023223876953125);
    float _5700 = _5588 * 2000.0;
    float _5702 = -_5590;
    float _5704 = _5588 + _5702;
    float _5706 = _5694 * 2000.0;
    float _5708 = abs(_5688);
    float _5710 = abs(_5690);
    float _5712 = precise::max(_5708, _5710);
    float _5714 = -_5588;
    float _5716 = _5714 + _5598;
    float _5718 = _5498 * _5686;
    float _5720 = _5500 * _5686;
    float _5722 = _5502 * _5686;
    float _5724 = _5700 + (-2.0);
    float _5726 = _5704 * 2000.0;
    float _5728 = -_5616;
    float _5730 = _5728 + 1.0;
    float _5732 = abs(_5706);
    float _5734 = precise::max(_5712, _5732);
    float _5736 = -_5588;
    float _5738 = _5736 + _5600;
    float _5740 = _5716 * 1000.0;
    bool _5742 = _4914 >= _5724;
    bool _5744 = isnan(_4914);
    bool _5746 = _5742 || _5744;
    bool _5748 = isnan(_5724);
    bool _5750 = _5746 || _5748;
    float _5752 = fma(_298, _5616, _5730);
    float _5754 = _5738 * 1000.0;
    float _5756 = fma(_5740, _5740, 0.0625);
    float _5758 = -_5588;
    float _5760 = _5758 + _5596;
    float _5762 = -_5660;
    float _5764 = _5654 + _5762;
    float _5766 = fma(_5754, _5754, _5756);
    float _5768 = _5760 * 2000.0;
    float _5770 = fma(_5764, _5764, 0.0400000028312206268310546875);
    float _5772 = rsqrt(_5766);
    float _5774 = fma(_5698, _5698, _5770);
    float _5776 = sqrt(_5774);
    float _5778 = abs(_5768);
    float _5780 = precise::max(_5734, _5778);
    float _5782 = abs(_5726);
    bool _5784 = _5782 < 2.0;
    bool _5786 = !_5750;
    bool _5788 = _5784 || _5786;
    float _5790 = sqrt(_5684);
    float _5792 = _5772 * 0.25;
    bool _5794 = _5792 < 0.891006529331207275390625;
    bool _5796 = _5794 || _5788;
    float _5798 = _5776 + 9.9999997473787516355514526367188e-06;
    bool _5800 = _5780 >= 2.0;
    bool _5802 = isnan(_5780);
    bool _5804 = _5800 || _5802;
    bool _5806 = isnan(2.0);
    bool _5808 = _5804 || _5806;
    bool _5810 = _5808 || _5796;
    float _5812 = 1.0 / _5798;
    float _5814 = sqrt(_5790);
    float _5816 = _5590 * 2000.0;
    float _5818 = _5816;
    float _5820 = _5682;
    float _5822 = _5720;
    float _5824 = _5608;
    if (!_5810)
    {
        float _5826 = _5754 * _5772;
        float _5828 = _5740 * _5772;
        float _5830 = 1.0 / _5792;
        float _5832 = _5826 * _5826;
        float _5834 = fma(_5828, _5828, _5832);
        float _5836 = sqrt(_5834);
        bool _5838 = _5836 > 9.9999997473787516355514526367188e-05;
        float _5840 = _5836 * _5830;
        float _5842 = _5826;
        float _5844 = _5832;
        if (_5838)
        {
            float _5846 = abs(_5828);
            float _5848 = abs(_5826);
            float _5850 = precise::max(_5846, _5848);
            _5842 = _5850;
        }
        float _5852 = _5842;
        if (!_5838)
        {
            _5844 = 0.0;
        }
        float _5854 = _5844;
        float _5856 = _5852;
        float _5858 = _5854;
        if (_5838)
        {
            float _5860 = 1.0 / _5852;
            _5856 = _5860;
        }
        float _5862 = _5856;
        if (_5838)
        {
            float _5864 = _5836 * _5862;
            _5858 = _5864;
        }
        float _5866 = _5858;
        float _5868 = _5866 * 0.9649016857147216796875;
        float _5870 = -_5868;
        float _5872 = fma(_5870, _5840, _5700);
        _5818 = _5872;
    }
    float _5874 = _5818;
    float _5876 = -_5874;
    float _5878 = _4914 + _5876;
    float _5880 = _5812 * _5764;
    bool _5882 = _5814 >= 0.5;
    float _5884 = _5812 * 0.20000000298023223876953125;
    float _5886 = abs(_5878);
    float _5888 = _5886 * 0.20000000298023223876953125;
    float _5890 = precise::clamp(_5888, 0.0, 1.0);
    float _5892 = _4682 * _5880;
    bool _5894 = _5814 >= 1.0;
    float _5896 = -_5812;
    float _5898 = _5698 * _5896;
    float _5900 = -_5890;
    float _5902 = _5900 + 1.0;
    float _5904 = _4540 * _5880;
    float _5906 = _4530 * _5880;
    float _5908 = -_5588;
    float _5910 = _5908 + _5606;
    float _5912 = _5902 * _5902;
    float _5914 = fma(_4556, _5884, _5904);
    float _5916 = fma(_4658, _5884, _5906);
    float _5918 = -_5588;
    float _5920 = _5918 + _5612;
    float _5922 = _5912 * _5912;
    float _5924 = fma(_4524, _5884, _5892);
    float _5926 = fma(_4558, _5898, _5916);
    float _5928 = _5752 * _5922;
    float _5930 = _5618 * 300.0;
    float _5932 = _5618 * 500.0;
    float _5934 = fma(_4544, _5898, _5924);
    float _5936 = fma(_4656, _5898, _5914);
    float _5938 = _5930;
    float _5940 = _5916;
    float _5942 = _5914;
    if (_5882)
    {
        float _5944 = _5930 * _5928;
        _5938 = _5944;
    }
    float _5946 = _5938;
    if (_5894)
    {
        float _5948 = _5932 * _5928;
        _5940 = _5948;
    }
    float _5950 = _5940;
    float _5952 = _4544 * 0.100000001490116119384765625;
    float _5954 = _5950;
    float _5956 = _5718;
    if (_5882)
    {
        float _5958 = _5696 * _5946;
        _5942 = _5958;
    }
    float _5960 = _5942;
    float _5962 = _4656 * 0.100000001490116119384765625;
    if (_5882)
    {
        float _5964 = _5682 * _5946;
        _5820 = _5964;
    }
    float _5966 = _5820;
    if (_5894)
    {
        float _5968 = _5814 * _5950;
        _5954 = _5968;
    }
    float _5970 = _5954;
    float _5972 = _4558 * 0.100000001490116119384765625;
    float _5974 = fma(_4556, 0.20000000298023223876953125, _5962);
    float _5976 = fma(_4524, 0.20000000298023223876953125, _5952);
    float _5978 = _5722;
    if (_5882)
    {
        float _5980 = fma(_4410, _5966, _5718);
        _5956 = _5980;
    }
    float _5982 = _5956;
    if (_5894)
    {
        float _5984 = fma(_4410, _5970, _5720);
        _5822 = _5984;
    }
    float _5986 = _5822;
    float _5988 = fma(_4658, 0.20000000298023223876953125, _5972);
    float _5990 = _5974 * _4402;
    float _5992 = _5976 * _4404;
    if (_5882)
    {
        float _5994 = fma(_4410, _5960, _5722);
        _5978 = _5994;
    }
    float _5996 = _5978;
    float _5998 = -_5986;
    float _6000 = _5264 + _5998;
    float _6002 = -_5990;
    float _6004 = fma(_5988, _4404, _6002);
    float _6006 = -_5992;
    float _6008 = fma(_5974, _4406, _6006);
    float _6010 = -_5982;
    float _6012 = _5266 + _6010;
    float _6014 = _4556 * (-0.20000000298023223876953125);
    float _6016 = _6000 + _6004;
    float _6018 = _4524 * (-0.20000000298023223876953125);
    float _6020 = _6012 + _6008;
    float _6022 = _4658 * (-0.20000000298023223876953125);
    float _6024 = _6014 * _4402;
    float _6026 = _6016 * _6016;
    float _6028 = _6018 * _4404;
    float _6030 = _5988 * _4406;
    float _6032 = -_6024;
    float _6034 = fma(_6022, _4404, _6032);
    float _6036 = fma(_6020, _6020, _6026);
    float _6038 = -_6028;
    float _6040 = fma(_6014, _4406, _6038);
    float _6042 = _6022 * _4406;
    float _6044 = _6000 + _6034;
    float _6046 = -_6030;
    float _6048 = fma(_5976, _4402, _6046);
    float _6050 = -_5996;
    float _6052 = _5268 + _6050;
    float _6054 = _6012 + _6040;
    float _6056 = -_6042;
    float _6058 = fma(_6018, _4402, _6056);
    float _6060 = _6044 * _6044;
    float _6062 = _6052 + _6048;
    float _6064 = _5700 + (-2.0);
    float _6066 = _6052 + _6058;
    float _6068 = fma(_6054, _6054, _6060);
    float _6070 = fma(_6062, _6062, _6036);
    float _6072 = -_5590;
    float _6074 = _5588 + _6072;
    bool _6076 = _4914 >= _6064;
    bool _6078 = isnan(_4914);
    bool _6080 = _6076 || _6078;
    bool _6082 = isnan(_6064);
    bool _6084 = _6080 || _6082;
    float _6086 = fma(_6066, _6066, _6068);
    float _6088 = rsqrt(_6070);
    float _6090 = _6074 * 2000.0;
    float _6092 = _5910 * 1000.0;
    float _6094 = _5920 * 1000.0;
    float _6096 = _4558 * 0.980571091175079345703125;
    float _6098 = abs(_6090);
    bool _6100 = _6098 < 2.0;
    bool _6102 = !_6084;
    bool _6104 = _6100 || _6102;
    float _6106 = sqrt(_6070);
    float _6108 = fma(_4530, 0.19611422717571258544921875, _6096);
    float _6110 = sqrt(_6086);
    float _6112 = _6016 * _6088;
    float _6114 = _6020 * _6088;
    float _6116 = _6062 * _6088;
    float _6118 = rsqrt(_6086);
    bool _6120 = _6106 != 0.0;
    bool _6122 = isnan(_6106);
    bool _6124 = _6120 || _6122;
    bool _6126 = isnan(0.0);
    bool _6128 = _6124 || _6126;
    float _6130 = _4544 * 0.980571091175079345703125;
    float _6132 = _6128 ? _6112 : 0.0;
    float _6134 = fma(_4682, 0.19611422717571258544921875, _6130);
    float _6136 = _6128 ? _6114 : 0.0;
    bool _6138 = _6110 != 0.0;
    bool _6140 = isnan(_6110);
    bool _6142 = _6138 || _6140;
    bool _6144 = isnan(0.0);
    bool _6146 = _6142 || _6144;
    float _6148 = fma(_6092, _6092, 0.0625);
    float _6150 = _6132 * _6134;
    float _6152 = _6128 ? _6116 : 0.0;
    float _6154 = fma(_6094, _6094, _6148);
    float _6156 = fma(_6136, _6108, _6150);
    float _6158 = _6044 * _6118;
    float _6160 = _6066 * _6118;
    float _6162 = _4656 * 0.980571091175079345703125;
    float _6164 = _6054 * _6118;
    float _6166 = rsqrt(_6154);
    float _6168 = _6146 ? _6158 : 0.0;
    float _6170 = fma(_4540, 0.19611422717571258544921875, _6162);
    float _6172 = _6146 ? _6160 : 0.0;
    float _6174 = _6146 ? _6164 : 0.0;
    float _6176 = _6168 * _5934;
    float _6178 = fma(_6152, _6170, _6156);
    float _6180 = fma(_6174, _5926, _6176);
    float _6182 = _6070 * _6178;
    float _6184 = fma(_6172, _5936, _6180);
    float _6186 = _6170 * _6182;
    float _6188 = _6108 * _6182;
    float _6190 = _6134 * _6182;
    float _6192 = _6166 * 0.25;
    float _6194 = _6086 * _6184;
    float _6196 = -_6186;
    float _6198 = _5988 * _6196;
    bool _6200 = _6192 < 0.891006529331207275390625;
    bool _6202 = _6200 || _6104;
    float _6204 = _5934 * _6194;
    float _6206 = -_6190;
    float _6208 = _5974 * _6206;
    float _6210 = _5936 * _6194;
    bool _6212 = _5780 >= 2.0;
    bool _6214 = isnan(_5780);
    bool _6216 = _6212 || _6214;
    bool _6218 = isnan(2.0);
    bool _6220 = _6216 || _6218;
    bool _6222 = _6220 || _6202;
    float _6224 = -_6188;
    float _6226 = -_6198;
    float _6228 = fma(_5974, _6224, _6226);
    float _6230 = -_6204;
    float _6232 = _6014 * _6230;
    float _6234 = _5926 * _6194;
    float _6236 = -_6186;
    float _6238 = -_6208;
    float _6240 = fma(_5976, _6236, _6238);
    float _6242 = -_6186;
    float _6244 = -_6210;
    float _6246 = _6242 + _6244;
    float _6248 = -_6210;
    float _6250 = _6022 * _6248;
    float _6252 = -_6210;
    float _6254 = -_6232;
    float _6256 = fma(_6018, _6252, _6254);
    float _6258 = -_6188;
    float _6260 = _5976 * _6258;
    float _6262 = -_6188;
    float _6264 = -_6234;
    float _6266 = _6262 + _6264;
    float _6268 = -_6234;
    float _6270 = _6018 * _6268;
    float _6272 = -_6234;
    float _6274 = -_6250;
    float _6276 = fma(_6014, _6272, _6274);
    float _6278 = -_6190;
    float _6280 = -_6260;
    float _6282 = fma(_5988, _6278, _6280);
    float _6284 = -_6190;
    float _6286 = -_6204;
    float _6288 = _6284 + _6286;
    float _6290 = -_6204;
    float _6292 = -_6270;
    float _6294 = fma(_6022, _6290, _6292);
    float _6296 = _6228 + _6276;
    float _6298 = _6092 * _6166;
    float _6300 = _6094 * _6166;
    float _6302 = _6240 + _6256;
    float _6304 = _6282 + _6294;
    float _6306 = _2758 * 0.5;
    float _6308 = _2758 * 0.300000011920928955078125;
    bool _6310 = !_6222;
    float _6312 = _6288;
    float _6314 = _6266;
    float _6316 = _6246;
    float _6348;
    float _6350;
    float _6352;
    float _6354;
    float _6356;
    if (!_6310)
    {
        float _6318 = -_5590;
        float _6320 = _6318 + _5608;
        float _6322 = -_5590;
        float _6324 = _6322 + _5614;
        float _6326 = _5590 * 2000.0;
        float _6328 = _6320 * 1000.0;
        float _6330 = _6324 * 1000.0;
        float _6332 = fma(_6328, _6328, 0.0625);
        float _6334 = fma(_6330, _6330, _6332);
        float _6336 = rsqrt(_6334);
        float _6338 = -_6328;
        float _6340 = fma(_6338, _6336, -0.0);
        float _6342 = -_6330;
        float _6344 = fma(_6342, _6336, -0.0);
        float _6346 = _6336 * 0.25;
        _6348 = _6326;
        _6350 = _6346;
        _6352 = _6340;
        _6354 = _6344;
        _6356 = _6336;
        _6358 = true;
    }
    else
    {
        float _6360 = _6300 * _6300;
        float _6362 = 1.0 / _6192;
        float _6364 = -_6300;
        float _6366 = (-0.0) + _6364;
        float _6368 = fma(_6298, _6298, _6360);
        float _6370 = sqrt(_6368);
        bool _6372 = _6370 > 9.9999997473787516355514526367188e-05;
        float _6374 = _6370 * _6362;
        float _6376 = _6360;
        _6350 = _6192;
        _6354 = _6366;
        _6356 = _6374;
        if (_6372)
        {
            float _6378 = abs(_6298);
            float _6380 = abs(_6300);
            float _6382 = precise::max(_6378, _6380);
            _5824 = _6382;
        }
        float _6384 = _5824;
        float _6386 = -_6298;
        float _6388 = (-0.0) + _6386;
        _6352 = _6388;
        if (!_6372)
        {
            _6376 = 0.0;
        }
        float _6390 = _6376;
        float _6392 = _6384;
        float _6394 = _6390;
        if (_6372)
        {
            float _6396 = 1.0 / _6384;
            _6392 = _6396;
        }
        float _6398 = _6392;
        if (_6372)
        {
            float _6400 = _6370 * _6398;
            _6394 = _6400;
        }
        float _6402 = _6394;
        float _6404 = _6402 * 0.9649016857147216796875;
        float _6406 = -_6404;
        float _6408 = fma(_6406, _6374, _5700);
        _6348 = _6408;
    }
    _6358 = false;
    float _6410 = _6348;
    float _6412 = _6350;
    float _6414 = _6352;
    float _6416 = _6354;
    float _6418 = _6356;
    float _6420 = -_4914;
    float _6422 = _6420 + _6410;
    bool _6424 = _6410 >= _4914;
    bool _6426 = isnan(_6410);
    bool _6428 = _6424 || _6426;
    bool _6430 = isnan(_4914);
    bool _6432 = _6428 || _6430;
    float _6434 = -_6410;
    float _6436 = fma(_5602, 2000.0, _6434);
    bool _6438 = _6410 > _4914;
    float _6440 = _6422 * _6422;
    float _6442 = precise::max(_1942, 0.001000000047497451305389404296875);
    bool _6444 = !_6438;
    float _6446 = _6444 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _6448 = _4408 >= 0.5;
    float _6450 = sqrt(_6440);
    int _6452 = ~as_type<int>(_6446);
    int _6454 = _6452 + 1;
    int _6456 = _6454 + 1;
    float _6458 = abs(_6436);
    bool _6460 = _6458 >= 2.0;
    bool _6462 = isnan(_6458);
    bool _6464 = _6460 || _6462;
    bool _6466 = isnan(2.0);
    bool _6468 = _6464 || _6466;
    int _6470 = _6456;
    float _6472 = _6418;
    float _6474 = _6446;
    float _6476 = _6422;
    float _6478 = _6442;
    if (_6432)
    {
        int _6480 = ~as_type<int>(_6446);
        int _6482 = _6480 + 1;
        _6470 = _6482;
    }
    int _6484 = _6470;
    bool _6486 = _6412 >= 0.891006529331207275390625;
    bool _6488 = _6486 && _6468;
    float _6490 = float(_6484);
    float _6492 = _6450 * _6490;
    float _6494 = precise::min(_6442, 10000.0);
    bool _6496 = !_6448;
    float _6498 = _6492;
    float _6500 = _6450;
    float _6594;
    float _6596;
    float _6598;
    float _6832;
    float _6834;
    float _6836;
    float _6872;
    float _6874;
    float _6876;
    float _6878;
    float _6880;
    if (!_6496)
    {
        bool _6502 = _4650 > _4510;
        float _6504 = _5264 * _6412;
        bool _6506 = _4650 >= _4510;
        bool _6508 = isnan(_4650);
        bool _6510 = _6506 || _6508;
        bool _6512 = isnan(_4510);
        bool _6514 = _6510 || _6512;
        float _6516 = fma(_5266, _6414, _6504);
        int _6518 = _6514 ? 0 : 1;
        float _6520 = fma(_5268, _6416, _6516);
        int _6522 = ~_6518;
        int _6524 = _6522 + 1;
        int _6526 = _6524 + 1;
        int _6528 = _6526;
        int _6530 = _6514 ? (-1) : 0;
        if (!_6502)
        {
            int _6532 = ~_6518;
            int _6534 = _6532 + 1;
            _6528 = _6534;
        }
        int _6536 = _6528;
        bool _6538 = _4408 != 1.0;
        bool _6540 = isnan(_4408);
        bool _6542 = _6538 || _6540;
        bool _6544 = isnan(1.0);
        bool _6546 = _6542 || _6544;
        float _6548 = float(_6536);
        float _6550 = _4682 * _6548;
        float _6552 = _4530 * _6548;
        float _6554 = _4540 * _6548;
        bool _6556 = _6520 <= 0.0;
        float _6558 = float(_6556);
        float _6560 = _6550 * _6412;
        float _6562 = fma(_6552, _6414, _6560);
        float _6564 = _6520 * _6558;
        float _6566 = fma(_6554, _6416, _6562);
        float _6568 = -_6564;
        float _6570 = fma(_6414, _6568, _5266);
        float _6572 = -_6564;
        float _6574 = fma(_6412, _6572, _5264);
        float _6576 = -_6564;
        float _6578 = fma(_6416, _6576, _5268);
        float _6580 = abs(_6566);
        float _6582 = -_6580;
        float _6584 = _6582 + 1.0;
        float _6586 = abs(_6584);
        float _6588 = log2(_6586);
        float _6590 = _6588 * 0.20000000298023223876953125;
        float _6592 = exp2(_6590);
        _6594 = _6570;
        _6596 = _6574;
        _6598 = _6578;
        float _6618;
        int _6646;
        int _6708;
        float _6710;
        float _6712;
        if (!_6546)
        {
            float _6600 = _6574 * _6574;
            float _6602 = _4402 * 0.89999997615814208984375;
            float _6604 = _4406 * 0.89999997615814208984375;
            float _6606 = _4404 * 0.89999997615814208984375;
            float _6608 = fma(_6570, _6570, _6600);
            float _6610 = fma(_6578, _6578, _6608);
            float _6612 = sqrt(_6610);
            bool _6614 = _6612 > 0.5;
            bool _6616 = !_6614;
            _6618 = _6602;
            if (!_6616)
            {
                bool _6620 = _6566 > 0.0;
                bool _6622 = _6566 >= 0.0;
                bool _6624 = isnan(_6566);
                bool _6626 = _6622 || _6624;
                bool _6628 = isnan(0.0);
                bool _6630 = _6626 || _6628;
                float _6632 = precise::max(_2106, 0.100000001490116119384765625);
                int _6634 = _6630 ? 0 : 1;
                float _6636 = precise::max(_2096, 0.100000001490116119384765625);
                int _6638 = ~_6634;
                int _6640 = _6638 + 1;
                int _6642 = _6640 + 1;
                int _6644 = _6642;
                _6530 = _6630 ? (-1) : 0;
                _6646 = _6620 ? (-1) : 0;
                if (!_6620)
                {
                    int _6648 = ~_6634;
                    int _6650 = _6648 + 1;
                    _6644 = _6650;
                }
                int _6652 = _6644;
                float _6654 = _6632 + _6636;
                float _6656 = float(_6652);
                float _6658 = 1.0 / _6654;
                float _6660 = _6552 * _6656;
                float _6662 = _6554 * _6656;
                float _6664 = _6550 * _6656;
                float _6666 = _6578 * _6660;
                float _6668 = _6574 * _6662;
                float _6670 = -_6666;
                float _6672 = fma(_6570, _6662, _6670);
                float _6674 = _6570 * _6664;
                float _6676 = -_6668;
                float _6678 = fma(_6578, _6664, _6676);
                float _6680 = _6672 * _6672;
                float _6682 = -_6674;
                float _6684 = fma(_6574, _6660, _6682);
                float _6686 = _6658 * 0.4000000059604644775390625;
                float _6688 = fma(_6678, _6678, _6680);
                float _6690 = _6612 * _6686;
                float _6692 = fma(_6684, _6684, _6688);
                float _6694 = sqrt(_6692);
                float _6696 = _6694 + 9.9999997473787516355514526367188e-06;
                float _6698 = 1.0 / _6696;
                float _6700 = _6690 * _6698;
                float _6702 = fma(_6678, _6700, _6602);
                float _6704 = fma(_6672, _6700, _6604);
                float _6706 = fma(_6684, _6700, _6606);
                _6618 = _6702;
                _6708 = 1065353216;
                _6710 = _6704;
                _6712 = _6706;
                _6714 = true;
            }
            else
            {
                bool _6716 = _6592 > 0.5;
                bool _6718 = _6492 > (-0.800000011920928955078125);
                bool _6720 = _6718 && _6716;
                bool _6722 = !_6720;
                int _6724 = _6722 ? 1065353216 : 1056964608;
                _6646 = _6720 ? (-1) : 0;
                _6708 = _6724;
                _6710 = _6604;
                _6712 = _6606;
                _6714 = true;
            }
        }
        else
        {
            bool _6726 = _6566 > 0.0;
            bool _6728 = _6566 >= 0.0;
            bool _6730 = isnan(_6566);
            bool _6732 = _6728 || _6730;
            bool _6734 = isnan(0.0);
            bool _6736 = _6732 || _6734;
            int _6738 = _6736 ? 0 : 1;
            int _6740 = ~_6738;
            int _6742 = _6740 + 1;
            int _6744 = _6742 + 1;
            int _6746 = _6744;
            _6530 = _6736 ? (-1) : 0;
            if (!_6726)
            {
                int _6748 = ~_6738;
                int _6750 = _6748 + 1;
                _6746 = _6750;
            }
            int _6752 = _6746;
            bool _6754 = _6592 >= 0.300000011920928955078125;
            bool _6756 = isnan(_6592);
            bool _6758 = _6754 || _6756;
            bool _6760 = isnan(0.300000011920928955078125);
            bool _6762 = _6758 || _6760;
            float _6764 = float(_6752);
            float _6766 = _6554 * _6764;
            float _6768 = _6552 * _6764;
            float _6770 = _6550 * _6764;
            float _6772 = _6766 * _6412;
            float _6774 = _6768 * _6416;
            float _6776 = _6770 * _6414;
            float _6778 = -_6772;
            float _6780 = fma(_6770, _6416, _6778);
            float _6782 = _6592 * 10.0;
            float _6784 = -_6774;
            float _6786 = fma(_6766, _6414, _6784);
            float _6788 = -_6776;
            float _6790 = fma(_6768, _6412, _6788);
            float _6792 = _6782 * _6780;
            float _6794 = _6782 * _6786;
            float _6796 = _6782 * _6790;
            int _6798 = _6762 ? as_type<int>(_4408) : 1065353216;
            _6618 = _6792;
            _6646 = _6762 ? (-1) : 0;
            _6708 = _6798;
            _6710 = _6794;
            _6712 = _6796;
        }
        _6714 = false;
        int _6800 = _6530;
        float _6802 = _6618;
        int _6804 = _6646;
        int _6806 = _6708;
        float _6808 = _6710;
        float _6810 = _6712;
        bool _6812 = _6422 >= (-0.20000000298023223876953125);
        bool _6814 = isnan(_6422);
        bool _6816 = _6812 || _6814;
        bool _6818 = isnan(-0.20000000298023223876953125);
        bool _6820 = _6816 || _6818;
        float _6822 = _5982 * 0.20000000298023223876953125;
        float _6824 = _5986 * 0.20000000298023223876953125;
        float _6826 = _5996 * 0.20000000298023223876953125;
        int _6828 = _6800;
        int _6830 = _6804;
        _6312 = _6824;
        _6314 = _6822;
        _6316 = _6826;
        _6832 = 0.0;
        _6834 = _6808;
        _6836 = _6810;
        _1058 = _6820;
        if (_6820)
        {
            bool _6838 = _6492 > 2.0;
            _6828 = _6838 ? (-1) : 0;
        }
        int _6840 = _6828;
        if (!_6820)
        {
            _6830 = -1;
        }
        int _6842 = _6830;
        int _6844 = _6842;
        if (_6820)
        {
            bool _6846 = _6422 >= (-0.20000000298023223876953125);
            int _6848 = (_6846 ? (-1) : 0) & _6840;
            _6844 = _6848;
        }
        int _6850 = _6844;
        int _6852 = ~_6850;
        bool _6854 = !_6488;
        int _6856 = _6852 & (_6854 ? (-1) : 0);
        bool _6858 = !_6488;
        int _6860 = _6850 & (_6858 ? (-1) : 0);
        int _6862 = _6856 | _6860;
        int _6864 = _6850 & (_6488 ? (-1) : 0);
        int _6866 = _6862 | _6864;
        int _6868 = ~_6866;
        float _6870 = (_6868 != 0) ? as_type<float>(_6806) : 0.0;
        _6872 = _6870;
        _6874 = 0.0;
        _6876 = 0.0;
        _6878 = 0.0;
        _6880 = _6802;
        _6882 = true;
    }
    else
    {
        bool _6884 = _6492 < 0.0;
        bool _6886 = _6884 && _6488;
        bool _6888 = _6492 > (-0.800000011920928955078125);
        bool _6890 = _6888 && _6886;
        if (_6890)
        {
            float _6892 = _5264 * _6412;
            _2264 = _6892;
        }
        float _6894 = _2264;
        float _6896 = _6894;
        if (!_6890)
        {
            _6472 = 0.0;
        }
        float _6898 = _6472;
        float _6900 = _6898;
        if (_6890)
        {
            _6900 = _6422;
        }
        float _6902 = _6900;
        _6878 = _6902;
        if (_6890)
        {
            float _6904 = fma(_5266, _6414, _6894);
            _6896 = _6904;
        }
        float _6906 = _6896;
        float _6908 = _6906;
        if (!_6890)
        {
            _6474 = _6302;
        }
        float _6910 = _6474;
        float _6912 = _6910;
        if (!_6890)
        {
            _6476 = _6296;
        }
        float _6914 = _6476;
        float _6916 = _6914;
        if (_6890)
        {
            float _6918 = fma(_5268, _6416, _6906);
            _6908 = _6918;
        }
        float _6920 = _6908;
        float _6922 = _6920;
        if (!_6890)
        {
            _6478 = _6304;
        }
        float _6924 = _6478;
        float _6926 = _6924;
        if (!_6890)
        {
            _6498 = _4402;
        }
        float _6928 = _6498;
        float _6930 = _6928;
        if (_6890)
        {
            float _6932 = -_6414;
            float _6934 = fma(_6932, _6920, _5266);
            _5294 = _6934;
        }
        float _6936 = _5294;
        _6594 = _6936;
        if (_6890)
        {
            float _6938 = -_6412;
            float _6940 = fma(_6938, _6920, _5264);
            _5296 = _6940;
        }
        float _6942 = _5296;
        _6596 = _6942;
        if (_6890)
        {
            float _6944 = -_6416;
            float _6946 = fma(_6944, _6920, _5268);
            _5298 = _6946;
        }
        float _6948 = _5298;
        _6598 = _6948;
        if (!_6890)
        {
            _2266 = _4406;
        }
        float _6950 = _2266;
        float _6952 = _6950;
        if (!_6890)
        {
            _6922 = _4404;
        }
        float _6954 = _6922;
        float _6956 = _6954;
        if (!_6890)
        {
            _6500 = _4408;
        }
        float _6958 = _6500;
        _6872 = _6958;
        if (_6890)
        {
            _6912 = _6302;
        }
        float _6960 = _6912;
        _6832 = _6960;
        if (_6890)
        {
            _6916 = _6296;
        }
        float _6962 = _6916;
        _6874 = _6962;
        if (_6890)
        {
            _6926 = _6304;
        }
        float _6964 = _6926;
        _6876 = _6964;
        if (_6890)
        {
            _6930 = _4402;
        }
        float _6966 = _6930;
        _6880 = _6966;
        if (_6890)
        {
            _6952 = _4406;
        }
        float _6968 = _6952;
        _6834 = _6968;
        if (_6890)
        {
            _6956 = _4404;
        }
        float _6970 = _6956;
        _6836 = _6970;
        if (_6890)
        {
            _6872 = 0.5;
        }
    }
    _6882 = false;
    float _6972 = _6872;
    float _6974 = _6312;
    float _6976 = _6314;
    float _6978 = _6316;
    float _6980 = _6594;
    float _6982 = _6596;
    float _6984 = _6832;
    float _6986 = _6874;
    float _6988 = _6876;
    float _6990 = _6598;
    float _6992 = _6878;
    float _6994 = _6834;
    float _6996 = _6880;
    float _6998 = _6836;
    bool _7000 = _1058;
    float _7002 = 1.0 / _6494;
    float _7004 = _2758 * _2758;
    bool _7006 = _6972 >= 0.5;
    float _7008 = fma(_6306, _6306, _7004);
    float _7010 = _7002 * _6974;
    float _7012 = _7002 * _6976;
    float _7014 = _7002 * _6978;
    float _7016 = _7010 * _7010;
    float _7018 = fma(_7012, _7012, _7016);
    float _7020 = fma(_7014, _7014, _7018);
    float _7022 = _6308 * _6308;
    float _7024 = fma(_6308, _6308, _7004);
    float _7026 = _7008 * 0.083333335816860198974609375;
    float _7028 = sqrt(_7020);
    float _7030 = fma(_6306, _6306, _7022);
    float _7032 = _7024 * 0.083333335816860198974609375;
    float _7034 = _4682 * _7026;
    float _7036 = _7030 * 0.083333335816860198974609375;
    float _7038 = _4658 * _7032;
    float _7040 = _4524 * _7032;
    float _7042 = _4530 * _7034;
    float _7044 = _4556 * _7032;
    bool _7046 = _7028 > 80.0;
    float _7048 = _4530 * _7026;
    float _7050 = _4540 * _7026;
    float _7052 = _4530 * _7048;
    float _7054 = _4682 * _7048;
    float _7056 = _4540 * _7048;
    float _7058 = _4682 * _7034;
    float _7060 = _4682 * _7050;
    float _7062 = _4530 * _7050;
    float _7064 = _4540 * _7034;
    float _7066 = _4540 * _7050;
    float _7068 = fma(_4658, _7038, _7052);
    float _7070 = fma(_4524, _7038, _7054);
    float _7072 = fma(_4556, _7038, _7056);
    float _7074 = fma(_4658, _7040, _7042);
    float _7076 = _7038;
    float _7078 = _7012;
    float _7080 = _7010;
    float _7082 = _6982;
    float _7084 = _6992;
    float _7086 = _6972;
    if (_7046)
    {
        float _7088 = rsqrt(_7020);
        _7076 = _7088;
    }
    float _7090 = _7076;
    float _7092 = fma(_4658, _7044, _7062);
    float _7094 = fma(_4556, _7040, _7064);
    float _7096 = _4558 * _7036;
    float _7098 = fma(_4556, _7044, _7066);
    float _7100 = fma(_4524, _7040, _7058);
    float _7102 = fma(_4524, _7044, _7060);
    float _7104 = _4544 * _7036;
    float _7106 = _4656 * _7036;
    float _7108 = fma(_4558, _7096, _7068);
    float _7110 = fma(_4544, _7096, _7070);
    float _7112 = fma(_4656, _7096, _7072);
    float _7114 = fma(_4544, _7104, _7100);
    float _7116 = fma(_4656, _7104, _7094);
    float _7118 = fma(_4544, _7106, _7102);
    float _7120 = fma(_4656, _7106, _7098);
    float _7122 = fma(_4558, _7106, _7092);
    float _7124 = fma(_4558, _7104, _7074);
    float _7126 = _7118 * _7112;
    float _7128 = _7110 * _7120;
    float _7130 = _7092;
    float _7132 = _7104;
    float _7134 = _7110;
    float _7136 = _7114;
    float _7138 = _7118;
    float _7140 = _7108;
    float _7142 = _7124;
    float _7144 = _7122;
    float _7146 = _7112;
    float _7148 = _7120;
    if (_7046)
    {
        float _7150 = _7090 * 80.0;
        _7130 = _7150;
    }
    float _7152 = _7130;
    float _7154 = _7118 * _7116;
    float _7156 = _7114 * _7112;
    float _7158 = -_7126;
    float _7160 = _7128 + _7158;
    if (!_7046)
    {
        _7132 = _7014;
    }
    float _7162 = _7132;
    float _7164 = -_7154;
    float _7166 = fma(_7114, _7120, _7164);
    float _7168 = -_7156;
    float _7170 = fma(_7110, _7116, _7168);
    float _7172 = _7124 * _7160;
    float _7174 = _7162;
    if (_7046)
    {
        float _7176 = _7012 * _7152;
        _7078 = _7176;
    }
    float _7178 = _7078;
    if (_7046)
    {
        float _7180 = _7010 * _7152;
        _7080 = _7180;
    }
    float _7182 = _7080;
    if (_7046)
    {
        float _7184 = _7014 * _7152;
        _7174 = _7184;
    }
    float _7186 = _7174;
    float _7188 = -_7172;
    float _7190 = fma(_7108, _7166, _7188);
    float _7192 = _7110 * _4406;
    float _7194 = _7118 * _4406;
    float _7196 = _7114 * _4406;
    float _7198 = fma(_7122, _7170, _7190);
    float _7200 = fma(_7108, _4402, _7192);
    float _7202 = fma(_7122, _4402, _7194);
    float _7204 = fma(_7124, _4402, _7196);
    float _7206 = _4410 * 0.01666666753590106964111328125;
    bool _7208 = _7198 != 0.0;
    bool _7210 = isnan(_7198);
    bool _7212 = _7208 || _7210;
    bool _7214 = isnan(0.0);
    bool _7216 = _7212 || _7214;
    float _7218 = fma(_7120, _4404, _7202);
    float _7220 = fma(_7112, _4404, _7200);
    float _7222 = fma(_7116, _4404, _7204);
    float _7224 = fma(_7206, _7178, _6980);
    float _7226 = _7218 * _4406;
    float _7228 = _7220 * _4404;
    float _7230 = _7222 * _4402;
    float _7232 = -_7226;
    float _7234 = fma(_7222, _4404, _7232);
    float _7236 = -_7228;
    float _7238 = fma(_7218, _4402, _7236);
    float _7240 = -_7230;
    float _7242 = fma(_7220, _4406, _7240);
    float _7244 = fma(_7206, _7182, _6982);
    float _7246 = _7234 + _6984;
    float _7248 = _7238 + _6986;
    float _7250 = _7230;
    float _7252 = _7224;
    float _7254 = _7224;
    float _7256 = _7244;
    if (!_7216)
    {
        _4428 = _7116;
    }
    float _7258 = _4428;
    bool _7260 = !_7216;
    float _7262 = _7258;
    if (!_7260)
    {
        float _7264 = 1.0 / _7198;
        float _7266 = _7124 * _7120;
        float _7268 = _7108 * _7118;
        float _7270 = _7122 * _7114;
        float _7272 = _7108 * _7116;
        float _7274 = -_7266;
        float _7276 = fma(_7122, _7116, _7274);
        float _7278 = -_7268;
        float _7280 = fma(_7122, _7110, _7278);
        float _7282 = _7122 * _7112;
        float _7284 = _7124 * _7110;
        float _7286 = -_7128;
        float _7288 = _7286 + _7126;
        float _7290 = -_7270;
        float _7292 = fma(_7124, _7118, _7290);
        float _7294 = -_7282;
        float _7296 = fma(_7108, _7120, _7294);
        float _7298 = -_7272;
        float _7300 = fma(_7124, _7112, _7298);
        float _7302 = -_7284;
        float _7304 = fma(_7108, _7114, _7302);
        float _7306 = _7296 * _7264;
        float _7308 = _7280 * _7264;
        float _7310 = _7166 * _7264;
        float _7312 = _7288 * _7264;
        float _7314 = _7170 * _7264;
        float _7316 = _7276 * _7264;
        float _7318 = _7292 * _7264;
        float _7320 = _7300 * _7264;
        float _7322 = _7304 * _7264;
        _7134 = _7312;
        _7136 = _7306;
        _7138 = _7308;
        _7140 = _7310;
        _7142 = _7316;
        _7144 = _7318;
        _7146 = _7314;
        _7262 = _7320;
        _7148 = _7322;
        _7082 = _7304;
        _7250 = _7300;
    }
    float _7324 = _7134;
    float _7326 = _7136;
    float _7328 = _7138;
    float _7330 = _7140;
    float _7332 = _7142;
    float _7334 = _7144;
    float _7336 = _7146;
    float _7338 = _7262;
    float _7340 = _7148;
    float _7342 = _7082;
    float _7344 = _7250;
    float _7346 = _7248 * _7324;
    float _7348 = _7248 * _7326;
    float _7350 = _7248 * _7328;
    float _7352 = _7242 + _6988;
    float _7354 = fma(_7246, _7330, _7346);
    float _7356 = fma(_7246, _7332, _7348);
    float _7358 = fma(_7246, _7334, _7350);
    float _7360 = fma(_7352, _7336, _7354);
    float _7362 = fma(_7352, _7338, _7356);
    float _7364 = fma(_7206, _7186, _6990);
    float _7366 = fma(_7352, _7340, _7358);
    bool _7368 = !_7006;
    float _7370 = _7364;
    float _7372 = _7344;
    float _7374 = _7342;
    float _7376 = _7364;
    float _7378 = _7362;
    float _7380 = _7360;
    float _7382 = _7366;
    if (!_7368)
    {
        float _7384 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
        float _7386 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
        float _7388 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
        float _7390 = _7244 * _7244;
        float _7392 = fma(_7224, _7224, _7390);
        float _7394 = fma(_7364, _7364, _7392);
        float _7396 = sqrt(_7394);
        float _7398 = _7396 + 9.9999997473787516355514526367188e-06;
        float _7400 = 1.0 / _7398;
        float _7402 = _7224 * _7400;
        float _7404 = _7244 * _7400;
        if (_1948)
        {
            float _7406 = _7386 * _4934;
            _4996 = _7406;
        }
        float _7408 = _4996;
        float _7410 = _7408;
        if (_1948)
        {
            float _7412 = _7386 * _4958;
            _5014 = _7412;
        }
        float _7414 = _5014;
        float _7416 = _7414;
        if (_1948)
        {
            float _7418 = _7386 * _4982;
            _5038 = _7418;
        }
        float _7420 = _5038;
        float _7422 = _7364 * _7400;
        float _7424 = _7420;
        if (_1948)
        {
            float _7426 = fma(_7384, _4932, _7408);
            _7410 = _7426;
        }
        float _7428 = _7410;
        if (_1948)
        {
            float _7430 = fma(_7384, _4956, _7414);
            _7416 = _7430;
        }
        float _7432 = _7416;
        if (_1948)
        {
            float _7434 = fma(_7384, _4980, _7420);
            _7424 = _7434;
        }
        float _7436 = _7424;
        if (_1948)
        {
            float _7438 = fma(_7388, _4936, _7428);
            _4998 = _7438;
        }
        float _7440 = _4998;
        float _7442 = _7440;
        float _7444 = _7440;
        if (_1948)
        {
            float _7446 = fma(_7388, _4960, _7432);
            _5016 = _7446;
        }
        float _7448 = _5016;
        float _7450 = _7448;
        float _7452 = _7448;
        if (_1948)
        {
            float _7454 = fma(_7388, _4984, _7436);
            _5040 = _7454;
        }
        float _7456 = _5040;
        float _7458 = _7456;
        float _7460 = _7456;
        if (!_1948)
        {
            bool _7462 = !_2176;
            if (!_7462)
            {
                uint _7464 = uint(int(uint(_180) >> uint(2)));
                float _7466 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_7464)]);
                int _7468 = _180 + 4;
                uint _7470 = uint(int(uint(_7468) >> uint(2)));
                float _7472 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_7470)]);
                int _7474 = _180 + 8;
                uint _7476 = uint(int(uint(_7474) >> uint(2)));
                float _7478 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_7476)]);
                uint _7480 = uint(int(uint(_180) >> uint(2)));
                float _7482 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_7480)]);
                int _7484 = _180 + 4;
                uint _7486 = uint(int(uint(_7484) >> uint(2)));
                float _7488 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_7486)]);
                int _7490 = _180 + 8;
                uint _7492 = uint(int(uint(_7490) >> uint(2)));
                float _7494 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_7492)]);
                uint _7496 = uint(int(uint(_180) >> uint(2)));
                float _7498 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7496)]);
                int _7500 = _180 + 4;
                uint _7502 = uint(int(uint(_7500) >> uint(2)));
                float _7504 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7502)]);
                int _7506 = _180 + 8;
                uint _7508 = uint(int(uint(_7506) >> uint(2)));
                float _7510 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7508)]);
                float _7512 = _7472 * _7386;
                float _7514 = _7488 * _7386;
                float _7516 = _7504 * _7386;
                float _7518 = fma(_7466, _7384, _7512);
                float _7520 = fma(_7482, _7384, _7514);
                float _7522 = fma(_7498, _7384, _7516);
                float _7524 = fma(_7478, _7388, _7518);
                float _7526 = fma(_7494, _7388, _7520);
                float _7528 = fma(_7510, _7388, _7522);
                _7452 = _7526;
                _7444 = _7524;
                _7460 = _7528;
                _7530 = true;
            }
            else
            {
                if (!_2228)
                {
                    _7442 = _7384;
                }
                float _7532 = _7442;
                _7444 = _7532;
                if (!_2228)
                {
                    _7450 = _7386;
                }
                float _7534 = _7450;
                _7452 = _7534;
                if (!_2228)
                {
                    _7458 = _7388;
                }
                float _7536 = _7458;
                bool _7538 = !_2228;
                _7460 = _7536;
                if (!_7538)
                {
                    uint _7540 = uint(int(uint(_180) >> uint(2)));
                    float _7542 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_7540)]);
                    int _7544 = _180 + 4;
                    uint _7546 = uint(int(uint(_7544) >> uint(2)));
                    float _7548 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_7546)]);
                    int _7550 = _180 + 8;
                    uint _7552 = uint(int(uint(_7550) >> uint(2)));
                    float _7554 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_7552)]);
                    uint _7556 = uint(int(uint(_180) >> uint(2)));
                    float _7558 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_7556)]);
                    int _7560 = _180 + 4;
                    uint _7562 = uint(int(uint(_7560) >> uint(2)));
                    float _7564 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_7562)]);
                    int _7566 = _180 + 8;
                    uint _7568 = uint(int(uint(_7566) >> uint(2)));
                    float _7570 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_7568)]);
                    uint _7572 = uint(int(uint(_180) >> uint(2)));
                    float _7574 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7572)]);
                    int _7576 = _180 + 4;
                    uint _7578 = uint(int(uint(_7576) >> uint(2)));
                    float _7580 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7578)]);
                    int _7582 = _180 + 8;
                    uint _7584 = uint(int(uint(_7582) >> uint(2)));
                    float _7586 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7584)]);
                    float _7588 = _7548 * _7386;
                    float _7590 = _7564 * _7386;
                    float _7592 = _7580 * _7386;
                    float _7594 = fma(_7542, _7384, _7588);
                    float _7596 = fma(_7558, _7384, _7590);
                    float _7598 = fma(_7574, _7384, _7592);
                    float _7600 = fma(_7554, _7388, _7594);
                    float _7602 = fma(_7570, _7388, _7596);
                    float _7604 = fma(_7586, _7388, _7598);
                    _7452 = _7602;
                    _7444 = _7600;
                    _7460 = _7604;
                }
            }
        }
        _7530 = false;
        float _7606 = _7452;
        float _7608 = _7444;
        float _7610 = _7460;
        float _7612 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
        float _7614 = _7612 * 59.999996185302734375;
        float _7616 = _7606 * _7614;
        float _7618 = _7608 * _7614;
        float _7620 = _4410 * _7616;
        float _7622 = _7610 * _7614;
        float _7624 = _4410 * _7618;
        float _7626 = _7620 * _6412;
        float _7628 = _4410 * _7622;
        float _7630 = fma(_7624, _6414, _7626);
        float _7632 = fma(_7628, _6416, _7630);
        float _7634 = -_6412;
        float _7636 = fma(_7632, _7634, _7620);
        float _7638 = -_6414;
        float _7640 = fma(_7632, _7638, _7624);
        float _7642 = -_6416;
        float _7644 = fma(_7632, _7642, _7628);
        float _7646 = _7636 * _7636;
        float _7648 = fma(_7640, _7640, _7646);
        float _7650 = fma(_7644, _7644, _7648);
        float _7652 = sqrt(_7650);
        float _7654 = _7652 + 9.9999997473787516355514526367188e-06;
        float _7656 = 1.0 / _7654;
        float _7658 = _7636 * _7656;
        float _7660 = _7640 * _7656;
        float _7662 = _7644 * _7656;
        float _7664 = _7244 * _7658;
        float _7666 = fma(_7224, _7660, _7664);
        float _7668 = fma(_7364, _7662, _7666);
        float _7670 = _7668 * 0.5;
        bool _7672 = _7668 >= 0.0;
        float _7674 = float(_7672);
        float _7676 = precise::min(_7652, _7670);
        float _7678 = _7676 * _7674;
        float _7680 = -_7678;
        float _7682 = fma(_7658, _7680, _7244);
        float _7684 = -_7678;
        float _7686 = fma(_7660, _7684, _7224);
        float _7688 = -_7678;
        float _7690 = fma(_7662, _7688, _7364);
        float _7692 = _7682 * _7682;
        float _7694 = fma(_7686, _7686, _7692);
        float _7696 = fma(_7690, _7690, _7694);
        float _7698 = sqrt(_7696);
        bool _7700 = _7698 > 0.5;
        bool _7702 = isnan(_7698);
        bool _7704 = _7700 || _7702;
        bool _7706 = isnan(0.5);
        bool _7708 = _7704 || _7706;
        float _7710 = _7662;
        float _7712 = _7698;
        float _7714 = _7696;
        _5002 = _7678;
        _7372 = _7652;
        _5018 = _7686;
        _5020 = _7636;
        _5022 = _7682;
        _7374 = _7614;
        if (!_7708)
        {
            float _7716 = _1944 * 20.0;
            _7252 = _7716;
        }
        float _7718 = _7252;
        float _7720 = _7718;
        if (_7708)
        {
            float _7722 = _1944 * 10.0;
            _2268 = _7722;
        }
        float _7724 = _2268;
        float _7726 = _7724;
        if (!_7708)
        {
            float _7728 = _4410 * _7718;
            _7720 = _7728;
        }
        float _7730 = _7720;
        float _7732 = _7730;
        if (_7708)
        {
            float _7734 = _4410 * _7724;
            _7726 = _7734;
        }
        float _7736 = _7726;
        float _7738 = _7736;
        if (!_7708)
        {
            float _7740 = _7730 * 0.01666666753590106964111328125;
            _7732 = _7740;
        }
        float _7742 = _7732;
        float _7744 = _7742;
        if (_7708)
        {
            float _7746 = _7736 * 0.01666666753590106964111328125;
            _7738 = _7746;
        }
        float _7748 = _7738;
        if (!_7708)
        {
            float _7750 = precise::min(_7698, _7742);
            _7710 = _7750;
        }
        float _7752 = _7710;
        _5000 = _7752;
        if (_7708)
        {
            float _7754 = precise::min(_7698, _7748);
            _7712 = _7754;
        }
        float _7756 = _7712;
        _5004 = _7756;
        if (!_7708)
        {
            float _7758 = -_7402;
            float _7760 = fma(_7758, _7752, _7686);
            _7744 = _7760;
        }
        float _7762 = _7744;
        float _7764 = _7762;
        if (!_7708)
        {
            float _7766 = -_7404;
            float _7768 = fma(_7766, _7752, _7682);
            _7714 = _7768;
        }
        float _7770 = _7714;
        float _7772 = _7770;
        if (!_7708)
        {
            float _7774 = -_7422;
            float _7776 = fma(_7774, _7752, _7690);
            _7370 = _7776;
        }
        float _7778 = _7370;
        _7376 = _7778;
        if (_7708)
        {
            float _7780 = -_7402;
            float _7782 = fma(_7780, _7756, _7686);
            _7764 = _7782;
        }
        float _7784 = _7764;
        _7254 = _7784;
        if (_7708)
        {
            float _7786 = -_7404;
            float _7788 = fma(_7786, _7756, _7682);
            _7772 = _7788;
        }
        float _7790 = _7772;
        _7256 = _7790;
        if (_7708)
        {
            float _7792 = -_7422;
            float _7794 = fma(_7792, _7756, _7690);
            _7376 = _7794;
        }
    }
    float _7796 = _5000;
    float _7798 = _5002;
    float _7800 = _5004;
    float _7802 = _7372;
    float _7804 = _5018;
    float _7806 = _5020;
    float _7808 = _5022;
    float _7810 = _7374;
    float _7812 = _7254;
    float _7814 = _7256;
    float _7816 = _7376;
    bool _7818 = !_1948;
    float _7820 = _7800;
    float _7822 = _7796;
    float _7824 = _7798;
    float _7826 = _7802;
    float _7828 = _7804;
    float _7830 = _7806;
    float _7832 = _7808;
    float _7834 = _7810;
    float _7836 = _7814;
    float _7914;
    float _7916;
    if (!_7818)
    {
        float _7838 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _7840 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _7842 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _7844 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _7846 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _7848 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _7850 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _7852 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _7854 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _7856 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _7858 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _7860 = _7842 * _7846;
        float _7862 = _7842 * _7848;
        float _7864 = -_7860;
        float _7866 = fma(_7838, _7850, _7864);
        float _7868 = -_7862;
        float _7870 = fma(_7840, _7850, _7868);
        float _7872 = _7840 * _7846;
        float _7874 = _7856 * _7850;
        float _7876 = _7856 * _7866;
        float _7878 = -_7872;
        float _7880 = fma(_7838, _7848, _7878);
        float _7882 = _7854 * _7848;
        float _7884 = -_7876;
        float _7886 = fma(_7854, _7870, _7884);
        float _7888 = -_7874;
        float _7890 = fma(_7858, _7848, _7888);
        float _7892 = -_7882;
        float _7894 = fma(_7856, _7846, _7892);
        float _7896 = fma(_7858, _7880, _7886);
        float _7898 = _7858 * _7846;
        float _7900 = -_7898;
        float _7902 = fma(_7854, _7850, _7900);
        float _7904 = 1.0 / _7896;
        float _7906 = _7904 * _6992;
        float _7908 = _7890 * _7906;
        float _7910 = _7902 * _7906;
        float _7912 = _7894 * _7906;
        _7914 = _7908;
        _7916 = _7912;
        _7824 = _7902;
        _7826 = _7844;
        _7828 = _7846;
        _7830 = _7848;
        _7832 = _7850;
        _7834 = _7852;
        _7084 = _7910;
        _7918 = true;
    }
    else
    {
        bool _7920 = _2174 != 0;
        bool _7922 = _2226 != 0;
        bool _7924 = _7922 || _7920;
        if (!_7924)
        {
            _7820 = 0.0;
        }
        float _7926 = _7820;
        _7914 = _7926;
        if (!_7924)
        {
            _7822 = 0.0;
        }
        float _7928 = _7822;
        bool _7930 = !_7924;
        _7916 = _7928;
        if (!_7930)
        {
            uint _7932 = uint(int(uint(_180) >> uint(2)));
            float _7934 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_7932)]);
            int _7936 = _180 + 4;
            uint _7938 = uint(int(uint(_7936) >> uint(2)));
            float _7940 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_7938)]);
            int _7942 = _180 + 8;
            uint _7944 = uint(int(uint(_7942) >> uint(2)));
            float _7946 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_7944)]);
            int _7948 = _180 + 12;
            uint _7950 = uint(int(uint(_7948) >> uint(2)));
            float _7952 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_7950)]);
            uint _7954 = uint(int(uint(_180) >> uint(2)));
            float _7956 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7954)]);
            int _7958 = _180 + 4;
            uint _7960 = uint(int(uint(_7958) >> uint(2)));
            float _7962 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7960)]);
            int _7964 = _180 + 8;
            uint _7966 = uint(int(uint(_7964) >> uint(2)));
            float _7968 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7966)]);
            int _7970 = _180 + 12;
            uint _7972 = uint(int(uint(_7970) >> uint(2)));
            float _7974 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7972)]);
            uint _7976 = uint(int(uint(_180) >> uint(2)));
            float _7978 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_7976)]);
            int _7980 = _180 + 4;
            uint _7982 = uint(int(uint(_7980) >> uint(2)));
            float _7984 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_7982)]);
            int _7986 = _180 + 8;
            uint _7988 = uint(int(uint(_7986) >> uint(2)));
            float _7990 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_7988)]);
            float _7992 = _7946 * _7956;
            float _7994 = _7946 * _7962;
            float _7996 = -_7992;
            float _7998 = fma(_7934, _7968, _7996);
            float _8000 = -_7994;
            float _8002 = fma(_7940, _7968, _8000);
            float _8004 = _7940 * _7956;
            float _8006 = _7978 * _7962;
            float _8008 = _7984 * _7998;
            float _8010 = -_8004;
            float _8012 = fma(_7934, _7962, _8010);
            float _8014 = -_8008;
            float _8016 = fma(_7978, _8002, _8014);
            float _8018 = _7984 * _7968;
            float _8020 = -_8006;
            float _8022 = fma(_7984, _7956, _8020);
            float _8024 = fma(_7990, _8012, _8016);
            float _8026 = _7990 * _7956;
            float _8028 = -_8018;
            float _8030 = fma(_7990, _7962, _8028);
            float _8032 = -_8026;
            float _8034 = fma(_7978, _7968, _8032);
            float _8036 = 1.0 / _8024;
            float _8038 = _8036 * _6992;
            float _8040 = _8030 * _8038;
            float _8042 = _8034 * _8038;
            float _8044 = _8022 * _8038;
            _7914 = _8040;
            _7916 = _8044;
            _7824 = _8034;
            _7826 = _7952;
            _7828 = _7956;
            _7830 = _7962;
            _7832 = _7968;
            _7834 = _7974;
            _7084 = _8042;
        }
    }
    _7918 = false;
    float _8046 = _7914;
    float _8048 = _7916;
    float _8050 = _7824;
    float _8052 = _7826;
    float _8054 = _7828;
    float _8056 = _7830;
    float _8058 = _7832;
    float _8060 = _7834;
    float _8062 = _7084;
    float _8064 = _4562 + _8046;
    float _8066 = _7812 * 0.01666666753590106964111328125;
    float _8068 = _4560 + _8048;
    float _8070 = _7814 * 0.01666666753590106964111328125;
    float _8072 = _7816 * 0.01666666753590106964111328125;
    bool _8074 = !_1948;
    float _8076 = _8050;
    float _8078 = _8052;
    float _8080 = _8054;
    float _8082 = _8056;
    float _8084 = _8058;
    float _8086 = _8060;
    float _8088 = _8070;
    float _8090 = _8072;
    float _8212;
    if (!_8074)
    {
        float _8092 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _8094 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _8096 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _8098 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _8100 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _8102 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _8104 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _8106 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _8108 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _8110 = _8096 * _8098;
        float _8112 = _8096 * _8100;
        float _8114 = _8094 * _8098;
        float _8116 = -_8110;
        float _8118 = fma(_8092, _8102, _8116);
        float _8120 = -_8112;
        float _8122 = fma(_8094, _8102, _8120);
        float _8124 = _8108 * _8094;
        float _8126 = _8106 * _8102;
        float _8128 = _8106 * _8118;
        float _8130 = -_8114;
        float _8132 = fma(_8092, _8100, _8130);
        float _8134 = _8108 * _8098;
        float _8136 = _8104 * _8100;
        float _8138 = -_8128;
        float _8140 = fma(_8104, _8122, _8138);
        float _8142 = -_8124;
        float _8144 = fma(_8106, _8096, _8142);
        float _8146 = -_8126;
        float _8148 = fma(_8108, _8100, _8146);
        float _8150 = -_8134;
        float _8152 = fma(_8104, _8102, _8150);
        float _8154 = fma(_8108, _8132, _8140);
        float _8156 = _8106 * _8092;
        float _8158 = -_8136;
        float _8160 = fma(_8106, _8098, _8158);
        float _8162 = 1.0 / _8154;
        float _8164 = -_8156;
        float _8166 = fma(_8104, _8094, _8164);
        float _8168 = _8104 * _8096;
        float _8170 = -_8168;
        float _8172 = fma(_8108, _8092, _8170);
        float _8174 = -_8092;
        float _8176 = fma(_8174, _8102, _8110);
        float _8178 = _8148 * _8162;
        float _8180 = _8152 * _8162;
        float _8182 = _8160 * _8162;
        float _8184 = _8066 * _8162;
        float _8186 = _8070 * _8178;
        float _8188 = _8070 * _8180;
        float _8190 = _8176 * _8162;
        float _8192 = _8070 * _8182;
        float _8194 = _8144 * _8162;
        float _8196 = _8172 * _8162;
        float _8198 = fma(_8122, _8184, _8186);
        float _8200 = fma(_8066, _8190, _8188);
        float _8202 = _8166 * _8162;
        float _8204 = fma(_8132, _8184, _8192);
        float _8206 = fma(_8072, _8194, _8198);
        float _8208 = fma(_8072, _8196, _8200);
        float _8210 = fma(_8072, _8202, _8204);
        _8076 = _8166;
        _8078 = _8148;
        _8080 = _8202;
        _8082 = _8100;
        _8084 = _8198;
        _8086 = _8152;
        _8212 = _8206;
        _8088 = _8208;
        _8090 = _8210;
        _8214 = true;
    }
    else
    {
        bool _8216 = _2174 != 0;
        bool _8218 = _2226 != 0;
        bool _8220 = _8218 || _8216;
        if (!_8220)
        {
            _7836 = _8066;
        }
        float _8222 = _7836;
        bool _8224 = !_8220;
        _8212 = _8222;
        if (!_8224)
        {
            uint _8226 = uint(int(uint(_180) >> uint(2)));
            float _8228 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_8226)]);
            int _8230 = _180 + 4;
            uint _8232 = uint(int(uint(_8230) >> uint(2)));
            float _8234 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_8232)]);
            int _8236 = _180 + 8;
            uint _8238 = uint(int(uint(_8236) >> uint(2)));
            float _8240 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_8238)]);
            uint _8242 = uint(int(uint(_180) >> uint(2)));
            float _8244 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8242)]);
            int _8246 = _180 + 4;
            uint _8248 = uint(int(uint(_8246) >> uint(2)));
            float _8250 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8248)]);
            int _8252 = _180 + 8;
            uint _8254 = uint(int(uint(_8252) >> uint(2)));
            float _8256 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8254)]);
            uint _8258 = uint(int(uint(_180) >> uint(2)));
            float _8260 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_8258)]);
            int _8262 = _180 + 4;
            uint _8264 = uint(int(uint(_8262) >> uint(2)));
            float _8266 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_8264)]);
            int _8268 = _180 + 8;
            uint _8270 = uint(int(uint(_8268) >> uint(2)));
            float _8272 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_8270)]);
            float _8274 = _8240 * _8244;
            float _8276 = _8240 * _8250;
            float _8278 = _8234 * _8244;
            float _8280 = -_8274;
            float _8282 = fma(_8228, _8256, _8280);
            float _8284 = -_8276;
            float _8286 = fma(_8234, _8256, _8284);
            float _8288 = _8272 * _8234;
            float _8290 = _8272 * _8244;
            float _8292 = _8266 * _8282;
            float _8294 = -_8278;
            float _8296 = fma(_8228, _8250, _8294);
            float _8298 = _8266 * _8228;
            float _8300 = _8260 * _8250;
            float _8302 = -_8292;
            float _8304 = fma(_8260, _8286, _8302);
            float _8306 = -_8290;
            float _8308 = fma(_8260, _8256, _8306);
            float _8310 = -_8298;
            float _8312 = fma(_8260, _8234, _8310);
            float _8314 = _8266 * _8256;
            float _8316 = fma(_8272, _8296, _8304);
            float _8318 = -_8288;
            float _8320 = fma(_8266, _8240, _8318);
            float _8322 = -_8300;
            float _8324 = fma(_8266, _8244, _8322);
            float _8326 = -_8314;
            float _8328 = fma(_8272, _8250, _8326);
            float _8330 = 1.0 / _8316;
            float _8332 = _8260 * _8240;
            float _8334 = -_8228;
            float _8336 = fma(_8334, _8256, _8274);
            float _8338 = -_8332;
            float _8340 = fma(_8272, _8228, _8338);
            float _8342 = _8308 * _8330;
            float _8344 = _8328 * _8330;
            float _8346 = _8324 * _8330;
            float _8348 = _8336 * _8330;
            float _8350 = _8342 * _8070;
            float _8352 = _8344 * _8070;
            float _8354 = _8066 * _8330;
            float _8356 = _8346 * _8070;
            float _8358 = _8320 * _8330;
            float _8360 = _8340 * _8330;
            float _8362 = fma(_8286, _8354, _8352);
            float _8364 = fma(_8348, _8066, _8350);
            float _8366 = _8312 * _8330;
            float _8368 = fma(_8296, _8354, _8356);
            float _8370 = fma(_8358, _8072, _8362);
            float _8372 = fma(_8360, _8072, _8364);
            float _8374 = fma(_8366, _8072, _8368);
            _8076 = _8328;
            _8078 = _8358;
            _8080 = _8346;
            _8082 = _8250;
            _8084 = _8256;
            _8086 = _8308;
            _8212 = _8370;
            _8088 = _8372;
            _8090 = _8374;
        }
    }
    _8214 = false;
    float _8376 = _8076;
    float _8378 = _8078;
    float _8380 = _8080;
    float _8382 = _8082;
    float _8384 = _8084;
    float _8386 = _8086;
    float _8388 = _8212;
    float _8390 = _8088;
    float _8392 = _8090;
    float _8394 = _7362 * _7362;
    float _8396 = _4410 * (-0.0291463173925876617431640625);
    float _8398 = fma(_7360, _7360, _8394);
    float _8400 = exp2(_8396);
    float _8402 = fma(_7366, _7366, _8398);
    float _8404 = sqrt(_8402);
    float _8406 = _8404 * 0.01666666753590106964111328125;
    bool _8408 = _8406 > 1.57079637050628662109375;
    float _8410 = _8406;
    float _8412 = _8400;
    if (_8408)
    {
        float _8414 = rsqrt(_8402);
        _8410 = _8414;
    }
    float _8416 = _8410;
    float _8418 = _8416;
    if (_8408)
    {
        float _8420 = _8416 * 94.24777984619140625;
        _8418 = _8420;
    }
    float _8422 = _8418;
    if (_8408)
    {
        float _8424 = _7362 * _8422;
        _7378 = _8424;
    }
    float _8426 = _7378;
    if (_8408)
    {
        float _8428 = _7360 * _8422;
        _7380 = _8428;
    }
    float _8430 = _7380;
    if (_8408)
    {
        float _8432 = _7366 * _8422;
        _7382 = _8432;
    }
    float _8434 = _7382;
    float _8436 = fma(_7206, _8426, _6994);
    float _8438 = fma(_7206, _8430, _6996);
    float _8440 = fma(_7206, _8434, _6998);
    float _8442 = _8436 * _8400;
    float _8444 = _8438 * _8400;
    float _8446 = _8440 * _8400;
    float _8448 = _8442 * _8442;
    float _8450 = fma(_8444, _8444, _8448);
    float _8452 = fma(_8446, _8446, _8450);
    float _8454 = sqrt(_8452);
    bool _8456 = _8454 > 31.4159259796142578125;
    float _8458 = _8454;
    float _8460 = _8442;
    float _8462 = _8446;
    if (_8456)
    {
        float _8464 = rsqrt(_8452);
        _8458 = _8464;
    }
    float _8466 = _8458;
    if (!_8456)
    {
        _8412 = _8444;
    }
    float _8468 = _8412;
    float _8470 = _8466;
    float _8472 = _8468;
    if (_8456)
    {
        float _8474 = _8466 * 31.4159259796142578125;
        _8470 = _8474;
    }
    float _8476 = _8470;
    if (_8456)
    {
        float _8478 = _8442 * _8476;
        _8460 = _8478;
    }
    float _8480 = _8460;
    float _8482 = _8480;
    if (_8456)
    {
        float _8484 = _8444 * _8476;
        _8472 = _8484;
    }
    float _8486 = _8472;
    if (_8456)
    {
        float _8488 = _8446 * _8476;
        _8462 = _8488;
    }
    float _8490 = _8462;
    float _8492 = _7206 * _8480;
    float _8494 = _7206 * _8486;
    float _8496 = _7206 * _8490;
    float _8498 = _8492 * _8492;
    float _8500 = fma(_8494, _8494, _8498);
    float _8502 = fma(_8496, _8496, _8500);
    float _8504 = sqrt(_8502);
    float _8506 = rsqrt(_8502);
    float _8508 = _8504 * 0.5;
    bool _8510 = _8504 != 0.0;
    bool _8512 = isnan(_8504);
    bool _8514 = _8510 || _8512;
    bool _8516 = isnan(0.0);
    bool _8518 = _8514 || _8516;
    float _8520 = _8508 * 0.15915493667125701904296875;
    float _8522 = _8520 * 6.283185482025146484375;
    float _8524 = sin(_8522);
    float _8526 = _8496 * _8506;
    float _8528 = _8492 * _8506;
    float _8530 = _8494 * _8506;
    float _8532 = _8518 ? _8526 : 0.0;
    float _8534 = _8518 ? _8528 : 0.0;
    float _8536 = _8520 * 6.283185482025146484375;
    float _8538 = cos(_8536);
    float _8540 = _8518 ? _8530 : 0.0;
    float _8542 = _8532 * _8524;
    float _8544 = _8534 * _8524;
    float _8546 = _8540 * _8524;
    float _8548 = _8542 * _4394;
    float _8550 = _8544 * _4388;
    float _8552 = _8544 * _4394;
    float _8554 = _8544 * _4384;
    float _8556 = -_8548;
    float _8558 = fma(_8544, _4390, _8556);
    float _8560 = -_8550;
    float _8562 = fma(_8546, _4394, _8560);
    float _8564 = _8546 * _4384;
    float _8566 = _8546 * _4390;
    float _8568 = _8542 * _4384;
    float _8570 = fma(_8546, _4388, _8552);
    float _8572 = fma(_8538, _4394, _8554);
    float _8574 = fma(_8538, _4388, _8564);
    float _8576 = -_8566;
    float _8578 = fma(_8542, _4388, _8576);
    float _8580 = fma(_8538, _4390, _8568);
    float _8582 = fma(_8542, _4390, _8570);
    float _8584 = _8574 + _8558;
    float _8586 = _8572 + _8578;
    float _8588 = _8580 + _8562;
    float _8590 = -_8582;
    float _8592 = fma(_8538, _4384, _8590);
    uint _8594 = uint(int(uint(_1914) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8594)] = as_type<uint>(_8584);
    int _8596 = _1914 + 4;
    uint _8598 = uint(int(uint(_8596) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8598)] = as_type<uint>(_8586);
    int _8600 = _1914 + 8;
    uint _8602 = uint(int(uint(_8600) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8602)] = as_type<uint>(_8588);
    int _8604 = _1914 + 12;
    uint _8606 = uint(int(uint(_8604) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8606)] = as_type<uint>(_8592);
    uint _8608 = uint(int(uint(_2028) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8608)] = as_type<uint>(_8486);
    int _8610 = _2028 + 4;
    uint _8612 = uint(int(uint(_8610) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8612)] = as_type<uint>(_8480);
    int _8614 = _2028 + 8;
    uint _8616 = uint(int(uint(_8614) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8616)] = as_type<uint>(_8490);
    int _8618 = _2028 + 12;
    uint _8620 = uint(int(uint(_8618) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8620)] = as_type<uint>(_6972);
    float _8622 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    float _8624 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[71]);
    int _8626 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 48;
    uint _8628 = uint(int(uint(_8626) >> uint(2)));
    float _8630 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8628)]);
    int _8632 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 52;
    uint _8634 = uint(int(uint(_8632) >> uint(2)));
    float _8636 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8634)]);
    int _8638 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 56;
    uint _8640 = uint(int(uint(_8638) >> uint(2)));
    float _8642 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8640)]);
    int _8644 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 36;
    uint _8646 = uint(int(uint(_8644) >> uint(2)));
    float _8648 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8646)]);
    int _8650 = as_type<int>(_8622) & 512;
    bool _8652 = _8650 != 0;
    int _8654 = as_type<int>(_8622) & 1024;
    bool _8656 = _8654 != 0;
    float _8658 = _8558;
    float _8660 = _8376;
    float _8662 = _8570;
    float _8664 = _8378;
    float _8666 = _8562;
    float _8668 = _8580;
    bool _8670 = _8656;
    bool _8672 = _7000;
    if (_8652)
    {
        float _8674 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _8676 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _8678 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _8680 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _8658 = _8674;
        _8660 = _8676;
        _8662 = _8678;
        _8664 = _8680;
    }
    float _8682 = _8658;
    float _8684 = _8660;
    float _8686 = _8662;
    float _8688 = _8664;
    float _8690 = _8380;
    float _8692 = _8382;
    float _8694 = _8384;
    float _8696 = _8386;
    if (_8652)
    {
        float _8698 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _8700 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _8702 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _8704 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _8690 = _8698;
        _8692 = _8700;
        _8694 = _8702;
        _8696 = _8704;
    }
    float _8706 = _8690;
    float _8708 = _8692;
    float _8710 = _8694;
    float _8712 = _8696;
    float _8714 = _8578;
    float _8716 = _4390;
    float _8718 = _4384;
    float _8720 = _8566;
    if (_8652)
    {
        float _8722 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _8724 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _8726 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _8728 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _8714 = _8722;
        _8716 = _8724;
        _8718 = _8726;
        _8720 = _8728;
    }
    float _8730 = _8714;
    float _8732 = _8716;
    float _8734 = _8718;
    float _8736 = _8720;
    float _8738 = _4552 + _8624;
    float _8740 = _8738 + _8062;
    float _8742 = _8738;
    if (!_8652)
    {
        _8666 = 0.0;
    }
    float _8744 = _8666;
    float _8746 = _8744;
    if (!_8652)
    {
        _8668 = 0.0;
    }
    float _8748 = _8668;
    float _8750 = _8748;
    if (!_8652)
    {
        _8482 = 0.0;
    }
    float _8752 = _8482;
    int _8754 = as_type<int>(_8622) & 2048;
    bool _8756 = _8754 != 0;
    float _8758 = _8708;
    float _8760 = _8710;
    float _8762 = _8752;
    if (_8652)
    {
        float _8764 = _8740 * _8684;
        _1958 = _8764;
    }
    float _8766 = _1958;
    float _8768 = _8766;
    if (_8652)
    {
        float _8770 = _8740 * _8708;
        _8758 = _8770;
    }
    float _8772 = _8758;
    float _8774 = _8772;
    if (_8652)
    {
        float _8776 = _8740 * _8732;
        _2090 = _8776;
    }
    float _8778 = _2090;
    float _8780 = _8778;
    if (_8652)
    {
        float _8782 = fma(_8064, _8682, _8766);
        _8768 = _8782;
    }
    float _8784 = _8768;
    float _8786 = _8784;
    if (_8652)
    {
        float _8788 = fma(_8064, _8706, _8772);
        _8774 = _8788;
    }
    float _8790 = _8774;
    if (_8652)
    {
        float _8792 = fma(_8064, _8730, _8778);
        _8780 = _8792;
    }
    float _8794 = _8780;
    float _8796 = _8794;
    if (_8652)
    {
        float _8798 = fma(_8068, _8686, _8784);
        _8786 = _8798;
    }
    float _8800 = _8786;
    float _8802 = _8800;
    if (_8652)
    {
        float _8804 = fma(_8068, _8710, _8790);
        _8760 = _8804;
    }
    float _8806 = _8760;
    if (_8652)
    {
        float _8808 = fma(_8068, _8734, _8794);
        _8796 = _8808;
    }
    float _8810 = _8796;
    float _8812 = _8810;
    if (_8652)
    {
        float _8814 = _8688 + _8800;
        _8746 = _8814;
    }
    float _8816 = _8746;
    float _8818 = _8816;
    if (_8652)
    {
        float _8820 = _8712 + _8806;
        _8750 = _8820;
    }
    float _8822 = _8750;
    float _8824 = _8822;
    if (_8652)
    {
        float _8826 = _8736 + _8810;
        _8762 = _8826;
    }
    float _8828 = _8762;
    bool _8830 = !_8656;
    float _8832 = _8828;
    if (!_8830)
    {
        float _8834 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        uint _8836 = uint(int(uint(_180) >> uint(2)));
        float _8838 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_8836)]);
        int _8840 = _180 + 4;
        uint _8842 = uint(int(uint(_8840) >> uint(2)));
        float _8844 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_8842)]);
        int _8846 = _180 + 8;
        uint _8848 = uint(int(uint(_8846) >> uint(2)));
        float _8850 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_8848)]);
        int _8852 = _180 + 12;
        uint _8854 = uint(int(uint(_8852) >> uint(2)));
        float _8856 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_8854)]);
        uint _8858 = uint(int(uint(_180) >> uint(2)));
        float _8860 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_8858)]);
        int _8862 = _180 + 4;
        uint _8864 = uint(int(uint(_8862) >> uint(2)));
        float _8866 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_8864)]);
        int _8868 = _180 + 8;
        uint _8870 = uint(int(uint(_8868) >> uint(2)));
        float _8872 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_8870)]);
        uint _8874 = uint(int(uint(_180) >> uint(2)));
        float _8876 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8874)]);
        int _8878 = _180 + 4;
        uint _8880 = uint(int(uint(_8878) >> uint(2)));
        float _8882 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8880)]);
        int _8884 = _180 + 8;
        uint _8886 = uint(int(uint(_8884) >> uint(2)));
        float _8888 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8886)]);
        float _8890 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        float _8892 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _8894 = _8740 * _8844;
        float _8896 = _8740 * _8866;
        float _8898 = fma(_8064, _8838, _8894);
        float _8900 = _8740 * _8882;
        float _8902 = fma(_8064, _8860, _8896);
        float _8904 = fma(_8064, _8876, _8900);
        float _8906 = fma(_8068, _8850, _8898);
        float _8908 = fma(_8068, _8872, _8902);
        float _8910 = fma(_8068, _8888, _8904);
        float _8912 = _8834 + _8906;
        float _8914 = _8890 + _8908;
        float _8916 = _8892 + _8910;
        _8832 = _8916;
        _7086 = _8856;
        _8824 = _8912;
        _8818 = _8914;
        _8812 = _8908;
        _8802 = _8892;
    }
    float _8918 = _8832;
    float _8920 = _7086;
    float _8922 = _8824;
    float _8924 = _8818;
    float _8926 = _8812;
    float _8928 = _8802;
    bool _8930 = !_8756;
    float _8932 = _8922;
    float _8934 = _8924;
    float _8936 = _8918;
    float _8938 = _8920;
    float _8940 = _8928;
    float _8942 = _8926;
    if (!_8930)
    {
        uint _8944 = uint(int(uint(_180) >> uint(2)));
        float _8946 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_8944)]);
        int _8948 = _180 + 4;
        uint _8950 = uint(int(uint(_8948) >> uint(2)));
        float _8952 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_8950)]);
        int _8954 = _180 + 8;
        uint _8956 = uint(int(uint(_8954) >> uint(2)));
        float _8958 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_8956)]);
        int _8960 = _180 + 12;
        uint _8962 = uint(int(uint(_8960) >> uint(2)));
        float _8964 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_8962)]);
        uint _8966 = uint(int(uint(_180) >> uint(2)));
        float _8968 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_8966)]);
        int _8970 = _180 + 4;
        uint _8972 = uint(int(uint(_8970) >> uint(2)));
        float _8974 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_8972)]);
        int _8976 = _180 + 8;
        uint _8978 = uint(int(uint(_8976) >> uint(2)));
        float _8980 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_8978)]);
        int _8982 = _180 + 12;
        uint _8984 = uint(int(uint(_8982) >> uint(2)));
        float _8986 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_8984)]);
        uint _8988 = uint(int(uint(_180) >> uint(2)));
        float _8990 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8988)]);
        int _8992 = _180 + 4;
        uint _8994 = uint(int(uint(_8992) >> uint(2)));
        float _8996 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8994)]);
        int _8998 = _180 + 8;
        uint _9000 = uint(int(uint(_8998) >> uint(2)));
        float _9002 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_9000)]);
        int _9004 = _180 + 12;
        uint _9006 = uint(int(uint(_9004) >> uint(2)));
        float _9008 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_9006)]);
        float _9010 = _8740 * _8952;
        float _9012 = _8740 * _8974;
        float _9014 = _8740 * _8996;
        float _9016 = fma(_8064, _8946, _9010);
        float _9018 = fma(_8064, _8968, _9012);
        float _9020 = fma(_8064, _8990, _9014);
        float _9022 = fma(_8068, _8958, _9016);
        float _9024 = fma(_8068, _8980, _9018);
        float _9026 = fma(_8068, _9002, _9020);
        float _9028 = _9022 + _8964;
        float _9030 = _9024 + _8986;
        float _9032 = _9026 + _9008;
        _8932 = _9030;
        _8934 = _9028;
        _8936 = _9032;
        _8938 = _8986;
        _8940 = _9022;
    }
    float _9034 = _8932;
    float _9036 = _8934;
    float _9038 = _8936;
    float _9040 = _8938;
    float _9042 = _8940;
    float _9044 = -_9034;
    float _9046 = _8636 + _9044;
    float _9048 = -_9036;
    float _9050 = _8630 + _9048;
    float _9052 = -_9038;
    float _9054 = _8642 + _9052;
    bool _9056 = _616 > 0.001000000047497451305389404296875;
    bool _9058 = isnan(_616);
    bool _9060 = _9056 || _9058;
    bool _9062 = isnan(0.001000000047497451305389404296875);
    bool _9064 = _9060 || _9062;
    float _9066 = _9046 * _9046;
    float _9068 = fma(_9050, _9050, _9066);
    float _9070 = fma(_9054, _9054, _9068);
    float _9072 = sqrt(_9070);
    float _9074 = _9042;
    if (!_9064)
    {
        _8742 = 0.0;
    }
    float _9076 = _8742;
    float _9078 = _9076;
    if (!_9064)
    {
        _9074 = 0.0;
    }
    float _9080 = _9074;
    float _9082 = _9080;
    if (!_9064)
    {
        _636 = 0.0;
    }
    float _9084 = _636;
    int _9086 = as_type<int>(_9072);
    float _9088 = _9084;
    if (!_9064)
    {
        bool _9090 = _9072 > _8648;
        float _9092 = float(_9090);
        _8942 = _9092;
    }
    float _9094 = _8942;
    bool _9096 = !_9064;
    float _9098 = _9094;
    if (!_9096)
    {
        int _9100 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 64;
        uint _9102 = uint(int(uint(_9100) >> uint(2)));
        float _9104 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9102)]);
        int _9106 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 68;
        uint _9108 = uint(int(uint(_9106) >> uint(2)));
        float _9110 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9108)]);
        int _9112 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 72;
        uint _9114 = uint(int(uint(_9112) >> uint(2)));
        float _9116 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9114)]);
        int _9118 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 80;
        uint _9120 = uint(int(uint(_9118) >> uint(2)));
        float _9122 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9120)]);
        int _9124 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 84;
        uint _9126 = uint(int(uint(_9124) >> uint(2)));
        float _9128 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9126)]);
        int _9130 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 88;
        uint _9132 = uint(int(uint(_9130) >> uint(2)));
        float _9134 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9132)]);
        int _9136 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 96;
        uint _9138 = uint(int(uint(_9136) >> uint(2)));
        float _9140 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9138)]);
        int _9142 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 100;
        uint _9144 = uint(int(uint(_9142) >> uint(2)));
        float _9146 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9144)]);
        int _9148 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 104;
        uint _9150 = uint(int(uint(_9148) >> uint(2)));
        float _9152 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9150)]);
        uint _9154 = uint(int(uint(_202) >> uint(2)));
        float _9156 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_9154)]);
        bool _9158 = _9072 > _8648;
        float _9160 = _9094;
        if (!_9158)
        {
            int _9162 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 32;
            uint _9164 = uint(int(uint(_9162) >> uint(2)));
            float _9166 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9164)]);
            _9160 = _9166;
        }
        float _9168 = _9160;
        float _9170 = -_9034;
        float _9172 = _9110 + _9170;
        float _9174 = -_9036;
        float _9176 = _9104 + _9174;
        float _9178 = -_9038;
        float _9180 = _9116 + _9178;
        float _9182 = -_9034;
        float _9184 = _9128 + _9182;
        float _9186 = _9172 * _9172;
        float _9188 = -_9036;
        float _9190 = _9122 + _9188;
        float _9192 = -_9038;
        float _9194 = _9134 + _9192;
        float _9196 = -_9034;
        float _9198 = _9146 + _9196;
        float _9200 = _9184 * _9184;
        float _9202 = -_9036;
        float _9204 = _9140 + _9202;
        float _9206 = fma(_9176, _9176, _9186);
        float _9208 = _9198 * _9198;
        float _9210 = fma(_9190, _9190, _9200);
        float _9212 = -_9038;
        float _9214 = _9152 + _9212;
        float _9216 = fma(_9180, _9180, _9206);
        float _9218 = fma(_9204, _9204, _9208);
        float _9220 = fma(_9194, _9194, _9210);
        float _9222 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
        float _9224 = sqrt(_9216);
        float _9226 = fma(_9214, _9214, _9218);
        float _9228 = sqrt(_9220);
        float _9230 = sqrt(_9226);
        bool _9232 = _9224 > _8648;
        bool _9234 = _9228 > _8648;
        float _9236 = _9038;
        int _9238 = as_type<int>(_9194);
        int _9240 = as_type<int>(_9156);
        float _9242 = _9168;
        int _9244 = as_type<int>(_9226);
        if (!_9232)
        {
            int _9246 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 32;
            uint _9248 = uint(int(uint(_9246) >> uint(2)));
            float _9250 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9248)]);
            _9236 = _9250;
        }
        float _9252 = _9236;
        bool _9254 = _9230 > _8648;
        int _9256 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 40;
        uint _9258 = uint(int(uint(_9256) >> uint(2)));
        float _9260 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9258)]);
        float _9262 = _9040;
        if (!_9234)
        {
            int _9264 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 32;
            uint _9266 = uint(int(uint(_9264) >> uint(2)));
            float _9268 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9266)]);
            _9262 = _9268;
        }
        float _9270 = _9262;
        float _9272 = _9036;
        if (!_9254)
        {
            int _9274 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 32;
            uint _9276 = uint(int(uint(_9274) >> uint(2)));
            float _9278 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9276)]);
            _9272 = _9278;
        }
        float _9280 = _9272;
        int _9282 = as_type<int>(_9156) << 24;
        int _9284 = _9282 >> 24;
        float _9286 = float(_9284);
        float _9288 = _9286 * 0.0078740157186985015869140625;
        float _9290 = precise::min(_9288, 1.0);
        float _9292 = precise::max(_9290, -1.0);
        int _9294 = as_type<int>(_9156) << 16;
        int _9296 = as_type<int>(_9156) << 8;
        bool _9298 = _9292 > 0.0;
        bool _9300 = _9298 || _9158;
        int _9302 = _9294 >> 24;
        int _9304 = _9296 >> 24;
        if (!_9158)
        {
            bool _9306 = _9292 >= 0.0;
            bool _9308 = isnan(_9292);
            bool _9310 = _9306 || _9308;
            bool _9312 = isnan(0.0);
            bool _9314 = _9310 || _9312;
            _8670 = _9314;
        }
        bool _9316 = _8670;
        float _9318 = float(_9302);
        int _9320 = as_type<int>(_9156) >> 24;
        float _9322 = float(_9304);
        float _9324 = _9318 * 0.0078740157186985015869140625;
        bool _9326 = _9316;
        if (!_9158)
        {
            int _9328 = _9316 ? 0 : 1;
            _9238 = _9328;
        }
        int _9330 = _9238;
        float _9332 = float(_9320);
        float _9334 = _9322 * 0.0078740157186985015869140625;
        if (!_9158)
        {
            int _9336 = ~_9330;
            int _9338 = _9336 + 1;
            int _9340 = _9338 + 1;
            _9240 = _9340;
        }
        int _9342 = _9240;
        int _9344 = _9342;
        if (!_9300)
        {
            int _9346 = ~_9330;
            int _9348 = _9346 + 1;
            _9344 = _9348;
        }
        int _9350 = _9344;
        float _9352 = _9332 * 0.0078740157186985015869140625;
        float _9354 = precise::min(_9324, 1.0);
        int _9356 = _9350;
        int _9358 = as_type<int>(_9354);
        if (!_9158)
        {
            bool _9360 = _9072 >= _9168;
            bool _9362 = isnan(_9072);
            bool _9364 = _9360 || _9362;
            bool _9366 = isnan(_9168);
            bool _9368 = _9364 || _9366;
            _9326 = _9368;
        }
        bool _9370 = _9326;
        bool _9372 = _9370;
        if (!_9158)
        {
            float _9374 = float(_9350);
            _9356 = as_type<int>(_9374);
        }
        int _9376 = _9356;
        float _9378 = precise::min(_9334, 1.0);
        float _9380 = precise::max(_9354, -1.0);
        float _9382 = precise::min(_9352, 1.0);
        int _9384 = _9376;
        int _9386 = as_type<int>(_9378);
        int _9388 = as_type<int>(_9382);
        if (_9158)
        {
            _9242 = 1.0;
        }
        float _9390 = _9242;
        float _9392 = _9390;
        if (!_9158)
        {
            float _9394 = _9370 ? as_type<float>(_9376) : (-1.0);
            _9392 = _9394;
        }
        float _9396 = _9392;
        float _9398 = precise::max(_9378, -1.0);
        if (!_9232)
        {
            bool _9400 = _9380 >= 0.0;
            bool _9402 = isnan(_9380);
            bool _9404 = _9400 || _9402;
            bool _9406 = isnan(0.0);
            bool _9408 = _9404 || _9406;
            _9372 = _9408;
        }
        bool _9410 = _9372;
        float _9412 = precise::max(_9382, -1.0);
        bool _9414 = _9380 > 0.0;
        bool _9416 = _9414 || _9232;
        bool _9418 = _9416;
        if (!_9234)
        {
            bool _9420 = _9398 >= 0.0;
            bool _9422 = isnan(_9398);
            bool _9424 = _9420 || _9422;
            bool _9426 = isnan(0.0);
            bool _9428 = _9424 || _9426;
            _8672 = _9428;
        }
        bool _9430 = _8672;
        bool _9432 = _9398 > 0.0;
        bool _9434 = _9432 || _9234;
        bool _9436 = _9430;
        bool _9438 = _9434;
        if (!_9232)
        {
            int _9440 = _9410 ? 0 : 1;
            _9358 = _9440;
        }
        int _9442 = _9358;
        bool _9444 = _9412 > 0.0;
        bool _9446 = _9444 || _9254;
        float _9448 = as_type<float>(_9442);
        bool _9450 = _9446;
        if (!_9234)
        {
            int _9452 = _9430 ? 0 : 1;
            _9086 = _9452;
        }
        int _9454 = _9086;
        if (!_9254)
        {
            bool _9456 = _9412 >= 0.0;
            bool _9458 = isnan(_9412);
            bool _9460 = _9456 || _9458;
            bool _9462 = isnan(0.0);
            bool _9464 = _9460 || _9462;
            _9436 = _9464;
        }
        bool _9466 = _9436;
        if (!_9254)
        {
            int _9468 = _9466 ? 0 : 1;
            _9384 = _9468;
        }
        int _9470 = _9384;
        float _9472 = as_type<float>(_9470);
        if (!_9232)
        {
            int _9474 = ~_9442;
            int _9476 = _9474 + 1;
            int _9478 = _9476 + 1;
            _9386 = _9478;
        }
        int _9480 = _9386;
        int _9482 = _9480;
        if (!_9234)
        {
            int _9484 = ~_9454;
            int _9486 = _9484 + 1;
            int _9488 = _9486 + 1;
            _9388 = _9488;
        }
        int _9490 = _9388;
        int _9492 = _9490;
        if (!_9416)
        {
            int _9494 = ~_9442;
            int _9496 = _9494 + 1;
            _9482 = _9496;
        }
        int _9498 = _9482;
        int _9500 = _9498;
        if (!_9254)
        {
            int _9502 = ~_9470;
            int _9504 = _9502 + 1;
            int _9506 = _9504 + 1;
            _9244 = _9506;
        }
        int _9508 = _9244;
        int _9510 = _9508;
        if (!_9434)
        {
            int _9512 = ~_9454;
            int _9514 = _9512 + 1;
            _9492 = _9514;
        }
        int _9516 = _9492;
        int _9518 = _9516;
        if (!_9446)
        {
            int _9520 = ~_9470;
            int _9522 = _9520 + 1;
            _9510 = _9522;
        }
        int _9524 = _9510;
        int _9526 = _9524;
        if (!_9232)
        {
            float _9528 = float(_9498);
            _9500 = as_type<int>(_9528);
        }
        int _9530 = _9500;
        if (!_9234)
        {
            float _9532 = float(_9516);
            _9518 = as_type<int>(_9532);
        }
        int _9534 = _9518;
        if (!_9254)
        {
            float _9536 = float(_9524);
            _9526 = as_type<int>(_9536);
        }
        int _9538 = _9526;
        if (_9234)
        {
            _9448 = 1.0;
        }
        float _9540 = _9448;
        float _9542 = _9540;
        if (_9254)
        {
            _9472 = 1.0;
        }
        float _9544 = _9472;
        float _9546 = 1.0 / _9260;
        float _9548 = _9260;
        float _9550 = _9544;
        if (!_9232)
        {
            bool _9552 = _9224 >= _9252;
            bool _9554 = isnan(_9224);
            bool _9556 = _9552 || _9554;
            bool _9558 = isnan(_9252);
            bool _9560 = _9556 || _9558;
            _9418 = _9560;
        }
        bool _9562 = _9418;
        if (!_9234)
        {
            bool _9564 = _9228 >= _9270;
            bool _9566 = isnan(_9228);
            bool _9568 = _9564 || _9566;
            bool _9570 = isnan(_9270);
            bool _9572 = _9568 || _9570;
            _9438 = _9572;
        }
        bool _9574 = _9438;
        if (!_9234)
        {
            float _9576 = _9574 ? as_type<float>(_9534) : (-1.0);
            _9542 = _9576;
        }
        float _9578 = _9542;
        if (!_9254)
        {
            bool _9580 = _9230 >= _9280;
            bool _9582 = isnan(_9230);
            bool _9584 = _9580 || _9582;
            bool _9586 = isnan(_9280);
            bool _9588 = _9584 || _9586;
            _9450 = _9588;
        }
        bool _9590 = _9450;
        if (_9232)
        {
            _9548 = 1.0;
        }
        float _9592 = _9548;
        float _9594 = _9592;
        if (!_9232)
        {
            float _9596 = _9562 ? as_type<float>(_9530) : (-1.0);
            _9594 = _9596;
        }
        float _9598 = _9594;
        float _9600 = _9222 * _9546;
        if (!_9254)
        {
            float _9602 = _9590 ? as_type<float>(_9538) : (-1.0);
            _9550 = _9602;
        }
        float _9604 = _9550;
        float _9606 = abs(_9292);
        float _9608 = fma(_9600, _9396, _9606);
        float _9610 = precise::clamp(_9608, 0.0, 1.0);
        float _9612 = abs(_9380);
        float _9614 = fma(_9600, _9598, _9612);
        float _9616 = precise::clamp(_9614, 0.0, 1.0);
        float _9618 = abs(_9398);
        float _9620 = fma(_9600, _9578, _9618);
        float _9622 = precise::clamp(_9620, 0.0, 1.0);
        float _9624 = abs(_9412);
        float _9626 = fma(_9600, _9604, _9624);
        float _9628 = precise::clamp(_9626, 0.0, 1.0);
        float _9630 = _9610 * _9396;
        float _9632 = _9616 * _9598;
        float _9634 = _9622 * _9578;
        float _9636 = _9628 * _9604;
        _9098 = _9630;
        _9078 = _9632;
        _9082 = _9634;
        _9088 = _9636;
    }
    float _9638 = _9098;
    float _9640 = _9078;
    float _9642 = _9082;
    float _9644 = _9088;
    float _9646 = precise::min(_9638, 1.0);
    float _9648 = precise::min(_9640, 1.0);
    float _9650 = -_184;
    float _9652 = _9650 + _8064;
    float _9654 = precise::max(_9646, -1.0);
    float _9656 = precise::max(_9648, -1.0);
    float _9658 = -_190;
    float _9660 = _9658 + _8740;
    float _9662 = precise::min(_9642, 1.0);
    float _9664 = _9654 * 127.0;
    float _9666 = precise::min(_9644, 1.0);
    float _9668 = _9656 * 127.0;
    float _9670 = precise::max(_9662, -1.0);
    float _9672 = -_196;
    float _9674 = _9672 + _8068;
    float _9676 = precise::max(_9666, -1.0);
    float _9678 = rint(_9664);
    int _9680 = int(_9678);
    int _9682 = _180 + 4;
    float _9684 = _9670 * 127.0;
    float _9686 = _9676 * 127.0;
    float _9688 = rint(_9668);
    int _9690 = int(_9688);
    float _9692 = rint(_9684);
    int _9694 = int(_9692);
    uint _9696 = extract_bits(uint(_9680), 0u, 8u);
    int _9698 = int(_9696) & 255;
    float _9700 = rint(_9686);
    int _9702 = int(_9700);
    uint _9704 = extract_bits(uint(_9698), 0u, 8u);
    int _9706 = int(_9704) & 255;
    uint _9708 = extract_bits(uint(_9690), 0u, 8u);
    int _9710 = int(_9708) & 255;
    int _9712 = _9710 << 8;
    int _9714 = _9706 | _9712;
    uint _9716 = extract_bits(uint(_9698), 16u, 8u);
    int _9718 = int(_9716) & 255;
    int _9720 = _9718 << 16;
    int _9722 = _9714 | _9720;
    uint _9724 = extract_bits(uint(_9698), 24u, 8u);
    int _9726 = int(_9724) & 255;
    int _9728 = _9726 << 24;
    int _9730 = _9722 | _9728;
    int _9732 = _180 + 8;
    uint _9734 = extract_bits(uint(_9730), 0u, 8u);
    int _9736 = int(_9734) & 255;
    uint _9738 = extract_bits(uint(_9730), 8u, 8u);
    int _9740 = int(_9738) & 255;
    int _9742 = _9740 << 8;
    int _9744 = _9736 | _9742;
    uint _9746 = extract_bits(uint(_9694), 0u, 8u);
    int _9748 = int(_9746) & 255;
    int _9750 = _9748 << 16;
    int _9752 = _9744 | _9750;
    uint _9754 = extract_bits(uint(_9730), 24u, 8u);
    int _9756 = int(_9754) & 255;
    int _9758 = _9756 << 24;
    int _9760 = _9752 | _9758;
    uint _9762 = extract_bits(uint(_9760), 0u, 8u);
    int _9764 = int(_9762) & 255;
    uint _9766 = extract_bits(uint(_9760), 8u, 8u);
    int _9768 = int(_9766) & 255;
    int _9770 = _9768 << 8;
    int _9772 = _9764 | _9770;
    uint _9774 = extract_bits(uint(_9760), 16u, 8u);
    int _9776 = int(_9774) & 255;
    int _9778 = _9776 << 16;
    int _9780 = _9772 | _9778;
    uint _9782 = extract_bits(uint(_9702), 0u, 8u);
    int _9784 = int(_9782) & 255;
    int _9786 = _9784 << 24;
    int _9788 = _9780 | _9786;
    uint _9790 = uint(int(uint(_202) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_9790)] = uint(_9788);
    uint _9792 = uint(int(uint(_202) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_9792)] = as_type<uint>(_574);
    uint _9794 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_9794)] = as_type<uint>(_8064);
    uint _9796 = uint(int(uint(_9682) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_9796)] = as_type<uint>(_8740);
    uint _9798 = uint(int(uint(_9732) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_9798)] = as_type<uint>(_8068);
    uint _9800 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_9800)] = as_type<uint>(_8388);
    uint _9802 = uint(int(uint(_9682) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_9802)] = as_type<uint>(_8390);
    uint _9804 = uint(int(uint(_9732) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_9804)] = as_type<uint>(_8392);
    uint _9806 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_9806)] = as_type<uint>(_9652);
    uint _9808 = uint(int(uint(_9682) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_9808)] = as_type<uint>(_9660);
    uint _9810 = uint(int(uint(_9732) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_9810)] = as_type<uint>(_9674);
    float _9812 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _9814 = _9660 * _9660;
    float _9816 = _8390 * _8390;
    float _9818 = fma(_9652, _9652, _9814);
    float _9820 = fma(_8388, _8388, _9816);
    float _9822 = fma(_9674, _9674, _9818);
    float _9824 = fma(_8392, _8392, _9820);
    float _9826 = sqrt(_9822);
    float _9828 = sqrt(_9824);
    bool _9830 = _9826 >= 9.9999999747524270787835121154785e-07;
    bool _9832 = isnan(_9826);
    bool _9834 = _9830 || _9832;
    bool _9836 = isnan(9.9999999747524270787835121154785e-07);
    bool _9838 = _9834 || _9836;
    float _9840 = _9824;
    if (!_9838)
    {
        bool _9842 = _558 != _306;
        bool _9844 = isnan(_558);
        bool _9846 = _9842 || _9844;
        bool _9848 = isnan(_306);
        bool _9850 = _9846 || _9848;
        _9852 = _9850;
        if (!_9852)
        {
            float _9854 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _9856 = _9854 > 0.0;
            bool _9858 = !_9856;
            if (!_9858)
            {
                float _9860 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _9862 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _9864 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _9866 = _9862 * _528;
                float _9868 = _9862 * _526;
                float _9870 = _9862 * _530;
                float _9872 = fma(_9860, _534, _9866);
                float _9874 = fma(_9860, _532, _9868);
                float _9876 = fma(_9860, _536, _9870);
                float _9878 = fma(_9864, _540, _9872);
                float _9880 = fma(_9864, _538, _9874);
                float _9882 = fma(_9864, _542, _9876);
                float _9884 = _9878 * _9878;
                float _9886 = fma(_9880, _9880, _9884);
                float _9888 = fma(_9882, _9882, _9886);
                float _9890 = rsqrt(_9888);
                float _9892 = _9890 * 9.9999999747524270787835121154785e-07;
                float _9894 = _9880 * _9892;
                float _9896 = _9878 * _9892;
                float _9898 = _9882 * _9892;
                _360 = as_type<int>(_9894);
                _362 = as_type<int>(_9896);
                _364 = as_type<int>(_9898);
                _9852 = true;
            }
            else
            {
                bool _9900 = _9828 >= 9.9999999747524270787835121154785e-07;
                bool _9902 = isnan(_9828);
                bool _9904 = _9900 || _9902;
                bool _9906 = isnan(9.9999999747524270787835121154785e-07);
                bool _9908 = _9904 || _9906;
                if (!_9908)
                {
                    float _9910 = _8740 * _8740;
                    float _9912 = fma(_8064, _8064, _9910);
                    float _9914 = fma(_8068, _8068, _9912);
                    float _9916 = sqrt(_9914);
                    bool _9918 = _9916 >= 9.9999999747524270787835121154785e-07;
                    bool _9920 = isnan(_9916);
                    bool _9922 = _9918 || _9920;
                    bool _9924 = isnan(9.9999999747524270787835121154785e-07);
                    bool _9926 = _9922 || _9924;
                    float _9928 = _9916;
                    if (_9926)
                    {
                        float _9930 = rsqrt(_9914);
                        _9928 = _9930;
                    }
                    float _9932 = _9928;
                    if (!_9926)
                    {
                        _348 = 0;
                    }
                    int _9934 = _348;
                    int _9936 = _9934;
                    if (!_9926)
                    {
                        _350 = 897988541;
                    }
                    int _9938 = _350;
                    int _9940 = _9938;
                    if (!_9926)
                    {
                        _352 = 0;
                    }
                    int _9942 = _352;
                    int _9944 = _9942;
                    if (_9926)
                    {
                        float _9946 = _9932 * 9.9999999747524270787835121154785e-07;
                        _9840 = _9946;
                    }
                    float _9948 = _9840;
                    if (_9926)
                    {
                        float _9950 = _8064 * _9948;
                        _9936 = as_type<int>(_9950);
                    }
                    int _9952 = _9936;
                    _360 = _9952;
                    if (_9926)
                    {
                        float _9954 = _8740 * _9948;
                        _9940 = as_type<int>(_9954);
                    }
                    int _9956 = _9940;
                    _362 = _9956;
                    if (_9926)
                    {
                        float _9958 = _8068 * _9948;
                        _9944 = as_type<int>(_9958);
                    }
                    int _9960 = _9944;
                    _364 = _9960;
                    _9852 = true;
                }
                else
                {
                    float _9962 = rsqrt(_9824);
                    float _9964 = _9962 * 9.9999999747524270787835121154785e-07;
                    float _9966 = _8388 * _9964;
                    float _9968 = _8390 * _9964;
                    float _9970 = _8392 * _9964;
                    _360 = as_type<int>(_9966);
                    _362 = as_type<int>(_9968);
                    _364 = as_type<int>(_9970);
                    _9852 = true;
                }
            }
        }
    }
    else
    {
        float _9972 = _9828 * _9812;
        bool _9974 = _9972 >= 0.001000000047497451305389404296875;
        bool _9976 = isnan(_9972);
        bool _9978 = _9974 || _9976;
        bool _9980 = isnan(0.001000000047497451305389404296875);
        bool _9982 = _9978 || _9980;
        bool _9984 = _9972 > 0.0;
        bool _9986 = !_9982;
        bool _9988 = _9984 && _9986;
        bool _9990 = _9826 < 0.001000000047497451305389404296875;
        bool _9992 = _9990 && _9988;
        if (!_9992)
        {
            _354 = as_type<int>(_9652);
        }
        int _9994 = _354;
        int _9996 = _9994;
        if (_9992)
        {
            float _9998 = _9812 * _8388;
            _9996 = as_type<int>(_9998);
        }
        int _10000 = _9996;
        _360 = _10000;
        if (!_9992)
        {
            _356 = as_type<int>(_9660);
        }
        int _10002 = _356;
        int _10004 = _10002;
        if (_9992)
        {
            float _10006 = _9812 * _8390;
            _10004 = as_type<int>(_10006);
        }
        int _10008 = _10004;
        _362 = _10008;
        if (!_9992)
        {
            _358 = as_type<int>(_9674);
        }
        int _10010 = _358;
        _364 = _10010;
        if (_9992)
        {
            float _10012 = _9812 * _8392;
            _364 = as_type<int>(_10012);
        }
    }
    _9852 = false;
    int _10014 = _360;
    int _10016 = _362;
    int _10018 = _364;
    uint _10020 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_10020)] = uint(_10014);
    uint _10022 = uint(int(uint(_9682) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_10022)] = uint(_10016);
    uint _10024 = uint(int(uint(_9732) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_10024)] = uint(_10018);
}

