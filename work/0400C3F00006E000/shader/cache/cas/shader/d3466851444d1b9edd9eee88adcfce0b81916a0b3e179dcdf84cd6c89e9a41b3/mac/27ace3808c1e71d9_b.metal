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
    texture2d_array<float> cp_t_tcb_14 [[id(17)]];
    sampler cp_t_tcb_14Smplr [[id(18)]];
    texture2d_array<float> cp_t_tcb_16 [[id(19)]];
    sampler cp_t_tcb_16Smplr [[id(20)]];
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
void _87(thread const int& _21286, thread const int& _21287, thread const int& _21288, thread const int& _21289, thread int& _21290, thread int& _21291, thread int& _21292, thread int& _21293, thread int& _21294, thread int& _21295)
{
    float _21298 = as_type<float>(_21288) + 0.0;
    bool _21300 = _21298 != 0.0;
    bool _21302 = isnan(_21298);
    bool _21304 = _21300 || _21302;
    bool _21306 = isnan(0.0);
    bool _21308 = _21304 || _21306;
    int _21310 = _21286;
    int _21312 = _21287;
    int _21314 = _21288;
    int _21316 = _21308 ? (-1) : 0;
    if (!_21308)
    {
        float _21318 = as_type<float>(_21288) * 1.0;
        _21310 = as_type<int>(_21318);
    }
    int _21320 = _21310;
    bool _21322 = !_21308;
    int _21324 = _21320;
    int _21326 = _21320;
    if (!_21322)
    {
        float _21328 = as_type<float>(_21288) + 0.0;
        bool _21330 = _21328 >= 0.0;
        bool _21332 = isnan(_21328);
        bool _21334 = _21330 || _21332;
        bool _21336 = isnan(0.0);
        bool _21338 = _21334 || _21336;
        _21316 = _21338 ? (-1) : 0;
        if (!_21338)
        {
            _21324 = 2147483647;
        }
        int _21340 = _21324;
        bool _21342 = !_21338;
        int _21344 = _21340;
        _21326 = _21340;
        if (!_21342)
        {
            float _21346 = as_type<float>(_21288) + 0.0;
            bool _21348 = _21346 > as_type<float>(0x7f800000u /* inf */);
            bool _21350 = isnan(_21346);
            bool _21352 = _21348 || _21350;
            bool _21354 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _21356 = _21352 || _21354;
            _21316 = _21356 ? (-1) : 0;
            if (_21356)
            {
                float _21358 = as_type<float>(_21288) + 1.0;
                _21344 = as_type<int>(_21358);
            }
            int _21360 = _21344;
            int _21362 = _21360;
            _21326 = _21360;
            if (!_21356)
            {
                float _21364 = 0.0 + as_type<float>(_21288);
                bool _21366 = _21364 != as_type<float>(0x7f800000u /* inf */);
                bool _21368 = isnan(_21364);
                bool _21370 = _21366 || _21368;
                bool _21372 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _21374 = _21370 || _21372;
                _21316 = _21374 ? (-1) : 0;
                if (!_21374)
                {
                    _21362 = _21288;
                }
                int _21376 = _21362;
                bool _21378 = !_21374;
                _21326 = _21376;
                if (!_21378)
                {
                    float _21380 = as_type<float>(_21288) * 18446744073709551616.0;
                    float _21382 = rsqrt(_21380);
                    float _21384 = _21380 * _21382;
                    float _21386 = _21382 * 0.5;
                    float _21388 = -_21384;
                    float _21390 = 0.0 + _21388;
                    float _21392 = fma(_21386, _21390, 0.5);
                    float _21394 = fma(_21384, _21392, _21384);
                    float _21396 = -_21394;
                    float _21398 = 0.0 + _21396;
                    float _21400 = fma(_21394, _21398, _21380);
                    float _21402 = fma(_21386, _21400, _21394);
                    float _21404 = _21402 * 2.3283064365386962890625e-10;
                    _21326 = as_type<int>(_21404);
                    _21312 = as_type<int>(_21394);
                    _21314 = as_type<int>(_21390);
                }
            }
        }
    }
    int _21406 = _21326;
    int _21408 = _21312;
    int _21410 = _21314;
    int _21412 = _21316;
    _21290 = _21289;
    _21291 = 0;
    _21292 = _21406;
    _21293 = _21408;
    _21294 = _21410;
    _21295 = _21412;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _8396 = false;
    bool _7920 = false;
    bool _7658 = false;
    bool _7294 = false;
    bool _6626 = false;
    bool _6454 = false;
    bool _6082 = false;
    bool _5132 = false;
    bool _4888 = false;
    bool _4526 = false;
    bool _3638 = false;
    bool _2984 = false;
    bool _3028 = false;
    bool _2796 = false;
    bool _558 = false;
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
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[86]);
    int _180 = _99 << 4;
    float _182 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[68]);
    int _184 = _180 + 12;
    float _186 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[85]);
    float _188 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    uint _192 = uint(int(uint(_184) >> uint(2)));
    float _194 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_192)]);
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[84]);
    uint _198 = uint(int(uint(_180) >> uint(2)));
    float _200 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_198)]);
    int _202 = _180 + 4;
    uint _204 = uint(int(uint(_202) >> uint(2)));
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_204)]);
    float _208 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    float _210 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
    float _212 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
    float _214 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
    float _216 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
    uint _218 = uint(int(uint(_180) >> uint(2)));
    float _220 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_218)]);
    int _222 = _180 + 4;
    uint _224 = uint(int(uint(_222) >> uint(2)));
    float _226 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_224)]);
    int _228 = _180 + 8;
    uint _230 = uint(int(uint(_228) >> uint(2)));
    float _232 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_230)]);
    uint _234 = uint(int(uint(_184) >> uint(2)));
    float _236 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_234)]);
    uint _238 = uint(int(uint(_180) >> uint(2)));
    float _240 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_238)]);
    int _242 = _180 + 4;
    uint _244 = uint(int(uint(_242) >> uint(2)));
    float _246 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_244)]);
    int _248 = _180 + 8;
    uint _250 = uint(int(uint(_248) >> uint(2)));
    float _252 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_250)]);
    float _254 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[128]);
    float _256 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[129]);
    float _258 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[130]);
    float _260 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[131]);
    uint _262 = uint(int(uint(_180) >> uint(2)));
    float _264 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_262)]);
    int _266 = _180 + 4;
    uint _268 = uint(int(uint(_266) >> uint(2)));
    float _270 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_268)]);
    int _272 = _180 + 8;
    uint _274 = uint(int(uint(_272) >> uint(2)));
    float _276 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_274)]);
    int _278 = _180 + 12;
    uint _280 = uint(int(uint(_278) >> uint(2)));
    float _282 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_280)]);
    uint _284 = uint(int(uint(_184) >> uint(2)));
    float _286 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_284)]);
    bool _288 = _178 > 0.0;
    float _290 = abs(_182);
    float _292 = log2(_290);
    bool _294 = _186 > 0.0;
    float _296 = 0.0;
    float _298 = _196;
    float _300 = _212;
    float _302 = _220;
    float _304 = _226;
    float _306 = _232;
    float _308 = _188;
    float _310 = _208;
    float _312 = _254;
    float _314 = _256;
    float _316 = _258;
    float _318 = _260;
    if (_288)
    {
        float _320 = 1.0 / _178;
        _296 = _320;
    }
    float _322 = _296;
    float _324 = _188 * _292;
    float _326 = -_194;
    float _328 = _190 + _326;
    float _330 = _196 * _186;
    float _332 = exp2(_324);
    float _334 = _322;
    float _336 = _328;
    if (_288)
    {
        float _338 = _328 * _322;
        _334 = _338;
    }
    float _340 = _334;
    float _342 = _340;
    if (_294)
    {
        float _344 = -_330;
        float _346 = fma(_200, _344, _196);
        _298 = _346;
    }
    float _348 = _298;
    int _350 = as_type<int>(_208) & 512;
    bool _352 = _350 != 0;
    float _354 = _348;
    bool _356 = _352;
    if (_288)
    {
        float _358 = precise::min(_340, 1.0);
        _342 = _358;
    }
    float _360 = _342;
    float _362 = _188 * _210;
    if (_288)
    {
        float _364 = _360 * _348;
        _354 = _364;
    }
    float _366 = _354;
    float _368 = _214 * _362;
    float _370 = _212 * _362;
    float _372 = _216 * _362;
    float _374 = _188 * _366;
    float _376 = fma(_226, _332, _368);
    float _378 = _236 * _188;
    float _380 = fma(_220, _332, _370);
    float _382 = fma(_232, _332, _372);
    float _384 = fma(_220, _378, _240);
    float _386 = fma(_226, _378, _246);
    float _388 = fma(_232, _378, _252);
    float _390 = _254 * _374;
    float _392 = _256 * _374;
    float _394 = _258 * _374;
    bool _396 = !_352;
    float _398 = _282;
    float _400 = _374;
    float _402 = _378;
    float _404 = _368;
    float _406 = _332;
    float _408 = _370;
    float _410 = _384;
    float _412 = _286;
    int _414 = as_type<int>(_264);
    int _416 = as_type<int>(_270);
    int _418 = as_type<int>(_276);
    int _420 = as_type<int>(_264);
    int _422 = as_type<int>(_270);
    int _424 = as_type<int>(_276);
    int _426 = as_type<int>(_264);
    int _428 = as_type<int>(_270);
    int _430 = as_type<int>(_276);
    float _552;
    float _554;
    float _556;
    if (!_396)
    {
        float _432 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _434 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _436 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _438 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _440 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _442 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _444 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _446 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _448 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _450 = _436 * _438;
        float _452 = _436 * _440;
        float _454 = _434 * _438;
        float _456 = -_450;
        float _458 = fma(_432, _442, _456);
        float _460 = -_452;
        float _462 = fma(_434, _442, _460);
        float _464 = -_454;
        float _466 = fma(_432, _440, _464);
        float _468 = _446 * _432;
        float _470 = _446 * _458;
        float _472 = _448 * _434;
        float _474 = _444 * _440;
        float _476 = -_468;
        float _478 = fma(_444, _434, _476);
        float _480 = -_470;
        float _482 = fma(_444, _462, _480);
        float _484 = _446 * _442;
        float _486 = _448 * _438;
        float _488 = -_474;
        float _490 = fma(_446, _438, _488);
        float _492 = fma(_448, _466, _482);
        float _494 = -_484;
        float _496 = fma(_448, _440, _494);
        float _498 = -_486;
        float _500 = fma(_444, _442, _498);
        float _502 = _444 * _436;
        float _504 = 1.0 / _492;
        float _506 = -_432;
        float _508 = fma(_506, _442, _450);
        float _510 = -_472;
        float _512 = fma(_446, _436, _510);
        float _514 = -_502;
        float _516 = fma(_448, _432, _514);
        float _518 = _496 * _504;
        float _520 = _500 * _504;
        float _522 = _490 * _504;
        float _524 = _390 * _504;
        float _526 = _392 * _518;
        float _528 = _392 * _520;
        float _530 = _392 * _522;
        float _532 = _508 * _504;
        float _534 = _512 * _504;
        float _536 = fma(_462, _524, _526);
        float _538 = _516 * _504;
        float _540 = _478 * _504;
        float _542 = fma(_390, _532, _528);
        float _544 = fma(_466, _524, _530);
        float _546 = fma(_394, _534, _536);
        float _548 = fma(_394, _538, _542);
        float _550 = fma(_394, _540, _544);
        _302 = _432;
        _304 = _518;
        _306 = _436;
        _402 = _492;
        _308 = _444;
        _310 = _446;
        _404 = _448;
        _406 = _528;
        _312 = _526;
        _314 = _524;
        _316 = _542;
        _318 = _450;
        _552 = _548;
        _554 = _546;
        _556 = _550;
        _408 = _466;
        _558 = true;
    }
    else
    {
        int _560 = as_type<int>(_208) & 1024;
        bool _562 = _560 != 0;
        if (_562)
        {
            _356 = true;
        }
        bool _564 = _356;
        bool _566 = _564;
        if (!_562)
        {
            int _568 = as_type<int>(_208) & 2048;
            bool _570 = _568 != 0;
            _566 = _570;
        }
        bool _572 = _566;
        if (!_572)
        {
            _398 = _390;
        }
        float _574 = _398;
        _554 = _574;
        if (!_572)
        {
            _400 = _392;
        }
        float _576 = _400;
        _552 = _576;
        if (!_572)
        {
            _300 = _394;
        }
        float _578 = _300;
        bool _580 = !_572;
        _556 = _578;
        if (!_580)
        {
            uint _582 = uint(int(uint(_180) >> uint(2)));
            float _584 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_582)]);
            int _586 = _180 + 4;
            uint _588 = uint(int(uint(_586) >> uint(2)));
            float _590 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_588)]);
            int _592 = _180 + 8;
            uint _594 = uint(int(uint(_592) >> uint(2)));
            float _596 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_594)]);
            uint _598 = uint(int(uint(_180) >> uint(2)));
            float _600 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_598)]);
            int _602 = _180 + 4;
            uint _604 = uint(int(uint(_602) >> uint(2)));
            float _606 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_604)]);
            int _608 = _180 + 8;
            uint _610 = uint(int(uint(_608) >> uint(2)));
            float _612 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_610)]);
            uint _614 = uint(int(uint(_180) >> uint(2)));
            float _616 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_614)]);
            int _618 = _180 + 4;
            uint _620 = uint(int(uint(_618) >> uint(2)));
            float _622 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_620)]);
            int _624 = _180 + 8;
            uint _626 = uint(int(uint(_624) >> uint(2)));
            float _628 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_626)]);
            float _630 = _596 * _600;
            float _632 = _596 * _606;
            float _634 = _590 * _600;
            float _636 = -_630;
            float _638 = fma(_584, _612, _636);
            float _640 = -_632;
            float _642 = fma(_590, _612, _640);
            float _644 = -_634;
            float _646 = fma(_584, _606, _644);
            float _648 = _622 * _584;
            float _650 = _622 * _638;
            float _652 = _628 * _590;
            float _654 = _616 * _606;
            float _656 = -_648;
            float _658 = fma(_616, _590, _656);
            float _660 = -_650;
            float _662 = fma(_616, _642, _660);
            float _664 = _622 * _612;
            float _666 = _628 * _600;
            float _668 = -_654;
            float _670 = fma(_622, _600, _668);
            float _672 = fma(_628, _646, _662);
            float _674 = -_664;
            float _676 = fma(_628, _606, _674);
            float _678 = -_666;
            float _680 = fma(_616, _612, _678);
            float _682 = _616 * _596;
            float _684 = 1.0 / _672;
            float _686 = -_584;
            float _688 = fma(_686, _612, _630);
            float _690 = -_652;
            float _692 = fma(_622, _596, _690);
            float _694 = -_682;
            float _696 = fma(_628, _584, _694);
            float _698 = _676 * _684;
            float _700 = _680 * _684;
            float _702 = _670 * _684;
            float _704 = _390 * _684;
            float _706 = _392 * _698;
            float _708 = _392 * _700;
            float _710 = _392 * _702;
            float _712 = _688 * _684;
            float _714 = _692 * _684;
            float _716 = fma(_642, _704, _706);
            float _718 = _696 * _684;
            float _720 = _658 * _684;
            float _722 = fma(_390, _712, _708);
            float _724 = fma(_646, _704, _710);
            float _726 = fma(_394, _714, _716);
            float _728 = fma(_394, _718, _722);
            float _730 = fma(_394, _720, _724);
            _302 = _584;
            _304 = _698;
            _306 = _596;
            _402 = _672;
            _308 = _616;
            _310 = _622;
            _404 = _628;
            _406 = _708;
            _312 = _706;
            _314 = _704;
            _316 = _722;
            _318 = _630;
            _552 = _728;
            _554 = _726;
            _556 = _730;
            _408 = _646;
        }
    }
    _558 = false;
    float _732 = _302;
    float _734 = _304;
    float _736 = _306;
    float _738 = _402;
    float _740 = _308;
    float _742 = _310;
    float _744 = _404;
    float _746 = _406;
    float _748 = _312;
    float _750 = _314;
    float _752 = _316;
    float _754 = _318;
    float _756 = _552;
    float _758 = _554;
    float _760 = _556;
    float _762 = _408;
    uint _764 = uint(int(uint(_184) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_764)] = as_type<uint>(_286);
    float _766 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    int _768 = as_type<int>(_766) & 512;
    bool _770 = _768 != 0;
    int _772 = as_type<int>(_766) & 1024;
    bool _774 = _772 != 0;
    float _776 = _732;
    float _778 = _734;
    float _780 = _736;
    float _782 = _738;
    float _784 = _756;
    float _786 = _762;
    if (_770)
    {
        float _788 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _790 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _792 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _794 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _776 = _788;
        _778 = _790;
        _780 = _792;
        _782 = _794;
    }
    float _796 = _776;
    float _798 = _778;
    float _800 = _780;
    float _802 = _782;
    float _804 = _740;
    float _806 = _742;
    float _808 = _744;
    float _810 = _746;
    if (_770)
    {
        float _812 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _814 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _816 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _818 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _804 = _812;
        _806 = _814;
        _808 = _816;
        _810 = _818;
    }
    float _820 = _804;
    float _822 = _806;
    float _824 = _808;
    float _826 = _810;
    float _828 = _748;
    float _830 = _750;
    float _832 = _752;
    float _834 = _754;
    if (_770)
    {
        float _836 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _838 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _840 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _842 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _828 = _836;
        _830 = _838;
        _832 = _840;
        _834 = _842;
    }
    float _844 = _828;
    float _846 = _830;
    float _848 = _832;
    float _850 = _834;
    float _852 = _386 + _756;
    float _854 = _384 + _758;
    float _856 = _388 + _760;
    int _858 = as_type<int>(_852);
    if (!_770)
    {
        _784 = 0.0;
    }
    float _860 = _784;
    float _862 = 0.0;
    float _864 = _860;
    if (!_770)
    {
        _862 = 0.0;
    }
    float _866 = _862;
    float _868 = _866;
    if (!_770)
    {
        _786 = 0.0;
    }
    float _870 = _786;
    int _872 = as_type<int>(_766) & 2048;
    bool _874 = _872 != 0;
    float _876 = _870;
    if (_770)
    {
        float _878 = _852 * _798;
        _410 = _878;
    }
    float _880 = _410;
    float _882 = _822;
    float _884 = _880;
    float _886 = _824;
    if (_770)
    {
        float _888 = _852 * _822;
        _882 = _888;
    }
    float _890 = _882;
    float _892 = _890;
    if (_770)
    {
        float _894 = fma(_854, _796, _880);
        _884 = _894;
    }
    float _896 = _884;
    float _898 = _846;
    float _900 = _896;
    float _902 = _844;
    if (_770)
    {
        float _904 = _852 * _846;
        _898 = _904;
    }
    float _906 = _898;
    if (_770)
    {
        float _908 = fma(_854, _820, _890);
        _892 = _908;
    }
    float _910 = _892;
    if (_770)
    {
        float _912 = fma(_856, _800, _896);
        _900 = _912;
    }
    float _914 = _900;
    if (_770)
    {
        float _916 = fma(_854, _844, _906);
        _902 = _916;
    }
    float _918 = _902;
    float _920 = _918;
    if (_770)
    {
        float _922 = fma(_856, _824, _910);
        _886 = _922;
    }
    float _924 = _886;
    if (_770)
    {
        float _926 = _802 + _914;
        _864 = _926;
    }
    float _928 = _864;
    float _930 = _928;
    if (_770)
    {
        float _932 = fma(_856, _848, _918);
        _920 = _932;
    }
    float _934 = _920;
    if (_770)
    {
        float _936 = _826 + _924;
        _868 = _936;
    }
    float _938 = _868;
    float _940 = _938;
    if (_770)
    {
        float _942 = _850 + _934;
        _876 = _942;
    }
    float _944 = _876;
    bool _946 = !_774;
    float _948 = _944;
    if (!_946)
    {
        float _950 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _952 = uint(int(uint(_180) >> uint(2)));
        float _954 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_952)]);
        int _956 = _180 + 4;
        uint _958 = uint(int(uint(_956) >> uint(2)));
        float _960 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_958)]);
        int _962 = _180 + 8;
        uint _964 = uint(int(uint(_962) >> uint(2)));
        float _966 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_964)]);
        uint _968 = uint(int(uint(_180) >> uint(2)));
        float _970 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_968)]);
        int _972 = _180 + 4;
        uint _974 = uint(int(uint(_972) >> uint(2)));
        float _976 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_974)]);
        int _978 = _180 + 8;
        uint _980 = uint(int(uint(_978) >> uint(2)));
        float _982 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_980)]);
        uint _984 = uint(int(uint(_180) >> uint(2)));
        float _986 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_984)]);
        int _988 = _180 + 4;
        uint _990 = uint(int(uint(_988) >> uint(2)));
        float _992 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_990)]);
        int _994 = _180 + 8;
        uint _996 = uint(int(uint(_994) >> uint(2)));
        float _998 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_996)]);
        float _1000 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1002 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1004 = _852 * _960;
        float _1006 = _852 * _976;
        float _1008 = _852 * _992;
        float _1010 = fma(_854, _954, _1004);
        float _1012 = fma(_854, _970, _1006);
        float _1014 = fma(_854, _986, _1008);
        float _1016 = fma(_856, _966, _1010);
        float _1018 = fma(_856, _982, _1012);
        float _1020 = fma(_856, _998, _1014);
        float _1022 = _950 + _1016;
        float _1024 = _1000 + _1018;
        float _1026 = _1002 + _1020;
        _940 = _1024;
        _930 = _1022;
        _948 = _1026;
    }
    float _1028 = _940;
    float _1030 = _930;
    float _1032 = _948;
    bool _1034 = !_874;
    float _1036 = _1028;
    float _1038 = _1030;
    float _1040 = _1032;
    if (!_1034)
    {
        uint _1042 = uint(int(uint(_180) >> uint(2)));
        float _1044 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1042)]);
        int _1046 = _180 + 4;
        uint _1048 = uint(int(uint(_1046) >> uint(2)));
        float _1050 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1048)]);
        int _1052 = _180 + 8;
        uint _1054 = uint(int(uint(_1052) >> uint(2)));
        float _1056 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1054)]);
        int _1058 = _180 + 12;
        uint _1060 = uint(int(uint(_1058) >> uint(2)));
        float _1062 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1060)]);
        uint _1064 = uint(int(uint(_180) >> uint(2)));
        float _1066 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1064)]);
        int _1068 = _180 + 4;
        uint _1070 = uint(int(uint(_1068) >> uint(2)));
        float _1072 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1070)]);
        int _1074 = _180 + 8;
        uint _1076 = uint(int(uint(_1074) >> uint(2)));
        float _1078 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1076)]);
        int _1080 = _180 + 12;
        uint _1082 = uint(int(uint(_1080) >> uint(2)));
        float _1084 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1082)]);
        uint _1086 = uint(int(uint(_180) >> uint(2)));
        float _1088 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1086)]);
        int _1090 = _180 + 4;
        uint _1092 = uint(int(uint(_1090) >> uint(2)));
        float _1094 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1092)]);
        int _1096 = _180 + 8;
        uint _1098 = uint(int(uint(_1096) >> uint(2)));
        float _1100 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1098)]);
        int _1102 = _180 + 12;
        uint _1104 = uint(int(uint(_1102) >> uint(2)));
        float _1106 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1104)]);
        float _1108 = _852 * _1050;
        float _1110 = _852 * _1072;
        float _1112 = _852 * _1094;
        float _1114 = fma(_854, _1044, _1108);
        float _1116 = fma(_854, _1066, _1110);
        float _1118 = fma(_854, _1088, _1112);
        float _1120 = fma(_856, _1056, _1114);
        float _1122 = fma(_856, _1078, _1116);
        float _1124 = fma(_856, _1100, _1118);
        float _1126 = _1120 + _1062;
        float _1128 = _1122 + _1084;
        float _1130 = _1124 + _1106;
        _1036 = _1128;
        _1038 = _1126;
        _1040 = _1130;
    }
    float _1132 = _1036;
    float _1134 = _1038;
    float _1136 = _1040;
    float _1138 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[70]);
    float _1140 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[8]);
    float _1142 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[9]);
    float _1144 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[10]);
    float _1146 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[11]);
    float _1148 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1150 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1152 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1154 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1156 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1158 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1160 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1162 = _1138 + 1.0;
    float _1164 = _1162 + _1132;
    float _1166 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _1168 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _1170 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _1172 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _1174 = _1164 * _1150;
    float _1176 = fma(_1148, _1134, _1174);
    float _1178 = fma(_1152, _1136, _1176);
    float _1180 = _1154 + _1178;
    float _1182 = trunc(_1180);
    int _1184 = int(_1182);
    int _1186 = ~as_type<int>(_1156);
    int _1188 = _1184 + _1186;
    int _1190 = _1188 + 1;
    float _1192 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    bool _1194 = _1190 >= 0;
    int _1196 = as_type<int>(_390);
    if (_1194)
    {
        float _1198 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1196 = as_type<int>(_1198);
    }
    int _1200 = _1196;
    float _1202 = _1142 * _1132;
    float _1204 = fma(_1140, _1134, _1202);
    float _1206 = fma(_1144, _1136, _1204);
    float _1208 = _1146 + _1206;
    float _1210 = -_1208;
    bool _1212 = _1158 >= _1210;
    bool _1214 = isnan(_1158);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(_1210);
    bool _1220 = _1216 || _1218;
    float _1222 = -_1208;
    bool _1224 = _1160 >= _1222;
    bool _1226 = isnan(_1160);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan(_1222);
    bool _1232 = _1228 || _1230;
    int _1234 = _1220 ? 0 : 1;
    int _1236 = 2;
    if (_1220)
    {
        _1236 = 1;
    }
    int _1238 = _1236;
    int _1240 = _1238;
    if (_1232)
    {
        _1240 = _1234;
    }
    int _1242 = _1240;
    int _1244 = _1242 << 6;
    int _1246 = _1244 + 96;
    uint _1248 = uint(int(uint(_1246) >> uint(2)));
    float _1250 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1248)]);
    int _1252 = _1246 + 4;
    uint _1254 = uint(int(uint(_1252) >> uint(2)));
    float _1256 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1254)]);
    int _1258 = _1246 + 8;
    uint _1260 = uint(int(uint(_1258) >> uint(2)));
    float _1262 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1260)]);
    int _1264 = _1246 + 12;
    uint _1266 = uint(int(uint(_1264) >> uint(2)));
    float _1268 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1266)]);
    int _1270 = _1244 + 48;
    int _1272 = _1244 + 64;
    uint _1274 = uint(int(uint(_1270) >> uint(2)));
    float _1276 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1274)]);
    int _1278 = _1270 + 4;
    uint _1280 = uint(int(uint(_1278) >> uint(2)));
    float _1282 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1280)]);
    int _1284 = _1270 + 8;
    uint _1286 = uint(int(uint(_1284) >> uint(2)));
    float _1288 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1286)]);
    int _1290 = _1270 + 12;
    uint _1292 = uint(int(uint(_1290) >> uint(2)));
    float _1294 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1292)]);
    uint _1296 = uint(int(uint(_1272) >> uint(2)));
    float _1298 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1296)]);
    int _1300 = _1272 + 4;
    uint _1302 = uint(int(uint(_1300) >> uint(2)));
    float _1304 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1302)]);
    int _1306 = _1272 + 8;
    uint _1308 = uint(int(uint(_1306) >> uint(2)));
    float _1310 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1308)]);
    int _1312 = _1272 + 12;
    uint _1314 = uint(int(uint(_1312) >> uint(2)));
    float _1316 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1314)]);
    float _1318 = _1164 * _1168;
    float _1320 = fma(_1166, _1134, _1318);
    float _1322 = fma(_1170, _1136, _1320);
    float _1324 = _1172 + _1322;
    float _1326 = trunc(_1324);
    int _1328 = int(_1326);
    bool _1330 = _1200 <= _1190;
    bool _1332 = !_1194;
    bool _1334 = _1330 || _1332;
    int _1336 = ~as_type<int>(_1192);
    int _1338 = _1328 + _1336;
    int _1340 = _1338 + 1;
    bool _1342 = _1340 < 0;
    bool _1344 = _1342 || _1334;
    int _1346 = _1244 + 80;
    uint _1348 = uint(int(uint(_1346) >> uint(2)));
    float _1350 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1348)]);
    int _1352 = _1346 + 4;
    uint _1354 = uint(int(uint(_1352) >> uint(2)));
    float _1356 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1354)]);
    int _1358 = _1346 + 8;
    uint _1360 = uint(int(uint(_1358) >> uint(2)));
    float _1362 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1360)]);
    int _1364 = _1346 + 12;
    uint _1366 = uint(int(uint(_1364) >> uint(2)));
    float _1368 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1366)]);
    int _1370 = 0;
    float _1372 = _1276;
    float _1374 = as_type<float>(_1242);
    float _1376 = _1316;
    if (!_1344)
    {
        float _1378 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1370 = as_type<int>(_1378);
    }
    int _1380 = _1370;
    float _1382 = _1164 * _1256;
    float _1384 = fma(_1250, _1134, _1382);
    float _1386 = fma(_1262, _1136, _1384);
    float _1388 = _1268 + _1386;
    float _1390 = _1164 * _1282;
    float _1392 = 1.0 / _1388;
    float _1394 = fma(_1276, _1134, _1390);
    float _1396 = _1164 * _1304;
    float _1398 = fma(_1288, _1136, _1394);
    float _1400 = fma(_1298, _1134, _1396);
    float _1402 = _1294 + _1398;
    float _1404 = fma(_1310, _1136, _1400);
    float _1406 = _1402 * _1392;
    float _1408 = _1316 + _1404;
    bool _1410 = _1406 >= 0.0;
    float _1412 = _1408 * _1392;
    bool _1414 = _1406 <= 1.0;
    bool _1416 = _1414 && _1410;
    bool _1418 = _1412 >= 0.0;
    bool _1420 = _1418 && _1416;
    bool _1422 = _1412 <= 1.0;
    bool _1424 = _1422 && _1420;
    float _1426 = _1404;
    int _1428 = _1424 ? (-1) : 0;
    if (_1424)
    {
        float _1430 = float(_1242);
        _1372 = _1430;
    }
    float _1432 = _1372;
    float _1434 = _1432;
    if (_1424)
    {
        float _1436 = rint(_1432);
        float _1438 = precise::max(_1436, 0.0);
        uint _1440 = uint(_1438);
        uint _1442 = clamp(_1440, 0u, 65535u);
        _1434 = as_type<float>(_1442);
    }
    float _1444 = _1434;
    bool _1446 = _328 > 0.001000000047497451305389404296875;
    bool _1448 = isnan(_328);
    bool _1450 = _1446 || _1448;
    bool _1452 = isnan(0.001000000047497451305389404296875);
    bool _1454 = _1450 || _1452;
    float _1456 = _1164 * _1356;
    bool _1458 = _1380 <= _1340;
    bool _1460 = _1458 || _1344;
    float _1462 = fma(_1350, _1134, _1456);
    float _1464 = fma(_1362, _1136, _1462);
    float _1466 = _1368 + _1464;
    if (_1460)
    {
        _336 = 1.0;
    }
    float _1468 = _336;
    float _1470 = _1468;
    if (!_1460)
    {
        float _1472 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1474 = _1340 * as_type<int>(_1472);
        int _1476 = _1474 + _1190;
        int _1478 = _1476 << 2;
        uint _1480 = uint(int(uint(_1476) >> uint(2)));
        int _1482 = 12 & _1478;
        int _1484 = int(_1480) << 4;
        int _1486 = _1484 + _1482;
        int _1488 = _1486 + 400;
        uint _1490 = uint(int(uint(_1488) >> uint(2)));
        float _1492 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1490)]);
        float _1494 = floor(_1324);
        float _1496 = floor(_1180);
        float _1498 = -_1494;
        float _1500 = _1324 + _1498;
        float _1502 = -_1496;
        float _1504 = _1180 + _1502;
        float _1506 = rint(_1492);
        float _1508 = precise::max(_1506, 0.0);
        uint _1510 = uint(_1508);
        uint _1512 = clamp(_1510, 0u, 65535u);
        float3 _10756 = float3(_1504, _1500, float(int(_1512)));
        float3 _10760 = select(_10756, float3(0.0), isnan(_10756));
        float _1514 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _10760.xy, uint(rint(_10760.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _10760.xy, uint(rint(_10760.z)), level(0.0)).x;
        int _1516 = _1476 << 4;
        int _1518 = _1516 + 2048;
        uint _1520 = uint(int(uint(_1518) >> uint(2)));
        float _1522 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1520)]);
        int _1524 = _1518 + 4;
        uint _1526 = uint(int(uint(_1524) >> uint(2)));
        float _1528 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1526)]);
        int _1530 = _1518 + 8;
        uint _1532 = uint(int(uint(_1530) >> uint(2)));
        float _1534 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1532)]);
        int _1536 = _1518 + 12;
        uint _1538 = uint(int(uint(_1536) >> uint(2)));
        float _1540 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1538)]);
        float _1542 = _1164 * _1528;
        float _1544 = fma(_1522, _1134, _1542);
        float _1546 = fma(_1534, _1136, _1544);
        float _1548 = _1540 + _1546;
        float _1550 = precise::clamp(_1548, 0.0, 1.0);
        float _1552 = -_1550;
        float _1554 = _1552 + _1514;
        float _1556 = fma(_1554, 500.0, 1.5);
        float _1558 = exp2(_1556);
        float _1560 = 0.0 + _1558;
        float _1562 = precise::clamp(_1560, 0.0, 1.0);
        _1374 = _1492;
        _1470 = _1562;
        _1426 = as_type<float>(_1512);
        _1376 = _1504;
    }
    float _1564 = _1374;
    float _1566 = _1470;
    float _1568 = _1426;
    float _1570 = _1376;
    float _1572 = _1466 * _1392;
    float _1574 = fma(_1134, 6.2500002968590706586837768554688e-05, 0.5);
    uint _1576 = uint(int(uint(_180) >> uint(2)));
    float _1578 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1576)]);
    float _1580 = _1444;
    float _1582 = _1564;
    if (_1424)
    {
        float3 _10871 = float3(_1406, _1412, float(as_type<int>(_1444)));
        float3 _10873 = select(_10871, float3(0.0), isnan(_10871));
        float _1584 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _10873.xy, uint(rint(_10873.z)), _1572, level(0.0));
        _1580 = _1584;
    }
    float _1586 = _1580;
    float _1588 = fma(_1136, 6.2500002968590706586837768554688e-05, 0.5);
    float _1590 = _1136;
    if (!_1454)
    {
        float2 _10888 = float2(_1574, _1588);
        float _1592 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_10888, float2(0.0), isnan(_10888)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_10888, float2(0.0), isnan(_10888)), level(0.0)).x;
        _1590 = _1592;
    }
    float _1594 = _1590;
    if (!_1424)
    {
        _1582 = 1.0;
    }
    float _1596 = _1582;
    float _1598 = _1596;
    float _1600 = _1594;
    if (_1424)
    {
        bool _1602 = _1586 >= _1572;
        bool _1604 = isnan(_1586);
        bool _1606 = _1602 || _1604;
        bool _1608 = isnan(_1572);
        bool _1610 = _1606 || _1608;
        float _1612 = float(_1610);
        _1598 = _1612;
    }
    float _1614 = _1598;
    float _1616 = -_1614;
    float _1618 = fma(_1616, _1566, 1.0);
    float _1620 = -_1578;
    float _1622 = _1618 + _1620;
    float _1624 = _1618;
    if (_1454)
    {
        float _1626 = fma(_1622, 0.0500000007450580596923828125, _1578);
        _1624 = _1626;
    }
    float _1628 = _1624;
    float _1630 = precise::max(0.0, _1628);
    float _1632 = precise::min(_1630, 0.999000012874603271484375);
    uint _1634 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1634)] = as_type<uint>(_1632);
    float _1636 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    uint _1638 = uint(int(uint(_180) >> uint(2)));
    float _1640 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1638)]);
    int _1642 = _180 + 4;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    float _1646 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1644)]);
    int _1648 = _180 + 8;
    uint _1650 = uint(int(uint(_1648) >> uint(2)));
    float _1652 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1650)]);
    int _1654 = _180 + 12;
    uint _1656 = uint(int(uint(_1654) >> uint(2)));
    float _1658 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1656)]);
    float _1660 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[71]);
    int _1662 = _99 << 5;
    float _1664 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[82]);
    uint _1666 = uint(int(uint(_1662) >> uint(2)));
    float _1668 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1666)]);
    int _1670 = _1662 + 4;
    uint _1672 = uint(int(uint(_1670) >> uint(2)));
    float _1674 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1672)]);
    int _1676 = _1662 + 8;
    uint _1678 = uint(int(uint(_1676) >> uint(2)));
    float _1680 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1678)]);
    int _1682 = _1662 + 12;
    uint _1684 = uint(int(uint(_1682) >> uint(2)));
    float _1686 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1684)]);
    float _1688 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[80]);
    float _1690 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[79]);
    float _1692 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[2607]);
    int _1694 = as_type<int>(_1636) & 512;
    bool _1696 = _1694 != 0;
    float _1698 = 0.0;
    float _1700 = 0.0;
    float _1702 = 0.0;
    float _1704 = 0.0;
    if (_1696)
    {
        float _1706 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1708 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1710 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1712 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1698 = _1706;
        _1700 = _1708;
        _1702 = _1710;
        _1704 = _1712;
    }
    float _1714 = _1698;
    float _1716 = _1700;
    float _1718 = _1702;
    float _1720 = _1704;
    float _1722 = _1412;
    float _1724 = _1572;
    float _1726 = _1568;
    float _1728 = _1570;
    if (_1696)
    {
        float _1730 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1732 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1734 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1736 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1722 = _1730;
        _1724 = _1732;
        _1726 = _1734;
        _1728 = _1736;
    }
    float _1738 = _1722;
    float _1740 = _1724;
    float _1742 = _1726;
    float _1744 = _1728;
    float _1746 = 0.0;
    float _1748 = 0.0;
    float _1750 = 0.0;
    float _1752 = 0.0;
    if (_1696)
    {
        float _1754 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1756 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1758 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1760 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1746 = _1754;
        _1748 = _1756;
        _1750 = _1758;
        _1752 = _1760;
    }
    float _1762 = _1746;
    float _1764 = _1748;
    float _1766 = _1750;
    float _1768 = _1752;
    float _1770 = -_1660;
    float _1772 = _1646 + _1770;
    int _1774 = as_type<int>(_1636) & 1024;
    bool _1776 = _1774 != 0;
    int _1778 = _1662 + 16;
    uint _1780 = uint(int(uint(_180) >> uint(2)));
    float _1782 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1780)]);
    int _1784 = _180 + 4;
    uint _1786 = uint(int(uint(_1784) >> uint(2)));
    float _1788 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1786)]);
    int _1790 = _180 + 8;
    uint _1792 = uint(int(uint(_1790) >> uint(2)));
    float _1794 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1792)]);
    int _1796 = _180 + 12;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    float _1800 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1798)]);
    float _1802 = precise::max(0.0, _1664);
    uint _1804 = uint(int(uint(_1778) >> uint(2)));
    float _1806 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1804)]);
    int _1808 = _1778 + 4;
    uint _1810 = uint(int(uint(_1808) >> uint(2)));
    float _1812 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1810)]);
    int _1814 = _1778 + 8;
    uint _1816 = uint(int(uint(_1814) >> uint(2)));
    float _1818 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1816)]);
    int _1820 = _1778 + 12;
    uint _1822 = uint(int(uint(_1820) >> uint(2)));
    float _1824 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1822)]);
    float _1826 = _1658;
    float _1828 = _1668;
    float _1830 = _1674;
    float _1832 = _1680;
    float _1834 = _1686;
    float _1836 = _1652;
    float _1838 = as_type<float>(_1774);
    if (!_1696)
    {
        _1826 = 0.0;
    }
    float _1840 = _1826;
    uint _1842 = uint(int(uint(_180) >> uint(2)));
    float _1844 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1842)]);
    float _1846 = 0.0;
    float _1848 = _1840;
    if (!_1696)
    {
        _1846 = 0.0;
    }
    float _1850 = _1846;
    int _1852 = _180 + 8;
    uint _1854 = uint(int(uint(_1852) >> uint(2)));
    float _1856 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1854)]);
    int _1858 = as_type<int>(_1636) & 2048;
    bool _1860 = _1858 != 0;
    uint _1862 = uint(int(uint(_180) >> uint(2)));
    float _1864 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_1862)]);
    int _1866 = _180 + 4;
    uint _1868 = uint(int(uint(_1866) >> uint(2)));
    float _1870 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_1868)]);
    int _1872 = _180 + 8;
    uint _1874 = uint(int(uint(_1872) >> uint(2)));
    float _1876 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_1874)]);
    int _1878 = _180 + 12;
    uint _1880 = uint(int(uint(_1878) >> uint(2)));
    float _1882 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_1880)]);
    bool _1884 = _1802 != 0.0;
    bool _1886 = isnan(_1802);
    bool _1888 = _1884 || _1886;
    bool _1890 = isnan(0.0);
    bool _1892 = _1888 || _1890;
    float _1894 = _1668 + _1674;
    float _1896 = _1716;
    float _1898 = _1740;
    float _1900 = _1764;
    float _1902 = _1718;
    float _1904 = _1742;
    float _1906 = _1766;
    float _1908 = _1762;
    float _1910 = _1850;
    float _1912 = _1744;
    float _1914 = _1768;
    float _1916 = _1714;
    float _1918 = _1720;
    int _1920 = as_type<int>(_1894);
    float _1922 = as_type<float>(_1858);
    if (_1696)
    {
        float _1924 = _1772 * _1716;
        _1896 = _1924;
    }
    float _1926 = _1896;
    float _1928 = _1926;
    if (_1696)
    {
        float _1930 = _1772 * _1740;
        _1898 = _1930;
    }
    float _1932 = _1898;
    float _1934 = _1932;
    if (_1696)
    {
        float _1936 = _1772 * _1764;
        _1900 = _1936;
    }
    float _1938 = _1900;
    float _1940 = _1938;
    if (_1696)
    {
        float _1942 = fma(_1640, _1714, _1926);
        _1928 = _1942;
    }
    float _1944 = _1928;
    float _1946 = _1944;
    if (_1696)
    {
        float _1948 = fma(_1640, _1738, _1932);
        _1934 = _1948;
    }
    float _1950 = _1934;
    if (_1696)
    {
        float _1952 = fma(_1640, _1762, _1938);
        _1940 = _1952;
    }
    float _1954 = _1940;
    float _1956 = _1954;
    if (_1696)
    {
        float _1958 = fma(_1652, _1718, _1944);
        _1902 = _1958;
    }
    float _1960 = _1902;
    float _1962 = _1960;
    if (_1696)
    {
        float _1964 = fma(_1652, _1742, _1950);
        _1904 = _1964;
    }
    float _1966 = _1904;
    float _1968 = _1966;
    if (_1696)
    {
        float _1970 = fma(_1652, _1766, _1954);
        _1906 = _1970;
    }
    float _1972 = _1906;
    float _1974 = _1972;
    if (!_1696)
    {
        _1908 = 0.0;
    }
    float _1976 = _1908;
    float _1978 = _1976;
    if (_1696)
    {
        float _1980 = _1720 + _1960;
        _1848 = _1980;
    }
    float _1982 = _1848;
    float _1984 = _1982;
    if (_1696)
    {
        float _1986 = _1744 + _1966;
        _1978 = _1986;
    }
    float _1988 = _1978;
    float _1990 = _1988;
    if (_1696)
    {
        float _1992 = _1768 + _1972;
        _1910 = _1992;
    }
    float _1994 = _1910;
    bool _1996 = !_1776;
    int _1998 = as_type<int>(_1800);
    float _2000 = _1994;
    float _2002 = _1806;
    float _2004 = _1812;
    float _2006 = _1818;
    float _2008 = _1824;
    float _2010 = _1856;
    float _2012 = _1844;
    float _2014 = _1692;
    float _2016 = _1692;
    if (!_1996)
    {
        float _2018 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _2020 = uint(int(uint(_180) >> uint(2)));
        float _2022 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2020)]);
        int _2024 = _180 + 4;
        uint _2026 = uint(int(uint(_2024) >> uint(2)));
        float _2028 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2026)]);
        int _2030 = _180 + 8;
        uint _2032 = uint(int(uint(_2030) >> uint(2)));
        float _2034 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2032)]);
        int _2036 = _180 + 12;
        uint _2038 = uint(int(uint(_2036) >> uint(2)));
        float _2040 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2038)]);
        uint _2042 = uint(int(uint(_180) >> uint(2)));
        float _2044 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2042)]);
        int _2046 = _180 + 4;
        uint _2048 = uint(int(uint(_2046) >> uint(2)));
        float _2050 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2048)]);
        int _2052 = _180 + 8;
        uint _2054 = uint(int(uint(_2052) >> uint(2)));
        float _2056 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2054)]);
        int _2058 = _180 + 12;
        uint _2060 = uint(int(uint(_2058) >> uint(2)));
        float _2062 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2060)]);
        uint _2064 = uint(int(uint(_180) >> uint(2)));
        float _2066 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2064)]);
        int _2068 = _180 + 4;
        uint _2070 = uint(int(uint(_2068) >> uint(2)));
        float _2072 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2070)]);
        int _2074 = _180 + 8;
        uint _2076 = uint(int(uint(_2074) >> uint(2)));
        float _2078 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2076)]);
        int _2080 = _180 + 12;
        uint _2082 = uint(int(uint(_2080) >> uint(2)));
        float _2084 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2082)]);
        float _2086 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _2088 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _2090 = _1772 * _2028;
        float _2092 = _1772 * _2050;
        float _2094 = _1772 * _2072;
        float _2096 = fma(_1640, _2022, _2090);
        float _2098 = fma(_1640, _2044, _2092);
        float _2100 = fma(_1640, _2066, _2094);
        float _2102 = fma(_1652, _2034, _2096);
        float _2104 = fma(_1652, _2056, _2098);
        float _2106 = fma(_1652, _2078, _2100);
        float _2108 = _2018 + _2102;
        float _2110 = _2086 + _2104;
        float _2112 = _2088 + _2106;
        _1968 = _2102;
        _1912 = _2040;
        _1990 = _2110;
        _1956 = _2098;
        _1974 = _2104;
        _1914 = _2062;
        _1916 = _2066;
        _1946 = _2100;
        _1962 = _2106;
        _1918 = _2084;
        _1998 = as_type<int>(_2086);
        _1984 = _2108;
        _2000 = _2112;
    }
    float _2114 = _1968;
    float _2116 = _1912;
    float _2118 = _1990;
    float _2120 = _1956;
    float _2122 = _1974;
    float _2124 = _1914;
    float _2126 = _1916;
    float _2128 = _1946;
    float _2130 = _1962;
    float _2132 = _1918;
    int _2134 = _1998;
    float _2136 = _1984;
    float _2138 = _2000;
    bool _2140 = !_1860;
    float _2142 = _2116;
    float _2144 = _2114;
    float _2146 = _2130;
    float _2148 = _2136;
    float _2150 = _2138;
    float _2152 = _2120;
    float _2154 = _2124;
    float _2156 = _2128;
    float _2158 = _2118;
    float _2160 = _2122;
    float _2162 = _2126;
    float _2164 = _2132;
    int _2166 = _2134;
    if (!_2140)
    {
        uint _2168 = uint(int(uint(_180) >> uint(2)));
        float _2170 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2168)]);
        int _2172 = _180 + 4;
        uint _2174 = uint(int(uint(_2172) >> uint(2)));
        float _2176 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2174)]);
        int _2178 = _180 + 8;
        uint _2180 = uint(int(uint(_2178) >> uint(2)));
        float _2182 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2180)]);
        int _2184 = _180 + 12;
        uint _2186 = uint(int(uint(_2184) >> uint(2)));
        float _2188 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2186)]);
        uint _2190 = uint(int(uint(_180) >> uint(2)));
        float _2192 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2190)]);
        int _2194 = _180 + 4;
        uint _2196 = uint(int(uint(_2194) >> uint(2)));
        float _2198 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2196)]);
        int _2200 = _180 + 8;
        uint _2202 = uint(int(uint(_2200) >> uint(2)));
        float _2204 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2202)]);
        int _2206 = _180 + 12;
        uint _2208 = uint(int(uint(_2206) >> uint(2)));
        float _2210 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2208)]);
        uint _2212 = uint(int(uint(_180) >> uint(2)));
        float _2214 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2212)]);
        int _2216 = _180 + 4;
        uint _2218 = uint(int(uint(_2216) >> uint(2)));
        float _2220 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2218)]);
        int _2222 = _180 + 8;
        uint _2224 = uint(int(uint(_2222) >> uint(2)));
        float _2226 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2224)]);
        int _2228 = _180 + 12;
        uint _2230 = uint(int(uint(_2228) >> uint(2)));
        float _2232 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2230)]);
        float _2234 = _1772 * _2176;
        float _2236 = _1772 * _2198;
        float _2238 = _1772 * _2220;
        float _2240 = fma(_1640, _2170, _2234);
        float _2242 = fma(_1640, _2192, _2236);
        float _2244 = fma(_1640, _2214, _2238);
        float _2246 = fma(_1652, _2182, _2240);
        float _2248 = fma(_1652, _2204, _2242);
        float _2250 = fma(_1652, _2226, _2244);
        float _2252 = _2246 + _2188;
        float _2254 = _2248 + _2210;
        float _2256 = _2250 + _2232;
        _2142 = _2188;
        _2144 = _2246;
        _2146 = _2250;
        _2148 = _2252;
        _2150 = _2256;
        _2152 = _2242;
        _2154 = _2210;
        _2156 = _2244;
        _2158 = _2254;
        _2160 = _2248;
        _2162 = _2214;
        _2164 = _2232;
    }
    float _2258 = _2142;
    float _2260 = _2144;
    float _2262 = _2146;
    float _2264 = _2148;
    float _2266 = _2150;
    float _2268 = _2152;
    float _2270 = _2154;
    float _2272 = _2156;
    float _2274 = _2158;
    float _2276 = _2160;
    float _2278 = _2162;
    float _2280 = _2164;
    float _2282 = _1680 + _1894;
    float _2284 = _2264;
    float _2286 = _2266;
    float _2288 = _2264;
    float _2290 = _2266;
    float _2292 = _2262;
    float _2294 = _2276;
    float _2296 = _2278;
    float _2298 = _2260;
    float _2300 = _2258;
    float _2302 = _2274;
    float _2304 = _2274;
    float _2306 = _2268;
    float _2308 = _2270;
    float _2310 = _2272;
    float _2312 = _2280;
    if (!_1892)
    {
        _1428 = 0;
    }
    int _2314 = _1428;
    int _2316 = _2314;
    if (!_1892)
    {
        _1920 = as_type<int>(_1782);
    }
    int _2318 = _1920;
    float _2320 = -_1686;
    bool _2322 = _2282 != _2320;
    bool _2324 = isnan(_2282);
    bool _2326 = _2322 || _2324;
    bool _2328 = isnan(_2320);
    bool _2330 = _2326 || _2328;
    int _2332 = 0;
    bool _2334 = _2330;
    int _2336 = _2318;
    if (!_1892)
    {
        _2332 = as_type<int>(_1788);
    }
    int _2338 = _2332;
    int _2340 = _2330 ? 0 : 1;
    int _2342 = _2338;
    int _2344 = _2340;
    int _2346 = _2340;
    int _2348 = _2338;
    if (!_1892)
    {
        _2166 = as_type<int>(_1794);
    }
    int _2350 = _2166;
    bool _2352 = !_1892;
    int _2354 = _2350;
    if (!_2352)
    {
        uint _2356 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
        float _2358 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2356)]);
        int _2360 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 16;
        uint _2362 = uint(int(uint(_2360) >> uint(2)));
        float _2364 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2362)]);
        int _2366 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 8;
        uint _2368 = uint(int(uint(_2366) >> uint(2)));
        float _2370 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2368)]);
        int _2372 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 24;
        uint _2374 = uint(int(uint(_2372) >> uint(2)));
        float _2376 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2374)]);
        float _2378 = _1802 * 0.5;
        float _2380 = 1.0 / _1802;
        float _2382 = -_2364;
        float _2384 = fma(_2378, _2382, _2358);
        float _2386 = -_2378;
        float _2388 = _2386 + _2384;
        float _2390 = -_2376;
        float _2392 = fma(_2378, _2390, _2370);
        float _2394 = -_2388;
        float _2396 = _2394 + _2264;
        float _2398 = -_2378;
        float _2400 = _2398 + _2392;
        float _2402 = _2396 * _2380;
        float _2404 = -_2400;
        float _2406 = _2404 + _2266;
        float _2408 = floor(_2402);
        float _2410 = _2406 * _2380;
        float _2412 = floor(_2410);
        float _2414 = -_2408;
        float _2416 = fma(_1802, _2414, _2396);
        bool _2418 = _2416 != _2396;
        bool _2420 = isnan(_2416);
        bool _2422 = _2418 || _2420;
        bool _2424 = isnan(_2396);
        bool _2426 = _2422 || _2424;
        float _2428 = -_2412;
        float _2430 = fma(_1802, _2428, _2406);
        bool _2432 = _2430 == _2406;
        bool _2434 = !_2426;
        bool _2436 = _2432 && _2434;
        bool _2438 = !_2436;
        int _2440 = as_type<int>(_2416);
        int _2442 = as_type<int>(_2410);
        _2334 = _2436;
        _2316 = _2438 ? (-1) : 0;
        _2292 = _2430;
        _2294 = _2400;
        _2296 = _2388;
        _2298 = _2408;
        _2300 = _2406;
        if (!_2436)
        {
            float _2444 = _2388 + _2416;
            _2284 = _2444;
        }
        float _2446 = _2284;
        _2288 = _2446;
        if (_2436)
        {
            _2440 = as_type<int>(_1782);
        }
        int _2448 = _2440;
        int _2450 = _2448;
        if (!_2436)
        {
            float _2452 = _2400 + _2430;
            _2286 = _2452;
        }
        float _2454 = _2286;
        _2290 = _2454;
        if (_2436)
        {
            _2342 = as_type<int>(_1788);
        }
        int _2456 = _2342;
        int _2458 = _2456;
        if (_2436)
        {
            _2442 = as_type<int>(_1794);
        }
        int _2460 = _2442;
        _2354 = _2460;
        if (!_2436)
        {
            _2344 = 1;
        }
        int _2462 = _2344;
        _2346 = _2462;
        if (!_2436)
        {
            _2450 = 0;
        }
        int _2464 = _2450;
        _2336 = _2464;
        if (!_2436)
        {
            _2458 = 0;
        }
        int _2466 = _2458;
        _2348 = _2466;
        if (!_2436)
        {
            _2354 = 0;
        }
    }
    int _2468 = _2346;
    bool _2470 = _2334;
    float _2472 = _2288;
    float _2474 = _2290;
    int _2476 = _2316;
    float _2478 = _2292;
    float _2480 = _2294;
    float _2482 = _2296;
    float _2484 = _2298;
    int _2486 = _2336;
    float _2488 = _2300;
    int _2490 = _2348;
    int _2492 = _2354;
    int _2494 = _2468 & 1;
    bool _2496 = _2494 != 0;
    int _2498 = _2468;
    bool _2500 = _2470;
    float _2502 = _2484;
    float _2504 = _2488;
    float _2506 = _2480;
    float _2508 = _2482;
    float _2510 = _2478;
    float _2512 = as_type<float>(_2492);
    float _2514 = as_type<float>(_2486);
    if (!_1454)
    {
        float _2516 = _1594 * 2000.0;
        _1600 = _2516;
    }
    float _2518 = _1600;
    float _2520 = _1688 * 0.5;
    float _2522 = _2518;
    if (_1454)
    {
        _2498 = as_type<int>(_286);
    }
    int _2524 = _2498;
    float _2526 = -_1660;
    float _2528 = _852 + _2526;
    int _2530 = _2524;
    if (!_1454)
    {
        bool _2532 = _1132 >= _2518;
        bool _2534 = isnan(_1132);
        bool _2536 = _2532 || _2534;
        bool _2538 = isnan(_2518);
        bool _2540 = _2536 || _2538;
        _2500 = _2540;
    }
    bool _2542 = _2500;
    float _2544 = precise::max(_2520, 0.001000000047497451305389404296875);
    bool _2546 = _2542;
    if (!_1454)
    {
        int _2548 = _2542 ? as_type<int>(_286) : 0;
        _2530 = _2548;
    }
    int _2550 = _2530;
    float _2552 = precise::min(_2544, 10000.0);
    if (!_2496)
    {
        _2502 = _1668;
    }
    float _2554 = _2502;
    float _2556 = _2554;
    if (!_2496)
    {
        _2504 = _1674;
    }
    float _2558 = _2504;
    float _2560 = _2558;
    if (!_2496)
    {
        _1828 = _1680;
    }
    float _2562 = _1828;
    float _2564 = _2562;
    if (!_2496)
    {
        _1830 = _1686;
    }
    float _2566 = _1830;
    float _2568 = _2566;
    if (!_2496)
    {
        _1832 = _1806;
    }
    float _2570 = _1832;
    float _2572 = _2570;
    if (!_2496)
    {
        _2546 = false;
    }
    bool _2574 = _2546;
    bool _2576 = _2574;
    if (!_2496)
    {
        _1834 = _1812;
    }
    float _2578 = _1834;
    float _2580 = _2578;
    if (!_2496)
    {
        _412 = _1818;
    }
    float _2582 = _412;
    float _2584 = _2582;
    if (!_2496)
    {
        _2522 = _1824;
    }
    float _2586 = _2522;
    int _2588 = 0;
    float _2590 = _2586;
    if (!_2496)
    {
        _2588 = as_type<int>(_1640);
    }
    int _2592 = _2588;
    int _2594 = _2592;
    int _2596 = _2592;
    if (!_2496)
    {
        _858 = as_type<int>(_1772);
    }
    int _2598 = _858;
    int _2600 = 0;
    int _2602 = _2598;
    if (!_2496)
    {
        _2600 = as_type<int>(_1652);
    }
    int _2604 = _2600;
    bool _2606 = !_2496;
    int _2608 = _2604;
    int _2610 = _2604;
    float _2612 = 0.0;
    float _2614 = 0.0;
    float _2616 = 0.0;
    if (!_2606)
    {
        float _2618 = fma(_2472, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
        float _2620 = fma(_2474, 6.2500002968590706586837768554688e-05, 0.5);
        float _2622 = fma(_2472, 6.2500002968590706586837768554688e-05, 0.5);
        float _2624 = fma(_2474, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
        float _2626 = fma(_2472, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
        float _2628 = fma(_2474, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
        float2 _12337 = float2(_2618, _2620);
        float2 _2632 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_12337, float2(0.0), isnan(_12337)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_12337, float2(0.0), isnan(_12337)), level(0.0)).xy;
        float _2634 = _2632.x;
        float _2636 = _2632.y;
        float2 _12349 = float2(_2622, _2620);
        float2 _2638 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_12349, float2(0.0), isnan(_12349)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_12349, float2(0.0), isnan(_12349)), level(0.0)).xy;
        float _2640 = _2638.x;
        float _2642 = _2638.y;
        float _2644 = fma(_2474, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
        float2 _12364 = float2(_2622, _2624);
        float2 _2646 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_12364, float2(0.0), isnan(_12364)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_12364, float2(0.0), isnan(_12364)), level(0.0)).xy;
        float _2648 = _2646.x;
        float _2650 = _2646.y;
        float2 _12376 = float2(_2626, _2628);
        float _2652 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_12376, float2(0.0), isnan(_12376)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_12376, float2(0.0), isnan(_12376)), level(0.0)).x;
        float _2654 = fma(_2472, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
        float2 _12386 = float2(_2626, _2644);
        float _2656 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_12386, float2(0.0), isnan(_12386)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_12386, float2(0.0), isnan(_12386)), level(0.0)).x;
        float2 _12394 = float2(_2654, _2628);
        float _2658 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_12394, float2(0.0), isnan(_12394)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_12394, float2(0.0), isnan(_12394)), level(0.0)).x;
        float2 _12402 = float2(_2654, _2644);
        float _2660 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_12402, float2(0.0), isnan(_12402)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_12402, float2(0.0), isnan(_12402)), level(0.0)).x;
        float _2662 = -_2640;
        float _2664 = _2662 + _2634;
        float _2666 = -_2640;
        float _2668 = _2666 + _2648;
        float _2670 = -_2642;
        float _2672 = _2640 + _2670;
        float _2674 = _2664 * 1000.0;
        float _2676 = _2668 * 1000.0;
        float _2678 = _2672 * 2000.0;
        float _2680 = fma(_2674, _2674, 0.0625);
        float _2682 = fma(_2676, _2676, _2680);
        float _2684 = -_2640;
        float _2686 = _2684 + _2652;
        float _2688 = -_2640;
        float _2690 = _2688 + _2656;
        float _2692 = abs(_2678);
        bool _2694 = _2692 >= 2.0;
        bool _2696 = isnan(_2692);
        bool _2698 = _2694 || _2696;
        bool _2700 = isnan(2.0);
        bool _2702 = _2698 || _2700;
        float _2704 = -_2640;
        float _2706 = _2704 + _2658;
        float _2708 = _2686 * 2000.0;
        float _2710 = rsqrt(_2682);
        float _2712 = _2690 * 2000.0;
        float _2714 = -_2640;
        float _2716 = _2714 + _2660;
        float _2718 = _2706 * 2000.0;
        float _2720 = abs(_2708);
        float _2722 = abs(_2712);
        float _2724 = precise::max(_2720, _2722);
        float _2726 = _2716 * 2000.0;
        float _2728 = abs(_2718);
        float _2730 = precise::max(_2724, _2728);
        float _2732 = abs(_2726);
        float _2734 = precise::max(_2730, _2732);
        float _2736 = _2674 * _2710;
        float _2738 = _2676 * _2710;
        float _2740 = _2710 * 0.25;
        float _2742 = _2642;
        float _2744 = _2654;
        float _2746 = _2708;
        float _2748 = _2674;
        float _2750 = _2644;
        float _2752 = _2690;
        float _2754 = _2738;
        float _2756 = _2718;
        _2508 = _2620;
        _2310 = _2734;
        _2312 = _2740;
        float _2788;
        float _2790;
        float _2792;
        float _2794;
        if (!_2702)
        {
            float _2758 = -_2642;
            float _2760 = _2758 + _2636;
            float _2762 = -_2642;
            float _2764 = _2762 + _2650;
            float _2766 = _2642 * 2000.0;
            float _2768 = _2760 * 1000.0;
            float _2770 = _2764 * 1000.0;
            float _2772 = fma(_2768, _2768, 0.0625);
            float _2774 = fma(_2770, _2770, _2772);
            float _2776 = rsqrt(_2774);
            float _2778 = -_2770;
            float _2780 = fma(_2778, _2776, -0.0);
            float _2782 = -_2768;
            float _2784 = fma(_2782, _2776, -0.0);
            float _2786 = _2776 * 0.25;
            _2788 = _2766;
            _2790 = _2784;
            _2792 = _2780;
            _2794 = _2786;
            _2796 = true;
        }
        else
        {
            float _2798 = _2738 * _2738;
            float _2800 = 1.0 / _2740;
            float _2802 = -_2736;
            float _2804 = (-0.0) + _2802;
            float _2806 = fma(_2736, _2736, _2798);
            float _2808 = sqrt(_2806);
            bool _2810 = _2808 > 9.9999997473787516355514526367188e-05;
            float _2812 = _2808 * _2800;
            float _2814 = _2798;
            _2790 = _2804;
            _2794 = _2740;
            if (_2810)
            {
                float _2816 = abs(_2736);
                float _2818 = abs(_2738);
                float _2820 = precise::max(_2816, _2818);
                _2742 = _2820;
            }
            float _2822 = _2742;
            if (!_2810)
            {
                _2814 = 0.0;
            }
            float _2824 = _2814;
            float _2826 = _2822;
            float _2828 = _2824;
            if (_2810)
            {
                float _2830 = 1.0 / _2822;
                _2826 = _2830;
            }
            float _2832 = _2826;
            if (_2810)
            {
                float _2834 = _2808 * _2832;
                _2828 = _2834;
            }
            float _2836 = _2828;
            bool _2838 = _2734 >= 2.0;
            bool _2840 = isnan(_2734);
            bool _2842 = _2838 || _2840;
            bool _2844 = isnan(2.0);
            bool _2846 = _2842 || _2844;
            float _2848 = _2836 * 0.9649016857147216796875;
            float _2850 = _2848 * _2812;
            bool _2852 = !_2846;
            float _2854 = _2852 ? 0.0 : 1000.0;
            float _2856 = -_2850;
            float _2858 = fma(_2640, 2000.0, _2856);
            float _2860 = -_2854;
            float _2862 = _2858 + _2860;
            float _2864 = -_2738;
            float _2866 = (-0.0) + _2864;
            _2788 = _2862;
            _2792 = _2866;
        }
        _2796 = false;
        float _2868 = _2788;
        float _2870 = _2790;
        float _2872 = _2792;
        float _2874 = _2794;
        float2 _12667 = float2(_2622, _2620);
        float _2876 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_12667, float2(0.0), isnan(_12667)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_12667, float2(0.0), isnan(_12667)), level(0.0)).y;
        float _2878 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[81]);
        bool _2880 = _2274 >= _2868;
        int _2882 = (_2880 ? (-1) : 0) | _2476;
        float _2884 = 0.0 + _2878;
        float _2886 = precise::clamp(_2884, 0.0, 1.0);
        bool _2888 = _1882 >= _2886;
        int _2890 = (_2888 ? (-1) : 0) & _2882;
        int _2892 = ~_2890;
        float _2894 = _2868;
        float _2896 = _2868;
        float _2958;
        float _2960;
        float _2962;
        float _2964;
        float _2966;
        float _2968;
        float _2970;
        float _2972;
        float _2974;
        bool _2976;
        float _2978;
        float _2980;
        float _2982;
        if (!(_2892 != 0))
        {
            float _2898 = _1870 * 6.283185482025146484375;
            float _2900 = _1864 * 6.283185482025146484375;
            float _2902 = _1876 * 6.283185482025146484375;
            if (_2476 != 0)
            {
                float _2904 = fma(_1870, _1802, _2868);
                _2302 = _2904;
            }
            float _2906 = _2302;
            float _2908 = _2898 * _2898;
            float _2910 = fma(_2900, _2900, _2908);
            float _2912 = fma(_2902, _2902, _2910);
            float _2914 = sqrt(_2912);
            float _2916 = rsqrt(_2912);
            float _2918 = _2914 * 0.5;
            bool _2920 = _2914 != 0.0;
            bool _2922 = isnan(_2914);
            bool _2924 = _2920 || _2922;
            bool _2926 = isnan(0.0);
            bool _2928 = _2924 || _2926;
            float _2930 = _2918 * 0.15915493667125701904296875;
            float _2932 = _2930 * 6.283185482025146484375;
            float _2934 = sin(_2932);
            float _2936 = _2900 * _2916;
            float _2938 = _2898 * _2916;
            float _2940 = _2902 * _2916;
            float _2942 = _2928 ? _2936 : 0.0;
            float _2944 = _2930 * 6.283185482025146484375;
            float _2946 = cos(_2944);
            float _2948 = _2928 ? _2938 : 0.0;
            float _2950 = _2928 ? _2940 : 0.0;
            float _2952 = _2942 * _2934;
            float _2954 = _2948 * _2934;
            float _2956 = _2950 * _2934;
            _2958 = _2950;
            _2960 = _2912;
            _2962 = _2930;
            _2964 = _2934;
            _2966 = _2906;
            _2968 = _2906;
            _2970 = _2956;
            _2972 = _2952;
            _2974 = _2946;
            _2976 = _2928;
            _2978 = _2954;
            _2980 = _2914;
            _2982 = 0.0;
            _2984 = true;
        }
        else
        {
            float _2986 = _2870 * _2870;
            float _2988 = fma(_2872, _2872, _2986);
            float _2990 = sqrt(_2988);
            float _2992 = precise::max(_2990, -1.0);
            float _2994 = precise::min(_2992, 1.0);
            float _2996 = abs(_2994);
            float _2998 = fma(_2996, -0.5, 0.5);
            int _3000 = as_type<int>(_2998) + (-218103808);
            bool _3002 = uint(_3000) >= 1920991232u;
            bool _3004 = !_3002;
            int _3026;
            if (!_3004)
            {
                int _3006 = 1056964608;
                int _3008 = as_type<int>(_2736);
                int _3010 = as_type<int>(_2998);
                int _3012 = 10560;
                int _3014;
                int _3016;
                int _3018;
                int _3020;
                int _3022;
                int _3024;
                _87(_3006, _3008, _3010, _3012, _3014, _3016, _3018, _3020, _3022, _3024);
                _3026 = _3018;
                _3028 = true;
            }
            else
            {
                float _3030 = rsqrt(_2998);
                float _3032 = _2998 * _3030;
                float _3034 = _3030 * 0.5;
                float _3036 = -_3032;
                float _3038 = 0.0 + _3036;
                float _3040 = fma(_3034, _3038, 0.5);
                float _3042 = fma(_3032, _3040, _3032);
                float _3044 = -_3042;
                float _3046 = 0.0 + _3044;
                float _3048 = fma(_3042, _3046, _2998);
                float _3050 = fma(_3034, _3048, _3042);
                _3026 = as_type<int>(_3050);
            }
            _3028 = false;
            int _3052 = _3026;
            float _3054 = abs(_2994);
            bool _3056 = _3054 > 0.569999992847442626953125;
            float _3058 = _2990 + 9.9999997473787516355514526367188e-06;
            float _3060 = _1876 * 6.283185482025146484375;
            float _3062 = abs(_2994);
            float _3064 = _3056 ? as_type<float>(_3052) : _3062;
            float _3066 = -_2868;
            float _3068 = fma(_2876, 2000.0, _3066);
            float _3070 = 1.0 / _3058;
            float _3072 = _3060 * _2874;
            float _3074 = _3064 * _3064;
            float _3076 = _3060 * _2870;
            float _3078 = _3060 * _2872;
            float _3080 = _3072 * _3072;
            float _3082 = fma(_3074, 0.0517513789236545562744140625, 0.01816697604954242706298828125);
            float _3084 = fma(_3076, _3076, _3080);
            float _3086 = fma(_3074, _3082, 0.0467568598687648773193359375);
            float _3088 = fma(_3078, _3078, _3084);
            float _3090 = fma(_3074, _3086, 0.074846573173999786376953125);
            float _3092 = _3070 * _2870;
            float _3094 = sqrt(_3088);
            float _3096 = fma(_3074, _3090, 0.166670143604278564453125);
            float _3098 = _3074 * _3096;
            float _3100 = rsqrt(_3088);
            float _3102 = fma(_3064, _3098, _3064);
            float _3104 = _3102;
            _2748 = _3068;
            if (_3056)
            {
                float _3106 = fma(_3102, -2.0, 1.57079637050628662109375);
                _3104 = _3106;
            }
            float _3108 = _3104;
            bool _3110 = _2994 >= 0.0;
            bool _3112 = isnan(_2994);
            bool _3114 = _3110 || _3112;
            bool _3116 = isnan(0.0);
            bool _3118 = _3114 || _3116;
            float _3120 = -_2872;
            float _3122 = _3070 * _3120;
            float _3124 = _3094 * 0.5;
            bool _3126 = _3094 != 0.0;
            bool _3128 = isnan(_3094);
            bool _3130 = _3126 || _3128;
            bool _3132 = isnan(0.0);
            bool _3134 = _3130 || _3132;
            bool _3136 = !_3118;
            float _3138 = -_3108;
            float _3140 = _3136 ? _3138 : _3108;
            float _3142 = _3124 * 0.15915493667125701904296875;
            float _3144 = abs(_3068);
            bool _3146 = _3144 >= 2.0;
            bool _3148 = isnan(_3144);
            bool _3150 = _3146 || _3148;
            bool _3152 = isnan(2.0);
            bool _3154 = _3150 || _3152;
            float _3156 = _3140 * _3092;
            float _3158 = _3140 * _3122;
            float _3160 = _3142 * 6.283185482025146484375;
            float _3162 = sin(_3160);
            float _3164 = _3076 * _3100;
            float _3166 = _3156 * _3156;
            float _3168 = _3078 * _3100;
            float _3170 = _3072 * _3100;
            bool _3172 = _2874 <= 0.891006529331207275390625;
            bool _3174 = !_3154;
            bool _3176 = _3172 || _3174;
            float _3178 = fma(_3158, _3158, _3166);
            float _3180 = _3134 ? _3164 : 0.0;
            float _3182 = _3142 * 6.283185482025146484375;
            float _3184 = cos(_3182);
            float _3186 = _3134 ? _3168 : 0.0;
            float _3188 = _3134 ? _3170 : 0.0;
            float _3190 = sqrt(_3178);
            float _3192 = _3180 * _3162;
            _2746 = _3184;
            _2752 = _3100;
            _2754 = _3142;
            _2756 = _3094;
            _2976 = _3176;
            if (_3176)
            {
                float _3194 = _2868 + (-1000.0);
                _2894 = _3194;
            }
            float _3196 = _2894;
            float _3198 = rsqrt(_3178);
            float _3200 = _3190 * 0.5;
            bool _3202 = _3190 != 0.0;
            bool _3204 = isnan(_3190);
            bool _3206 = _3202 || _3204;
            bool _3208 = isnan(0.0);
            bool _3210 = _3206 || _3208;
            float _3212 = _3186 * _3162;
            float _3214 = _3188 * _3162;
            float _3216 = _3200 * 0.15915493667125701904296875;
            float _3218 = _3216 * 6.283185482025146484375;
            float _3220 = sin(_3218);
            float _3222 = _3158 * _3198;
            float _3224 = _3156 * _3198;
            float _3226 = _3210 ? _3222 : 0.0;
            float _3228 = _3216 * 6.283185482025146484375;
            float _3230 = cos(_3228);
            float _3232 = _3210 ? _3224 : 0.0;
            float _3234 = _3226 * _3220;
            float _3236 = _3232 * _3220;
            float _3238 = _3236 * _3192;
            float _3240 = _3236 * _3212;
            float _3242 = _3230 * _3192;
            float _3244 = _3230 * _3212;
            float _3246 = fma(_3234, _3192, _3240);
            float _3248 = fma(_3234, _3184, _3242);
            float _3250 = fma(_3236, _3184, _3244);
            float _3252 = fma(_3236, _3214, _3248);
            float _3254 = -_3238;
            float _3256 = fma(_3234, _3212, _3254);
            float _3258 = -_3234;
            float _3260 = fma(_3258, _3214, _3250);
            float _3262 = fma(_3230, _3214, _3256);
            float _3264 = -_3246;
            float _3266 = fma(_3230, _3184, _3264);
            _2958 = _3234;
            _2960 = _3212;
            _2962 = _3250;
            _2964 = _3244;
            _2744 = _3246;
            _2750 = _3242;
            _2966 = _3216;
            _2968 = _3196;
            _2970 = _3260;
            _2972 = _3252;
            _2974 = _3266;
            _2896 = _3196;
            _2978 = _3262;
            _2980 = _3256;
            _2982 = 1.0;
        }
        _2984 = false;
        float _3268 = _2958;
        float _3270 = _2960;
        float _3272 = _2962;
        float _3274 = _2964;
        float _3276 = _2744;
        float _3278 = _2746;
        float _3280 = _2748;
        float _3282 = _2750;
        float _3284 = _2966;
        float _3286 = _2752;
        float _3288 = _2754;
        float _3290 = _2756;
        float _3292 = _2968;
        float _3294 = _2970;
        float _3296 = _2972;
        float _3298 = _2974;
        float _3300 = _2896;
        bool _3302 = _2976;
        float _3304 = _2978;
        float _3306 = _2980;
        float _3308 = _2982;
        bool _3310 = !_1696;
        bool _3312 = _3302;
        float _3314 = _3272;
        float _3316 = _3274;
        float _3318 = _3306;
        float _3320 = _3300;
        float _3322 = _3268;
        float _3324 = _3270;
        _2002 = _3276;
        _2004 = _3278;
        _2006 = _3280;
        _2008 = _3282;
        _2304 = _3284;
        _2306 = _3286;
        _2506 = _3288;
        _2308 = _3290;
        _2602 = as_type<int>(_3292);
        _2560 = _3304;
        _2590 = _3308;
        if (!_3310)
        {
            float _3326 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _3328 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _3330 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _3332 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _3334 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[28]);
            float _3336 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[29]);
            float _3338 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[30]);
            float _3340 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[31]);
            float _3342 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _3344 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _3346 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _3348 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _3350 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _3352 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _3354 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _3356 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _3358 = _3332 * _3338;
            float _3360 = _3332 * _3336;
            float _3362 = _3332 * _3334;
            float _3364 = _3348 * _3338;
            float _3366 = _3348 * _3336;
            float _3368 = _3348 * _3334;
            float _3370 = _3348 * _3330;
            float _3372 = _3348 * _3328;
            float _3374 = _3348 * _3326;
            float _3376 = -_3358;
            float _3378 = fma(_3330, _3340, _3376);
            float _3380 = -_3360;
            float _3382 = fma(_3328, _3340, _3380);
            float _3384 = -_3362;
            float _3386 = fma(_3326, _3340, _3384);
            float _3388 = -_3364;
            float _3390 = fma(_3346, _3340, _3388);
            float _3392 = -_3366;
            float _3394 = fma(_3344, _3340, _3392);
            float _3396 = -_3368;
            float _3398 = fma(_3342, _3340, _3396);
            float _3400 = _3330 * _3336;
            float _3402 = _3330 * _3334;
            float _3404 = _3328 * _3334;
            float _3406 = _3346 * _3336;
            float _3408 = -_3370;
            float _3410 = fma(_3346, _3332, _3408);
            float _3412 = -_3372;
            float _3414 = fma(_3344, _3332, _3412);
            float _3416 = -_3374;
            float _3418 = fma(_3342, _3332, _3416);
            float _3420 = _3346 * _3334;
            float _3422 = -_3400;
            float _3424 = fma(_3328, _3338, _3422);
            float _3426 = -_3402;
            float _3428 = fma(_3326, _3338, _3426);
            float _3430 = _3346 * _3328;
            float _3432 = _3346 * _3326;
            float _3434 = -_3404;
            float _3436 = fma(_3326, _3336, _3434);
            float _3438 = -_3406;
            float _3440 = fma(_3344, _3338, _3438);
            float _3442 = _3344 * _3326;
            float _3444 = _3346 * _3386;
            float _3446 = -_3420;
            float _3448 = fma(_3342, _3338, _3446);
            float _3450 = -_3430;
            float _3452 = fma(_3344, _3330, _3450);
            float _3454 = -_3442;
            float _3456 = fma(_3342, _3328, _3454);
            float _3458 = _3346 * _3382;
            float _3460 = -_3444;
            float _3462 = fma(_3342, _3378, _3460);
            float _3464 = _3344 * _3334;
            float _3466 = _3344 * _3386;
            float _3468 = -_3458;
            float _3470 = fma(_3344, _3378, _3468);
            float _3472 = fma(_3348, _3428, _3462);
            float _3474 = -_3464;
            float _3476 = fma(_3342, _3336, _3474);
            float _3478 = -_3466;
            float _3480 = fma(_3342, _3382, _3478);
            float _3482 = _3344 * _3428;
            float _3484 = fma(_3348, _3424, _3470);
            float _3486 = _3352 * _3472;
            float _3488 = -_3432;
            float _3490 = fma(_3342, _3330, _3488);
            float _3492 = _3354 * _3382;
            float _3494 = -_3482;
            float _3496 = fma(_3342, _3424, _3494);
            float _3498 = fma(_3348, _3436, _3480);
            float _3500 = -_3486;
            float _3502 = fma(_3350, _3484, _3500);
            float _3504 = -_3492;
            float _3506 = fma(_3352, _3378, _3504);
            float _3508 = fma(_3346, _3436, _3496);
            float _3510 = _3354 * _3386;
            float _3512 = fma(_3354, _3498, _3502);
            float _3514 = _3352 * _3386;
            float _3516 = _3354 * _3398;
            float _3518 = -_3510;
            float _3520 = fma(_3350, _3378, _3518);
            float _3522 = -_3356;
            float _3524 = fma(_3522, _3508, _3512);
            float _3526 = -_3514;
            float _3528 = fma(_3350, _3382, _3526);
            float _3530 = _3354 * _3394;
            float _3532 = _3352 * _3398;
            float _3534 = 1.0 / _3524;
            float _3536 = fma(_3356, _3424, _3506);
            float _3538 = fma(_3356, _3436, _3528);
            float _3540 = -_3530;
            float _3542 = fma(_3352, _3390, _3540);
            float _3544 = -_3516;
            float _3546 = fma(_3350, _3390, _3544);
            float _3548 = _3354 * _3414;
            float _3550 = _3354 * _3418;
            float _3552 = -_3532;
            float _3554 = fma(_3350, _3394, _3552);
            float _3556 = fma(_3356, _3428, _3520);
            float _3558 = _3352 * _3418;
            float _3560 = fma(_3356, _3440, _3542);
            float _3562 = fma(_3356, _3448, _3546);
            float _3564 = fma(_3356, _3476, _3554);
            float _3566 = -_3548;
            float _3568 = fma(_3352, _3410, _3566);
            float _3570 = -_3550;
            float _3572 = fma(_3350, _3410, _3570);
            float _3574 = -_3558;
            float _3576 = fma(_3350, _3414, _3574);
            float _3578 = _3484 * _3534;
            float _3580 = _3536 * _3534;
            float _3582 = _3472 * _3534;
            float _3584 = _3538 * _3534;
            float _3586 = _3556 * _3534;
            float _3588 = _3498 * _3534;
            float _3590 = _3582 * _2472;
            float _3592 = _3580 * _3292;
            float _3594 = _3584 * _3292;
            float _3596 = _3560 * _3534;
            float _3598 = -_3590;
            float _3600 = fma(_3586, _3292, _3598);
            float _3602 = -_3592;
            float _3604 = fma(_3578, _2472, _3602);
            float _3606 = -_3594;
            float _3608 = fma(_3588, _2472, _3606);
            float _3610 = _3562 * _3534;
            float _3612 = _3564 * _3534;
            float _3614 = fma(_3356, _3452, _3568);
            float _3616 = fma(_3356, _3490, _3572);
            float _3618 = fma(_3356, _3456, _3576);
            float _3620 = fma(_3596, _2474, _3604);
            float _3622 = -_3610;
            float _3624 = fma(_3622, _2474, _3600);
            float _3626 = fma(_3612, _2474, _3608);
            float _3628 = -_3614;
            float _3630 = fma(_3628, _3534, _3620);
            float _3632 = fma(_3616, _3534, _3624);
            float _3634 = -_3618;
            float _3636 = fma(_3634, _3534, _3626);
            _2002 = _3588;
            _2004 = _3550;
            _2006 = _3536;
            _2008 = _3532;
            _2304 = _3596;
            _2306 = _3534;
            _2506 = _3614;
            _2308 = _3348;
            _2508 = _3350;
            _2310 = _3352;
            _2510 = _3612;
            _2312 = _3356;
            _2568 = _3298;
            _2576 = true;
            _2596 = as_type<int>(_3630);
            _2556 = _3296;
            _2564 = _3294;
            _2602 = as_type<int>(_3632);
            _2610 = as_type<int>(_3636);
            _2612 = _3576;
            _2614 = _3414;
            _2616 = _3440;
            _2572 = 0.0;
            _2584 = 0.0;
            _2580 = 0.0;
            _3638 = true;
        }
        else
        {
            bool _3640 = !_1776;
            if (!_3640)
            {
                float _3642 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                uint _3644 = uint(int(uint(_180) >> uint(2)));
                float _3646 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3644)]);
                int _3648 = _180 + 4;
                uint _3650 = uint(int(uint(_3648) >> uint(2)));
                float _3652 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3650)]);
                int _3654 = _180 + 8;
                uint _3656 = uint(int(uint(_3654) >> uint(2)));
                float _3658 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3656)]);
                uint _3660 = uint(int(uint(_180) >> uint(2)));
                float _3662 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3660)]);
                int _3664 = _180 + 4;
                uint _3666 = uint(int(uint(_3664) >> uint(2)));
                float _3668 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3666)]);
                int _3670 = _180 + 8;
                uint _3672 = uint(int(uint(_3670) >> uint(2)));
                float _3674 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3672)]);
                uint _3676 = uint(int(uint(_180) >> uint(2)));
                float _3678 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3676)]);
                int _3680 = _180 + 4;
                uint _3682 = uint(int(uint(_3680) >> uint(2)));
                float _3684 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3682)]);
                int _3686 = _180 + 8;
                uint _3688 = uint(int(uint(_3686) >> uint(2)));
                float _3690 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3688)]);
                float _3692 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _3694 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _3696 = _3658 * _3662;
                float _3698 = _3658 * _3668;
                float _3700 = -_3696;
                float _3702 = fma(_3646, _3674, _3700);
                float _3704 = _3652 * _3662;
                float _3706 = -_3698;
                float _3708 = fma(_3652, _3674, _3706);
                float _3710 = _3684 * _3702;
                float _3712 = -_3704;
                float _3714 = fma(_3646, _3668, _3712);
                float _3716 = -_3710;
                float _3718 = fma(_3678, _3708, _3716);
                float _3720 = fma(_3690, _3714, _3718);
                float _3722 = 1.0 / _3720;
                float _3724 = _3642 * _3668;
                float _3726 = _3642 * _3674;
                float _3728 = _3642 * _3662;
                float _3730 = _3684 * _3674;
                float _3732 = _3690 * _3662;
                float _3734 = -_3724;
                float _3736 = fma(_3652, _3692, _3734);
                float _3738 = -_3726;
                float _3740 = fma(_3658, _3692, _3738);
                float _3742 = -_3728;
                float _3744 = fma(_3646, _3692, _3742);
                float _3746 = _3678 * _3668;
                float _3748 = _3678 * _3658;
                float _3750 = -_3732;
                float _3752 = fma(_3678, _3674, _3750);
                float _3754 = -_3730;
                float _3756 = fma(_3690, _3668, _3754);
                float _3758 = -_3746;
                float _3760 = fma(_3684, _3662, _3758);
                float _3762 = -_3646;
                float _3764 = fma(_3762, _3674, _3696);
                float _3766 = _3690 * _3652;
                float _3768 = _3684 * _3646;
                float _3770 = -_3748;
                float _3772 = fma(_3690, _3646, _3770);
                float _3774 = _3690 * _3736;
                float _3776 = _3756 * _3722;
                float _3778 = _3752 * _3722;
                float _3780 = _3760 * _3722;
                float _3782 = -_3766;
                float _3784 = fma(_3684, _3658, _3782);
                float _3786 = -_3774;
                float _3788 = fma(_3684, _3740, _3786);
                float _3790 = -_3768;
                float _3792 = fma(_3678, _3652, _3790);
                float _3794 = _3776 * _3292;
                float _3796 = _3778 * _3292;
                float _3798 = _3764 * _3722;
                float _3800 = _3708 * _3722;
                float _3802 = _3690 * _3744;
                float _3804 = _3780 * _3292;
                float _3806 = _3714 * _3722;
                float _3808 = _3684 * _3744;
                float _3810 = fma(_3798, _2472, _3796);
                float _3812 = fma(_3800, _2472, _3794);
                float _3814 = -_3802;
                float _3816 = fma(_3678, _3740, _3814);
                float _3818 = fma(_3806, _2472, _3804);
                float _3820 = _3772 * _3722;
                float _3822 = _3784 * _3722;
                float _3824 = _3792 * _3722;
                float _3826 = -_3808;
                float _3828 = fma(_3678, _3736, _3826);
                float _3830 = fma(_3820, _2474, _3810);
                float _3832 = fma(_3822, _2474, _3812);
                float _3834 = fma(_3694, _3702, _3816);
                float _3836 = fma(_3694, _3708, _3788);
                float _3838 = fma(_3824, _2474, _3818);
                float _3840 = fma(_3694, _3714, _3828);
                float _3842 = fma(_3834, _3722, _3830);
                float _3844 = -_3836;
                float _3846 = fma(_3844, _3722, _3832);
                float _3848 = -_3840;
                float _3850 = fma(_3848, _3722, _3838);
                _2002 = _3824;
                _2004 = _3784;
                _2006 = _3674;
                _2008 = _3764;
                _2304 = _3840;
                _2306 = _3684;
                _2506 = _3690;
                _2308 = _3838;
                _2508 = _3702;
                _2310 = _3832;
                _2312 = _3772;
                _2568 = _3298;
                _2576 = true;
                _2596 = as_type<int>(_3846);
                _2556 = _3296;
                _2564 = _3294;
                _2602 = as_type<int>(_3842);
                _2610 = as_type<int>(_3850);
                _2612 = 0.0;
                _2614 = 0.0;
                _2616 = _3792;
                _2572 = 0.0;
                _2584 = 0.0;
                _2580 = 0.0;
                _3638 = true;
            }
            else
            {
                if (!_1860)
                {
                    _3312 = true;
                }
                bool _3852 = _3312;
                _2576 = _3852;
                if (!_1860)
                {
                    _3314 = 0.0;
                    _3316 = 0.0;
                }
                float _3854 = _3314;
                float _3856 = _3316;
                _2572 = _3854;
                _2580 = _3856;
                if (!_1860)
                {
                    _3318 = 0.0;
                }
                float _3858 = _3318;
                _2584 = _3858;
                if (!_1860)
                {
                    _3320 = _3296;
                }
                float _3860 = _3320;
                _2556 = _3860;
                if (!_1860)
                {
                    _3322 = _3294;
                }
                float _3862 = _3322;
                _2564 = _3862;
                if (!_1860)
                {
                    _3324 = _3298;
                }
                float _3864 = _3324;
                _2568 = _3864;
                if (!_1860)
                {
                    _2594 = as_type<int>(_2472);
                }
                int _3866 = _2594;
                _2596 = _3866;
                if (!_1860)
                {
                    _2608 = as_type<int>(_2474);
                }
                int _3868 = _2608;
                bool _3870 = !_1860;
                _2610 = _3868;
                _2612 = 0.0;
                _2614 = 0.0;
                _2616 = 0.0;
                if (!_3870)
                {
                    uint _3872 = uint(int(uint(_180) >> uint(2)));
                    float _3874 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3872)]);
                    int _3876 = _180 + 4;
                    uint _3878 = uint(int(uint(_3876) >> uint(2)));
                    float _3880 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3878)]);
                    int _3882 = _180 + 8;
                    uint _3884 = uint(int(uint(_3882) >> uint(2)));
                    float _3886 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3884)]);
                    int _3888 = _180 + 12;
                    uint _3890 = uint(int(uint(_3888) >> uint(2)));
                    float _3892 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3890)]);
                    uint _3894 = uint(int(uint(_180) >> uint(2)));
                    float _3896 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3894)]);
                    int _3898 = _180 + 4;
                    uint _3900 = uint(int(uint(_3898) >> uint(2)));
                    float _3902 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3900)]);
                    int _3904 = _180 + 8;
                    uint _3906 = uint(int(uint(_3904) >> uint(2)));
                    float _3908 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3906)]);
                    int _3910 = _180 + 12;
                    uint _3912 = uint(int(uint(_3910) >> uint(2)));
                    float _3914 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3912)]);
                    uint _3916 = uint(int(uint(_180) >> uint(2)));
                    float _3918 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3916)]);
                    int _3920 = _180 + 4;
                    uint _3922 = uint(int(uint(_3920) >> uint(2)));
                    float _3924 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3922)]);
                    int _3926 = _180 + 8;
                    uint _3928 = uint(int(uint(_3926) >> uint(2)));
                    float _3930 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3928)]);
                    int _3932 = _180 + 12;
                    uint _3934 = uint(int(uint(_3932) >> uint(2)));
                    float _3936 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3934)]);
                    float _3938 = _3886 * _3896;
                    float _3940 = _3886 * _3902;
                    float _3942 = _3880 * _3896;
                    float _3944 = _3902 * _3892;
                    float _3946 = -_3938;
                    float _3948 = fma(_3874, _3908, _3946);
                    float _3950 = -_3940;
                    float _3952 = fma(_3880, _3908, _3950);
                    float _3954 = -_3942;
                    float _3956 = fma(_3874, _3902, _3954);
                    float _3958 = _3924 * _3908;
                    float _3960 = _3924 * _3948;
                    float _3962 = _3908 * _3892;
                    float _3964 = _3896 * _3892;
                    float _3966 = -_3944;
                    float _3968 = fma(_3880, _3914, _3966);
                    float _3970 = -_3960;
                    float _3972 = fma(_3918, _3952, _3970);
                    float _3974 = -_3958;
                    float _3976 = fma(_3930, _3902, _3974);
                    float _3978 = _3918 * _3902;
                    float _3980 = _3930 * _3880;
                    float _3982 = fma(_3930, _3956, _3972);
                    float _3984 = _3918 * _3886;
                    float _3986 = -_3962;
                    float _3988 = fma(_3886, _3914, _3986);
                    float _3990 = -_3964;
                    float _3992 = fma(_3874, _3914, _3990);
                    float _3994 = _3930 * _3896;
                    float _3996 = -_3978;
                    float _3998 = fma(_3924, _3896, _3996);
                    float _4000 = 1.0 / _3982;
                    float _4002 = -_3980;
                    float _4004 = fma(_3924, _3886, _4002);
                    float _4006 = -_3874;
                    float _4008 = fma(_4006, _3908, _3938);
                    float _4010 = -_3984;
                    float _4012 = fma(_3930, _3874, _4010);
                    float _4014 = _3924 * _3874;
                    float _4016 = _3924 * _3992;
                    float _4018 = -_3994;
                    float _4020 = fma(_3918, _3908, _4018);
                    float _4022 = _3930 * _3968;
                    float _4024 = -_4014;
                    float _4026 = fma(_3918, _3880, _4024);
                    float _4028 = -_4016;
                    float _4030 = fma(_3918, _3968, _4028);
                    float _4032 = _3930 * _3992;
                    float _4034 = -_4022;
                    float _4036 = fma(_3924, _3988, _4034);
                    float _4038 = fma(_3956, _3936, _4030);
                    float _4040 = -_4032;
                    float _4042 = fma(_3918, _3988, _4040);
                    float _4044 = fma(_3952, _3936, _4036);
                    float _4046 = _3976 * _4000;
                    float _4048 = _4020 * _4000;
                    float _4050 = _3998 * _4000;
                    float _4052 = _4008 * _4000;
                    float _4054 = _4046 * _3292;
                    float _4056 = _4048 * _3292;
                    float _4058 = _4050 * _3292;
                    float _4060 = _3952 * _4000;
                    float _4062 = _3956 * _4000;
                    float _4064 = fma(_4052, _2472, _4056);
                    float _4066 = _4012 * _4000;
                    float _4068 = fma(_4060, _2472, _4054);
                    float _4070 = fma(_4062, _2472, _4058);
                    float _4072 = _4004 * _4000;
                    float _4074 = _4026 * _4000;
                    float _4076 = fma(_3948, _3936, _4042);
                    float _4078 = fma(_4066, _2474, _4064);
                    float _4080 = fma(_4072, _2474, _4068);
                    float _4082 = fma(_4074, _2474, _4070);
                    float _4084 = fma(_4076, _4000, _4078);
                    float _4086 = -_4044;
                    float _4088 = fma(_4086, _4000, _4080);
                    float _4090 = -_4038;
                    float _4092 = fma(_4090, _4000, _4082);
                    _2002 = _4072;
                    _2004 = _4082;
                    _2006 = _4020;
                    _2008 = _3994;
                    _2304 = _3918;
                    _2306 = _3924;
                    _2506 = _4076;
                    _2308 = _3936;
                    _2508 = _4052;
                    _2310 = _3988;
                    _2510 = _4066;
                    _2312 = _3992;
                    _2568 = _3298;
                    _2576 = true;
                    _2596 = as_type<int>(_4088);
                    _2556 = _3296;
                    _2564 = _3294;
                    _2602 = as_type<int>(_4084);
                    _2610 = as_type<int>(_4092);
                    _2612 = 0.0;
                    _2614 = 0.0;
                    _2616 = _3984;
                    _2572 = 0.0;
                    _2584 = 0.0;
                    _2580 = 0.0;
                }
            }
        }
    }
    _3638 = false;
    float _4094 = _2002;
    float _4096 = _2004;
    float _4098 = _2006;
    float _4100 = _2008;
    float _4102 = _2304;
    float _4104 = _2306;
    float _4106 = _2506;
    float _4108 = _2308;
    float _4110 = _2508;
    float _4112 = _2310;
    float _4114 = _2510;
    float _4116 = _2312;
    float _4118 = _2568;
    bool _4120 = _2576;
    int _4122 = _2596;
    float _4124 = _2556;
    float _4126 = _2564;
    int _4128 = _2602;
    float _4130 = _2560;
    int _4132 = _2610;
    float _4134 = _2612;
    float _4136 = _2614;
    float _4138 = _2616;
    float _4140 = _2572;
    float _4142 = _2584;
    float _4144 = _2580;
    float _4146 = _2590;
    float _4148 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _4150 = _4094;
    float _4152 = _4096;
    float _4154 = _4098;
    float _4156 = _4100;
    float _4158 = _4134;
    float _4160 = _4138;
    float _4162 = _4136;
    float _4164 = _4144;
    float _4166 = _4140;
    if (_1696)
    {
        float _4168 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _4170 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _4172 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _4174 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _4150 = _4168;
        _4152 = _4170;
        _4154 = _4172;
        _4156 = _4174;
    }
    float _4176 = _4150;
    float _4178 = _4152;
    float _4180 = _4154;
    float _4182 = _4156;
    float _4184 = _4102;
    float _4186 = _4104;
    float _4188 = _4106;
    float _4190 = _4108;
    if (_1696)
    {
        float _4192 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _4194 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _4196 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _4198 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _4184 = _4192;
        _4186 = _4194;
        _4188 = _4196;
        _4190 = _4198;
    }
    float _4200 = _4184;
    float _4202 = _4186;
    float _4204 = _4188;
    float _4206 = _4190;
    float _4208 = _4110;
    float _4210 = _4112;
    float _4212 = _4114;
    float _4214 = _4116;
    if (_1696)
    {
        float _4216 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _4218 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _4220 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _4222 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _4208 = _4216;
        _4210 = _4218;
        _4212 = _4220;
        _4214 = _4222;
    }
    float _4224 = _4208;
    float _4226 = _4210;
    float _4228 = _4212;
    float _4230 = _4214;
    float _4232 = _4118 * 2.0;
    float _4234 = _4120 ? as_type<float>(_4122) : _1640;
    float _4236 = _4124 * _4124;
    float _4238 = _4236 * 2.0;
    float _4240 = _4120 ? as_type<float>(_4122) : _854;
    float _4242 = _4232 * _4126;
    float _4244 = _4120 ? as_type<float>(_2486) : _1782;
    float _4246 = _4124 * 2.0;
    float _4248 = _4120 ? as_type<float>(_4128) : _1772;
    float _4250 = _4120 ? as_type<float>(_4128) : _2528;
    float _4252 = fma(_4246, _4130, _4242);
    float _4254 = _4120 ? as_type<float>(_2490) : _1788;
    float _4256 = -_4242;
    float _4258 = fma(_4246, _4130, _4256);
    float _4260 = _4120 ? as_type<float>(_4132) : _1652;
    float _4262 = _4232 * _4130;
    float _4264 = _4120 ? as_type<float>(_4132) : _856;
    float _4266 = _4126 * 2.0;
    float _4268 = _4120 ? as_type<float>(_2492) : _1794;
    float _4270 = _4130 * 2.0;
    float _4272 = _4120 ? as_type<float>(_2490) : _376;
    float _4274 = -_4262;
    float _4276 = fma(_4266, _4124, _4274);
    float _4278 = _4232 * _4124;
    float _4280 = fma(_4266, _4124, _4262);
    float _4282 = _4120 ? as_type<float>(_2492) : _382;
    float _4284 = fma(_4270, _4126, _4278);
    float _4286 = -_4278;
    float _4288 = fma(_4270, _4126, _4286);
    float _4290 = -_4238;
    float _4292 = _4290 + 1.0;
    float _4294 = _4120 ? as_type<float>(_2486) : _380;
    float _4296 = fma(_4254, _4148, _4248);
    float _4298 = fma(_4268, _4148, _4260);
    float _4300 = fma(_4244, _4148, _4234);
    float _4302 = _4262;
    float _4304 = _4268;
    float _4306 = _4176;
    float _4308 = _4292;
    float _4310 = _4244;
    float _4312 = _4234;
    float _4314 = _4178;
    float _4316 = _4180;
    float _4318 = _4182;
    float _4320 = _4282;
    float _4322 = _4240;
    float _4324 = _4264;
    float _4326 = _4280;
    if (_1696)
    {
        float _4328 = _4296 * _4178;
        _4302 = _4328;
    }
    float _4330 = _4302;
    float _4332 = _4226;
    float _4334 = _4204;
    float _4336 = _4228;
    float _4338 = _4202;
    float _4340 = _4206;
    if (_1696)
    {
        float _4342 = _4296 * _4202;
        _4304 = _4342;
    }
    float _4344 = _4304;
    if (_1696)
    {
        float _4346 = fma(_4300, _4176, _4330);
        _4306 = _4346;
    }
    float _4348 = _4306;
    float _4350 = _4130 * _4130;
    float _4352 = _4348;
    float _4354 = _4350;
    if (_1696)
    {
        float _4356 = _4296 * _4226;
        _4332 = _4356;
    }
    float _4358 = _4332;
    float _4360 = _4358;
    if (_1696)
    {
        float _4362 = fma(_4300, _4200, _4344);
        _2512 = _4362;
    }
    float _4364 = _2512;
    float _4366 = _4126 * _4126;
    float _4368 = fma(_4350, -2.0, 1.0);
    float _4370 = _4366;
    float _4372 = _4364;
    if (_1696)
    {
        float _4374 = fma(_4300, _4224, _4358);
        _4360 = _4374;
    }
    float _4376 = _4360;
    float _4378 = _4376;
    if (_1696)
    {
        float _4380 = fma(_4298, _4180, _4348);
        _4352 = _4380;
    }
    float _4382 = _4352;
    float _4384 = _4382;
    if (_1696)
    {
        float _4386 = fma(_4298, _4204, _4364);
        _4334 = _4386;
    }
    float _4388 = _4334;
    float _4390 = fma(_4366, -2.0, 1.0);
    if (_1696)
    {
        float _4392 = fma(_4298, _4228, _4376);
        _4336 = _4392;
    }
    float _4394 = _4336;
    float _4396 = fma(_4350, -2.0, _4292);
    float _4398 = fma(_4366, -2.0, _4368);
    if (_1696)
    {
        float _4400 = _4382 + _4182;
        _4158 = _4400;
    }
    float _4402 = _4158;
    float _4404 = _4402;
    float _4406 = _4402;
    if (_1696)
    {
        float _4408 = _4388 + _4206;
        _4160 = _4408;
    }
    float _4410 = _4160;
    float _4412 = _4410;
    float _4414 = _4410;
    if (_1696)
    {
        float _4416 = _4394 + _4230;
        _4162 = _4416;
    }
    float _4418 = _4162;
    float _4420 = -_4238;
    float _4422 = _4420 + _4390;
    float _4424 = _4418;
    float _4426 = _4418;
    if (!_1696)
    {
        bool _4428 = !_1776;
        if (!_4428)
        {
            float _4430 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            uint _4432 = uint(int(uint(_180) >> uint(2)));
            float _4434 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4432)]);
            int _4436 = _180 + 4;
            uint _4438 = uint(int(uint(_4436) >> uint(2)));
            float _4440 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4438)]);
            int _4442 = _180 + 8;
            uint _4444 = uint(int(uint(_4442) >> uint(2)));
            float _4446 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4444)]);
            int _4448 = _180 + 12;
            uint _4450 = uint(int(uint(_4448) >> uint(2)));
            float _4452 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4450)]);
            uint _4454 = uint(int(uint(_180) >> uint(2)));
            float _4456 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4454)]);
            int _4458 = _180 + 4;
            uint _4460 = uint(int(uint(_4458) >> uint(2)));
            float _4462 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4460)]);
            int _4464 = _180 + 8;
            uint _4466 = uint(int(uint(_4464) >> uint(2)));
            float _4468 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4466)]);
            int _4470 = _180 + 12;
            uint _4472 = uint(int(uint(_4470) >> uint(2)));
            float _4474 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4472)]);
            uint _4476 = uint(int(uint(_180) >> uint(2)));
            float _4478 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4476)]);
            int _4480 = _180 + 4;
            uint _4482 = uint(int(uint(_4480) >> uint(2)));
            float _4484 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4482)]);
            int _4486 = _180 + 8;
            uint _4488 = uint(int(uint(_4486) >> uint(2)));
            float _4490 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4488)]);
            int _4492 = _180 + 12;
            uint _4494 = uint(int(uint(_4492) >> uint(2)));
            float _4496 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4494)]);
            float _4498 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _4500 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _4502 = _4440 * _4296;
            float _4504 = _4462 * _4296;
            float _4506 = _4484 * _4296;
            float _4508 = fma(_4434, _4300, _4502);
            float _4510 = fma(_4456, _4300, _4504);
            float _4512 = fma(_4478, _4300, _4506);
            float _4514 = fma(_4446, _4298, _4508);
            float _4516 = fma(_4468, _4298, _4510);
            float _4518 = fma(_4490, _4298, _4512);
            float _4520 = _4430 + _4514;
            float _4522 = _4498 + _4516;
            float _4524 = _4500 + _4518;
            _4354 = _4434;
            _4308 = _4514;
            _4370 = _4446;
            _4372 = _4452;
            _4310 = _4456;
            _2514 = _4516;
            _1836 = _4468;
            _4312 = _4474;
            _4384 = _4478;
            _4314 = _4518;
            _4316 = _4490;
            _4318 = _4496;
            _4406 = _4520;
            _4426 = _4524;
            _4414 = _4522;
            _4526 = true;
        }
        else
        {
            if (!_1860)
            {
                _4404 = _4300;
            }
            float _4528 = _4404;
            _4406 = _4528;
            if (!_1860)
            {
                _4412 = _4296;
            }
            float _4530 = _4412;
            _4414 = _4530;
            if (!_1860)
            {
                _4424 = _4298;
            }
            float _4532 = _4424;
            bool _4534 = !_1860;
            _4426 = _4532;
            if (!_4534)
            {
                uint _4536 = uint(int(uint(_180) >> uint(2)));
                float _4538 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4536)]);
                int _4540 = _180 + 4;
                uint _4542 = uint(int(uint(_4540) >> uint(2)));
                float _4544 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4542)]);
                int _4546 = _180 + 8;
                uint _4548 = uint(int(uint(_4546) >> uint(2)));
                float _4550 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4548)]);
                int _4552 = _180 + 12;
                uint _4554 = uint(int(uint(_4552) >> uint(2)));
                float _4556 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4554)]);
                uint _4558 = uint(int(uint(_180) >> uint(2)));
                float _4560 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4558)]);
                int _4562 = _180 + 4;
                uint _4564 = uint(int(uint(_4562) >> uint(2)));
                float _4566 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4564)]);
                int _4568 = _180 + 8;
                uint _4570 = uint(int(uint(_4568) >> uint(2)));
                float _4572 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4570)]);
                int _4574 = _180 + 12;
                uint _4576 = uint(int(uint(_4574) >> uint(2)));
                float _4578 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4576)]);
                uint _4580 = uint(int(uint(_180) >> uint(2)));
                float _4582 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4580)]);
                int _4584 = _180 + 4;
                uint _4586 = uint(int(uint(_4584) >> uint(2)));
                float _4588 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4586)]);
                int _4590 = _180 + 8;
                uint _4592 = uint(int(uint(_4590) >> uint(2)));
                float _4594 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4592)]);
                int _4596 = _180 + 12;
                uint _4598 = uint(int(uint(_4596) >> uint(2)));
                float _4600 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4598)]);
                float _4602 = _4544 * _4296;
                float _4604 = _4566 * _4296;
                float _4606 = _4588 * _4296;
                float _4608 = fma(_4538, _4300, _4602);
                float _4610 = fma(_4560, _4300, _4604);
                float _4612 = fma(_4582, _4300, _4606);
                float _4614 = fma(_4550, _4298, _4608);
                float _4616 = fma(_4572, _4298, _4610);
                float _4618 = fma(_4594, _4298, _4612);
                float _4620 = _4614 + _4556;
                float _4622 = _4616 + _4578;
                float _4624 = _4618 + _4600;
                _4354 = _4538;
                _4308 = _4608;
                _4370 = _4614;
                _4372 = _4556;
                _4310 = _4560;
                _2514 = _4610;
                _1836 = _4616;
                _4312 = _4578;
                _4384 = _4582;
                _4314 = _4612;
                _4316 = _4618;
                _4318 = _4600;
                _4406 = _4620;
                _4426 = _4624;
                _4414 = _4622;
            }
        }
    }
    _4526 = false;
    float _4626 = _4354;
    float _4628 = _4308;
    float _4630 = _4370;
    float _4632 = _4372;
    float _4634 = _4310;
    float _4636 = _2514;
    float _4638 = _1836;
    float _4640 = _4312;
    float _4642 = _4384;
    float _4644 = _4314;
    float _4646 = _4316;
    float _4648 = _4318;
    float _4650 = _4406;
    float _4652 = _4426;
    float _4654 = _4414;
    float _4656 = _4626;
    float _4658 = _4628;
    float _4660 = _4630;
    float _4662 = _4632;
    if (_1696)
    {
        float _4664 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _4666 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _4668 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _4670 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _4656 = _4664;
        _4658 = _4666;
        _4660 = _4668;
        _4662 = _4670;
    }
    float _4672 = _4656;
    float _4674 = _4658;
    float _4676 = _4660;
    float _4678 = _4662;
    float _4680 = _4634;
    float _4682 = _4636;
    float _4684 = _4638;
    float _4686 = _4640;
    if (_1696)
    {
        float _4688 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _4690 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _4692 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _4694 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _4680 = _4688;
        _4682 = _4690;
        _4684 = _4692;
        _4686 = _4694;
    }
    float _4696 = _4680;
    float _4698 = _4682;
    float _4700 = _4684;
    float _4702 = _4686;
    float _4704 = _4642;
    float _4706 = _4644;
    float _4708 = _4646;
    float _4710 = _4648;
    if (_1696)
    {
        float _4712 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _4714 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _4716 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _4718 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _4704 = _4712;
        _4706 = _4714;
        _4708 = _4716;
        _4710 = _4718;
    }
    float _4720 = _4704;
    float _4722 = _4706;
    float _4724 = _4708;
    float _4726 = _4710;
    float _4728 = _4272 * 59.999996185302734375;
    float _4730 = _4294 * 59.999996185302734375;
    float _4732 = _4282 * 59.999996185302734375;
    float _4734 = _4678;
    float _4736 = _4674;
    float _4738 = _4676;
    float _4740 = _4672;
    if (_1696)
    {
        float _4742 = _4728 * _4674;
        _4734 = _4742;
    }
    float _4744 = _4734;
    float _4746 = _4702;
    float _4748 = _4744;
    float _4750 = _4698;
    float _4752 = _4700;
    if (_1696)
    {
        float _4754 = _4728 * _4698;
        _4746 = _4754;
    }
    float _4756 = _4746;
    float _4758 = _4756;
    if (_1696)
    {
        float _4760 = fma(_4730, _4672, _4744);
        _4748 = _4760;
    }
    float _4762 = _4748;
    float _4764 = _4726;
    float _4766 = _4762;
    float _4768 = _4722;
    float _4770 = _4724;
    if (_1696)
    {
        float _4772 = _4728 * _4722;
        _4764 = _4772;
    }
    float _4774 = _4764;
    float _4776 = _4774;
    if (_1696)
    {
        float _4778 = fma(_4730, _4696, _4756);
        _4758 = _4778;
    }
    float _4780 = _4758;
    float _4782 = _4780;
    if (_1696)
    {
        float _4784 = fma(_4732, _4676, _4762);
        _4766 = _4784;
    }
    float _4786 = _4766;
    float _4788 = _4786;
    float _4790 = _4786;
    if (_1696)
    {
        float _4792 = fma(_4730, _4720, _4774);
        _4776 = _4792;
    }
    float _4794 = _4776;
    float _4796 = _4794;
    if (_1696)
    {
        float _4798 = fma(_4732, _4700, _4780);
        _4782 = _4798;
    }
    float _4800 = _4782;
    float _4802 = _4800;
    float _4804 = _4800;
    if (_1696)
    {
        float _4806 = fma(_4732, _4724, _4794);
        _4796 = _4806;
    }
    float _4808 = _4796;
    float _4810 = _4808;
    float _4812 = _4808;
    if (!_1696)
    {
        bool _4814 = !_1776;
        if (!_4814)
        {
            uint _4816 = uint(int(uint(_180) >> uint(2)));
            float _4818 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4816)]);
            int _4820 = _180 + 4;
            uint _4822 = uint(int(uint(_4820) >> uint(2)));
            float _4824 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4822)]);
            int _4826 = _180 + 8;
            uint _4828 = uint(int(uint(_4826) >> uint(2)));
            float _4830 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4828)]);
            int _4832 = _180 + 12;
            uint _4834 = uint(int(uint(_4832) >> uint(2)));
            float _4836 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4834)]);
            uint _4838 = uint(int(uint(_180) >> uint(2)));
            float _4840 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4838)]);
            int _4842 = _180 + 4;
            uint _4844 = uint(int(uint(_4842) >> uint(2)));
            float _4846 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4844)]);
            int _4848 = _180 + 8;
            uint _4850 = uint(int(uint(_4848) >> uint(2)));
            float _4852 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4850)]);
            uint _4854 = uint(int(uint(_180) >> uint(2)));
            float _4856 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4854)]);
            int _4858 = _180 + 4;
            uint _4860 = uint(int(uint(_4858) >> uint(2)));
            float _4862 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4860)]);
            int _4864 = _180 + 8;
            uint _4866 = uint(int(uint(_4864) >> uint(2)));
            float _4868 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4866)]);
            float _4870 = _4824 * _4728;
            float _4872 = _4846 * _4728;
            float _4874 = _4862 * _4728;
            float _4876 = fma(_4818, _4730, _4870);
            float _4878 = fma(_4840, _4730, _4872);
            float _4880 = fma(_4856, _4730, _4874);
            float _4882 = fma(_4830, _4732, _4876);
            float _4884 = fma(_4852, _4732, _4878);
            float _4886 = fma(_4868, _4732, _4880);
            _4338 = _4876;
            _4340 = _4836;
            _4378 = _4878;
            _4320 = _4868;
            _4804 = _4884;
            _4790 = _4882;
            _4812 = _4886;
            _4888 = true;
        }
        else
        {
            if (!_1860)
            {
                _4788 = _4730;
            }
            float _4890 = _4788;
            _4790 = _4890;
            if (!_1860)
            {
                _4802 = _4728;
            }
            float _4892 = _4802;
            _4804 = _4892;
            if (!_1860)
            {
                _4810 = _4732;
            }
            float _4894 = _4810;
            bool _4896 = !_1860;
            _4812 = _4894;
            if (!_4896)
            {
                uint _4898 = uint(int(uint(_180) >> uint(2)));
                float _4900 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4898)]);
                int _4902 = _180 + 4;
                uint _4904 = uint(int(uint(_4902) >> uint(2)));
                float _4906 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4904)]);
                int _4908 = _180 + 8;
                uint _4910 = uint(int(uint(_4908) >> uint(2)));
                float _4912 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4910)]);
                int _4914 = _180 + 12;
                uint _4916 = uint(int(uint(_4914) >> uint(2)));
                float _4918 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4916)]);
                uint _4920 = uint(int(uint(_180) >> uint(2)));
                float _4922 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4920)]);
                int _4924 = _180 + 4;
                uint _4926 = uint(int(uint(_4924) >> uint(2)));
                float _4928 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4926)]);
                int _4930 = _180 + 8;
                uint _4932 = uint(int(uint(_4930) >> uint(2)));
                float _4934 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4932)]);
                uint _4936 = uint(int(uint(_180) >> uint(2)));
                float _4938 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4936)]);
                int _4940 = _180 + 4;
                uint _4942 = uint(int(uint(_4940) >> uint(2)));
                float _4944 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4942)]);
                int _4946 = _180 + 8;
                uint _4948 = uint(int(uint(_4946) >> uint(2)));
                float _4950 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4948)]);
                float _4952 = _4906 * _4728;
                float _4954 = _4928 * _4728;
                float _4956 = _4944 * _4728;
                float _4958 = fma(_4900, _4730, _4952);
                float _4960 = fma(_4922, _4730, _4954);
                float _4962 = fma(_4938, _4730, _4956);
                float _4964 = fma(_4912, _4732, _4958);
                float _4966 = fma(_4934, _4732, _4960);
                float _4968 = fma(_4950, _4732, _4962);
                _4338 = _4958;
                _4340 = _4918;
                _4378 = _4960;
                _4320 = _4950;
                _4804 = _4966;
                _4790 = _4964;
                _4812 = _4968;
            }
        }
    }
    _4888 = false;
    float _4970 = _4338;
    float _4972 = _4340;
    float _4974 = _4378;
    float _4976 = _4320;
    float _4978 = _4804;
    float _4980 = _4790;
    float _4982 = _4812;
    float _4984 = -_4296;
    float _4986 = _4984 + _4250;
    float _4988 = -_4300;
    float _4990 = _4988 + _4240;
    float _4992 = -_4298;
    float _4994 = _4992 + _4264;
    float _4996 = _4970;
    float _4998 = _4972;
    float _5000 = _4974;
    float _5002 = _4976;
    float _5004 = _4980;
    float _5006 = _4978;
    float _5008 = _4982;
    if (_1696)
    {
        float _5010 = _4986 * _4674;
        _4996 = _5010;
    }
    float _5012 = _4996;
    float _5014 = _5012;
    if (_1696)
    {
        float _5016 = _4986 * _4698;
        _4998 = _5016;
    }
    float _5018 = _4998;
    float _5020 = _5018;
    if (_1696)
    {
        float _5022 = _4986 * _4722;
        _5000 = _5022;
    }
    float _5024 = _5000;
    float _5026 = _5024;
    if (_1696)
    {
        float _5028 = fma(_4990, _4672, _5012);
        _5014 = _5028;
    }
    float _5030 = _5014;
    if (_1696)
    {
        float _5032 = fma(_4990, _4696, _5018);
        _5020 = _5032;
    }
    float _5034 = _5020;
    if (_1696)
    {
        float _5036 = fma(_4990, _4720, _5024);
        _5026 = _5036;
    }
    float _5038 = _5026;
    if (_1696)
    {
        float _5040 = fma(_4994, _4676, _5030);
        _4322 = _5040;
    }
    float _5042 = _4322;
    float _5044 = _5042;
    float _5046 = _5042;
    if (_1696)
    {
        float _5048 = fma(_4994, _4700, _5034);
        _4324 = _5048;
    }
    float _5050 = _4324;
    float _5052 = _5050;
    float _5054 = _5050;
    if (_1696)
    {
        float _5056 = fma(_4994, _4724, _5038);
        _5002 = _5056;
    }
    float _5058 = _5002;
    float _5060 = _5058;
    float _5062 = _5058;
    if (!_1696)
    {
        bool _5064 = !_1776;
        if (!_5064)
        {
            uint _5066 = uint(int(uint(_180) >> uint(2)));
            float _5068 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5066)]);
            int _5070 = _180 + 4;
            uint _5072 = uint(int(uint(_5070) >> uint(2)));
            float _5074 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5072)]);
            int _5076 = _180 + 8;
            uint _5078 = uint(int(uint(_5076) >> uint(2)));
            float _5080 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5078)]);
            uint _5082 = uint(int(uint(_180) >> uint(2)));
            float _5084 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5082)]);
            int _5086 = _180 + 4;
            uint _5088 = uint(int(uint(_5086) >> uint(2)));
            float _5090 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5088)]);
            int _5092 = _180 + 8;
            uint _5094 = uint(int(uint(_5092) >> uint(2)));
            float _5096 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5094)]);
            uint _5098 = uint(int(uint(_180) >> uint(2)));
            float _5100 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5098)]);
            int _5102 = _180 + 4;
            uint _5104 = uint(int(uint(_5102) >> uint(2)));
            float _5106 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5104)]);
            int _5108 = _180 + 8;
            uint _5110 = uint(int(uint(_5108) >> uint(2)));
            float _5112 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5110)]);
            float _5114 = _5074 * _4986;
            float _5116 = _5090 * _4986;
            float _5118 = _5106 * _4986;
            float _5120 = fma(_5068, _4990, _5114);
            float _5122 = fma(_5084, _4990, _5116);
            float _5124 = fma(_5100, _4990, _5118);
            float _5126 = fma(_5080, _4994, _5120);
            float _5128 = fma(_5096, _4994, _5122);
            float _5130 = fma(_5112, _4994, _5124);
            _5046 = _5126;
            _5054 = _5128;
            _5062 = _5130;
            _5132 = true;
        }
        else
        {
            if (!_1860)
            {
                _5044 = _4990;
            }
            float _5134 = _5044;
            _5046 = _5134;
            if (!_1860)
            {
                _5052 = _4986;
            }
            float _5136 = _5052;
            _5054 = _5136;
            if (!_1860)
            {
                _5060 = _4994;
            }
            float _5138 = _5060;
            bool _5140 = !_1860;
            _5062 = _5138;
            if (!_5140)
            {
                uint _5142 = uint(int(uint(_180) >> uint(2)));
                float _5144 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5142)]);
                int _5146 = _180 + 4;
                uint _5148 = uint(int(uint(_5146) >> uint(2)));
                float _5150 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5148)]);
                int _5152 = _180 + 8;
                uint _5154 = uint(int(uint(_5152) >> uint(2)));
                float _5156 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5154)]);
                uint _5158 = uint(int(uint(_180) >> uint(2)));
                float _5160 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5158)]);
                int _5162 = _180 + 4;
                uint _5164 = uint(int(uint(_5162) >> uint(2)));
                float _5166 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5164)]);
                int _5168 = _180 + 8;
                uint _5170 = uint(int(uint(_5168) >> uint(2)));
                float _5172 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5170)]);
                uint _5174 = uint(int(uint(_180) >> uint(2)));
                float _5176 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5174)]);
                int _5178 = _180 + 4;
                uint _5180 = uint(int(uint(_5178) >> uint(2)));
                float _5182 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5180)]);
                int _5184 = _180 + 8;
                uint _5186 = uint(int(uint(_5184) >> uint(2)));
                float _5188 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5186)]);
                float _5190 = _5150 * _4986;
                float _5192 = _5166 * _4986;
                float _5194 = _5182 * _4986;
                float _5196 = fma(_5144, _4990, _5190);
                float _5198 = fma(_5160, _4990, _5192);
                float _5200 = fma(_5176, _4990, _5194);
                float _5202 = fma(_5156, _4994, _5196);
                float _5204 = fma(_5172, _4994, _5198);
                float _5206 = fma(_5188, _4994, _5200);
                _5046 = _5202;
                _5054 = _5204;
                _5062 = _5206;
            }
        }
    }
    _5132 = false;
    float _5208 = _5046;
    float _5210 = _5054;
    float _5212 = _5062;
    int _5214 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 24;
    uint _5216 = uint(int(uint(_5214) >> uint(2)));
    float _5218 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_5216)]);
    int _5220 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 16;
    uint _5222 = uint(int(uint(_5220) >> uint(2)));
    float _5224 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_5222)]);
    int _5226 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 8;
    uint _5228 = uint(int(uint(_5226) >> uint(2)));
    float _5230 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_5228)]);
    uint _5232 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
    float _5234 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_5232)]);
    float _5236 = fma(_4650, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
    float _5238 = fma(_4652, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
    float _5240 = fma(_4650, 6.2500002968590706586837768554688e-05, 0.5);
    float _5242 = fma(_4652, 6.2500002968590706586837768554688e-05, 0.5);
    float _5244 = fma(_4652, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
    float _5246 = fma(_4650, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
    float _5248 = fma(_4650, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
    float _5250 = fma(_4652, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
    float _5252 = _5218 * _5218;
    float _5254 = fma(_5224, _5224, _5252);
    float _5256 = rsqrt(_5254);
    float _5258 = _5256 * (-20.0);
    float _5260 = fma(_5218, _5258, _5230);
    float _5262 = fma(_5224, _5258, _5234);
    float _5264 = _5260 * 0.5;
    float _5266 = _5262 * 0.5;
    float _5268 = floor(_5266);
    float _5270 = floor(_5264);
    float _5272 = fma(_5268, 2.0, -32.0);
    float _5274 = -_5272;
    float _5276 = _5274 + _4650;
    float _5278 = fma(_5270, 2.0, -32.0);
    float _5280 = -_5278;
    float _5282 = _5280 + _4652;
    float _5284 = _5276 * 0.015625;
    float _5286 = _5282 * 0.015625;
    float2 _16365 = float2(_5284, _5286);
    float2 _5288 = dm_bs(spvDescriptorSet0.cp_t_tcb_26.sample(spvDescriptorSet0.cp_t_tcb_26Smplr, select(_16365, float2(0.0), isnan(_16365)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_26, spvDescriptorSet0.cp_t_tcb_26Smplr_w, select(_16365, float2(0.0), isnan(_16365)), level(0.0)).xy;
    float _5290 = _5288.x;
    float _5292 = _5288.y;
    float2 _16377 = float2(_5236, _5238);
    float _5294 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_16377, float2(0.0), isnan(_16377)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_16377, float2(0.0), isnan(_16377)), level(0.0)).x;
    float2 _16385 = float2(_5240, _5242);
    float2 _5296 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_16385, float2(0.0), isnan(_16385)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_16385, float2(0.0), isnan(_16385)), level(0.0)).xy;
    float _5298 = _5296.x;
    float _5300 = _5296.y;
    float2 _16397 = float2(_5236, _5244);
    float _5302 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_16397, float2(0.0), isnan(_16397)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_16397, float2(0.0), isnan(_16397)), level(0.0)).x;
    float2 _16405 = float2(_5246, _5238);
    float _5304 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_16405, float2(0.0), isnan(_16405)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_16405, float2(0.0), isnan(_16405)), level(0.0)).x;
    float2 _16413 = float2(_5246, _5244);
    float _5306 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_16413, float2(0.0), isnan(_16413)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_16413, float2(0.0), isnan(_16413)), level(0.0)).x;
    float2 _16421 = float2(_5248, _5242);
    float _5308 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_16421, float2(0.0), isnan(_16421)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_16421, float2(0.0), isnan(_16421)), level(0.0)).x;
    float2 _16429 = float2(_5240, _5250);
    float _5310 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_16429, float2(0.0), isnan(_16429)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_16429, float2(0.0), isnan(_16429)), level(0.0)).x;
    float2 _16437 = float2(_5240, _5242);
    float _5312 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_16437, float2(0.0), isnan(_16437)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_16437, float2(0.0), isnan(_16437)), level(0.0)).y;
    float2 _16445 = float2(_5248, _5242);
    float2 _5314 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_16445, float2(0.0), isnan(_16445)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_16445, float2(0.0), isnan(_16445)), level(0.0)).xy;
    float _5316 = _5314.x;
    float _5318 = _5314.y;
    float2 _16457 = float2(_5240, _5250);
    float2 _5320 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_16457, float2(0.0), isnan(_16457)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_16457, float2(0.0), isnan(_16457)), level(0.0)).xy;
    float _5322 = _5320.x;
    float _5324 = _5320.y;
    float _5326 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[73]);
    float _5328 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[72]);
    float _5330 = fma(_200, 3.1415927410125732421875, -1.57079637050628662109375);
    float _5332 = 1.0 / _4148;
    float _5334 = _5330 * 0.15915493667125701904296875;
    float _5336 = _5334 * 6.283185482025146484375;
    float _5338 = cos(_5336);
    float _5340 = _5334 * 6.283185482025146484375;
    float _5342 = sin(_5340);
    float _5344 = _1882 * 19.23889923095703125;
    float _5346 = _5332 * 59.999996185302734375;
    float _5348 = _1876 * 19.23889923095703125;
    float _5350 = _5208 * _5346;
    float _5352 = _5348 * 0.15915493667125701904296875;
    float _5354 = _5210 * _5346;
    float _5356 = _5212 * _5346;
    float _5358 = _5352 * 6.283185482025146484375;
    float _5360 = sin(_5358);
    float _5362 = _5360 * 34873.41015625;
    float _5364 = floor(_5362);
    float _5366 = -_5364;
    float _5368 = _5362 + _5366;
    float _5370 = _5292 * 14.99999904632568359375;
    float _5372 = _5290 * 14.99999904632568359375;
    float _5374 = _5370 * _5338;
    float _5376 = _5370 * _5342;
    float _5378 = _5370 * _5370;
    float _5380 = fma(_5372, _5342, _5374);
    float _5382 = _5344 * 0.15915493667125701904296875;
    float _5384 = -_5298;
    float _5386 = _5384 + _5294;
    float _5388 = -_5298;
    float _5390 = _5388 + _5302;
    float _5392 = _5298 * 2000.0;
    float _5394 = -_5376;
    float _5396 = fma(_5372, _5338, _5394);
    float _5398 = fma(_5372, _5372, _5378);
    float _5400 = _5382 * 6.283185482025146484375;
    float _5402 = sin(_5400);
    float _5404 = _5386 * 2000.0;
    float _5406 = _5390 * 2000.0;
    float _5408 = _5392 + (-2.0);
    float _5410 = -_5298;
    float _5412 = _5410 + _5304;
    float _5414 = -_5298;
    float _5416 = _5414 + _5308;
    float _5418 = abs(_5404);
    float _5420 = abs(_5406);
    float _5422 = precise::max(_5418, _5420);
    float _5424 = _5412 * 2000.0;
    bool _5426 = _4654 >= _5408;
    bool _5428 = isnan(_4654);
    bool _5430 = _5426 || _5428;
    bool _5432 = isnan(_5408);
    bool _5434 = _5430 || _5432;
    float _5436 = -_5298;
    float _5438 = _5436 + _5306;
    float _5440 = -_5326;
    float _5442 = _5440 + 1.0;
    float _5444 = -_5298;
    float _5446 = _5444 + _5310;
    float _5448 = _5416 * 1000.0;
    float _5450 = _5438 * 2000.0;
    float _5452 = fma(_206, _5326, _5442);
    float _5454 = _5446 * 1000.0;
    float _5456 = fma(_5448, _5448, 0.0625);
    float _5458 = abs(_5424);
    float _5460 = precise::max(_5422, _5458);
    float _5462 = _5402 * 34873.41015625;
    float _5464 = fma(_5454, _5454, _5456);
    float _5466 = floor(_5462);
    float _5468 = -_5300;
    float _5470 = _5298 + _5468;
    float _5472 = rsqrt(_5464);
    float _5474 = _5470 * 2000.0;
    float _5476 = sqrt(_5398);
    float _5478 = -_5466;
    float _5480 = _5478 + _5462;
    float _5482 = abs(_5474);
    bool _5484 = _5482 < 2.0;
    bool _5486 = !_5434;
    bool _5488 = _5484 || _5486;
    float _5490 = fma(_5480, 0.800000011920928955078125, 0.20000000298023223876953125);
    float _5492 = fma(_5368, _5368, 0.0400000028312206268310546875);
    float _5494 = _5472 * 0.25;
    float _5496 = abs(_5450);
    float _5498 = precise::max(_5460, _5496);
    float _5500 = fma(_5490, _5490, _5492);
    bool _5502 = _5494 < 0.891006529331207275390625;
    bool _5504 = _5502 || _5488;
    bool _5506 = _5498 >= 2.0;
    bool _5508 = isnan(_5498);
    bool _5510 = _5506 || _5508;
    bool _5512 = isnan(2.0);
    bool _5514 = _5510 || _5512;
    bool _5516 = _5514 || _5504;
    float _5518 = sqrt(_5500);
    float _5520 = sqrt(_5476);
    float _5522 = _5300 * 2000.0;
    float _5524 = _5522;
    float _5526 = _5396;
    float _5528 = _5350;
    float _5530 = _5356;
    float _5532 = _5300;
    if (!_5516)
    {
        float _5534 = _5454 * _5472;
        float _5536 = _5448 * _5472;
        float _5538 = 1.0 / _5494;
        float _5540 = _5534 * _5534;
        float _5542 = fma(_5536, _5536, _5540);
        float _5544 = sqrt(_5542);
        bool _5546 = _5544 > 9.9999997473787516355514526367188e-05;
        float _5548 = _5544 * _5538;
        float _5550 = _5536;
        float _5552 = _5540;
        if (_5546)
        {
            float _5554 = abs(_5536);
            float _5556 = abs(_5534);
            float _5558 = precise::max(_5554, _5556);
            _5550 = _5558;
        }
        float _5560 = _5550;
        if (!_5546)
        {
            _5552 = 0.0;
        }
        float _5562 = _5552;
        float _5564 = _5560;
        float _5566 = _5562;
        if (_5546)
        {
            float _5568 = 1.0 / _5560;
            _5564 = _5568;
        }
        float _5570 = _5564;
        if (_5546)
        {
            float _5572 = _5544 * _5570;
            _5566 = _5572;
        }
        float _5574 = _5566;
        float _5576 = _5574 * 0.9649016857147216796875;
        float _5578 = -_5576;
        float _5580 = fma(_5578, _5548, _5392);
        _5524 = _5580;
    }
    float _5582 = _5524;
    float _5584 = _5518 + 9.9999997473787516355514526367188e-06;
    float _5586 = -_5582;
    float _5588 = _4654 + _5586;
    bool _5590 = _5520 >= 0.5;
    float _5592 = _4396 * 0.100000001490116119384765625;
    bool _5594 = _5520 >= 1.0;
    float _5596 = abs(_5588);
    float _5598 = _5596 * 0.20000000298023223876953125;
    float _5600 = precise::clamp(_5598, 0.0, 1.0);
    float _5602 = 1.0 / _5584;
    float _5604 = fma(_4276, 0.20000000298023223876953125, _5592);
    float _5606 = -_5298;
    float _5608 = _5294 + _5606;
    float _5610 = -_5600;
    float _5612 = _5610 + 1.0;
    float _5614 = -_5298;
    float _5616 = _5302 + _5614;
    float _5618 = -_5298;
    float _5620 = _5306 + _5618;
    float _5622 = _5608 * 2000.0;
    float _5624 = _5612 * _5612;
    float _5626 = -_5298;
    float _5628 = _5626 + _5316;
    float _5630 = -_5298;
    float _5632 = _5630 + _5322;
    float _5634 = _5624 * _5624;
    float _5636 = _5628 * 1000.0;
    float _5638 = _5452 * _5634;
    float _5640 = _5602 * _5368;
    float _5642 = _5328 * 300.0;
    float _5644 = -_5602;
    float _5646 = _5490 * _5644;
    float _5648 = _5602 * 0.20000000298023223876953125;
    float _5650 = _5328 * 500.0;
    float _5652 = _4422 * _5640;
    float _5654 = _5642;
    float _5656 = _5650;
    float _5658 = _5652;
    if (_5590)
    {
        float _5660 = _5642 * _5638;
        _5654 = _5660;
    }
    float _5662 = _5654;
    float _5664 = _4258 * _5640;
    float _5666 = _4284 * _5640;
    float _5668 = _5666;
    if (_5594)
    {
        float _5670 = _5650 * _5638;
        _5656 = _5670;
    }
    float _5672 = _5656;
    float _5674 = fma(_4252, _5648, _5652);
    if (_5590)
    {
        float _5676 = _5396 * _5662;
        _5658 = _5676;
    }
    float _5678 = _5658;
    if (_5590)
    {
        float _5680 = _5380 * _5662;
        _5526 = _5680;
    }
    float _5682 = _5526;
    float _5684 = fma(_4276, _5648, _5666);
    float _5686 = _5354;
    if (_5594)
    {
        float _5688 = _5520 * _5672;
        _5668 = _5688;
    }
    float _5690 = _5668;
    if (_5590)
    {
        float _5692 = fma(_4148, _5678, _5350);
        _5528 = _5692;
    }
    float _5694 = _5528;
    float _5696 = _4288 * 0.100000001490116119384765625;
    float _5698 = fma(_4398, _5648, _5664);
    float _5700 = _5694;
    if (_5594)
    {
        float _5702 = fma(_4148, _5690, _5354);
        _5686 = _5702;
    }
    float _5704 = _5686;
    float _5706 = _4280 * 0.100000001490116119384765625;
    float _5708 = fma(_4288, _5646, _5674);
    if (_5590)
    {
        float _5710 = fma(_4148, _5682, _5356);
        _5530 = _5710;
    }
    float _5712 = _5530;
    float _5714 = _4276 * (-0.20000000298023223876953125);
    float _5716 = fma(_4398, 0.20000000298023223876953125, _5706);
    float _5718 = fma(_4252, 0.20000000298023223876953125, _5696);
    float _5720 = _5604 * _4140;
    float _5722 = fma(_4280, _5646, _5698);
    float _5724 = fma(_4396, _5646, _5684);
    float _5726 = _4398 * (-0.20000000298023223876953125);
    float _5728 = _5714 * _4140;
    float _5730 = _5718 * _4142;
    float _5732 = -_5720;
    float _5734 = fma(_5716, _4142, _5732);
    float _5736 = -_5704;
    float _5738 = _4978 + _5736;
    float _5740 = _4252 * (-0.20000000298023223876953125);
    float _5742 = -_5730;
    float _5744 = fma(_5604, _4144, _5742);
    float _5746 = -_5694;
    float _5748 = _4980 + _5746;
    float _5750 = _5738 + _5734;
    float _5752 = -_5728;
    float _5754 = fma(_5726, _4142, _5752);
    float _5756 = _5740 * _4142;
    float _5758 = _5716 * _4144;
    float _5760 = _5748 + _5744;
    float _5762 = _5750 * _5750;
    float _5764 = _5738 + _5754;
    float _5766 = -_5756;
    float _5768 = fma(_5714, _4144, _5766);
    float _5770 = _5726 * _4144;
    float _5772 = -_5758;
    float _5774 = fma(_5718, _4140, _5772);
    float _5776 = -_5712;
    float _5778 = _4982 + _5776;
    float _5780 = fma(_5760, _5760, _5762);
    float _5782 = _5748 + _5768;
    float _5784 = -_5770;
    float _5786 = fma(_5740, _4140, _5784);
    float _5788 = _5764 * _5764;
    float _5790 = _5778 + _5774;
    float _5792 = _5616 * 2000.0;
    float _5794 = _5778 + _5786;
    float _5796 = fma(_5782, _5782, _5788);
    float _5798 = fma(_5790, _5790, _5780);
    float _5800 = -_5298;
    float _5802 = _5304 + _5800;
    float _5804 = abs(_5622);
    float _5806 = abs(_5792);
    float _5808 = precise::max(_5804, _5806);
    float _5810 = fma(_5794, _5794, _5796);
    float _5812 = rsqrt(_5798);
    float _5814 = _5802 * 2000.0;
    float _5816 = _4288 * 0.980571091175079345703125;
    float _5818 = abs(_5814);
    float _5820 = precise::max(_5808, _5818);
    float _5822 = _5620 * 2000.0;
    float _5824 = sqrt(_5798);
    float _5826 = fma(_4422, 0.19611422717571258544921875, _5816);
    float _5828 = abs(_5822);
    float _5830 = precise::max(_5820, _5828);
    float _5832 = _4280 * 0.980571091175079345703125;
    float _5834 = rsqrt(_5810);
    float _5836 = _5750 * _5812;
    float _5838 = _5760 * _5812;
    float _5840 = _5790 * _5812;
    float _5842 = fma(_4258, 0.19611422717571258544921875, _5832);
    float _5844 = sqrt(_5810);
    bool _5846 = _5824 != 0.0;
    bool _5848 = isnan(_5824);
    bool _5850 = _5846 || _5848;
    bool _5852 = isnan(0.0);
    bool _5854 = _5850 || _5852;
    float _5856 = _5854 ? _5836 : 0.0;
    float _5858 = _5854 ? _5838 : 0.0;
    float _5860 = _5764 * _5834;
    float _5862 = _5782 * _5834;
    float _5864 = _5794 * _5834;
    float _5866 = _5856 * _5826;
    float _5868 = _4396 * 0.980571091175079345703125;
    float _5870 = _5854 ? _5840 : 0.0;
    float _5872 = fma(_5636, _5636, 0.0625);
    float _5874 = fma(_5858, _5842, _5866);
    bool _5876 = _5844 != 0.0;
    bool _5878 = isnan(_5844);
    bool _5880 = _5876 || _5878;
    bool _5882 = isnan(0.0);
    bool _5884 = _5880 || _5882;
    float _5886 = fma(_4284, 0.19611422717571258544921875, _5868);
    float _5888 = -_5300;
    float _5890 = _5298 + _5888;
    float _5892 = _5884 ? _5860 : 0.0;
    float _5894 = fma(_5870, _5886, _5874);
    float _5896 = _5884 ? _5862 : 0.0;
    float _5898 = _5890 * 2000.0;
    float _5900 = _5884 ? _5864 : 0.0;
    float _5902 = _5892 * _5708;
    float _5904 = _5798 * _5894;
    float _5906 = _5632 * 1000.0;
    float _5908 = abs(_5898);
    bool _5910 = _5908 >= 2.0;
    bool _5912 = isnan(_5908);
    bool _5914 = _5910 || _5912;
    bool _5916 = isnan(2.0);
    bool _5918 = _5914 || _5916;
    float _5920 = fma(_5896, _5722, _5902);
    float _5922 = _5842 * _5904;
    float _5924 = _5826 * _5904;
    float _5926 = _5886 * _5904;
    float _5928 = fma(_5900, _5724, _5920);
    float _5930 = -_5924;
    float _5932 = _5604 * _5930;
    float _5934 = -_5926;
    float _5936 = _5716 * _5934;
    float _5938 = _5810 * _5928;
    float _5940 = -_5926;
    float _5942 = -_5932;
    float _5944 = fma(_5718, _5940, _5942);
    float _5946 = -_5922;
    float _5948 = -_5936;
    float _5950 = fma(_5604, _5946, _5948);
    float _5952 = _5708 * _5938;
    float _5954 = fma(_5906, _5906, _5872);
    float _5956 = _5724 * _5938;
    float _5958 = _5722 * _5938;
    float _5960 = -_5922;
    float _5962 = _5718 * _5960;
    float _5964 = rsqrt(_5954);
    float _5966 = -_5956;
    float _5968 = _5726 * _5966;
    float _5970 = _2552 * 0.300000011920928955078125;
    float _5972 = -_5924;
    float _5974 = -_5962;
    float _5976 = fma(_5716, _5972, _5974);
    float _5978 = -_5924;
    float _5980 = -_5952;
    float _5982 = _5978 + _5980;
    float _5984 = -_5958;
    float _5986 = -_5968;
    float _5988 = fma(_5714, _5984, _5986);
    float _5990 = -_5952;
    float _5992 = _5714 * _5990;
    float _5994 = -_5922;
    float _5996 = -_5958;
    float _5998 = _5994 + _5996;
    float _6000 = -_5958;
    float _6002 = _5740 * _6000;
    float _6004 = _5950 + _5988;
    float _6006 = -_5956;
    float _6008 = -_5992;
    float _6010 = fma(_5740, _6006, _6008);
    float _6012 = -_5926;
    float _6014 = -_5956;
    float _6016 = _6012 + _6014;
    float _6018 = -_5952;
    float _6020 = -_6002;
    float _6022 = fma(_5726, _6018, _6020);
    float _6024 = _5944 + _6010;
    float _6026 = _2552 * 0.5;
    float _6028 = _5976 + _6022;
    float _6030 = _5636 * _5964;
    float _6032 = _5906 * _5964;
    float _6034 = _5964 * 0.25;
    float _6036 = _6034;
    float _6038 = _5712;
    float _6040 = _5982;
    float _6042 = _5998;
    float _6074;
    float _6076;
    float _6078;
    float _6080;
    if (!_5918)
    {
        float _6044 = -_5300;
        float _6046 = _6044 + _5318;
        float _6048 = -_5300;
        float _6050 = _6048 + _5324;
        float _6052 = _6046 * 1000.0;
        float _6054 = _6050 * 1000.0;
        float _6056 = fma(_6052, _6052, 0.0625);
        float _6058 = fma(_6054, _6054, _6056);
        float _6060 = _5300 * 2000.0;
        float _6062 = rsqrt(_6058);
        float _6064 = -_6052;
        float _6066 = fma(_6064, _6062, -0.0);
        float _6068 = -_6054;
        float _6070 = fma(_6068, _6062, -0.0);
        float _6072 = _6062 * 0.25;
        _6074 = _6060;
        _6036 = _6072;
        _6076 = _6066;
        _6078 = _6070;
        _6080 = _6062;
        _6082 = true;
    }
    else
    {
        float _6084 = _6032 * _6032;
        float _6086 = 1.0 / _6034;
        float _6088 = fma(_6030, _6030, _6084);
        float _6090 = sqrt(_6088);
        bool _6092 = _6090 > 9.9999997473787516355514526367188e-05;
        float _6094 = _6090 * _6086;
        float _6096 = _6084;
        if (_6092)
        {
            float _6098 = abs(_6030);
            float _6100 = abs(_6032);
            float _6102 = precise::max(_6098, _6100);
            _5532 = _6102;
        }
        float _6104 = _5532;
        float _6106 = -_6032;
        float _6108 = (-0.0) + _6106;
        _6078 = _6108;
        if (!_6092)
        {
            _6096 = 0.0;
        }
        float _6110 = _6096;
        float _6112 = _6104;
        float _6114 = _6110;
        if (_6092)
        {
            float _6116 = 1.0 / _6104;
            _6112 = _6116;
        }
        float _6118 = _6112;
        if (_6092)
        {
            float _6120 = _6090 * _6118;
            _6114 = _6120;
        }
        float _6122 = _6114;
        bool _6124 = _5830 >= 2.0;
        bool _6126 = isnan(_5830);
        bool _6128 = _6124 || _6126;
        bool _6130 = isnan(2.0);
        bool _6132 = _6128 || _6130;
        float _6134 = -_6030;
        float _6136 = (-0.0) + _6134;
        float _6138 = _6122 * 0.9649016857147216796875;
        bool _6140 = !_6132;
        float _6142 = _6140 ? 0.0 : 1000.0;
        float _6144 = _6138 * _6094;
        float _6146 = -_6144;
        float _6148 = fma(_5298, 2000.0, _6146);
        float _6150 = -_6142;
        float _6152 = _6148 + _6150;
        _6074 = _6152;
        _6076 = _6136;
        _6080 = _6144;
    }
    _6082 = false;
    float _6154 = _6074;
    float _6156 = _6036;
    float _6158 = _6076;
    float _6160 = _6078;
    float _6162 = _6080;
    float _6164 = -_4654;
    float _6166 = _6164 + _6154;
    bool _6168 = _6154 >= _4654;
    bool _6170 = isnan(_6154);
    bool _6172 = _6168 || _6170;
    bool _6174 = isnan(_4654);
    bool _6176 = _6172 || _6174;
    float _6178 = -_6154;
    float _6180 = fma(_5312, 2000.0, _6178);
    bool _6182 = _6154 > _4654;
    float _6184 = _6166 * _6166;
    float _6186 = precise::max(_1690, 0.001000000047497451305389404296875);
    bool _6188 = !_6182;
    float _6190 = _6188 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _6192 = _4146 >= 0.5;
    float _6194 = sqrt(_6184);
    int _6196 = ~as_type<int>(_6190);
    int _6198 = _6196 + 1;
    int _6200 = _6198 + 1;
    float _6202 = abs(_6180);
    bool _6204 = _6202 >= 2.0;
    bool _6206 = isnan(_6202);
    bool _6208 = _6204 || _6206;
    bool _6210 = isnan(2.0);
    bool _6212 = _6208 || _6210;
    int _6214 = _6200;
    float _6216 = _6190;
    float _6218 = _6162;
    if (_6176)
    {
        int _6220 = ~as_type<int>(_6190);
        int _6222 = _6220 + 1;
        _6214 = _6222;
    }
    int _6224 = _6214;
    bool _6226 = _6156 >= 0.891006529331207275390625;
    bool _6228 = _6226 && _6212;
    float _6230 = float(_6224);
    float _6232 = precise::min(_6186, 10000.0);
    float _6234 = _6194 * _6230;
    bool _6236 = !_6192;
    float _6238 = _6194;
    float _6240 = _6234;
    float _6242 = _6230;
    float _6336;
    float _6338;
    float _6572;
    float _6574;
    float _6576;
    float _6578;
    float _6580;
    float _6582;
    float _6584;
    float _6620;
    float _6622;
    float _6624;
    if (!_6236)
    {
        bool _6244 = _4390 > _4238;
        bool _6246 = _4390 >= _4238;
        bool _6248 = isnan(_4390);
        bool _6250 = _6246 || _6248;
        bool _6252 = isnan(_4238);
        bool _6254 = _6250 || _6252;
        int _6256 = _6254 ? 0 : 1;
        int _6258 = ~_6256;
        int _6260 = _6258 + 1;
        int _6262 = _6260 + 1;
        int _6264 = _6262;
        int _6266 = _6254 ? (-1) : 0;
        if (!_6244)
        {
            int _6268 = ~_6256;
            int _6270 = _6268 + 1;
            _6264 = _6270;
        }
        int _6272 = _6264;
        bool _6274 = _4146 != 1.0;
        bool _6276 = isnan(_4146);
        bool _6278 = _6274 || _6276;
        bool _6280 = isnan(1.0);
        bool _6282 = _6278 || _6280;
        float _6284 = float(_6272);
        float _6286 = _4422 * _6284;
        float _6288 = _4258 * _6284;
        float _6290 = _4284 * _6284;
        float _6292 = _4978 * _6156;
        float _6294 = _6286 * _6156;
        float _6296 = fma(_4980, _6158, _6292);
        float _6298 = fma(_6288, _6158, _6294);
        float _6300 = fma(_4982, _6160, _6296);
        float _6302 = fma(_6290, _6160, _6298);
        float _6304 = abs(_6302);
        float _6306 = -_6304;
        float _6308 = _6306 + 1.0;
        bool _6310 = _6300 <= 0.0;
        float _6312 = float(_6310);
        float _6314 = abs(_6308);
        float _6316 = log2(_6314);
        float _6318 = _6300 * _6312;
        float _6320 = -_6318;
        float _6322 = fma(_6158, _6320, _4980);
        float _6324 = -_6318;
        float _6326 = fma(_6156, _6324, _4978);
        float _6328 = -_6318;
        float _6330 = fma(_6160, _6328, _4982);
        float _6332 = _6316 * 0.20000000298023223876953125;
        float _6334 = exp2(_6332);
        _6336 = _6322;
        _6338 = _6326;
        int _6384;
        float _6446;
        int _6448;
        float _6450;
        float _6452;
        if (!_6282)
        {
            float _6340 = _6326 * _6326;
            float _6342 = _4140 * 0.89999997615814208984375;
            float _6344 = _4144 * 0.89999997615814208984375;
            float _6346 = _4142 * 0.89999997615814208984375;
            float _6348 = fma(_6322, _6322, _6340);
            float _6350 = fma(_6330, _6330, _6348);
            float _6352 = sqrt(_6350);
            bool _6354 = _6352 > 0.5;
            bool _6356 = !_6354;
            if (!_6356)
            {
                bool _6358 = _6302 > 0.0;
                bool _6360 = _6302 >= 0.0;
                bool _6362 = isnan(_6302);
                bool _6364 = _6360 || _6362;
                bool _6366 = isnan(0.0);
                bool _6368 = _6364 || _6366;
                float _6370 = precise::max(_1856, 0.100000001490116119384765625);
                int _6372 = _6368 ? 0 : 1;
                float _6374 = precise::max(_1844, 0.100000001490116119384765625);
                int _6376 = ~_6372;
                int _6378 = _6376 + 1;
                int _6380 = _6378 + 1;
                int _6382 = _6380;
                _6266 = _6368 ? (-1) : 0;
                _6384 = _6358 ? (-1) : 0;
                if (!_6358)
                {
                    int _6386 = ~_6372;
                    int _6388 = _6386 + 1;
                    _6382 = _6388;
                }
                int _6390 = _6382;
                float _6392 = float(_6390);
                float _6394 = _6288 * _6392;
                float _6396 = _6290 * _6392;
                float _6398 = _6286 * _6392;
                float _6400 = _6330 * _6394;
                float _6402 = _6326 * _6396;
                float _6404 = -_6400;
                float _6406 = fma(_6322, _6396, _6404);
                float _6408 = _6322 * _6398;
                float _6410 = -_6402;
                float _6412 = fma(_6330, _6398, _6410);
                float _6414 = _6406 * _6406;
                float _6416 = -_6408;
                float _6418 = fma(_6326, _6394, _6416);
                float _6420 = fma(_6412, _6412, _6414);
                float _6422 = fma(_6418, _6418, _6420);
                float _6424 = _6370 + _6374;
                float _6426 = 1.0 / _6424;
                float _6428 = sqrt(_6422);
                float _6430 = _6426 * 0.4000000059604644775390625;
                float _6432 = _6352 * _6430;
                float _6434 = _6428 + 9.9999997473787516355514526367188e-06;
                float _6436 = 1.0 / _6434;
                float _6438 = _6432 * _6436;
                float _6440 = fma(_6412, _6438, _6342);
                float _6442 = fma(_6406, _6438, _6344);
                float _6444 = fma(_6418, _6438, _6346);
                _6446 = _6440;
                _6448 = 1065353216;
                _6450 = _6442;
                _6452 = _6444;
                _6454 = true;
            }
            else
            {
                bool _6456 = _6334 > 0.5;
                bool _6458 = _6234 > (-0.800000011920928955078125);
                bool _6460 = _6458 && _6456;
                bool _6462 = !_6460;
                int _6464 = _6462 ? 1065353216 : 1056964608;
                _6446 = _6342;
                _6384 = _6460 ? (-1) : 0;
                _6448 = _6464;
                _6450 = _6344;
                _6452 = _6346;
                _6454 = true;
            }
        }
        else
        {
            bool _6466 = _6302 > 0.0;
            bool _6468 = _6302 >= 0.0;
            bool _6470 = isnan(_6302);
            bool _6472 = _6468 || _6470;
            bool _6474 = isnan(0.0);
            bool _6476 = _6472 || _6474;
            int _6478 = _6476 ? 0 : 1;
            int _6480 = ~_6478;
            int _6482 = _6480 + 1;
            int _6484 = _6482 + 1;
            int _6486 = _6484;
            _6266 = _6476 ? (-1) : 0;
            if (!_6466)
            {
                int _6488 = ~_6478;
                int _6490 = _6488 + 1;
                _6486 = _6490;
            }
            int _6492 = _6486;
            bool _6494 = _6334 >= 0.300000011920928955078125;
            bool _6496 = isnan(_6334);
            bool _6498 = _6494 || _6496;
            bool _6500 = isnan(0.300000011920928955078125);
            bool _6502 = _6498 || _6500;
            float _6504 = float(_6492);
            int _6506 = _6502 ? as_type<int>(_4146) : 1065353216;
            float _6508 = _6290 * _6504;
            float _6510 = _6288 * _6504;
            float _6512 = _6286 * _6504;
            float _6514 = _6508 * _6156;
            float _6516 = _6510 * _6160;
            float _6518 = _6512 * _6158;
            float _6520 = -_6514;
            float _6522 = fma(_6512, _6160, _6520);
            float _6524 = _6334 * 10.0;
            float _6526 = -_6516;
            float _6528 = fma(_6508, _6158, _6526);
            float _6530 = -_6518;
            float _6532 = fma(_6510, _6156, _6530);
            float _6534 = _6524 * _6522;
            float _6536 = _6524 * _6528;
            float _6538 = _6524 * _6532;
            _6446 = _6534;
            _6384 = _6502 ? (-1) : 0;
            _6448 = _6506;
            _6450 = _6536;
            _6452 = _6538;
        }
        _6454 = false;
        int _6540 = _6266;
        float _6542 = _6446;
        int _6544 = _6384;
        int _6546 = _6448;
        float _6548 = _6450;
        float _6550 = _6452;
        bool _6552 = _6166 >= (-0.20000000298023223876953125);
        bool _6554 = isnan(_6166);
        bool _6556 = _6552 || _6554;
        bool _6558 = isnan(-0.20000000298023223876953125);
        bool _6560 = _6556 || _6558;
        float _6562 = _5694 * 0.20000000298023223876953125;
        float _6564 = _5712 * 0.20000000298023223876953125;
        float _6566 = _5704 * 0.20000000298023223876953125;
        int _6568 = _6540;
        int _6570 = _6544;
        _6040 = _6566;
        _6042 = _6562;
        _6572 = _6564;
        _6574 = 0.0;
        _6576 = 0.0;
        _6578 = 0.0;
        _6580 = _6330;
        _6582 = _6548;
        _6584 = _6550;
        if (_6560)
        {
            bool _6586 = _6234 > 2.0;
            _6568 = _6586 ? (-1) : 0;
        }
        int _6588 = _6568;
        if (!_6560)
        {
            _6570 = -1;
        }
        int _6590 = _6570;
        int _6592 = _6590;
        if (_6560)
        {
            bool _6594 = _6166 >= (-0.20000000298023223876953125);
            int _6596 = (_6594 ? (-1) : 0) & _6588;
            _6592 = _6596;
        }
        int _6598 = _6592;
        int _6600 = ~_6598;
        bool _6602 = !_6228;
        int _6604 = _6600 & (_6602 ? (-1) : 0);
        bool _6606 = !_6228;
        int _6608 = _6598 & (_6606 ? (-1) : 0);
        int _6610 = _6604 | _6608;
        int _6612 = _6598 & (_6228 ? (-1) : 0);
        int _6614 = _6610 | _6612;
        int _6616 = ~_6614;
        float _6618 = (_6616 != 0) ? as_type<float>(_6546) : 0.0;
        _6620 = _6618;
        _6622 = 0.0;
        _6624 = _6542;
        _6626 = true;
    }
    else
    {
        bool _6628 = _6234 < 0.0;
        bool _6630 = _6628 && _6228;
        bool _6632 = _6234 > (-0.800000011920928955078125);
        bool _6634 = _6632 && _6630;
        if (_6634)
        {
            float _6636 = _4978 * _6156;
            _2010 = _6636;
        }
        float _6638 = _2010;
        float _6640 = _6638;
        if (!_6634)
        {
            _6238 = 0.0;
        }
        float _6642 = _6238;
        float _6644 = _6642;
        if (!_6634)
        {
            _5700 = _6016;
        }
        float _6646 = _5700;
        float _6648 = _6646;
        if (_6634)
        {
            float _6650 = fma(_4980, _6158, _6638);
            _6640 = _6650;
        }
        float _6652 = _6640;
        float _6654 = _6652;
        if (!_6634)
        {
            _6216 = _6024;
        }
        float _6656 = _6216;
        float _6658 = _6656;
        if (!_6634)
        {
            _6218 = _6004;
        }
        float _6660 = _6218;
        float _6662 = _6660;
        if (_6634)
        {
            float _6664 = fma(_4982, _6160, _6652);
            _6654 = _6664;
        }
        float _6666 = _6654;
        float _6668 = _6666;
        if (!_6634)
        {
            _6038 = _6028;
        }
        float _6670 = _6038;
        float _6672 = _6670;
        if (!_6634)
        {
            _6240 = _4140;
        }
        float _6674 = _6240;
        float _6676 = _6674;
        if (_6634)
        {
            float _6678 = -_6158;
            float _6680 = fma(_6678, _6666, _4980);
            _5004 = _6680;
        }
        float _6682 = _5004;
        _6336 = _6682;
        if (_6634)
        {
            float _6684 = -_6156;
            float _6686 = fma(_6684, _6666, _4978);
            _5006 = _6686;
        }
        float _6688 = _5006;
        _6338 = _6688;
        if (_6634)
        {
            float _6690 = -_6160;
            float _6692 = fma(_6690, _6666, _4982);
            _5008 = _6692;
        }
        float _6694 = _5008;
        _6580 = _6694;
        if (!_6634)
        {
            _2012 = _4144;
        }
        float _6696 = _2012;
        float _6698 = _6696;
        if (!_6634)
        {
            _6668 = _4142;
        }
        float _6700 = _6668;
        float _6702 = _6700;
        if (!_6634)
        {
            _6242 = _4146;
        }
        float _6704 = _6242;
        _6620 = _6704;
        if (_6634)
        {
            _6644 = _6166;
        }
        float _6706 = _6644;
        _6622 = _6706;
        if (_6634)
        {
            _6648 = _6016;
        }
        float _6708 = _6648;
        _6572 = _6708;
        if (_6634)
        {
            _6658 = _6024;
        }
        float _6710 = _6658;
        _6574 = _6710;
        if (_6634)
        {
            _6662 = _6004;
        }
        float _6712 = _6662;
        _6576 = _6712;
        if (_6634)
        {
            _6672 = _6028;
        }
        float _6714 = _6672;
        _6578 = _6714;
        if (_6634)
        {
            _6676 = _4140;
        }
        float _6716 = _6676;
        _6624 = _6716;
        if (_6634)
        {
            _6698 = _4144;
        }
        float _6718 = _6698;
        _6582 = _6718;
        if (_6634)
        {
            _6702 = _4142;
        }
        float _6720 = _6702;
        _6584 = _6720;
        if (_6634)
        {
            _6620 = 0.5;
        }
    }
    _6626 = false;
    float _6722 = _6620;
    float _6724 = _6040;
    float _6726 = _6042;
    float _6728 = _6572;
    float _6730 = _6336;
    float _6732 = _6338;
    float _6734 = _6574;
    float _6736 = _6576;
    float _6738 = _6578;
    float _6740 = _6580;
    float _6742 = _6622;
    float _6744 = _6582;
    float _6746 = _6624;
    float _6748 = _6584;
    float _6750 = 1.0 / _6232;
    bool _6752 = _6722 >= 0.5;
    float _6754 = _6750 * _6724;
    float _6756 = _6750 * _6726;
    float _6758 = _6750 * _6728;
    float _6760 = _6754 * _6754;
    float _6762 = fma(_6756, _6756, _6760);
    float _6764 = fma(_6758, _6758, _6762);
    float _6766 = _2552 * _2552;
    float _6768 = _5970 * _5970;
    float _6770 = sqrt(_6764);
    float _6772 = fma(_6026, _6026, _6766);
    float _6774 = fma(_5970, _5970, _6766);
    float _6776 = fma(_6026, _6026, _6768);
    float _6778 = _6772 * 0.083333335816860198974609375;
    float _6780 = _6774 * 0.083333335816860198974609375;
    float _6782 = _6776 * 0.083333335816860198974609375;
    float _6784 = _4258 * _6778;
    float _6786 = _4422 * _6778;
    float _6788 = _4284 * _6778;
    float _6790 = _4398 * _6780;
    float _6792 = _4252 * _6780;
    float _6794 = _4276 * _6780;
    float _6796 = _4422 * _6786;
    bool _6798 = _6770 > 80.0;
    float _6800 = _4422 * _6784;
    float _6802 = _4422 * _6788;
    float _6804 = _4258 * _6784;
    float _6806 = _4258 * _6786;
    float _6808 = _4258 * _6788;
    float _6810 = fma(_4252, _6790, _6800);
    float _6812 = fma(_4252, _6792, _6796);
    float _6814 = fma(_4252, _6794, _6802);
    float _6816 = _4284 * _6784;
    float _6818 = _4284 * _6788;
    float _6820 = _4284 * _6786;
    float _6822 = fma(_4398, _6794, _6808);
    float _6824 = _4252;
    float _6826 = _6810;
    float _6828 = _6792;
    float _6830 = _6734;
    float _6832 = _6732;
    if (_6798)
    {
        float _6834 = rsqrt(_6764);
        _6824 = _6834;
    }
    float _6836 = _6824;
    float _6838 = fma(_4398, _6790, _6804);
    float _6840 = _4280 * _6782;
    float _6842 = fma(_4276, _6790, _6816);
    float _6844 = fma(_4276, _6794, _6818);
    float _6846 = _4396 * _6782;
    float _6848 = fma(_4398, _6792, _6806);
    float _6850 = _4288 * _6782;
    float _6852 = fma(_4276, _6792, _6820);
    float _6854 = fma(_4280, _6840, _6838);
    float _6856 = fma(_4288, _6840, _6810);
    float _6858 = fma(_4396, _6840, _6842);
    float _6860 = fma(_4288, _6846, _6814);
    float _6862 = fma(_4396, _6846, _6844);
    float _6864 = fma(_4396, _6850, _6852);
    float _6866 = fma(_4280, _6846, _6822);
    float _6868 = _6860 * _6858;
    float _6870 = _6856 * _6862;
    float _6872 = fma(_4288, _6850, _6812);
    float _6874 = _6850;
    float _6876 = _6856;
    float _6878 = _6854;
    float _6880 = _6858;
    if (_6798)
    {
        float _6882 = _6836 * 80.0;
        _6826 = _6882;
    }
    float _6884 = _6826;
    float _6886 = _6860 * _6864;
    float _6888 = fma(_4280, _6850, _6848);
    float _6890 = -_6868;
    float _6892 = _6870 + _6890;
    if (!_6798)
    {
        _6874 = _6756;
    }
    float _6894 = _6874;
    float _6896 = _6894;
    if (_6798)
    {
        float _6898 = _6756 * _6884;
        _6896 = _6898;
    }
    float _6900 = _6896;
    if (!_6798)
    {
        _6828 = _6754;
    }
    float _6902 = _6828;
    float _6904 = _6902;
    if (_6798)
    {
        float _6906 = _6754 * _6884;
        _6904 = _6906;
    }
    float _6908 = _6904;
    float _6910 = _6908;
    if (!_6798)
    {
        _4326 = _6758;
    }
    float _6912 = _4326;
    float _6914 = _6912;
    if (_6798)
    {
        float _6916 = _6758 * _6884;
        _6914 = _6916;
    }
    float _6918 = _6914;
    float _6920 = -_6886;
    float _6922 = fma(_6872, _6862, _6920);
    float _6924 = _6872 * _6858;
    float _6926 = _6888 * _6892;
    float _6928 = _6860 * _4144;
    float _6930 = _6856 * _4144;
    float _6932 = -_6924;
    float _6934 = fma(_6856, _6864, _6932);
    float _6936 = -_6926;
    float _6938 = fma(_6854, _6922, _6936);
    float _6940 = _6872 * _4144;
    float _6942 = fma(_6866, _4140, _6928);
    float _6944 = fma(_6854, _4140, _6930);
    float _6946 = fma(_6866, _6934, _6938);
    float _6948 = fma(_6888, _4140, _6940);
    float _6950 = fma(_6862, _4142, _6942);
    float _6952 = fma(_6858, _4142, _6944);
    float _6954 = _4148 * 0.01666666753590106964111328125;
    bool _6956 = _6946 != 0.0;
    bool _6958 = isnan(_6946);
    bool _6960 = _6956 || _6958;
    bool _6962 = isnan(0.0);
    bool _6964 = _6960 || _6962;
    float _6966 = fma(_6864, _4142, _6948);
    float _6968 = _6950 * _4144;
    float _6970 = _6952 * _4142;
    float _6972 = fma(_6954, _6900, _6730);
    float _6974 = _6966 * _4140;
    float _6976 = -_6968;
    float _6978 = fma(_6966, _4142, _6976);
    float _6980 = -_6970;
    float _6982 = fma(_6950, _4140, _6980);
    float _6984 = fma(_6954, _6908, _6732);
    float _6986 = -_6974;
    float _6988 = fma(_6952, _4144, _6986);
    float _6990 = _6978 + _6734;
    float _6992 = _6982 + _6736;
    float _6994 = _6974;
    float _6996 = _6972;
    float _6998 = _6984;
    float _7000 = _6972;
    if (!_6964)
    {
        _6910 = _6864;
    }
    float _7002 = _6910;
    float _7004 = _7002;
    if (!_6964)
    {
        _6830 = _6862;
    }
    float _7006 = _6830;
    float _7008 = _7006;
    if (!_6964)
    {
        _6832 = _6872;
    }
    float _7010 = _6832;
    float _7012 = _7010;
    if (!_6964)
    {
        _6994 = _6860;
    }
    float _7014 = _6994;
    float _7016 = _7014;
    if (!_6964)
    {
        _4164 = _6888;
    }
    float _7018 = _4164;
    float _7020 = _7018;
    if (!_6964)
    {
        _4166 = _6866;
    }
    float _7022 = _4166;
    bool _7024 = !_6964;
    float _7026 = _7022;
    if (!_7024)
    {
        float _7028 = 1.0 / _6946;
        float _7030 = _6854 * _6860;
        float _7032 = _6888 * _6862;
        float _7034 = _6866 * _6872;
        float _7036 = _6866 * _6858;
        float _7038 = -_7030;
        float _7040 = fma(_6866, _6856, _7038);
        float _7042 = _6854 * _6864;
        float _7044 = _6888 * _6856;
        float _7046 = -_7032;
        float _7048 = fma(_6866, _6864, _7046);
        float _7050 = -_6870;
        float _7052 = _7050 + _6868;
        float _7054 = -_7034;
        float _7056 = fma(_6888, _6860, _7054);
        float _7058 = -_7036;
        float _7060 = fma(_6854, _6862, _7058);
        float _7062 = -_7042;
        float _7064 = fma(_6888, _6858, _7062);
        float _7066 = -_7044;
        float _7068 = fma(_6854, _6872, _7066);
        float _7070 = _7048 * _7028;
        float _7072 = _7052 * _7028;
        float _7074 = _7056 * _7028;
        float _7076 = _7060 * _7028;
        float _7078 = _7040 * _7028;
        float _7080 = _6922 * _7028;
        float _7082 = _6934 * _7028;
        float _7084 = _7064 * _7028;
        float _7086 = _7068 * _7028;
        _6876 = _7072;
        _7012 = _7076;
        _7016 = _7078;
        _6878 = _7080;
        _7020 = _7070;
        _7026 = _7074;
        _7004 = _7084;
        _6880 = _7082;
        _7008 = _7086;
    }
    float _7088 = _6876;
    float _7090 = _7012;
    float _7092 = _7016;
    float _7094 = _6878;
    float _7096 = _7020;
    float _7098 = _7026;
    float _7100 = _7004;
    float _7102 = _6880;
    float _7104 = _7008;
    float _7106 = _6992 * _7088;
    float _7108 = _6992 * _7090;
    float _7110 = _6992 * _7092;
    float _7112 = _6988 + _6738;
    float _7114 = fma(_6990, _7094, _7106);
    float _7116 = fma(_6990, _7096, _7108);
    float _7118 = fma(_6990, _7098, _7110);
    float _7120 = fma(_6954, _6918, _6740);
    float _7122 = fma(_7112, _7100, _7116);
    float _7124 = fma(_7112, _7102, _7114);
    float _7126 = fma(_7112, _7104, _7118);
    float _7128 = _7108;
    float _7130 = _7120;
    float _7132 = _7120;
    float _7134 = _7122;
    float _7136 = _7124;
    float _7138 = _7126;
    if (!_6752)
    {
        _7128 = _6984;
    }
    float _7140 = _7128;
    bool _7142 = !_6752;
    float _7144 = _7140;
    if (!_7142)
    {
        float _7146 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
        float _7148 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
        float _7150 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
        float _7152 = _6984 * _6984;
        float _7154 = fma(_6972, _6972, _7152);
        float _7156 = fma(_7120, _7120, _7154);
        float _7158 = sqrt(_7156);
        float _7160 = _7158 + 9.9999997473787516355514526367188e-06;
        float _7162 = 1.0 / _7160;
        float _7164 = _6972 * _7162;
        float _7166 = _6984 * _7162;
        float _7168 = _7146;
        if (_1696)
        {
            float _7170 = _7148 * _4674;
            _4736 = _7170;
        }
        float _7172 = _4736;
        float _7174 = _7172;
        if (_1696)
        {
            float _7176 = _7148 * _4698;
            _4750 = _7176;
        }
        float _7178 = _4750;
        float _7180 = _7178;
        if (_1696)
        {
            float _7182 = _7148 * _4722;
            _4768 = _7182;
        }
        float _7184 = _4768;
        float _7186 = _7120 * _7162;
        float _7188 = _7184;
        if (_1696)
        {
            float _7190 = fma(_7146, _4672, _7172);
            _7174 = _7190;
        }
        float _7192 = _7174;
        if (_1696)
        {
            float _7194 = fma(_7146, _4696, _7178);
            _7180 = _7194;
        }
        float _7196 = _7180;
        if (_1696)
        {
            float _7198 = fma(_7146, _4720, _7184);
            _7188 = _7198;
        }
        float _7200 = _7188;
        if (_1696)
        {
            float _7202 = fma(_7150, _4676, _7192);
            _4738 = _7202;
        }
        float _7204 = _4738;
        float _7206 = _7204;
        float _7208 = _7204;
        if (_1696)
        {
            float _7210 = fma(_7150, _4700, _7196);
            _4752 = _7210;
        }
        float _7212 = _4752;
        float _7214 = _7212;
        float _7216 = _7212;
        if (_1696)
        {
            float _7218 = fma(_7150, _4724, _7200);
            _4770 = _7218;
        }
        float _7220 = _4770;
        float _7222 = _7220;
        float _7224 = _7220;
        if (!_1696)
        {
            bool _7226 = !_1776;
            if (!_7226)
            {
                uint _7228 = uint(int(uint(_180) >> uint(2)));
                float _7230 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7228)]);
                int _7232 = _180 + 4;
                uint _7234 = uint(int(uint(_7232) >> uint(2)));
                float _7236 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7234)]);
                int _7238 = _180 + 8;
                uint _7240 = uint(int(uint(_7238) >> uint(2)));
                float _7242 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7240)]);
                uint _7244 = uint(int(uint(_180) >> uint(2)));
                float _7246 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7244)]);
                int _7248 = _180 + 4;
                uint _7250 = uint(int(uint(_7248) >> uint(2)));
                float _7252 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7250)]);
                int _7254 = _180 + 8;
                uint _7256 = uint(int(uint(_7254) >> uint(2)));
                float _7258 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7256)]);
                uint _7260 = uint(int(uint(_180) >> uint(2)));
                float _7262 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7260)]);
                int _7264 = _180 + 4;
                uint _7266 = uint(int(uint(_7264) >> uint(2)));
                float _7268 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7266)]);
                int _7270 = _180 + 8;
                uint _7272 = uint(int(uint(_7270) >> uint(2)));
                float _7274 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7272)]);
                float _7276 = _7236 * _7148;
                float _7278 = _7252 * _7148;
                float _7280 = _7268 * _7148;
                float _7282 = fma(_7230, _7146, _7276);
                float _7284 = fma(_7246, _7146, _7278);
                float _7286 = fma(_7262, _7146, _7280);
                float _7288 = fma(_7242, _7150, _7282);
                float _7290 = fma(_7258, _7150, _7284);
                float _7292 = fma(_7274, _7150, _7286);
                _7216 = _7290;
                _7208 = _7288;
                _7224 = _7292;
                _7294 = true;
            }
            else
            {
                if (!_1860)
                {
                    _7206 = _7146;
                }
                float _7296 = _7206;
                _7208 = _7296;
                if (!_1860)
                {
                    _7214 = _7148;
                }
                float _7298 = _7214;
                _7216 = _7298;
                if (!_1860)
                {
                    _7222 = _7150;
                }
                float _7300 = _7222;
                bool _7302 = !_1860;
                _7224 = _7300;
                if (!_7302)
                {
                    uint _7304 = uint(int(uint(_180) >> uint(2)));
                    float _7306 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7304)]);
                    int _7308 = _180 + 4;
                    uint _7310 = uint(int(uint(_7308) >> uint(2)));
                    float _7312 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7310)]);
                    int _7314 = _180 + 8;
                    uint _7316 = uint(int(uint(_7314) >> uint(2)));
                    float _7318 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7316)]);
                    uint _7320 = uint(int(uint(_180) >> uint(2)));
                    float _7322 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7320)]);
                    int _7324 = _180 + 4;
                    uint _7326 = uint(int(uint(_7324) >> uint(2)));
                    float _7328 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7326)]);
                    int _7330 = _180 + 8;
                    uint _7332 = uint(int(uint(_7330) >> uint(2)));
                    float _7334 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7332)]);
                    uint _7336 = uint(int(uint(_180) >> uint(2)));
                    float _7338 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7336)]);
                    int _7340 = _180 + 4;
                    uint _7342 = uint(int(uint(_7340) >> uint(2)));
                    float _7344 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7342)]);
                    int _7346 = _180 + 8;
                    uint _7348 = uint(int(uint(_7346) >> uint(2)));
                    float _7350 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7348)]);
                    float _7352 = _7312 * _7148;
                    float _7354 = _7328 * _7148;
                    float _7356 = _7344 * _7148;
                    float _7358 = fma(_7306, _7146, _7352);
                    float _7360 = fma(_7322, _7146, _7354);
                    float _7362 = fma(_7338, _7146, _7356);
                    float _7364 = fma(_7318, _7150, _7358);
                    float _7366 = fma(_7334, _7150, _7360);
                    float _7368 = fma(_7350, _7150, _7362);
                    _7216 = _7366;
                    _7208 = _7364;
                    _7224 = _7368;
                }
            }
        }
        _7294 = false;
        float _7370 = _7216;
        float _7372 = _7208;
        float _7374 = _7224;
        float _7376 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
        float _7378 = _7376 * 59.999996185302734375;
        float _7380 = _7370 * _7378;
        float _7382 = _7372 * _7378;
        float _7384 = _4148 * _7380;
        float _7386 = _7374 * _7378;
        float _7388 = _4148 * _7382;
        float _7390 = _7384 * _6156;
        float _7392 = _4148 * _7386;
        float _7394 = fma(_7388, _6158, _7390);
        float _7396 = fma(_7392, _6160, _7394);
        float _7398 = -_6156;
        float _7400 = fma(_7396, _7398, _7384);
        float _7402 = -_6158;
        float _7404 = fma(_7396, _7402, _7388);
        float _7406 = -_6160;
        float _7408 = fma(_7396, _7406, _7392);
        float _7410 = _7400 * _7400;
        float _7412 = fma(_7404, _7404, _7410);
        float _7414 = fma(_7408, _7408, _7412);
        float _7416 = sqrt(_7414);
        float _7418 = _7416 + 9.9999997473787516355514526367188e-06;
        float _7420 = 1.0 / _7418;
        float _7422 = _7400 * _7420;
        float _7424 = _7404 * _7420;
        float _7426 = _7408 * _7420;
        float _7428 = _6984 * _7422;
        float _7430 = fma(_6972, _7424, _7428);
        float _7432 = fma(_7120, _7426, _7430);
        float _7434 = _7432 * 0.5;
        bool _7436 = _7432 >= 0.0;
        float _7438 = float(_7436);
        float _7440 = precise::min(_7416, _7434);
        float _7442 = _7440 * _7438;
        float _7444 = -_7442;
        float _7446 = fma(_7422, _7444, _6984);
        float _7448 = -_7442;
        float _7450 = fma(_7424, _7448, _6972);
        float _7452 = -_7442;
        float _7454 = fma(_7426, _7452, _7120);
        float _7456 = _7446 * _7446;
        float _7458 = fma(_7450, _7450, _7456);
        float _7460 = fma(_7454, _7454, _7458);
        float _7462 = sqrt(_7460);
        bool _7464 = _7462 > 0.5;
        bool _7466 = isnan(_7462);
        bool _7468 = _7464 || _7466;
        bool _7470 = isnan(0.5);
        bool _7472 = _7468 || _7470;
        float _7474 = _7426;
        float _7476 = _7420;
        _6998 = _7462;
        if (!_7472)
        {
            float _7478 = _1692 * 20.0;
            _6996 = _7478;
        }
        float _7480 = _6996;
        float _7482 = _7480;
        if (_7472)
        {
            float _7484 = _1692 * 10.0;
            _2014 = _7484;
        }
        float _7486 = _2014;
        float _7488 = _7486;
        if (!_7472)
        {
            float _7490 = _4148 * _7480;
            _7482 = _7490;
        }
        float _7492 = _7482;
        float _7494 = _7492;
        if (_7472)
        {
            float _7496 = _4148 * _7486;
            _7488 = _7496;
        }
        float _7498 = _7488;
        float _7500 = _7498;
        if (!_7472)
        {
            float _7502 = _7492 * 0.01666666753590106964111328125;
            _7494 = _7502;
        }
        float _7504 = _7494;
        float _7506 = _7504;
        if (_7472)
        {
            float _7508 = _7498 * 0.01666666753590106964111328125;
            _7500 = _7508;
        }
        float _7510 = _7500;
        _2016 = _7510;
        if (!_7472)
        {
            float _7512 = precise::min(_7462, _7504);
            _7474 = _7512;
        }
        float _7514 = _7474;
        _4740 = _7514;
        if (_7472)
        {
            float _7516 = precise::min(_7462, _7510);
            _7476 = _7516;
        }
        float _7518 = _7476;
        if (!_7472)
        {
            float _7520 = -_7164;
            float _7522 = fma(_7520, _7514, _7450);
            _7506 = _7522;
        }
        float _7524 = _7506;
        float _7526 = _7524;
        if (!_7472)
        {
            float _7528 = -_7166;
            float _7530 = fma(_7528, _7514, _7446);
            _7168 = _7530;
        }
        float _7532 = _7168;
        float _7534 = _7532;
        if (!_7472)
        {
            float _7536 = -_7186;
            float _7538 = fma(_7536, _7514, _7454);
            _7130 = _7538;
        }
        float _7540 = _7130;
        _7132 = _7540;
        if (_7472)
        {
            float _7542 = -_7164;
            float _7544 = fma(_7542, _7518, _7450);
            _7526 = _7544;
        }
        float _7546 = _7526;
        _7000 = _7546;
        if (_7472)
        {
            float _7548 = -_7166;
            float _7550 = fma(_7548, _7518, _7446);
            _7534 = _7550;
        }
        float _7552 = _7534;
        _7144 = _7552;
        if (_7472)
        {
            float _7554 = -_7186;
            float _7556 = fma(_7554, _7518, _7454);
            _7132 = _7556;
        }
    }
    float _7558 = _4740;
    float _7560 = _6998;
    float _7562 = _7000;
    float _7564 = _7144;
    float _7566 = _7132;
    float _7568 = _2016;
    bool _7570 = !_1696;
    float _7572 = _7558;
    float _7574 = _7568;
    float _7576 = _7560;
    float _7578 = _7566;
    float _7652;
    float _7654;
    float _7656;
    if (!_7570)
    {
        float _7580 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _7582 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _7584 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _7586 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _7588 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _7590 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _7592 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _7594 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _7596 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _7598 = _7584 * _7586;
        float _7600 = _7584 * _7588;
        float _7602 = -_7598;
        float _7604 = fma(_7580, _7590, _7602);
        float _7606 = -_7600;
        float _7608 = fma(_7582, _7590, _7606);
        float _7610 = _7582 * _7586;
        float _7612 = _7596 * _7586;
        float _7614 = _7594 * _7604;
        float _7616 = _7592 * _7588;
        float _7618 = -_7610;
        float _7620 = fma(_7580, _7588, _7618);
        float _7622 = -_7612;
        float _7624 = fma(_7592, _7590, _7622);
        float _7626 = -_7614;
        float _7628 = fma(_7592, _7608, _7626);
        float _7630 = -_7616;
        float _7632 = fma(_7594, _7586, _7630);
        float _7634 = fma(_7596, _7620, _7628);
        float _7636 = _7594 * _7590;
        float _7638 = -_7636;
        float _7640 = fma(_7596, _7588, _7638);
        float _7642 = 1.0 / _7634;
        float _7644 = _7642 * _6742;
        float _7646 = _7640 * _7644;
        float _7648 = _7624 * _7644;
        float _7650 = _7632 * _7644;
        _7652 = _7650;
        _7654 = _7646;
        _7656 = _7648;
        _7658 = true;
    }
    else
    {
        bool _7660 = _1774 != 0;
        bool _7662 = _1858 != 0;
        bool _7664 = _7662 || _7660;
        if (!_7664)
        {
            _7572 = 0.0;
        }
        float _7666 = _7572;
        _7654 = _7666;
        if (!_7664)
        {
            _7574 = _6742;
        }
        float _7668 = _7574;
        _7656 = _7668;
        if (!_7664)
        {
            _7576 = 0.0;
        }
        float _7670 = _7576;
        bool _7672 = !_7664;
        _7652 = _7670;
        if (!_7672)
        {
            uint _7674 = uint(int(uint(_180) >> uint(2)));
            float _7676 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7674)]);
            int _7678 = _180 + 4;
            uint _7680 = uint(int(uint(_7678) >> uint(2)));
            float _7682 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7680)]);
            int _7684 = _180 + 8;
            uint _7686 = uint(int(uint(_7684) >> uint(2)));
            float _7688 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7686)]);
            uint _7690 = uint(int(uint(_180) >> uint(2)));
            float _7692 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7690)]);
            int _7694 = _180 + 4;
            uint _7696 = uint(int(uint(_7694) >> uint(2)));
            float _7698 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7696)]);
            int _7700 = _180 + 8;
            uint _7702 = uint(int(uint(_7700) >> uint(2)));
            float _7704 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7702)]);
            uint _7706 = uint(int(uint(_180) >> uint(2)));
            float _7708 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7706)]);
            int _7710 = _180 + 4;
            uint _7712 = uint(int(uint(_7710) >> uint(2)));
            float _7714 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7712)]);
            int _7716 = _180 + 8;
            uint _7718 = uint(int(uint(_7716) >> uint(2)));
            float _7720 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7718)]);
            float _7722 = _7688 * _7692;
            float _7724 = _7688 * _7698;
            float _7726 = -_7722;
            float _7728 = fma(_7676, _7704, _7726);
            float _7730 = -_7724;
            float _7732 = fma(_7682, _7704, _7730);
            float _7734 = _7682 * _7692;
            float _7736 = _7714 * _7728;
            float _7738 = -_7734;
            float _7740 = fma(_7676, _7698, _7738);
            float _7742 = _7708 * _7698;
            float _7744 = -_7736;
            float _7746 = fma(_7708, _7732, _7744);
            float _7748 = _7720 * _7692;
            float _7750 = fma(_7720, _7740, _7746);
            float _7752 = _7714 * _7704;
            float _7754 = -_7748;
            float _7756 = fma(_7708, _7704, _7754);
            float _7758 = -_7742;
            float _7760 = fma(_7714, _7692, _7758);
            float _7762 = -_7752;
            float _7764 = fma(_7720, _7698, _7762);
            float _7766 = 1.0 / _7750;
            float _7768 = _7766 * _6742;
            float _7770 = _7764 * _7768;
            float _7772 = _7756 * _7768;
            float _7774 = _7760 * _7768;
            _7652 = _7774;
            _7654 = _7770;
            _7656 = _7772;
        }
    }
    _7658 = false;
    float _7776 = _7652;
    float _7778 = _7654;
    float _7780 = _7656;
    float _7782 = _4298 + _7776;
    float _7784 = _4300 + _7778;
    float _7786 = _7562 * 0.01666666753590106964111328125;
    float _7788 = _7564 * 0.01666666753590106964111328125;
    float _7790 = _7566 * 0.01666666753590106964111328125;
    bool _7792 = !_1696;
    float _7914;
    float _7916;
    float _7918;
    if (!_7792)
    {
        float _7794 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _7796 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _7798 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _7800 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _7802 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _7804 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _7806 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _7808 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _7810 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _7812 = _7798 * _7800;
        float _7814 = _7798 * _7802;
        float _7816 = _7796 * _7800;
        float _7818 = -_7812;
        float _7820 = fma(_7794, _7804, _7818);
        float _7822 = -_7814;
        float _7824 = fma(_7796, _7804, _7822);
        float _7826 = -_7816;
        float _7828 = fma(_7794, _7802, _7826);
        float _7830 = _7810 * _7796;
        float _7832 = _7808 * _7820;
        float _7834 = _7808 * _7804;
        float _7836 = _7810 * _7800;
        float _7838 = _7806 * _7802;
        float _7840 = -_7832;
        float _7842 = fma(_7806, _7824, _7840);
        float _7844 = -_7830;
        float _7846 = fma(_7808, _7798, _7844);
        float _7848 = -_7838;
        float _7850 = fma(_7808, _7800, _7848);
        float _7852 = fma(_7810, _7828, _7842);
        float _7854 = _7808 * _7794;
        float _7856 = 1.0 / _7852;
        float _7858 = -_7854;
        float _7860 = fma(_7806, _7796, _7858);
        float _7862 = _7806 * _7798;
        float _7864 = -_7834;
        float _7866 = fma(_7810, _7802, _7864);
        float _7868 = -_7836;
        float _7870 = fma(_7806, _7804, _7868);
        float _7872 = -_7794;
        float _7874 = fma(_7872, _7804, _7812);
        float _7876 = -_7862;
        float _7878 = fma(_7810, _7794, _7876);
        float _7880 = _7866 * _7856;
        float _7882 = _7870 * _7856;
        float _7884 = _7850 * _7856;
        float _7886 = _7874 * _7856;
        float _7888 = _7788 * _7880;
        float _7890 = _7846 * _7856;
        float _7892 = _7788 * _7882;
        float _7894 = _7786 * _7856;
        float _7896 = _7788 * _7884;
        float _7898 = _7878 * _7856;
        float _7900 = fma(_7786, _7886, _7892);
        float _7902 = fma(_7824, _7894, _7888);
        float _7904 = _7860 * _7856;
        float _7906 = fma(_7828, _7894, _7896);
        float _7908 = fma(_7790, _7898, _7900);
        float _7910 = fma(_7790, _7890, _7902);
        float _7912 = fma(_7790, _7904, _7906);
        _7914 = _7910;
        _7916 = _7908;
        _7918 = _7912;
        _7920 = true;
    }
    else
    {
        bool _7922 = _1774 != 0;
        bool _7924 = _1858 != 0;
        bool _7926 = _7924 || _7922;
        if (!_7926)
        {
            _1922 = _7786;
        }
        float _7928 = _1922;
        _7914 = _7928;
        if (!_7926)
        {
            _1838 = _7788;
        }
        float _7930 = _1838;
        _7916 = _7930;
        if (!_7926)
        {
            _7578 = _7790;
        }
        float _7932 = _7578;
        bool _7934 = !_7926;
        _7918 = _7932;
        if (!_7934)
        {
            uint _7936 = uint(int(uint(_180) >> uint(2)));
            float _7938 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7936)]);
            int _7940 = _180 + 4;
            uint _7942 = uint(int(uint(_7940) >> uint(2)));
            float _7944 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7942)]);
            int _7946 = _180 + 8;
            uint _7948 = uint(int(uint(_7946) >> uint(2)));
            float _7950 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7948)]);
            uint _7952 = uint(int(uint(_180) >> uint(2)));
            float _7954 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7952)]);
            int _7956 = _180 + 4;
            uint _7958 = uint(int(uint(_7956) >> uint(2)));
            float _7960 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7958)]);
            int _7962 = _180 + 8;
            uint _7964 = uint(int(uint(_7962) >> uint(2)));
            float _7966 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7964)]);
            uint _7968 = uint(int(uint(_180) >> uint(2)));
            float _7970 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7968)]);
            int _7972 = _180 + 4;
            uint _7974 = uint(int(uint(_7972) >> uint(2)));
            float _7976 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7974)]);
            int _7978 = _180 + 8;
            uint _7980 = uint(int(uint(_7978) >> uint(2)));
            float _7982 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7980)]);
            float _7984 = _7950 * _7954;
            float _7986 = _7950 * _7960;
            float _7988 = _7944 * _7954;
            float _7990 = -_7984;
            float _7992 = fma(_7938, _7966, _7990);
            float _7994 = -_7986;
            float _7996 = fma(_7944, _7966, _7994);
            float _7998 = -_7988;
            float _8000 = fma(_7938, _7960, _7998);
            float _8002 = _7976 * _7938;
            float _8004 = _7976 * _7992;
            float _8006 = _7982 * _7944;
            float _8008 = _7982 * _7954;
            float _8010 = -_8002;
            float _8012 = fma(_7970, _7944, _8010);
            float _8014 = -_8004;
            float _8016 = fma(_7970, _7996, _8014);
            float _8018 = _7976 * _7966;
            float _8020 = _7970 * _7960;
            float _8022 = -_8006;
            float _8024 = fma(_7976, _7950, _8022);
            float _8026 = fma(_7982, _8000, _8016);
            float _8028 = -_8008;
            float _8030 = fma(_7970, _7966, _8028);
            float _8032 = -_8018;
            float _8034 = fma(_7982, _7960, _8032);
            float _8036 = -_8020;
            float _8038 = fma(_7976, _7954, _8036);
            float _8040 = 1.0 / _8026;
            float _8042 = _7970 * _7950;
            float _8044 = -_8042;
            float _8046 = fma(_7982, _7938, _8044);
            float _8048 = _8030 * _8040;
            float _8050 = _8034 * _8040;
            float _8052 = _8038 * _8040;
            float _8054 = -_7938;
            float _8056 = fma(_8054, _7966, _7984);
            float _8058 = _8048 * _7788;
            float _8060 = _8050 * _7788;
            float _8062 = _8052 * _7788;
            float _8064 = _7786 * _8040;
            float _8066 = _8056 * _8040;
            float _8068 = _8024 * _8040;
            float _8070 = _8046 * _8040;
            float _8072 = _8012 * _8040;
            float _8074 = fma(_7996, _8064, _8060);
            float _8076 = fma(_8066, _7786, _8058);
            float _8078 = fma(_8000, _8064, _8062);
            float _8080 = fma(_8068, _7790, _8074);
            float _8082 = fma(_8070, _7790, _8076);
            float _8084 = fma(_8072, _7790, _8078);
            _7914 = _8080;
            _7916 = _8082;
            _7918 = _8084;
        }
    }
    _7920 = false;
    float _8086 = _7914;
    float _8088 = _7916;
    float _8090 = _7918;
    float _8092 = _7122 * _7122;
    float _8094 = _4148 * (-0.0291463173925876617431640625);
    float _8096 = fma(_7124, _7124, _8092);
    float _8098 = exp2(_8094);
    float _8100 = fma(_7126, _7126, _8096);
    float _8102 = sqrt(_8100);
    float _8104 = _8102 * 0.01666666753590106964111328125;
    bool _8106 = _8104 > 1.57079637050628662109375;
    float _8108 = _8104;
    if (_8106)
    {
        float _8110 = rsqrt(_8100);
        _8108 = _8110;
    }
    float _8112 = _8108;
    float _8114 = _8112;
    if (_8106)
    {
        float _8116 = _8112 * 94.24777984619140625;
        _8114 = _8116;
    }
    float _8118 = _8114;
    if (_8106)
    {
        float _8120 = _7122 * _8118;
        _7134 = _8120;
    }
    float _8122 = _7134;
    if (_8106)
    {
        float _8124 = _7124 * _8118;
        _7136 = _8124;
    }
    float _8126 = _7136;
    if (_8106)
    {
        float _8128 = _7126 * _8118;
        _7138 = _8128;
    }
    float _8130 = _7138;
    float _8132 = fma(_6954, _8122, _6744);
    float _8134 = fma(_6954, _8126, _6746);
    float _8136 = fma(_6954, _8130, _6748);
    float _8138 = _8132 * _8098;
    float _8140 = _8134 * _8098;
    float _8142 = _8136 * _8098;
    float _8144 = _8138 * _8138;
    float _8146 = fma(_8140, _8140, _8144);
    float _8148 = fma(_8142, _8142, _8146);
    float _8150 = sqrt(_8148);
    bool _8152 = _8150 > 31.4159259796142578125;
    float _8154 = _8150;
    float _8156 = _8138;
    float _8158 = _8140;
    float _8160 = _8142;
    if (_8152)
    {
        float _8162 = rsqrt(_8148);
        _8154 = _8162;
    }
    float _8164 = _8154;
    float _8166 = _8164;
    if (_8152)
    {
        float _8168 = _8164 * 31.4159259796142578125;
        _8166 = _8168;
    }
    float _8170 = _8166;
    if (_8152)
    {
        float _8172 = _8138 * _8170;
        _8156 = _8172;
    }
    float _8174 = _8156;
    if (_8152)
    {
        float _8176 = _8140 * _8170;
        _8158 = _8176;
    }
    float _8178 = _8158;
    if (_8152)
    {
        float _8180 = _8142 * _8170;
        _8160 = _8180;
    }
    float _8182 = _8160;
    float _8184 = _6954 * _8174;
    float _8186 = _6954 * _8178;
    float _8188 = _6954 * _8182;
    float _8190 = _8184 * _8184;
    float _8192 = fma(_8186, _8186, _8190);
    float _8194 = fma(_8188, _8188, _8192);
    float _8196 = sqrt(_8194);
    float _8198 = rsqrt(_8194);
    float _8200 = _8196 * 0.5;
    bool _8202 = _8196 != 0.0;
    bool _8204 = isnan(_8196);
    bool _8206 = _8202 || _8204;
    bool _8208 = isnan(0.0);
    bool _8210 = _8206 || _8208;
    float _8212 = _8200 * 0.15915493667125701904296875;
    float _8214 = _8212 * 6.283185482025146484375;
    float _8216 = sin(_8214);
    float _8218 = _8188 * _8198;
    float _8220 = _8184 * _8198;
    float _8222 = _8186 * _8198;
    float _8224 = _8210 ? _8218 : 0.0;
    float _8226 = _8212 * 6.283185482025146484375;
    float _8228 = cos(_8226);
    float _8230 = _8210 ? _8220 : 0.0;
    float _8232 = _8210 ? _8222 : 0.0;
    float _8234 = _8224 * _8216;
    float _8236 = _8230 * _8216;
    float _8238 = _8232 * _8216;
    float _8240 = _8234 * _4130;
    float _8242 = _8236 * _4118;
    float _8244 = _8236 * _4124;
    float _8246 = _8236 * _4130;
    float _8248 = -_8240;
    float _8250 = fma(_8236, _4126, _8248);
    float _8252 = fma(_8228, _4130, _8242);
    float _8254 = -_8244;
    float _8256 = fma(_8238, _4130, _8254);
    float _8258 = _8238 * _4118;
    float _8260 = _8238 * _4126;
    float _8262 = _8234 * _4118;
    float _8264 = fma(_8238, _4124, _8246);
    float _8266 = fma(_8228, _4124, _8258);
    float _8268 = -_8260;
    float _8270 = fma(_8234, _4124, _8268);
    float _8272 = fma(_8228, _4126, _8262);
    float _8274 = fma(_8234, _4126, _8264);
    float _8276 = _8266 + _8250;
    float _8278 = _8252 + _8270;
    float _8280 = _8272 + _8256;
    float _8282 = -_8274;
    float _8284 = fma(_8228, _4118, _8282);
    uint _8286 = uint(int(uint(_1662) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8286)] = as_type<uint>(_8276);
    int _8288 = _1662 + 4;
    uint _8290 = uint(int(uint(_8288) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8290)] = as_type<uint>(_8278);
    int _8292 = _1662 + 8;
    uint _8294 = uint(int(uint(_8292) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8294)] = as_type<uint>(_8280);
    int _8296 = _1662 + 12;
    uint _8298 = uint(int(uint(_8296) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8298)] = as_type<uint>(_8284);
    uint _8300 = uint(int(uint(_1778) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8300)] = as_type<uint>(_8178);
    int _8302 = _1778 + 4;
    uint _8304 = uint(int(uint(_8302) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8304)] = as_type<uint>(_8174);
    int _8306 = _1778 + 8;
    uint _8308 = uint(int(uint(_8306) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8308)] = as_type<uint>(_8182);
    int _8310 = _1778 + 12;
    uint _8312 = uint(int(uint(_8310) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8312)] = as_type<uint>(_6722);
    float _8314 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[71]);
    float _8316 = -_240;
    float _8318 = _8316 + _7784;
    uint _8320 = uint(int(uint(_184) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_8320)] = uint(_2550);
    float _8322 = -_252;
    float _8324 = _8322 + _7782;
    int _8326 = _180 + 8;
    uint _8328 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_8328)] = as_type<uint>(_7784);
    float _8330 = _4296 + _8314;
    int _8332 = _180 + 4;
    float _8334 = _8330 + _7780;
    float _8336 = -_246;
    float _8338 = _8336 + _8334;
    uint _8340 = uint(int(uint(_8332) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_8340)] = as_type<uint>(_8334);
    uint _8342 = uint(int(uint(_8326) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_8342)] = as_type<uint>(_7782);
    uint _8344 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_8344)] = as_type<uint>(_8086);
    uint _8346 = uint(int(uint(_8332) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_8346)] = as_type<uint>(_8088);
    uint _8348 = uint(int(uint(_8326) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_8348)] = as_type<uint>(_8090);
    uint _8350 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_8350)] = as_type<uint>(_8318);
    uint _8352 = uint(int(uint(_8332) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_8352)] = as_type<uint>(_8338);
    uint _8354 = uint(int(uint(_8326) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_8354)] = as_type<uint>(_8324);
    float _8356 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _8358 = _8338 * _8338;
    float _8360 = _8088 * _8088;
    float _8362 = fma(_8318, _8318, _8358);
    float _8364 = fma(_8086, _8086, _8360);
    float _8366 = fma(_8324, _8324, _8362);
    float _8368 = fma(_8090, _8090, _8364);
    float _8370 = sqrt(_8366);
    float _8372 = sqrt(_8368);
    bool _8374 = _8370 >= 9.9999999747524270787835121154785e-07;
    bool _8376 = isnan(_8370);
    bool _8378 = _8374 || _8376;
    bool _8380 = isnan(9.9999999747524270787835121154785e-07);
    bool _8382 = _8378 || _8380;
    float _8384 = _8368;
    if (!_8382)
    {
        bool _8386 = _190 != _194;
        bool _8388 = isnan(_190);
        bool _8390 = _8386 || _8388;
        bool _8392 = isnan(_194);
        bool _8394 = _8390 || _8392;
        _8396 = _8394;
        if (!_8396)
        {
            float _8398 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
            bool _8400 = _8398 > 0.0;
            bool _8402 = !_8400;
            if (!_8402)
            {
                float _8404 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
                float _8406 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
                float _8408 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
                float _8410 = _8406 * _8406;
                float _8412 = fma(_8404, _8404, _8410);
                float _8414 = fma(_8408, _8408, _8412);
                float _8416 = rsqrt(_8414);
                float _8418 = _8416 * 9.9999999747524270787835121154785e-07;
                float _8420 = _8404 * _8418;
                float _8422 = _8406 * _8418;
                float _8424 = _8408 * _8418;
                _426 = as_type<int>(_8420);
                _428 = as_type<int>(_8422);
                _430 = as_type<int>(_8424);
                _8396 = true;
            }
            else
            {
                bool _8426 = _8372 >= 9.9999999747524270787835121154785e-07;
                bool _8428 = isnan(_8372);
                bool _8430 = _8426 || _8428;
                bool _8432 = isnan(9.9999999747524270787835121154785e-07);
                bool _8434 = _8430 || _8432;
                if (!_8434)
                {
                    float _8436 = _8334 * _8334;
                    float _8438 = fma(_7784, _7784, _8436);
                    float _8440 = fma(_7782, _7782, _8438);
                    float _8442 = sqrt(_8440);
                    bool _8444 = _8442 >= 9.9999999747524270787835121154785e-07;
                    bool _8446 = isnan(_8442);
                    bool _8448 = _8444 || _8446;
                    bool _8450 = isnan(9.9999999747524270787835121154785e-07);
                    bool _8452 = _8448 || _8450;
                    float _8454 = _8442;
                    if (_8452)
                    {
                        float _8456 = rsqrt(_8440);
                        _8454 = _8456;
                    }
                    float _8458 = _8454;
                    if (!_8452)
                    {
                        _414 = 0;
                    }
                    int _8460 = _414;
                    int _8462 = _8460;
                    if (!_8452)
                    {
                        _416 = 897988541;
                    }
                    int _8464 = _416;
                    int _8466 = _8464;
                    if (!_8452)
                    {
                        _418 = 0;
                    }
                    int _8468 = _418;
                    int _8470 = _8468;
                    if (_8452)
                    {
                        float _8472 = _8458 * 9.9999999747524270787835121154785e-07;
                        _8384 = _8472;
                    }
                    float _8474 = _8384;
                    if (_8452)
                    {
                        float _8476 = _7784 * _8474;
                        _8462 = as_type<int>(_8476);
                    }
                    int _8478 = _8462;
                    _426 = _8478;
                    if (_8452)
                    {
                        float _8480 = _8334 * _8474;
                        _8466 = as_type<int>(_8480);
                    }
                    int _8482 = _8466;
                    _428 = _8482;
                    if (_8452)
                    {
                        float _8484 = _7782 * _8474;
                        _8470 = as_type<int>(_8484);
                    }
                    int _8486 = _8470;
                    _430 = _8486;
                    _8396 = true;
                }
                else
                {
                    float _8488 = rsqrt(_8368);
                    float _8490 = _8488 * 9.9999999747524270787835121154785e-07;
                    float _8492 = _8086 * _8490;
                    float _8494 = _8088 * _8490;
                    float _8496 = _8090 * _8490;
                    _426 = as_type<int>(_8492);
                    _428 = as_type<int>(_8494);
                    _430 = as_type<int>(_8496);
                    _8396 = true;
                }
            }
        }
    }
    else
    {
        float _8498 = _8372 * _8356;
        bool _8500 = _8498 >= 0.001000000047497451305389404296875;
        bool _8502 = isnan(_8498);
        bool _8504 = _8500 || _8502;
        bool _8506 = isnan(0.001000000047497451305389404296875);
        bool _8508 = _8504 || _8506;
        bool _8510 = _8498 > 0.0;
        bool _8512 = !_8508;
        bool _8514 = _8510 && _8512;
        bool _8516 = _8370 < 0.001000000047497451305389404296875;
        bool _8518 = _8516 && _8514;
        if (!_8518)
        {
            _420 = as_type<int>(_8318);
        }
        int _8520 = _420;
        int _8522 = _8520;
        if (_8518)
        {
            float _8524 = _8356 * _8086;
            _8522 = as_type<int>(_8524);
        }
        int _8526 = _8522;
        _426 = _8526;
        if (!_8518)
        {
            _422 = as_type<int>(_8338);
        }
        int _8528 = _422;
        int _8530 = _8528;
        if (_8518)
        {
            float _8532 = _8356 * _8088;
            _8530 = as_type<int>(_8532);
        }
        int _8534 = _8530;
        _428 = _8534;
        if (!_8518)
        {
            _424 = as_type<int>(_8324);
        }
        int _8536 = _424;
        _430 = _8536;
        if (_8518)
        {
            float _8538 = _8356 * _8090;
            _430 = as_type<int>(_8538);
        }
    }
    _8396 = false;
    int _8540 = _426;
    int _8542 = _428;
    int _8544 = _430;
    uint _8546 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_8546)] = uint(_8540);
    uint _8548 = uint(int(uint(_8332) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_8548)] = uint(_8542);
    uint _8550 = uint(int(uint(_8326) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_8550)] = uint(_8544);
}

