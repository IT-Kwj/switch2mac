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
void _87(thread const int& _24346, thread const int& _24347, thread const int& _24348, thread const int& _24349, thread int& _24350, thread int& _24351, thread int& _24352, thread int& _24353, thread int& _24354)
{
    float _24357 = as_type<float>(_24348) + 0.0;
    bool _24359 = _24357 != 0.0;
    bool _24361 = isnan(_24357);
    bool _24363 = _24359 || _24361;
    bool _24365 = isnan(0.0);
    bool _24367 = _24363 || _24365;
    int _24369 = as_type<int>(_24357);
    int _24371 = _24347;
    int _24373 = _24367 ? (-1) : 0;
    if (!_24367)
    {
        float _24375 = as_type<float>(_24348) * 1.0;
        _24369 = as_type<int>(_24375);
    }
    int _24377 = _24369;
    bool _24379 = !_24367;
    int _24381 = _24377;
    if (!_24379)
    {
        float _24383 = as_type<float>(_24348) + 0.0;
        bool _24385 = _24383 >= 0.0;
        bool _24387 = isnan(_24383);
        bool _24389 = _24385 || _24387;
        bool _24391 = isnan(0.0);
        bool _24393 = _24389 || _24391;
        int _24395 = as_type<int>(_24383);
        _24373 = _24393 ? (-1) : 0;
        if (!_24393)
        {
            _24395 = 2147483647;
        }
        int _24397 = _24395;
        bool _24399 = !_24393;
        _24381 = _24397;
        if (!_24399)
        {
            float _24401 = as_type<float>(_24348) + 0.0;
            bool _24403 = _24401 > as_type<float>(0x7f800000u /* inf */);
            bool _24405 = isnan(_24401);
            bool _24407 = _24403 || _24405;
            bool _24409 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _24411 = _24407 || _24409;
            int _24413 = as_type<int>(_24401);
            _24373 = _24411 ? (-1) : 0;
            if (_24411)
            {
                float _24415 = as_type<float>(_24348) + 1.0;
                _24413 = as_type<int>(_24415);
            }
            int _24417 = _24413;
            _24381 = _24417;
            if (!_24411)
            {
                float _24419 = 0.0 + as_type<float>(_24348);
                bool _24421 = _24419 != as_type<float>(0x7f800000u /* inf */);
                bool _24423 = isnan(_24419);
                bool _24425 = _24421 || _24423;
                bool _24427 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _24429 = _24425 || _24427;
                int _24431 = as_type<int>(_24419);
                _24373 = _24429 ? (-1) : 0;
                if (!_24429)
                {
                    _24431 = _24348;
                }
                int _24433 = _24431;
                bool _24435 = !_24429;
                _24381 = _24433;
                if (!_24435)
                {
                    float _24437 = as_type<float>(_24348) * 18446744073709551616.0;
                    float _24439 = rsqrt(_24437);
                    float _24441 = _24437 * _24439;
                    float _24443 = _24439 * 0.5;
                    float _24445 = -_24441;
                    float _24447 = 0.0 + _24445;
                    float _24449 = fma(_24443, _24447, 0.5);
                    float _24451 = fma(_24441, _24449, _24441);
                    float _24453 = -_24451;
                    float _24455 = 0.0 + _24453;
                    float _24457 = fma(_24451, _24455, _24437);
                    float _24459 = fma(_24443, _24457, _24451);
                    float _24461 = _24459 * 2.3283064365386962890625e-10;
                    _24381 = as_type<int>(_24461);
                    _24371 = as_type<int>(_24451);
                }
            }
        }
    }
    int _24463 = _24381;
    int _24465 = _24371;
    int _24467 = _24373;
    _24350 = _24463;
    _24351 = _24349;
    _24352 = 0;
    _24353 = _24465;
    _24354 = _24467;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _9650 = false;
    bool _7994 = false;
    bool _7680 = false;
    bool _7264 = false;
    bool _6590 = false;
    bool _6420 = false;
    bool _6064 = false;
    bool _5126 = false;
    bool _4872 = false;
    bool _4490 = false;
    bool _3596 = false;
    bool _2944 = false;
    bool _2986 = false;
    bool _2774 = false;
    bool _550 = false;
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
    float _180 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[68]);
    int _182 = _99 << 4;
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[85]);
    int _186 = _182 + 12;
    float _188 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    uint _190 = uint(int(uint(_186) >> uint(2)));
    float _192 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_190)]);
    float _194 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[84]);
    uint _198 = uint(int(uint(_182) >> uint(2)));
    float _200 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_198)]);
    int _202 = _182 + 4;
    uint _204 = uint(int(uint(_202) >> uint(2)));
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_204)]);
    float _208 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    float _210 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
    float _212 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
    float _214 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
    float _216 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
    uint _218 = uint(int(uint(_182) >> uint(2)));
    float _220 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_218)]);
    int _222 = _182 + 4;
    uint _224 = uint(int(uint(_222) >> uint(2)));
    float _226 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_224)]);
    int _228 = _182 + 8;
    uint _230 = uint(int(uint(_228) >> uint(2)));
    float _232 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_230)]);
    uint _234 = uint(int(uint(_186) >> uint(2)));
    float _236 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_234)]);
    uint _238 = uint(int(uint(_182) >> uint(2)));
    float _240 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_238)]);
    int _242 = _182 + 4;
    uint _244 = uint(int(uint(_242) >> uint(2)));
    float _246 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_244)]);
    int _248 = _182 + 8;
    uint _250 = uint(int(uint(_248) >> uint(2)));
    float _252 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_250)]);
    float _254 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[128]);
    float _256 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[129]);
    float _258 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[130]);
    float _260 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[131]);
    uint _262 = uint(int(uint(_182) >> uint(2)));
    float _264 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_262)]);
    int _266 = _182 + 4;
    uint _268 = uint(int(uint(_266) >> uint(2)));
    float _270 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_268)]);
    int _272 = _182 + 8;
    uint _274 = uint(int(uint(_272) >> uint(2)));
    float _276 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_274)]);
    uint _278 = uint(int(uint(_186) >> uint(2)));
    float _280 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_278)]);
    bool _282 = _178 > 0.0;
    float _284 = abs(_180);
    float _286 = log2(_284);
    bool _288 = _184 > 0.0;
    float _290 = 0.0;
    float _292 = _196;
    float _294 = _210;
    float _296 = _216;
    float _298 = _220;
    float _300 = _226;
    float _302 = _232;
    float _304 = _236;
    float _306 = _208;
    float _308 = _254;
    float _310 = _256;
    float _312 = _258;
    float _314 = _260;
    if (_282)
    {
        float _316 = 1.0 / _178;
        _290 = _316;
    }
    float _318 = _290;
    float _320 = -_192;
    float _322 = _188 + _320;
    float _324 = _194 * _286;
    float _326 = _196 * _184;
    float _328 = exp2(_324);
    float _330 = 0.0;
    float _332 = _322;
    if (_282)
    {
        float _334 = _322 * _318;
        _330 = _334;
    }
    float _336 = _330;
    if (_288)
    {
        float _338 = -_326;
        float _340 = fma(_200, _338, _196);
        _292 = _340;
    }
    float _342 = _292;
    int _344 = as_type<int>(_208) & 512;
    bool _346 = _344 != 0;
    float _348 = _194 * _210;
    float _350 = _342;
    bool _352 = _346;
    if (_282)
    {
        float _354 = precise::min(_336, 1.0);
        _294 = _354;
    }
    float _356 = _294;
    float _358 = _212 * _348;
    float _360 = _358;
    if (_282)
    {
        float _362 = _356 * _342;
        _350 = _362;
    }
    float _364 = _350;
    float _366 = _214 * _348;
    float _368 = _216 * _348;
    float _370 = _236 * _194;
    float _372 = _194 * _364;
    float _374 = fma(_220, _328, _358);
    float _376 = fma(_226, _328, _366);
    float _378 = fma(_232, _328, _368);
    float _380 = fma(_220, _370, _240);
    float _382 = fma(_226, _370, _246);
    float _384 = fma(_232, _370, _252);
    float _386 = _254 * _372;
    float _388 = _256 * _372;
    float _390 = _258 * _372;
    bool _392 = !_346;
    float _394 = _328;
    float _396 = _366;
    float _398 = _370;
    float _400 = _372;
    float _402 = _384;
    float _404 = _388;
    int _406 = as_type<int>(_264);
    int _408 = as_type<int>(_270);
    int _410 = as_type<int>(_276);
    int _412 = as_type<int>(_264);
    int _414 = as_type<int>(_270);
    int _416 = as_type<int>(_276);
    int _418 = as_type<int>(_264);
    int _420 = as_type<int>(_270);
    int _422 = as_type<int>(_276);
    float _544;
    float _546;
    float _548;
    if (!_392)
    {
        float _424 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _426 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _428 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _430 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _432 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _434 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _436 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _438 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _440 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _442 = _428 * _430;
        float _444 = _428 * _432;
        float _446 = _426 * _430;
        float _448 = -_442;
        float _450 = fma(_424, _434, _448);
        float _452 = -_444;
        float _454 = fma(_426, _434, _452);
        float _456 = -_446;
        float _458 = fma(_424, _432, _456);
        float _460 = _438 * _424;
        float _462 = _438 * _450;
        float _464 = _440 * _426;
        float _466 = _436 * _432;
        float _468 = -_460;
        float _470 = fma(_436, _426, _468);
        float _472 = -_462;
        float _474 = fma(_436, _454, _472);
        float _476 = _438 * _434;
        float _478 = _440 * _430;
        float _480 = -_466;
        float _482 = fma(_438, _430, _480);
        float _484 = fma(_440, _458, _474);
        float _486 = -_476;
        float _488 = fma(_440, _432, _486);
        float _490 = -_478;
        float _492 = fma(_436, _434, _490);
        float _494 = _436 * _428;
        float _496 = 1.0 / _484;
        float _498 = -_424;
        float _500 = fma(_498, _434, _442);
        float _502 = -_464;
        float _504 = fma(_438, _428, _502);
        float _506 = -_494;
        float _508 = fma(_440, _424, _506);
        float _510 = _488 * _496;
        float _512 = _492 * _496;
        float _514 = _482 * _496;
        float _516 = _386 * _496;
        float _518 = _388 * _510;
        float _520 = _388 * _512;
        float _522 = _388 * _514;
        float _524 = _500 * _496;
        float _526 = _504 * _496;
        float _528 = fma(_454, _516, _518);
        float _530 = _508 * _496;
        float _532 = _470 * _496;
        float _534 = fma(_386, _524, _520);
        float _536 = fma(_458, _516, _522);
        float _538 = fma(_390, _526, _528);
        float _540 = fma(_390, _530, _534);
        float _542 = fma(_390, _532, _536);
        _298 = _424;
        _300 = _510;
        _302 = _428;
        _398 = _442;
        _304 = _436;
        _400 = _438;
        _306 = _440;
        _360 = _484;
        _308 = _536;
        _310 = _516;
        _312 = _534;
        _314 = _528;
        _544 = _540;
        _546 = _538;
        _548 = _542;
        _550 = true;
    }
    else
    {
        int _552 = as_type<int>(_208) & 1024;
        bool _554 = _552 != 0;
        if (_554)
        {
            _352 = true;
        }
        bool _556 = _352;
        bool _558 = _556;
        if (!_554)
        {
            int _560 = as_type<int>(_208) & 2048;
            bool _562 = _560 != 0;
            _558 = _562;
        }
        bool _564 = _558;
        if (!_564)
        {
            _296 = _386;
        }
        float _566 = _296;
        _546 = _566;
        if (!_564)
        {
            _394 = _388;
        }
        float _568 = _394;
        _544 = _568;
        if (!_564)
        {
            _396 = _390;
        }
        float _570 = _396;
        bool _572 = !_564;
        _548 = _570;
        if (!_572)
        {
            uint _574 = uint(int(uint(_182) >> uint(2)));
            float _576 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_574)]);
            int _578 = _182 + 4;
            uint _580 = uint(int(uint(_578) >> uint(2)));
            float _582 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_580)]);
            int _584 = _182 + 8;
            uint _586 = uint(int(uint(_584) >> uint(2)));
            float _588 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_586)]);
            uint _590 = uint(int(uint(_182) >> uint(2)));
            float _592 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_590)]);
            int _594 = _182 + 4;
            uint _596 = uint(int(uint(_594) >> uint(2)));
            float _598 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_596)]);
            int _600 = _182 + 8;
            uint _602 = uint(int(uint(_600) >> uint(2)));
            float _604 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_602)]);
            uint _606 = uint(int(uint(_182) >> uint(2)));
            float _608 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_606)]);
            int _610 = _182 + 4;
            uint _612 = uint(int(uint(_610) >> uint(2)));
            float _614 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_612)]);
            int _616 = _182 + 8;
            uint _618 = uint(int(uint(_616) >> uint(2)));
            float _620 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_618)]);
            float _622 = _588 * _592;
            float _624 = _588 * _598;
            float _626 = _582 * _592;
            float _628 = -_622;
            float _630 = fma(_576, _604, _628);
            float _632 = -_624;
            float _634 = fma(_582, _604, _632);
            float _636 = -_626;
            float _638 = fma(_576, _598, _636);
            float _640 = _614 * _576;
            float _642 = _614 * _630;
            float _644 = _620 * _582;
            float _646 = _608 * _598;
            float _648 = -_640;
            float _650 = fma(_608, _582, _648);
            float _652 = -_642;
            float _654 = fma(_608, _634, _652);
            float _656 = _614 * _604;
            float _658 = _620 * _592;
            float _660 = -_646;
            float _662 = fma(_614, _592, _660);
            float _664 = fma(_620, _638, _654);
            float _666 = -_656;
            float _668 = fma(_620, _598, _666);
            float _670 = -_658;
            float _672 = fma(_608, _604, _670);
            float _674 = _608 * _588;
            float _676 = 1.0 / _664;
            float _678 = -_576;
            float _680 = fma(_678, _604, _622);
            float _682 = -_644;
            float _684 = fma(_614, _588, _682);
            float _686 = -_674;
            float _688 = fma(_620, _576, _686);
            float _690 = _668 * _676;
            float _692 = _672 * _676;
            float _694 = _662 * _676;
            float _696 = _386 * _676;
            float _698 = _388 * _690;
            float _700 = _388 * _692;
            float _702 = _388 * _694;
            float _704 = _680 * _676;
            float _706 = _684 * _676;
            float _708 = fma(_634, _696, _698);
            float _710 = _688 * _676;
            float _712 = _650 * _676;
            float _714 = fma(_386, _704, _700);
            float _716 = fma(_638, _696, _702);
            float _718 = fma(_390, _706, _708);
            float _720 = fma(_390, _710, _714);
            float _722 = fma(_390, _712, _716);
            _298 = _576;
            _300 = _690;
            _302 = _588;
            _398 = _622;
            _304 = _608;
            _400 = _614;
            _306 = _620;
            _360 = _664;
            _308 = _716;
            _310 = _696;
            _312 = _714;
            _314 = _708;
            _544 = _720;
            _546 = _718;
            _548 = _722;
        }
    }
    _550 = false;
    float _724 = _298;
    float _726 = _300;
    float _728 = _302;
    float _730 = _398;
    float _732 = _304;
    float _734 = _400;
    float _736 = _306;
    float _738 = _360;
    float _740 = _308;
    float _742 = _310;
    float _744 = _312;
    float _746 = _314;
    float _748 = _544;
    float _750 = _546;
    float _752 = _548;
    uint _754 = uint(int(uint(_186) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_754)] = as_type<uint>(_280);
    float _756 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    int _758 = as_type<int>(_756) & 512;
    bool _760 = _758 != 0;
    int _762 = as_type<int>(_756) & 1024;
    bool _764 = _762 != 0;
    float _766 = _724;
    float _768 = _726;
    float _770 = _728;
    float _772 = _730;
    float _774 = _748;
    float _776 = _750;
    bool _778 = false;
    if (_760)
    {
        float _780 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _782 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _784 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _786 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _766 = _780;
        _768 = _782;
        _770 = _784;
        _772 = _786;
    }
    float _788 = _766;
    float _790 = _768;
    float _792 = _770;
    float _794 = _772;
    float _796 = _732;
    float _798 = _734;
    float _800 = _736;
    float _802 = _738;
    if (_760)
    {
        float _804 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _806 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _808 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _810 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _796 = _804;
        _798 = _806;
        _800 = _808;
        _802 = _810;
    }
    float _812 = _796;
    float _814 = _798;
    float _816 = _800;
    float _818 = _802;
    float _820 = _740;
    float _822 = _742;
    float _824 = _744;
    float _826 = _746;
    if (_760)
    {
        float _828 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _830 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _832 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _834 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _820 = _828;
        _822 = _830;
        _824 = _832;
        _826 = _834;
    }
    float _836 = _820;
    float _838 = _822;
    float _840 = _824;
    float _842 = _826;
    float _844 = _382 + _748;
    float _846 = _380 + _750;
    float _848 = _384 + _752;
    float _850 = _844;
    float _852 = _846;
    if (!_760)
    {
        _402 = 0.0;
    }
    float _854 = _402;
    float _856 = _854;
    if (!_760)
    {
        _404 = 0.0;
    }
    float _858 = _404;
    float _860 = _858;
    if (!_760)
    {
        _774 = 0.0;
    }
    float _862 = _774;
    int _864 = as_type<int>(_756) & 2048;
    bool _866 = _864 != 0;
    float _868 = _788;
    float _870 = _862;
    if (_760)
    {
        float _872 = _844 * _790;
        _776 = _872;
    }
    float _874 = _776;
    float _876 = _814;
    float _878 = _838;
    float _880 = _836;
    float _882 = _816;
    if (_760)
    {
        float _884 = _844 * _814;
        _876 = _884;
    }
    float _886 = _876;
    float _888 = _886;
    if (_760)
    {
        float _890 = fma(_846, _788, _874);
        _868 = _890;
    }
    float _892 = _868;
    float _894 = _892;
    if (_760)
    {
        float _896 = _844 * _838;
        _878 = _896;
    }
    float _898 = _878;
    if (_760)
    {
        float _900 = fma(_846, _812, _886);
        _888 = _900;
    }
    float _902 = _888;
    if (_760)
    {
        float _904 = fma(_848, _792, _892);
        _894 = _904;
    }
    float _906 = _894;
    if (_760)
    {
        float _908 = fma(_846, _836, _898);
        _880 = _908;
    }
    float _910 = _880;
    float _912 = _910;
    if (_760)
    {
        float _914 = fma(_848, _816, _902);
        _882 = _914;
    }
    float _916 = _882;
    if (_760)
    {
        float _918 = _794 + _906;
        _856 = _918;
    }
    float _920 = _856;
    float _922 = _920;
    if (_760)
    {
        float _924 = fma(_848, _840, _910);
        _912 = _924;
    }
    float _926 = _912;
    if (_760)
    {
        float _928 = _818 + _916;
        _860 = _928;
    }
    float _930 = _860;
    float _932 = _930;
    if (_760)
    {
        float _934 = _842 + _926;
        _870 = _934;
    }
    float _936 = _870;
    bool _938 = !_764;
    float _940 = _936;
    if (!_938)
    {
        float _942 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _944 = uint(int(uint(_182) >> uint(2)));
        float _946 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_944)]);
        int _948 = _182 + 4;
        uint _950 = uint(int(uint(_948) >> uint(2)));
        float _952 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_950)]);
        int _954 = _182 + 8;
        uint _956 = uint(int(uint(_954) >> uint(2)));
        float _958 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_956)]);
        uint _960 = uint(int(uint(_182) >> uint(2)));
        float _962 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_960)]);
        int _964 = _182 + 4;
        uint _966 = uint(int(uint(_964) >> uint(2)));
        float _968 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_966)]);
        int _970 = _182 + 8;
        uint _972 = uint(int(uint(_970) >> uint(2)));
        float _974 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_972)]);
        uint _976 = uint(int(uint(_182) >> uint(2)));
        float _978 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_976)]);
        int _980 = _182 + 4;
        uint _982 = uint(int(uint(_980) >> uint(2)));
        float _984 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_982)]);
        int _986 = _182 + 8;
        uint _988 = uint(int(uint(_986) >> uint(2)));
        float _990 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_988)]);
        float _992 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _994 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _996 = _844 * _952;
        float _998 = _844 * _968;
        float _1000 = _844 * _984;
        float _1002 = fma(_846, _946, _996);
        float _1004 = fma(_846, _962, _998);
        float _1006 = fma(_846, _978, _1000);
        float _1008 = fma(_848, _958, _1002);
        float _1010 = fma(_848, _974, _1004);
        float _1012 = fma(_848, _990, _1006);
        float _1014 = _942 + _1008;
        float _1016 = _992 + _1010;
        float _1018 = _994 + _1012;
        _932 = _1016;
        _922 = _1014;
        _940 = _1018;
    }
    float _1020 = _932;
    float _1022 = _922;
    float _1024 = _940;
    bool _1026 = !_866;
    float _1028 = _1020;
    float _1030 = _1022;
    float _1032 = _1024;
    if (!_1026)
    {
        uint _1034 = uint(int(uint(_182) >> uint(2)));
        float _1036 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1034)]);
        int _1038 = _182 + 4;
        uint _1040 = uint(int(uint(_1038) >> uint(2)));
        float _1042 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1040)]);
        int _1044 = _182 + 8;
        uint _1046 = uint(int(uint(_1044) >> uint(2)));
        float _1048 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1046)]);
        int _1050 = _182 + 12;
        uint _1052 = uint(int(uint(_1050) >> uint(2)));
        float _1054 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1052)]);
        uint _1056 = uint(int(uint(_182) >> uint(2)));
        float _1058 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1056)]);
        int _1060 = _182 + 4;
        uint _1062 = uint(int(uint(_1060) >> uint(2)));
        float _1064 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1062)]);
        int _1066 = _182 + 8;
        uint _1068 = uint(int(uint(_1066) >> uint(2)));
        float _1070 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1068)]);
        int _1072 = _182 + 12;
        uint _1074 = uint(int(uint(_1072) >> uint(2)));
        float _1076 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1074)]);
        uint _1078 = uint(int(uint(_182) >> uint(2)));
        float _1080 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1078)]);
        int _1082 = _182 + 4;
        uint _1084 = uint(int(uint(_1082) >> uint(2)));
        float _1086 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1084)]);
        int _1088 = _182 + 8;
        uint _1090 = uint(int(uint(_1088) >> uint(2)));
        float _1092 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1090)]);
        int _1094 = _182 + 12;
        uint _1096 = uint(int(uint(_1094) >> uint(2)));
        float _1098 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1096)]);
        float _1100 = _844 * _1042;
        float _1102 = _844 * _1064;
        float _1104 = _844 * _1086;
        float _1106 = fma(_846, _1036, _1100);
        float _1108 = fma(_846, _1058, _1102);
        float _1110 = fma(_846, _1080, _1104);
        float _1112 = fma(_848, _1048, _1106);
        float _1114 = fma(_848, _1070, _1108);
        float _1116 = fma(_848, _1092, _1110);
        float _1118 = _1112 + _1054;
        float _1120 = _1114 + _1076;
        float _1122 = _1116 + _1098;
        _1028 = _1120;
        _1030 = _1118;
        _1032 = _1122;
    }
    float _1124 = _1028;
    float _1126 = _1030;
    float _1128 = _1032;
    float _1130 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[8]);
    float _1132 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[9]);
    float _1134 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[10]);
    float _1136 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[11]);
    float _1138 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1140 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1142 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[70]);
    float _1144 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1146 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1148 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1150 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1152 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1154 = _1132 * _1124;
    float _1156 = fma(_1130, _1126, _1154);
    float _1158 = fma(_1134, _1128, _1156);
    float _1160 = _1136 + _1158;
    float _1162 = -_1160;
    bool _1164 = _1138 >= _1162;
    bool _1166 = isnan(_1138);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan(_1162);
    bool _1172 = _1168 || _1170;
    float _1174 = -_1160;
    bool _1176 = _1140 >= _1174;
    bool _1178 = isnan(_1140);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan(_1174);
    bool _1184 = _1180 || _1182;
    int _1186 = _1172 ? 0 : 1;
    int _1188 = 2;
    float _1190 = _1126;
    if (_1172)
    {
        _1188 = 1;
    }
    int _1192 = _1188;
    int _1194 = _1192;
    if (_1184)
    {
        _1194 = _1186;
    }
    int _1196 = _1194;
    int _1198 = _1196 << 6;
    int _1200 = _1198 + 96;
    uint _1202 = uint(int(uint(_1200) >> uint(2)));
    float _1204 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1202)]);
    int _1206 = _1200 + 4;
    uint _1208 = uint(int(uint(_1206) >> uint(2)));
    float _1210 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1208)]);
    int _1212 = _1200 + 8;
    uint _1214 = uint(int(uint(_1212) >> uint(2)));
    float _1216 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1214)]);
    int _1218 = _1200 + 12;
    uint _1220 = uint(int(uint(_1218) >> uint(2)));
    float _1222 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1220)]);
    int _1224 = _1198 + 48;
    int _1226 = _1198 + 64;
    uint _1228 = uint(int(uint(_1224) >> uint(2)));
    float _1230 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1228)]);
    int _1232 = _1224 + 4;
    uint _1234 = uint(int(uint(_1232) >> uint(2)));
    float _1236 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1234)]);
    int _1238 = _1224 + 8;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    float _1242 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1240)]);
    int _1244 = _1224 + 12;
    uint _1246 = uint(int(uint(_1244) >> uint(2)));
    float _1248 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1246)]);
    uint _1250 = uint(int(uint(_1226) >> uint(2)));
    float _1252 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1250)]);
    int _1254 = _1226 + 4;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    float _1258 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1256)]);
    int _1260 = _1226 + 8;
    uint _1262 = uint(int(uint(_1260) >> uint(2)));
    float _1264 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1262)]);
    int _1266 = _1226 + 12;
    uint _1268 = uint(int(uint(_1266) >> uint(2)));
    float _1270 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1268)]);
    int _1272 = _1198 + 80;
    float _1274 = _1142 + 1.0;
    float _1276 = _1274 + _1124;
    uint _1278 = uint(int(uint(_1272) >> uint(2)));
    float _1280 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1278)]);
    int _1282 = _1272 + 4;
    uint _1284 = uint(int(uint(_1282) >> uint(2)));
    float _1286 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1284)]);
    int _1288 = _1272 + 8;
    uint _1290 = uint(int(uint(_1288) >> uint(2)));
    float _1292 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1290)]);
    int _1294 = _1272 + 12;
    uint _1296 = uint(int(uint(_1294) >> uint(2)));
    float _1298 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1296)]);
    float _1300 = _1276 * _1146;
    float _1302 = fma(_1144, _1126, _1300);
    float _1304 = fma(_1148, _1128, _1302);
    float _1306 = _1150 + _1304;
    float _1308 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _1310 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _1312 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _1314 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _1316 = trunc(_1306);
    int _1318 = int(_1316);
    int _1320 = ~as_type<int>(_1152);
    int _1322 = _1318 + _1320;
    int _1324 = _1322 + 1;
    float _1326 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    bool _1328 = _1324 >= 0;
    int _1330 = as_type<int>(_1124);
    float _1332 = as_type<float>(_1196);
    if (_1328)
    {
        float _1334 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1330 = as_type<int>(_1334);
    }
    int _1336 = _1330;
    float _1338 = _1276 * _1210;
    float _1340 = fma(_1204, _1126, _1338);
    float _1342 = fma(_1216, _1128, _1340);
    float _1344 = _1222 + _1342;
    float _1346 = _1276 * _1236;
    float _1348 = 1.0 / _1344;
    float _1350 = fma(_1230, _1126, _1346);
    float _1352 = _1276 * _1258;
    float _1354 = fma(_1242, _1128, _1350);
    float _1356 = fma(_1252, _1126, _1352);
    float _1358 = _1248 + _1354;
    float _1360 = fma(_1264, _1128, _1356);
    float _1362 = _1358 * _1348;
    float _1364 = _1270 + _1360;
    bool _1366 = _1362 >= 0.0;
    float _1368 = _1364 * _1348;
    bool _1370 = _1362 <= 1.0;
    bool _1372 = _1370 && _1366;
    bool _1374 = _1368 >= 0.0;
    bool _1376 = _1374 && _1372;
    bool _1378 = _1368 <= 1.0;
    bool _1380 = _1378 && _1376;
    float _1382 = _1276 * _1286;
    float _1384 = fma(_1280, _1126, _1382);
    int _1386 = _1380 ? (-1) : 0;
    if (_1380)
    {
        float _1388 = float(_1196);
        _1332 = _1388;
    }
    float _1390 = _1332;
    float _1392 = _1358;
    if (_1380)
    {
        float _1394 = rint(_1390);
        float _1396 = precise::max(_1394, 0.0);
        uint _1398 = uint(_1396);
        uint _1400 = clamp(_1398, 0u, 65535u);
        _1392 = as_type<float>(_1400);
    }
    float _1402 = _1392;
    float _1404 = fma(_1292, _1128, _1384);
    float _1406 = _1298 + _1404;
    float _1408 = _1406 * _1348;
    float _1410 = _1402;
    if (_1380)
    {
        float3 _11868 = float3(_1362, _1368, float(as_type<int>(_1402)));
        float3 _11872 = select(_11868, float3(0.0), isnan(_11868));
        float _1412 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _11872.xy, uint(rint(_11872.z)), _1408, level(0.0));
        _1410 = _1412;
    }
    float _1414 = _1410;
    float _1416 = _1276 * _1310;
    float _1418 = fma(_1308, _1126, _1416);
    float _1420 = fma(_1312, _1128, _1418);
    float _1422 = _1314 + _1420;
    float _1424 = trunc(_1422);
    int _1426 = int(_1424);
    bool _1428 = _1336 <= _1324;
    bool _1430 = !_1328;
    bool _1432 = _1428 || _1430;
    int _1434 = ~as_type<int>(_1326);
    int _1436 = _1426 + _1434;
    int _1438 = _1436 + 1;
    bool _1440 = _1438 < 0;
    bool _1442 = _1440 || _1432;
    int _1444 = as_type<int>(_1418);
    float _1446 = as_type<float>(_1426);
    if (!_1442)
    {
        float _1448 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1444 = as_type<int>(_1448);
    }
    int _1450 = _1444;
    bool _1452 = _1450 <= _1438;
    bool _1454 = _1452 || _1442;
    if (_1454)
    {
        _1446 = 1.0;
    }
    float _1456 = _1446;
    float _1458 = _1456;
    if (!_1454)
    {
        float _1460 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1462 = _1438 * as_type<int>(_1460);
        int _1464 = _1462 + _1324;
        int _1466 = _1464 << 2;
        uint _1468 = uint(int(uint(_1464) >> uint(2)));
        int _1470 = 12 & _1466;
        int _1472 = int(_1468) << 4;
        int _1474 = _1472 + _1470;
        int _1476 = _1474 + 400;
        uint _1478 = uint(int(uint(_1476) >> uint(2)));
        float _1480 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1478)]);
        float _1482 = floor(_1422);
        float _1484 = floor(_1306);
        float _1486 = -_1482;
        float _1488 = _1422 + _1486;
        float _1490 = -_1484;
        float _1492 = _1306 + _1490;
        float _1494 = rint(_1480);
        float _1496 = precise::max(_1494, 0.0);
        uint _1498 = uint(_1496);
        uint _1500 = clamp(_1498, 0u, 65535u);
        float3 _12007 = float3(_1492, _1488, float(int(_1500)));
        float3 _12009 = select(_12007, float3(0.0), isnan(_12007));
        float _1502 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _12009.xy, uint(rint(_12009.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _12009.xy, uint(rint(_12009.z)), level(0.0)).x;
        int _1504 = _1464 << 4;
        int _1506 = _1504 + 2048;
        uint _1508 = uint(int(uint(_1506) >> uint(2)));
        float _1510 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1508)]);
        int _1512 = _1506 + 4;
        uint _1514 = uint(int(uint(_1512) >> uint(2)));
        float _1516 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1514)]);
        int _1518 = _1506 + 8;
        uint _1520 = uint(int(uint(_1518) >> uint(2)));
        float _1522 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1520)]);
        int _1524 = _1506 + 12;
        uint _1526 = uint(int(uint(_1524) >> uint(2)));
        float _1528 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1526)]);
        float _1530 = _1276 * _1516;
        float _1532 = fma(_1510, _1126, _1530);
        float _1534 = fma(_1522, _1128, _1532);
        float _1536 = _1528 + _1534;
        float _1538 = precise::clamp(_1536, 0.0, 1.0);
        float _1540 = -_1538;
        float _1542 = _1540 + _1502;
        float _1544 = fma(_1542, 500.0, 1.5);
        float _1546 = exp2(_1544);
        float _1548 = 0.0 + _1546;
        float _1550 = precise::clamp(_1548, 0.0, 1.0);
        _1190 = 500.0;
        _1458 = _1550;
    }
    float _1552 = _1190;
    float _1554 = _1458;
    uint _1556 = uint(int(uint(_182) >> uint(2)));
    float _1558 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1556)]);
    float _1560 = _1552;
    if (!_1380)
    {
        _1560 = 1.0;
    }
    float _1562 = _1560;
    bool _1564 = _322 > 0.001000000047497451305389404296875;
    bool _1566 = isnan(_322);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan(0.001000000047497451305389404296875);
    bool _1572 = _1568 || _1570;
    float _1574 = _1562;
    if (_1380)
    {
        bool _1576 = _1414 >= _1408;
        bool _1578 = isnan(_1414);
        bool _1580 = _1576 || _1578;
        bool _1582 = isnan(_1408);
        bool _1584 = _1580 || _1582;
        float _1586 = float(_1584);
        _1574 = _1586;
    }
    float _1588 = _1574;
    float _1590 = -_1588;
    float _1592 = fma(_1590, _1554, 1.0);
    float _1594 = -_1558;
    float _1596 = _1592 + _1594;
    float _1598 = _1592;
    if (_1572)
    {
        float _1600 = fma(_1596, 0.0500000007450580596923828125, _1558);
        _1598 = _1600;
    }
    float _1602 = _1598;
    float _1604 = precise::max(0.0, _1602);
    float _1606 = precise::min(_1604, 0.999000012874603271484375);
    uint _1608 = uint(int(uint(_182) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1608)] = as_type<uint>(_1606);
    float _1610 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    uint _1612 = uint(int(uint(_182) >> uint(2)));
    float _1614 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1612)]);
    int _1616 = _182 + 4;
    uint _1618 = uint(int(uint(_1616) >> uint(2)));
    float _1620 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1618)]);
    int _1622 = _182 + 8;
    uint _1624 = uint(int(uint(_1622) >> uint(2)));
    float _1626 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1624)]);
    int _1628 = _182 + 12;
    uint _1630 = uint(int(uint(_1628) >> uint(2)));
    float _1632 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1630)]);
    float _1634 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[71]);
    int _1636 = _99 << 5;
    float _1638 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[82]);
    uint _1640 = uint(int(uint(_1636) >> uint(2)));
    float _1642 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1640)]);
    int _1644 = _1636 + 4;
    uint _1646 = uint(int(uint(_1644) >> uint(2)));
    float _1648 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1646)]);
    int _1650 = _1636 + 8;
    uint _1652 = uint(int(uint(_1650) >> uint(2)));
    float _1654 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1652)]);
    int _1656 = _1636 + 12;
    uint _1658 = uint(int(uint(_1656) >> uint(2)));
    float _1660 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1658)]);
    float _1662 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[80]);
    float _1664 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[79]);
    float _1666 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[2607]);
    int _1668 = as_type<int>(_1610) & 512;
    bool _1670 = _1668 != 0;
    float _1672 = _1368;
    float _1674 = _1408;
    float _1676 = _1414;
    float _1678 = _1362;
    float _1680 = _1610;
    if (_1670)
    {
        float _1682 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1684 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1686 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1688 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1672 = _1682;
        _1674 = _1684;
        _1676 = _1686;
        _1678 = _1688;
    }
    float _1690 = _1672;
    float _1692 = _1674;
    float _1694 = _1676;
    float _1696 = _1678;
    float _1698 = 0.0;
    float _1700 = 0.0;
    float _1702 = 0.0;
    float _1704 = 0.0;
    if (_1670)
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
    float _1722 = 0.0;
    float _1724 = 0.0;
    float _1726 = 0.0;
    float _1728 = 0.0;
    if (_1670)
    {
        float _1730 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1732 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1734 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1736 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1722 = _1730;
        _1724 = _1732;
        _1726 = _1734;
        _1728 = _1736;
    }
    float _1738 = _1722;
    float _1740 = _1724;
    float _1742 = _1726;
    float _1744 = _1728;
    float _1746 = -_1634;
    float _1748 = _1620 + _1746;
    int _1750 = _1636 + 16;
    uint _1752 = uint(int(uint(_182) >> uint(2)));
    float _1754 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1752)]);
    int _1756 = _182 + 4;
    uint _1758 = uint(int(uint(_1756) >> uint(2)));
    float _1760 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1758)]);
    int _1762 = _182 + 8;
    uint _1764 = uint(int(uint(_1762) >> uint(2)));
    float _1766 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1764)]);
    int _1768 = _182 + 12;
    uint _1770 = uint(int(uint(_1768) >> uint(2)));
    float _1772 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1770)]);
    float _1774 = precise::max(0.0, _1638);
    uint _1776 = uint(int(uint(_1750) >> uint(2)));
    float _1778 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1776)]);
    int _1780 = _1750 + 4;
    uint _1782 = uint(int(uint(_1780) >> uint(2)));
    float _1784 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1782)]);
    int _1786 = _1750 + 8;
    uint _1788 = uint(int(uint(_1786) >> uint(2)));
    float _1790 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1788)]);
    int _1792 = _1750 + 12;
    uint _1794 = uint(int(uint(_1792) >> uint(2)));
    float _1796 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1794)]);
    float _1798 = 0.0;
    float _1800 = _1632;
    int _1802 = as_type<int>(_1620);
    float _1804 = _1642;
    float _1806 = _1648;
    float _1808 = _1654;
    float _1810 = _1660;
    float _1812 = as_type<float>(_1750);
    if (!_1670)
    {
        _1798 = 0.0;
    }
    float _1814 = _1798;
    uint _1816 = uint(int(uint(_182) >> uint(2)));
    float _1818 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1816)]);
    float _1820 = _1814;
    if (!_1670)
    {
        _1800 = 0.0;
    }
    float _1822 = _1800;
    int _1824 = _182 + 8;
    uint _1826 = uint(int(uint(_1824) >> uint(2)));
    float _1828 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1826)]);
    bool _1830 = _1774 != 0.0;
    bool _1832 = isnan(_1774);
    bool _1834 = _1830 || _1832;
    bool _1836 = isnan(0.0);
    bool _1838 = _1834 || _1836;
    uint _1840 = uint(int(uint(_182) >> uint(2)));
    float _1842 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_1840)]);
    int _1844 = _182 + 4;
    uint _1846 = uint(int(uint(_1844) >> uint(2)));
    float _1848 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_1846)]);
    int _1850 = _182 + 8;
    uint _1852 = uint(int(uint(_1850) >> uint(2)));
    float _1854 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_1852)]);
    int _1856 = _182 + 12;
    uint _1858 = uint(int(uint(_1856) >> uint(2)));
    float _1860 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_1858)]);
    float _1862 = _1692;
    float _1864 = _1716;
    float _1866 = _1740;
    float _1868 = _1694;
    float _1870 = _1718;
    float _1872 = _1742;
    float _1874 = _1738;
    float _1876 = _1822;
    float _1878 = _1744;
    float _1880 = _1714;
    float _1882 = _1720;
    if (_1670)
    {
        float _1884 = _1748 * _1692;
        _1862 = _1884;
    }
    float _1886 = _1862;
    float _1888 = _1886;
    if (_1670)
    {
        float _1890 = fma(_1614, _1690, _1886);
        _1888 = _1890;
    }
    float _1892 = _1888;
    int _1894 = as_type<int>(_1610) & 1024;
    bool _1896 = _1894 != 0;
    float _1898 = as_type<float>(_1894);
    if (_1670)
    {
        float _1900 = _1748 * _1716;
        _1864 = _1900;
    }
    float _1902 = _1864;
    float _1904 = _1902;
    if (_1670)
    {
        float _1906 = _1748 * _1740;
        _1866 = _1906;
    }
    float _1908 = _1866;
    float _1910 = _1908;
    if (_1670)
    {
        float _1912 = fma(_1614, _1714, _1902);
        _1904 = _1912;
    }
    float _1914 = _1904;
    float _1916 = _1914;
    if (_1670)
    {
        float _1918 = fma(_1614, _1738, _1908);
        _1910 = _1918;
    }
    float _1920 = _1910;
    float _1922 = _1920;
    if (_1670)
    {
        float _1924 = fma(_1626, _1694, _1892);
        _1868 = _1924;
    }
    float _1926 = _1868;
    if (_1670)
    {
        float _1928 = fma(_1626, _1718, _1914);
        _1870 = _1928;
    }
    float _1930 = _1870;
    float _1932 = _1930;
    if (_1670)
    {
        float _1934 = fma(_1626, _1742, _1920);
        _1872 = _1934;
    }
    float _1936 = _1872;
    float _1938 = _1936;
    if (!_1670)
    {
        _1874 = 0.0;
    }
    float _1940 = _1874;
    float _1942 = _1940;
    if (_1670)
    {
        float _1944 = _1696 + _1926;
        _1942 = _1944;
    }
    float _1946 = _1942;
    float _1948 = _1946;
    if (_1670)
    {
        float _1950 = _1720 + _1930;
        _1820 = _1950;
    }
    float _1952 = _1820;
    int _1954 = as_type<int>(_1610) & 2048;
    bool _1956 = _1954 != 0;
    float _1958 = _1952;
    float _1960 = as_type<float>(_1954);
    if (_1670)
    {
        float _1962 = _1744 + _1936;
        _1876 = _1962;
    }
    float _1964 = _1876;
    float _1966 = _1642 + _1648;
    bool _1968 = !_1896;
    int _1970 = 0;
    float _1972 = _1964;
    int _1974 = as_type<int>(_1772);
    float _1976 = _1966;
    float _1978 = _1778;
    float _1980 = _1784;
    float _1982 = _1790;
    float _1984 = _1796;
    float _1986 = _1828;
    float _1988 = _1818;
    float _1990 = _1666;
    float _1992 = _1666;
    if (!_1968)
    {
        float _1994 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1996 = uint(int(uint(_182) >> uint(2)));
        float _1998 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1996)]);
        int _2000 = _182 + 4;
        uint _2002 = uint(int(uint(_2000) >> uint(2)));
        float _2004 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2002)]);
        int _2006 = _182 + 8;
        uint _2008 = uint(int(uint(_2006) >> uint(2)));
        float _2010 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2008)]);
        int _2012 = _182 + 12;
        uint _2014 = uint(int(uint(_2012) >> uint(2)));
        float _2016 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2014)]);
        uint _2018 = uint(int(uint(_182) >> uint(2)));
        float _2020 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2018)]);
        int _2022 = _182 + 4;
        uint _2024 = uint(int(uint(_2022) >> uint(2)));
        float _2026 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2024)]);
        int _2028 = _182 + 8;
        uint _2030 = uint(int(uint(_2028) >> uint(2)));
        float _2032 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2030)]);
        int _2034 = _182 + 12;
        uint _2036 = uint(int(uint(_2034) >> uint(2)));
        float _2038 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2036)]);
        uint _2040 = uint(int(uint(_182) >> uint(2)));
        float _2042 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2040)]);
        int _2044 = _182 + 4;
        uint _2046 = uint(int(uint(_2044) >> uint(2)));
        float _2048 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2046)]);
        int _2050 = _182 + 8;
        uint _2052 = uint(int(uint(_2050) >> uint(2)));
        float _2054 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2052)]);
        float _2056 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _2058 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _2060 = _1748 * _2004;
        float _2062 = _1748 * _2026;
        float _2064 = _1748 * _2048;
        float _2066 = fma(_1614, _1998, _2060);
        float _2068 = fma(_1614, _2020, _2062);
        float _2070 = fma(_1614, _2042, _2064);
        float _2072 = fma(_1626, _2010, _2066);
        float _2074 = fma(_1626, _2032, _2068);
        float _2076 = fma(_1626, _2054, _2070);
        float _2078 = _1994 + _2072;
        float _2080 = _2056 + _2074;
        float _2082 = _2058 + _2076;
        _1948 = _2080;
        _1922 = _2066;
        _1938 = _2072;
        _1878 = _2016;
        _1880 = _2020;
        _1916 = _2074;
        _1932 = _2032;
        _1882 = _2038;
        _1970 = as_type<int>(_2042);
        _1958 = _2078;
        _1972 = _2082;
    }
    float _2084 = _1948;
    float _2086 = _1922;
    float _2088 = _1938;
    float _2090 = _1878;
    float _2092 = _1880;
    float _2094 = _1916;
    float _2096 = _1932;
    float _2098 = _1882;
    int _2100 = _1970;
    float _2102 = _1958;
    float _2104 = _1972;
    bool _2106 = !_1956;
    float _2108 = _2092;
    float _2110 = _2102;
    float _2112 = _2104;
    float _2114 = _2090;
    float _2116 = _2084;
    float _2118 = _2096;
    float _2120 = _2098;
    float _2122 = _2086;
    float _2124 = _2088;
    float _2126 = _2094;
    int _2128 = _2100;
    if (!_2106)
    {
        uint _2130 = uint(int(uint(_182) >> uint(2)));
        float _2132 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2130)]);
        int _2134 = _182 + 4;
        uint _2136 = uint(int(uint(_2134) >> uint(2)));
        float _2138 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2136)]);
        int _2140 = _182 + 8;
        uint _2142 = uint(int(uint(_2140) >> uint(2)));
        float _2144 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2142)]);
        int _2146 = _182 + 12;
        uint _2148 = uint(int(uint(_2146) >> uint(2)));
        float _2150 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2148)]);
        uint _2152 = uint(int(uint(_182) >> uint(2)));
        float _2154 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2152)]);
        int _2156 = _182 + 4;
        uint _2158 = uint(int(uint(_2156) >> uint(2)));
        float _2160 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2158)]);
        int _2162 = _182 + 8;
        uint _2164 = uint(int(uint(_2162) >> uint(2)));
        float _2166 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2164)]);
        int _2168 = _182 + 12;
        uint _2170 = uint(int(uint(_2168) >> uint(2)));
        float _2172 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2170)]);
        uint _2174 = uint(int(uint(_182) >> uint(2)));
        float _2176 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2174)]);
        int _2178 = _182 + 4;
        uint _2180 = uint(int(uint(_2178) >> uint(2)));
        float _2182 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2180)]);
        int _2184 = _182 + 8;
        uint _2186 = uint(int(uint(_2184) >> uint(2)));
        float _2188 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2186)]);
        int _2190 = _182 + 12;
        uint _2192 = uint(int(uint(_2190) >> uint(2)));
        float _2194 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2192)]);
        float _2196 = _1748 * _2138;
        float _2198 = _1748 * _2160;
        float _2200 = _1748 * _2182;
        float _2202 = fma(_1614, _2132, _2196);
        float _2204 = fma(_1614, _2154, _2198);
        float _2206 = fma(_1614, _2176, _2200);
        float _2208 = fma(_1626, _2144, _2202);
        float _2210 = fma(_1626, _2166, _2204);
        float _2212 = fma(_1626, _2188, _2206);
        float _2214 = _2208 + _2150;
        float _2216 = _2210 + _2172;
        float _2218 = _2212 + _2194;
        _2108 = _2154;
        _2110 = _2214;
        _2112 = _2218;
        _2114 = _2150;
        _2116 = _2216;
        _2118 = _2210;
        _2120 = _2172;
        _2122 = _2202;
        _2124 = _2208;
        _2126 = _2204;
        _2128 = as_type<int>(_2176);
    }
    float _2220 = _2108;
    float _2222 = _2110;
    float _2224 = _2112;
    float _2226 = _2114;
    float _2228 = _2116;
    float _2230 = _2118;
    float _2232 = _2120;
    float _2234 = _2122;
    float _2236 = _2124;
    float _2238 = _2126;
    int _2240 = _2128;
    float _2242 = _1654 + _1966;
    float _2244 = _2222;
    float _2246 = _2224;
    float _2248 = _2222;
    float _2250 = _2224;
    float _2252 = _2230;
    float _2254 = _2234;
    float _2256 = _2236;
    float _2258 = _2220;
    int _2260 = _2240;
    float _2262 = _2228;
    float _2264 = _2228;
    float _2266 = _2226;
    float _2268 = _2238;
    float _2270 = _2232;
    if (!_1838)
    {
        _1386 = 0;
    }
    int _2272 = _1386;
    int _2274 = _2272;
    if (!_1838)
    {
        _1802 = as_type<int>(_1754);
    }
    int _2276 = _1802;
    float _2278 = -_1660;
    bool _2280 = _2242 != _2278;
    bool _2282 = isnan(_2242);
    bool _2284 = _2280 || _2282;
    bool _2286 = isnan(_2278);
    bool _2288 = _2284 || _2286;
    int _2290 = 0;
    bool _2292 = _2288;
    int _2294 = _2276;
    if (!_1838)
    {
        _2290 = as_type<int>(_1760);
    }
    int _2296 = _2290;
    int _2298 = _2288 ? 0 : 1;
    int _2300 = _2298;
    int _2302 = _2298;
    int _2304 = _2296;
    if (!_1838)
    {
        _1974 = as_type<int>(_1766);
    }
    int _2306 = _1974;
    bool _2308 = !_1838;
    int _2310 = _2306;
    if (!_2308)
    {
        uint _2312 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
        float _2314 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2312)]);
        int _2316 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 16;
        uint _2318 = uint(int(uint(_2316) >> uint(2)));
        float _2320 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2318)]);
        int _2322 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 8;
        uint _2324 = uint(int(uint(_2322) >> uint(2)));
        float _2326 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2324)]);
        int _2328 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 24;
        uint _2330 = uint(int(uint(_2328) >> uint(2)));
        float _2332 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2330)]);
        float _2334 = _1774 * 0.5;
        float _2336 = 1.0 / _1774;
        float _2338 = -_2320;
        float _2340 = fma(_2334, _2338, _2314);
        float _2342 = -_2334;
        float _2344 = _2342 + _2340;
        float _2346 = -_2332;
        float _2348 = fma(_2334, _2346, _2326);
        float _2350 = -_2344;
        float _2352 = _2350 + _2222;
        float _2354 = -_2334;
        float _2356 = _2354 + _2348;
        float _2358 = _2352 * _2336;
        float _2360 = -_2356;
        float _2362 = _2360 + _2224;
        float _2364 = floor(_2358);
        float _2366 = _2362 * _2336;
        float _2368 = floor(_2366);
        float _2370 = -_2364;
        float _2372 = fma(_1774, _2370, _2352);
        bool _2374 = _2372 != _2352;
        bool _2376 = isnan(_2372);
        bool _2378 = _2374 || _2376;
        bool _2380 = isnan(_2352);
        bool _2382 = _2378 || _2380;
        float _2384 = -_2368;
        float _2386 = fma(_1774, _2384, _2362);
        bool _2388 = _2386 == _2362;
        bool _2390 = !_2382;
        bool _2392 = _2388 && _2390;
        bool _2394 = !_2392;
        int _2396 = as_type<int>(_2366);
        int _2398 = as_type<int>(_2336);
        int _2400 = as_type<int>(_2364);
        _2274 = _2394 ? (-1) : 0;
        _2252 = _2344;
        _2254 = _2372;
        _2256 = _2356;
        _2258 = _2386;
        _2292 = _2392;
        _1976 = _2352;
        _1680 = _2362;
        if (_2392)
        {
            _2396 = as_type<int>(_1754);
        }
        int _2402 = _2396;
        int _2404 = _2402;
        if (!_2392)
        {
            float _2406 = _2344 + _2372;
            _2244 = _2406;
        }
        float _2408 = _2244;
        _2248 = _2408;
        if (_2392)
        {
            _2398 = as_type<int>(_1760);
        }
        int _2410 = _2398;
        int _2412 = _2410;
        if (!_2392)
        {
            float _2414 = _2356 + _2386;
            _2246 = _2414;
        }
        float _2416 = _2246;
        _2250 = _2416;
        if (_2392)
        {
            _2400 = as_type<int>(_1766);
        }
        int _2418 = _2400;
        _2310 = _2418;
        if (!_2392)
        {
            _2300 = 1;
        }
        int _2420 = _2300;
        _2302 = _2420;
        if (!_2392)
        {
            _2404 = 0;
        }
        int _2422 = _2404;
        _2294 = _2422;
        if (!_2392)
        {
            _2412 = 0;
        }
        int _2424 = _2412;
        _2304 = _2424;
        if (!_2392)
        {
            _2310 = 0;
        }
    }
    int _2426 = _2302;
    float _2428 = _2248;
    float _2430 = _2250;
    int _2432 = _2274;
    float _2434 = _2252;
    float _2436 = _2254;
    float _2438 = _2256;
    float _2440 = _2258;
    bool _2442 = _2292;
    float _2444 = _1976;
    int _2446 = _2294;
    int _2448 = _2304;
    int _2450 = _2310;
    float _2452 = _1680;
    int _2454 = _2426 & 1;
    bool _2456 = _2454 != 0;
    float _2458 = _1662 * 0.5;
    float _2460 = -_1634;
    float _2462 = _844 + _2460;
    float _2464 = precise::max(_2458, 0.001000000047497451305389404296875);
    float _2466 = precise::min(_2464, 10000.0);
    float _2468 = _2444;
    bool _2470 = _2442;
    float _2472 = _2458;
    float _2474 = _2452;
    float _2476 = _2436;
    float _2478 = _2438;
    float _2480 = _2440;
    float _2482 = _2434;
    float _2484 = as_type<float>(_2446);
    if (!_2456)
    {
        _2468 = _1642;
    }
    float _2486 = _2468;
    float _2488 = _2486;
    if (!_2456)
    {
        _1804 = _1648;
    }
    float _2490 = _1804;
    float _2492 = _2490;
    if (!_2456)
    {
        _1806 = _1654;
    }
    float _2494 = _1806;
    float _2496 = _2494;
    if (!_2456)
    {
        _1808 = _1660;
    }
    float _2498 = _1808;
    float _2500 = _2498;
    if (!_2456)
    {
        _1810 = _1778;
    }
    float _2502 = _1810;
    float _2504 = _2502;
    if (!_2456)
    {
        _2470 = false;
    }
    bool _2506 = _2470;
    bool _2508 = _2506;
    if (!_2456)
    {
        _850 = _1784;
    }
    float _2510 = _850;
    float _2512 = _2510;
    if (!_2456)
    {
        _2472 = _1790;
    }
    float _2514 = _2472;
    float _2516 = _2514;
    if (!_2456)
    {
        _2474 = _1796;
    }
    float _2518 = _2474;
    int _2520 = 0;
    float _2522 = _2518;
    if (!_2456)
    {
        _2520 = as_type<int>(_1614);
    }
    int _2524 = _2520;
    int _2526 = _2524;
    int _2528 = _2524;
    if (!_2456)
    {
        _2260 = as_type<int>(_1748);
    }
    int _2530 = _2260;
    int _2532 = 0;
    int _2534 = _2530;
    if (!_2456)
    {
        _2532 = as_type<int>(_1626);
    }
    int _2536 = _2532;
    bool _2538 = !_2456;
    int _2540 = _2536;
    int _2542 = _2536;
    float _2544 = 0.0;
    float _2546 = 0.0;
    float _2548 = 0.0;
    if (!_2538)
    {
        float _2550 = fma(_2428, 6.2500002968590706586837768554688e-05, 0.5);
        float _2552 = fma(_2430, 6.2500002968590706586837768554688e-05, 0.5);
        float _2554 = fma(_2428, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
        float _2556 = fma(_2430, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
        float _2558 = fma(_2430, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
        float2 _13486 = float2(_2550, _2552);
        float2 _2562 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_13486, float2(0.0), isnan(_13486)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_13486, float2(0.0), isnan(_13486)), level(0.0)).xy;
        float _2564 = _2562.x;
        float _2566 = _2562.y;
        float _2568 = fma(_2428, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
        float _2570 = fma(_2428, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
        float _2572 = fma(_2430, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
        float2 _13507 = float2(_2554, _2556);
        float _2574 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_13507, float2(0.0), isnan(_13507)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_13507, float2(0.0), isnan(_13507)), level(0.0)).x;
        float2 _13515 = float2(_2554, _2558);
        float _2576 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_13515, float2(0.0), isnan(_13515)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_13515, float2(0.0), isnan(_13515)), level(0.0)).x;
        float2 _13523 = float2(_2568, _2556);
        float _2578 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_13523, float2(0.0), isnan(_13523)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_13523, float2(0.0), isnan(_13523)), level(0.0)).x;
        float2 _13531 = float2(_2570, _2552);
        float2 _2580 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_13531, float2(0.0), isnan(_13531)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_13531, float2(0.0), isnan(_13531)), level(0.0)).xy;
        float _2582 = _2580.x;
        float _2584 = _2580.y;
        float2 _13543 = float2(_2550, _2572);
        float2 _2586 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_13543, float2(0.0), isnan(_13543)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_13543, float2(0.0), isnan(_13543)), level(0.0)).xy;
        float _2588 = _2586.x;
        float _2590 = _2586.y;
        float2 _13555 = float2(_2568, _2558);
        float _2592 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_13555, float2(0.0), isnan(_13555)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_13555, float2(0.0), isnan(_13555)), level(0.0)).x;
        float _2594 = -_2566;
        float _2596 = _2564 + _2594;
        float _2598 = _2596 * 2000.0;
        float _2600 = abs(_2598);
        bool _2602 = _2600 >= 2.0;
        bool _2604 = isnan(_2600);
        bool _2606 = _2602 || _2604;
        bool _2608 = isnan(2.0);
        bool _2610 = _2606 || _2608;
        float _2612 = _2598;
        float _2614 = _2554;
        float _2616 = _2568;
        _2480 = _2552;
        if (_2610)
        {
            int _2618 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 4;
            uint _2620 = uint(int(uint(_2618) >> uint(2)));
            float _2622 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2620)]);
            _2612 = _2622;
        }
        float _2624 = _2612;
        float _2626 = _2564 * 2000.0;
        float _2628 = -_2564;
        float _2630 = _2628 + _2582;
        float _2632 = -_2564;
        float _2634 = _2632 + _2588;
        float _2636 = -_2564;
        float _2638 = _2636 + _2574;
        float _2640 = _2626;
        if (_2610)
        {
            float _2642 = _2626 + (-2.0);
            _2614 = _2642;
        }
        float _2644 = _2614;
        float _2646 = _2630 * 1000.0;
        float _2648 = _2634 * 1000.0;
        float _2650 = -_2564;
        float _2652 = _2650 + _2576;
        float _2654 = _2638 * 2000.0;
        float _2656 = -_2564;
        float _2658 = _2656 + _2578;
        float _2660 = -_2564;
        float _2662 = _2660 + _2592;
        float _2664 = _2652 * 2000.0;
        float _2666 = _2662 * 2000.0;
        float _2668 = abs(_2654);
        float _2670 = abs(_2664);
        float _2672 = precise::max(_2668, _2670);
        float _2674 = _2658 * 2000.0;
        float _2676 = abs(_2674);
        float _2678 = precise::max(_2672, _2676);
        float _2680 = abs(_2666);
        float _2682 = precise::max(_2678, _2680);
        float _2684 = _2624;
        float _2686 = _2646;
        float _2688 = _2658;
        float _2690 = _2662;
        if (_2610)
        {
            float _2692 = _2624 + 10.0;
            _2684 = _2692;
        }
        float _2694 = _2684;
        bool _2696 = _2694 < _2644;
        bool _2698 = !_2610;
        bool _2700 = _2696 || _2698;
        float _2702 = fma(_2646, _2646, 0.0625);
        float _2704 = fma(_2648, _2648, _2702);
        float _2706 = rsqrt(_2704);
        float _2708 = _2706 * 0.25;
        float _2710 = _2646 * _2706;
        float _2712 = _2648 * _2706;
        bool _2714 = _2708 < 0.891006529331207275390625;
        bool _2716 = _2714 || _2700;
        bool _2718 = _2682 >= 2.0;
        bool _2720 = isnan(_2682);
        bool _2722 = _2718 || _2720;
        bool _2724 = isnan(2.0);
        bool _2726 = _2722 || _2724;
        bool _2728 = _2726 || _2716;
        bool _2730 = !_2728;
        float _2732 = _2708;
        float _2734 = _2694;
        float _2766;
        float _2768;
        float _2770;
        float _2772;
        if (!_2730)
        {
            float _2736 = -_2566;
            float _2738 = _2736 + _2584;
            float _2740 = -_2566;
            float _2742 = _2740 + _2590;
            float _2744 = _2566 * 2000.0;
            float _2746 = _2738 * 1000.0;
            float _2748 = _2742 * 1000.0;
            float _2750 = fma(_2746, _2746, 0.0625);
            float _2752 = fma(_2748, _2748, _2750);
            float _2754 = rsqrt(_2752);
            float _2756 = -_2746;
            float _2758 = fma(_2756, _2754, -0.0);
            float _2760 = -_2748;
            float _2762 = fma(_2760, _2754, -0.0);
            float _2764 = _2754 * 0.25;
            _2766 = _2744;
            _2768 = _2762;
            _2770 = _2758;
            _2772 = _2764;
            _2774 = true;
        }
        else
        {
            float _2776 = _2712 * _2712;
            float _2778 = 1.0 / _2708;
            float _2780 = -_2710;
            float _2782 = (-0.0) + _2780;
            float _2784 = fma(_2710, _2710, _2776);
            float _2786 = sqrt(_2784);
            bool _2788 = _2786 > 9.9999997473787516355514526367188e-05;
            float _2790 = _2786 * _2778;
            float _2792 = _2776;
            _2770 = _2782;
            if (_2788)
            {
                float _2794 = abs(_2710);
                float _2796 = abs(_2712);
                float _2798 = precise::max(_2794, _2796);
                _2686 = _2798;
            }
            float _2800 = _2686;
            if (!_2788)
            {
                _2792 = 0.0;
            }
            float _2802 = _2792;
            float _2804 = _2800;
            float _2806 = _2802;
            if (_2788)
            {
                float _2808 = 1.0 / _2800;
                _2804 = _2808;
            }
            float _2810 = _2804;
            if (_2788)
            {
                float _2812 = _2786 * _2810;
                _2806 = _2812;
            }
            float _2814 = _2806;
            float _2816 = _2814 * 0.9649016857147216796875;
            float _2818 = -_2816;
            float _2820 = fma(_2818, _2790, _2626);
            float _2822 = -_2712;
            float _2824 = (-0.0) + _2822;
            _2766 = _2820;
            _2768 = _2824;
            _2772 = _2708;
        }
        _2774 = false;
        float _2826 = _2766;
        float _2828 = _2768;
        float _2830 = _2770;
        float _2832 = _2772;
        float2 _13864 = float2(_2550, _2552);
        float _2834 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_13864, float2(0.0), isnan(_13864)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_13864, float2(0.0), isnan(_13864)), level(0.0)).y;
        float _2836 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[81]);
        bool _2838 = _2228 >= _2826;
        int _2840 = (_2838 ? (-1) : 0) | _2432;
        float _2842 = 0.0 + _2836;
        float _2844 = precise::clamp(_2842, 0.0, 1.0);
        bool _2846 = _1860 >= _2844;
        int _2848 = (_2846 ? (-1) : 0) & _2840;
        int _2850 = ~_2848;
        float _2852 = _2826;
        float _2854 = _2826;
        _2268 = _2834;
        float _2916;
        float _2918;
        float _2920;
        float _2922;
        float _2924;
        float _2926;
        float _2928;
        float _2930;
        float _2932;
        float _2934;
        float _2936;
        bool _2938;
        float _2940;
        float _2942;
        if (!(_2850 != 0))
        {
            float _2856 = _1848 * 6.283185482025146484375;
            float _2858 = _1842 * 6.283185482025146484375;
            float _2860 = _1854 * 6.283185482025146484375;
            if (_2432 != 0)
            {
                float _2862 = fma(_1848, _1774, _2826);
                _2262 = _2862;
            }
            float _2864 = _2262;
            float _2866 = _2856 * _2856;
            float _2868 = fma(_2858, _2858, _2866);
            float _2870 = fma(_2860, _2860, _2868);
            float _2872 = sqrt(_2870);
            float _2874 = rsqrt(_2870);
            float _2876 = _2872 * 0.5;
            bool _2878 = _2872 != 0.0;
            bool _2880 = isnan(_2872);
            bool _2882 = _2878 || _2880;
            bool _2884 = isnan(0.0);
            bool _2886 = _2882 || _2884;
            float _2888 = _2876 * 0.15915493667125701904296875;
            float _2890 = _2858 * _2874;
            float _2892 = _2888 * 6.283185482025146484375;
            float _2894 = sin(_2892);
            float _2896 = _2856 * _2874;
            float _2898 = _2860 * _2874;
            float _2900 = _2886 ? _2890 : 0.0;
            float _2902 = _2886 ? _2896 : 0.0;
            float _2904 = _2888 * 6.283185482025146484375;
            float _2906 = cos(_2904);
            float _2908 = _2886 ? _2898 : 0.0;
            float _2910 = _2900 * _2894;
            float _2912 = _2902 * _2894;
            float _2914 = _2908 * _2894;
            _2916 = _2908;
            _2918 = _2870;
            _2920 = _2900;
            _2922 = _2894;
            _2924 = _2864;
            _2926 = _2864;
            _2928 = _2912;
            _2930 = _2914;
            _2932 = _2906;
            _2934 = _2888;
            _2936 = _2902;
            _2938 = _2886;
            _2940 = _2910;
            _2942 = 0.0;
            _2944 = true;
        }
        else
        {
            float _2946 = _2830 * _2830;
            float _2948 = fma(_2828, _2828, _2946);
            float _2950 = sqrt(_2948);
            float _2952 = precise::max(_2950, -1.0);
            float _2954 = precise::min(_2952, 1.0);
            float _2956 = abs(_2954);
            float _2958 = fma(_2956, -0.5, 0.5);
            int _2960 = as_type<int>(_2958) + (-218103808);
            bool _2962 = uint(_2960) >= 1920991232u;
            bool _2964 = !_2962;
            int _2984;
            if (!_2964)
            {
                int _2966 = 1056964608;
                int _2968 = as_type<int>(_1842);
                int _2970 = as_type<int>(_2958);
                int _2972 = 10480;
                int _2974;
                int _2976;
                int _2978;
                int _2980;
                int _2982;
                _87(_2966, _2968, _2970, _2972, _2974, _2976, _2978, _2980, _2982);
                _2984 = _2974;
                _2986 = true;
            }
            else
            {
                float _2988 = rsqrt(_2958);
                float _2990 = _2958 * _2988;
                float _2992 = _2988 * 0.5;
                float _2994 = -_2990;
                float _2996 = 0.0 + _2994;
                float _2998 = fma(_2992, _2996, 0.5);
                float _3000 = fma(_2990, _2998, _2990);
                float _3002 = -_3000;
                float _3004 = 0.0 + _3002;
                float _3006 = fma(_3000, _3004, _2958);
                float _3008 = fma(_2992, _3006, _3000);
                _2984 = as_type<int>(_3008);
            }
            _2986 = false;
            int _3010 = _2984;
            float _3012 = abs(_2954);
            bool _3014 = _3012 > 0.569999992847442626953125;
            float _3016 = _2950 + 9.9999997473787516355514526367188e-06;
            float _3018 = _1854 * 6.283185482025146484375;
            float _3020 = abs(_2954);
            float _3022 = _3014 ? as_type<float>(_3010) : _3020;
            float _3024 = 1.0 / _3016;
            float _3026 = _3018 * _2832;
            float _3028 = _3022 * _3022;
            float _3030 = _3018 * _2830;
            float _3032 = fma(_3028, 0.0517513789236545562744140625, 0.01816697604954242706298828125);
            float _3034 = fma(_3028, _3032, 0.0467568598687648773193359375);
            float _3036 = fma(_3028, _3034, 0.074846573173999786376953125);
            float _3038 = fma(_3028, _3036, 0.166670143604278564453125);
            float _3040 = _3028 * _3038;
            float _3042 = fma(_3022, _3040, _3022);
            float _3044 = _3026 * _3026;
            float _3046 = _3042;
            if (_3014)
            {
                float _3048 = fma(_3042, -2.0, 1.57079637050628662109375);
                _3046 = _3048;
            }
            float _3050 = _3046;
            bool _3052 = _2954 >= 0.0;
            bool _3054 = isnan(_2954);
            bool _3056 = _3052 || _3054;
            bool _3058 = isnan(0.0);
            bool _3060 = _3056 || _3058;
            float _3062 = fma(_3030, _3030, _3044);
            float _3064 = _3024 * _2830;
            float _3066 = _3018 * _2828;
            bool _3068 = !_3060;
            float _3070 = -_3050;
            float _3072 = _3068 ? _3070 : _3050;
            float _3074 = -_2828;
            float _3076 = _3024 * _3074;
            float _3078 = -_2826;
            float _3080 = fma(_2834, 2000.0, _3078);
            float _3082 = fma(_3066, _3066, _3062);
            float _3084 = _3072 * _3064;
            float _3086 = _3072 * _3076;
            float _3088 = sqrt(_3082);
            float _3090 = abs(_3080);
            bool _3092 = _3090 >= 2.0;
            bool _3094 = isnan(_3090);
            bool _3096 = _3092 || _3094;
            bool _3098 = isnan(2.0);
            bool _3100 = _3096 || _3098;
            float _3102 = _3084 * _3084;
            bool _3104 = _2832 <= 0.891006529331207275390625;
            bool _3106 = !_3100;
            bool _3108 = _3104 || _3106;
            float _3110 = fma(_3086, _3086, _3102);
            float _3112 = rsqrt(_3082);
            float _3114 = sqrt(_3110);
            float _3116 = _3088 * 0.5;
            bool _3118 = _3088 != 0.0;
            bool _3120 = isnan(_3088);
            bool _3122 = _3118 || _3120;
            bool _3124 = isnan(0.0);
            bool _3126 = _3122 || _3124;
            _2690 = _3088;
            _2938 = _3108;
            if (_3108)
            {
                float _3128 = _2826 + (-1000.0);
                _2852 = _3128;
            }
            float _3130 = _2852;
            float _3132 = _3116 * 0.15915493667125701904296875;
            float _3134 = rsqrt(_3110);
            float _3136 = _3030 * _3112;
            float _3138 = _3066 * _3112;
            float _3140 = _3026 * _3112;
            float _3142 = _3126 ? _3136 : 0.0;
            float _3144 = _3114 * 0.5;
            float _3146 = _3132 * 6.283185482025146484375;
            float _3148 = sin(_3146);
            bool _3150 = _3114 != 0.0;
            bool _3152 = isnan(_3114);
            bool _3154 = _3150 || _3152;
            bool _3156 = isnan(0.0);
            bool _3158 = _3154 || _3156;
            float _3160 = _3144 * 0.15915493667125701904296875;
            float _3162 = _3126 ? _3138 : 0.0;
            float _3164 = _3126 ? _3140 : 0.0;
            float _3166 = _3084 * _3134;
            float _3168 = _3160 * 6.283185482025146484375;
            float _3170 = sin(_3168);
            float _3172 = _3086 * _3134;
            float _3174 = _3158 ? _3166 : 0.0;
            float _3176 = _3158 ? _3172 : 0.0;
            float _3178 = _3160 * 6.283185482025146484375;
            float _3180 = cos(_3178);
            float _3182 = _3142 * _3148;
            float _3184 = _3162 * _3148;
            float _3186 = _3164 * _3148;
            float _3188 = _3132 * 6.283185482025146484375;
            float _3190 = cos(_3188);
            float _3192 = _3174 * _3170;
            float _3194 = _3176 * _3170;
            float _3196 = _3192 * _3182;
            float _3198 = _3192 * _3184;
            float _3200 = _3180 * _3182;
            float _3202 = _3180 * _3184;
            float _3204 = -_3196;
            float _3206 = fma(_3194, _3184, _3204);
            float _3208 = fma(_3194, _3182, _3198);
            float _3210 = fma(_3180, _3186, _3206);
            float _3212 = fma(_3194, _3190, _3200);
            float _3214 = fma(_3192, _3190, _3202);
            float _3216 = -_3208;
            float _3218 = fma(_3180, _3190, _3216);
            float _3220 = fma(_3192, _3186, _3212);
            float _3222 = -_3194;
            float _3224 = fma(_3222, _3186, _3214);
            _2854 = _3130;
            _2916 = _3184;
            _2918 = _3192;
            _2920 = _3190;
            _2922 = _3212;
            _2732 = _3206;
            _2640 = _3214;
            _2616 = _3134;
            _2924 = _3208;
            _2688 = _3160;
            _2734 = _3132;
            _2926 = _3130;
            _2928 = _3210;
            _2930 = _3224;
            _2932 = _3218;
            _2934 = _3202;
            _2936 = _3194;
            _2940 = _3220;
            _2942 = 1.0;
        }
        _2944 = false;
        float _3226 = _2854;
        float _3228 = _2916;
        float _3230 = _2918;
        float _3232 = _2920;
        float _3234 = _2922;
        float _3236 = _2732;
        float _3238 = _2640;
        float _3240 = _2616;
        float _3242 = _2924;
        float _3244 = _2688;
        float _3246 = _2734;
        float _3248 = _2690;
        float _3250 = _2926;
        float _3252 = _2928;
        float _3254 = _2930;
        float _3256 = _2932;
        float _3258 = _2934;
        float _3260 = _2936;
        bool _3262 = _2938;
        float _3264 = _2940;
        float _3266 = _2942;
        bool _3268 = !_1670;
        bool _3270 = _3262;
        float _3272 = _3258;
        float _3274 = _3260;
        float _3276 = _3232;
        float _3278 = _3226;
        float _3280 = _3228;
        float _3282 = _3230;
        _1978 = _3234;
        _1980 = _3236;
        _1982 = _3238;
        _1984 = _3240;
        _2264 = _3242;
        _2476 = _3244;
        _2478 = _3246;
        _2266 = _3248;
        _2488 = _3264;
        _2534 = as_type<int>(_3250);
        _2522 = _3266;
        if (!_3268)
        {
            float _3284 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _3286 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _3288 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _3290 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _3292 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[28]);
            float _3294 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[29]);
            float _3296 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[30]);
            float _3298 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[31]);
            float _3300 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _3302 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _3304 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _3306 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _3308 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _3310 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _3312 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _3314 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _3316 = _3290 * _3296;
            float _3318 = _3290 * _3294;
            float _3320 = _3290 * _3292;
            float _3322 = _3306 * _3296;
            float _3324 = _3306 * _3294;
            float _3326 = _3306 * _3292;
            float _3328 = _3306 * _3288;
            float _3330 = _3306 * _3286;
            float _3332 = _3306 * _3284;
            float _3334 = -_3316;
            float _3336 = fma(_3288, _3298, _3334);
            float _3338 = -_3318;
            float _3340 = fma(_3286, _3298, _3338);
            float _3342 = -_3320;
            float _3344 = fma(_3284, _3298, _3342);
            float _3346 = -_3322;
            float _3348 = fma(_3304, _3298, _3346);
            float _3350 = -_3324;
            float _3352 = fma(_3302, _3298, _3350);
            float _3354 = -_3326;
            float _3356 = fma(_3300, _3298, _3354);
            float _3358 = -_3328;
            float _3360 = fma(_3304, _3290, _3358);
            float _3362 = _3288 * _3294;
            float _3364 = _3288 * _3292;
            float _3366 = _3304 * _3294;
            float _3368 = _3304 * _3292;
            float _3370 = _3286 * _3292;
            float _3372 = -_3330;
            float _3374 = fma(_3302, _3290, _3372);
            float _3376 = -_3332;
            float _3378 = fma(_3300, _3290, _3376);
            float _3380 = -_3362;
            float _3382 = fma(_3286, _3296, _3380);
            float _3384 = -_3364;
            float _3386 = fma(_3284, _3296, _3384);
            float _3388 = -_3366;
            float _3390 = fma(_3302, _3296, _3388);
            float _3392 = -_3368;
            float _3394 = fma(_3300, _3296, _3392);
            float _3396 = _3304 * _3284;
            float _3398 = -_3370;
            float _3400 = fma(_3284, _3294, _3398);
            float _3402 = _3302 * _3284;
            float _3404 = _3304 * _3286;
            float _3406 = _3302 * _3292;
            float _3408 = _3304 * _3344;
            float _3410 = _3302 * _3386;
            float _3412 = -_3404;
            float _3414 = fma(_3302, _3288, _3412);
            float _3416 = _3304 * _3340;
            float _3418 = -_3408;
            float _3420 = fma(_3300, _3336, _3418);
            float _3422 = -_3406;
            float _3424 = fma(_3300, _3294, _3422);
            float _3426 = -_3402;
            float _3428 = fma(_3300, _3286, _3426);
            float _3430 = _3302 * _3344;
            float _3432 = -_3416;
            float _3434 = fma(_3302, _3336, _3432);
            float _3436 = fma(_3306, _3386, _3420);
            float _3438 = -_3396;
            float _3440 = fma(_3300, _3288, _3438);
            float _3442 = -_3430;
            float _3444 = fma(_3300, _3340, _3442);
            float _3446 = fma(_3306, _3382, _3434);
            float _3448 = _3310 * _3436;
            float _3450 = _3312 * _3340;
            float _3452 = -_3410;
            float _3454 = fma(_3300, _3382, _3452);
            float _3456 = fma(_3306, _3400, _3444);
            float _3458 = -_3448;
            float _3460 = fma(_3308, _3446, _3458);
            float _3462 = -_3450;
            float _3464 = fma(_3310, _3336, _3462);
            float _3466 = fma(_3304, _3400, _3454);
            float _3468 = _3312 * _3344;
            float _3470 = fma(_3312, _3456, _3460);
            float _3472 = _3310 * _3344;
            float _3474 = _3312 * _3352;
            float _3476 = -_3468;
            float _3478 = fma(_3308, _3336, _3476);
            float _3480 = -_3314;
            float _3482 = fma(_3480, _3466, _3470);
            float _3484 = -_3472;
            float _3486 = fma(_3308, _3340, _3484);
            float _3488 = _3312 * _3356;
            float _3490 = _3310 * _3356;
            float _3492 = 1.0 / _3482;
            float _3494 = fma(_3314, _3382, _3464);
            float _3496 = fma(_3314, _3400, _3486);
            float _3498 = -_3474;
            float _3500 = fma(_3310, _3348, _3498);
            float _3502 = -_3488;
            float _3504 = fma(_3308, _3348, _3502);
            float _3506 = _3312 * _3374;
            float _3508 = _3312 * _3378;
            float _3510 = -_3490;
            float _3512 = fma(_3308, _3352, _3510);
            float _3514 = fma(_3314, _3386, _3478);
            float _3516 = _3310 * _3378;
            float _3518 = fma(_3314, _3390, _3500);
            float _3520 = fma(_3314, _3394, _3504);
            float _3522 = fma(_3314, _3424, _3512);
            float _3524 = -_3506;
            float _3526 = fma(_3310, _3360, _3524);
            float _3528 = -_3508;
            float _3530 = fma(_3308, _3360, _3528);
            float _3532 = -_3516;
            float _3534 = fma(_3308, _3374, _3532);
            float _3536 = _3446 * _3492;
            float _3538 = _3494 * _3492;
            float _3540 = _3436 * _3492;
            float _3542 = _3496 * _3492;
            float _3544 = _3514 * _3492;
            float _3546 = _3456 * _3492;
            float _3548 = _3540 * _2428;
            float _3550 = _3538 * _3250;
            float _3552 = _3542 * _3250;
            float _3554 = _3518 * _3492;
            float _3556 = -_3548;
            float _3558 = fma(_3544, _3250, _3556);
            float _3560 = -_3550;
            float _3562 = fma(_3536, _2428, _3560);
            float _3564 = -_3552;
            float _3566 = fma(_3546, _2428, _3564);
            float _3568 = _3520 * _3492;
            float _3570 = _3522 * _3492;
            float _3572 = fma(_3314, _3414, _3526);
            float _3574 = fma(_3314, _3440, _3530);
            float _3576 = fma(_3314, _3428, _3534);
            float _3578 = fma(_3554, _2430, _3562);
            float _3580 = -_3568;
            float _3582 = fma(_3580, _2430, _3558);
            float _3584 = fma(_3570, _2430, _3566);
            float _3586 = -_3572;
            float _3588 = fma(_3586, _3492, _3578);
            float _3590 = fma(_3574, _3492, _3582);
            float _3592 = -_3576;
            float _3594 = fma(_3592, _3492, _3584);
            _1978 = _3548;
            _1980 = _3490;
            _1982 = _3546;
            _1984 = _3492;
            _2264 = _3494;
            _2476 = _3582;
            _2478 = _3554;
            _2266 = _3306;
            _2480 = _3308;
            _2268 = _3310;
            _2482 = _3570;
            _2270 = _3314;
            _2508 = true;
            _2528 = as_type<int>(_3588);
            _2500 = _3256;
            _2542 = as_type<int>(_3594);
            _2496 = _3254;
            _2534 = as_type<int>(_3590);
            _2492 = _3252;
            _2544 = _3534;
            _2546 = _3374;
            _2548 = _3390;
            _2504 = 0.0;
            _2516 = 0.0;
            _2512 = 0.0;
            _3596 = true;
        }
        else
        {
            bool _3598 = !_1896;
            if (!_3598)
            {
                float _3600 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                uint _3602 = uint(int(uint(_182) >> uint(2)));
                float _3604 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3602)]);
                int _3606 = _182 + 4;
                uint _3608 = uint(int(uint(_3606) >> uint(2)));
                float _3610 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3608)]);
                int _3612 = _182 + 8;
                uint _3614 = uint(int(uint(_3612) >> uint(2)));
                float _3616 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3614)]);
                uint _3618 = uint(int(uint(_182) >> uint(2)));
                float _3620 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3618)]);
                int _3622 = _182 + 4;
                uint _3624 = uint(int(uint(_3622) >> uint(2)));
                float _3626 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3624)]);
                int _3628 = _182 + 8;
                uint _3630 = uint(int(uint(_3628) >> uint(2)));
                float _3632 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3630)]);
                uint _3634 = uint(int(uint(_182) >> uint(2)));
                float _3636 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3634)]);
                int _3638 = _182 + 4;
                uint _3640 = uint(int(uint(_3638) >> uint(2)));
                float _3642 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3640)]);
                int _3644 = _182 + 8;
                uint _3646 = uint(int(uint(_3644) >> uint(2)));
                float _3648 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3646)]);
                float _3650 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _3652 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _3654 = _3616 * _3620;
                float _3656 = _3616 * _3626;
                float _3658 = -_3654;
                float _3660 = fma(_3604, _3632, _3658);
                float _3662 = _3610 * _3620;
                float _3664 = -_3656;
                float _3666 = fma(_3610, _3632, _3664);
                float _3668 = _3642 * _3660;
                float _3670 = -_3662;
                float _3672 = fma(_3604, _3626, _3670);
                float _3674 = -_3668;
                float _3676 = fma(_3636, _3666, _3674);
                float _3678 = fma(_3648, _3672, _3676);
                float _3680 = 1.0 / _3678;
                float _3682 = _3648 * _3620;
                float _3684 = _3600 * _3632;
                float _3686 = _3600 * _3626;
                float _3688 = _3600 * _3620;
                float _3690 = _3642 * _3632;
                float _3692 = -_3604;
                float _3694 = fma(_3692, _3632, _3654);
                float _3696 = -_3682;
                float _3698 = fma(_3636, _3632, _3696);
                float _3700 = -_3684;
                float _3702 = fma(_3616, _3650, _3700);
                float _3704 = -_3686;
                float _3706 = fma(_3610, _3650, _3704);
                float _3708 = -_3688;
                float _3710 = fma(_3604, _3650, _3708);
                float _3712 = _3636 * _3626;
                float _3714 = _3636 * _3616;
                float _3716 = -_3690;
                float _3718 = fma(_3648, _3626, _3716);
                float _3720 = _3648 * _3610;
                float _3722 = -_3712;
                float _3724 = fma(_3642, _3620, _3722);
                float _3726 = _3642 * _3604;
                float _3728 = -_3714;
                float _3730 = fma(_3648, _3604, _3728);
                float _3732 = _3648 * _3706;
                float _3734 = _3718 * _3680;
                float _3736 = _3698 * _3680;
                float _3738 = _3724 * _3680;
                float _3740 = -_3720;
                float _3742 = fma(_3642, _3616, _3740);
                float _3744 = -_3732;
                float _3746 = fma(_3642, _3702, _3744);
                float _3748 = -_3726;
                float _3750 = fma(_3636, _3610, _3748);
                float _3752 = _3734 * _3250;
                float _3754 = _3736 * _3250;
                float _3756 = _3694 * _3680;
                float _3758 = _3666 * _3680;
                float _3760 = _3648 * _3710;
                float _3762 = _3738 * _3250;
                float _3764 = _3672 * _3680;
                float _3766 = _3642 * _3710;
                float _3768 = fma(_3756, _2428, _3754);
                float _3770 = fma(_3758, _2428, _3752);
                float _3772 = -_3760;
                float _3774 = fma(_3636, _3702, _3772);
                float _3776 = fma(_3764, _2428, _3762);
                float _3778 = _3730 * _3680;
                float _3780 = _3742 * _3680;
                float _3782 = _3750 * _3680;
                float _3784 = -_3766;
                float _3786 = fma(_3636, _3706, _3784);
                float _3788 = fma(_3778, _2430, _3768);
                float _3790 = fma(_3780, _2430, _3770);
                float _3792 = fma(_3652, _3660, _3774);
                float _3794 = fma(_3652, _3666, _3746);
                float _3796 = fma(_3782, _2430, _3776);
                float _3798 = fma(_3652, _3672, _3786);
                float _3800 = fma(_3792, _3680, _3788);
                float _3802 = -_3794;
                float _3804 = fma(_3802, _3680, _3790);
                float _3806 = -_3798;
                float _3808 = fma(_3806, _3680, _3796);
                _1978 = _3788;
                _1980 = _3742;
                _1982 = _3782;
                _1984 = _3694;
                _2264 = _3798;
                _2476 = _3642;
                _2478 = _3648;
                _2266 = _3796;
                _2480 = _3686;
                _2268 = _3730;
                _2482 = _3660;
                _2270 = _3672;
                _2508 = true;
                _2528 = as_type<int>(_3804);
                _2500 = _3256;
                _2542 = as_type<int>(_3808);
                _2496 = _3254;
                _2534 = as_type<int>(_3800);
                _2492 = _3252;
                _2544 = 0.0;
                _2546 = 0.0;
                _2548 = _3750;
                _2504 = 0.0;
                _2516 = 0.0;
                _2512 = 0.0;
                _3596 = true;
            }
            else
            {
                if (!_1956)
                {
                    _3270 = true;
                }
                bool _3810 = _3270;
                _2508 = _3810;
                if (!_1956)
                {
                    _3272 = 0.0;
                    _3274 = 0.0;
                }
                float _3812 = _3272;
                float _3814 = _3274;
                _2516 = _3812;
                _2512 = _3814;
                if (!_1956)
                {
                    _3276 = 0.0;
                }
                float _3816 = _3276;
                _2504 = _3816;
                if (!_1956)
                {
                    _3278 = _3252;
                }
                float _3818 = _3278;
                _2492 = _3818;
                if (!_1956)
                {
                    _3280 = _3254;
                }
                float _3820 = _3280;
                _2496 = _3820;
                if (!_1956)
                {
                    _3282 = _3256;
                }
                float _3822 = _3282;
                _2500 = _3822;
                if (!_1956)
                {
                    _2526 = as_type<int>(_2428);
                }
                int _3824 = _2526;
                _2528 = _3824;
                if (!_1956)
                {
                    _2540 = as_type<int>(_2430);
                }
                int _3826 = _2540;
                bool _3828 = !_1956;
                _2542 = _3826;
                _2544 = 0.0;
                _2546 = 0.0;
                _2548 = 0.0;
                if (!_3828)
                {
                    uint _3830 = uint(int(uint(_182) >> uint(2)));
                    float _3832 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3830)]);
                    int _3834 = _182 + 4;
                    uint _3836 = uint(int(uint(_3834) >> uint(2)));
                    float _3838 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3836)]);
                    int _3840 = _182 + 8;
                    uint _3842 = uint(int(uint(_3840) >> uint(2)));
                    float _3844 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3842)]);
                    int _3846 = _182 + 12;
                    uint _3848 = uint(int(uint(_3846) >> uint(2)));
                    float _3850 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3848)]);
                    uint _3852 = uint(int(uint(_182) >> uint(2)));
                    float _3854 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3852)]);
                    int _3856 = _182 + 4;
                    uint _3858 = uint(int(uint(_3856) >> uint(2)));
                    float _3860 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3858)]);
                    int _3862 = _182 + 8;
                    uint _3864 = uint(int(uint(_3862) >> uint(2)));
                    float _3866 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3864)]);
                    int _3868 = _182 + 12;
                    uint _3870 = uint(int(uint(_3868) >> uint(2)));
                    float _3872 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3870)]);
                    uint _3874 = uint(int(uint(_182) >> uint(2)));
                    float _3876 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3874)]);
                    int _3878 = _182 + 4;
                    uint _3880 = uint(int(uint(_3878) >> uint(2)));
                    float _3882 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3880)]);
                    int _3884 = _182 + 8;
                    uint _3886 = uint(int(uint(_3884) >> uint(2)));
                    float _3888 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3886)]);
                    int _3890 = _182 + 12;
                    uint _3892 = uint(int(uint(_3890) >> uint(2)));
                    float _3894 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3892)]);
                    float _3896 = _3844 * _3854;
                    float _3898 = _3844 * _3860;
                    float _3900 = _3838 * _3854;
                    float _3902 = _3866 * _3850;
                    float _3904 = -_3896;
                    float _3906 = fma(_3832, _3866, _3904);
                    float _3908 = -_3898;
                    float _3910 = fma(_3838, _3866, _3908);
                    float _3912 = -_3900;
                    float _3914 = fma(_3832, _3860, _3912);
                    float _3916 = _3882 * _3866;
                    float _3918 = _3882 * _3906;
                    float _3920 = _3860 * _3850;
                    float _3922 = _3854 * _3850;
                    float _3924 = -_3916;
                    float _3926 = fma(_3888, _3860, _3924);
                    float _3928 = -_3918;
                    float _3930 = fma(_3876, _3910, _3928);
                    float _3932 = _3876 * _3860;
                    float _3934 = _3888 * _3838;
                    float _3936 = _3876 * _3844;
                    float _3938 = fma(_3888, _3914, _3930);
                    float _3940 = -_3902;
                    float _3942 = fma(_3844, _3872, _3940);
                    float _3944 = -_3920;
                    float _3946 = fma(_3838, _3872, _3944);
                    float _3948 = -_3922;
                    float _3950 = fma(_3832, _3872, _3948);
                    float _3952 = _3888 * _3854;
                    float _3954 = -_3932;
                    float _3956 = fma(_3882, _3854, _3954);
                    float _3958 = 1.0 / _3938;
                    float _3960 = -_3934;
                    float _3962 = fma(_3882, _3844, _3960);
                    float _3964 = -_3832;
                    float _3966 = fma(_3964, _3866, _3896);
                    float _3968 = -_3936;
                    float _3970 = fma(_3888, _3832, _3968);
                    float _3972 = _3882 * _3832;
                    float _3974 = _3888 * _3946;
                    float _3976 = _3888 * _3950;
                    float _3978 = _3882 * _3950;
                    float _3980 = -_3952;
                    float _3982 = fma(_3876, _3866, _3980);
                    float _3984 = -_3972;
                    float _3986 = fma(_3876, _3838, _3984);
                    float _3988 = -_3974;
                    float _3990 = fma(_3882, _3942, _3988);
                    float _3992 = -_3976;
                    float _3994 = fma(_3876, _3942, _3992);
                    float _3996 = -_3978;
                    float _3998 = fma(_3876, _3946, _3996);
                    float _4000 = fma(_3910, _3894, _3990);
                    float _4002 = fma(_3906, _3894, _3994);
                    float _4004 = _3926 * _3958;
                    float _4006 = _3982 * _3958;
                    float _4008 = _3956 * _3958;
                    float _4010 = _3966 * _3958;
                    float _4012 = _4004 * _3250;
                    float _4014 = _4006 * _3250;
                    float _4016 = _4008 * _3250;
                    float _4018 = _3910 * _3958;
                    float _4020 = _3914 * _3958;
                    float _4022 = fma(_4010, _2428, _4014);
                    float _4024 = _3970 * _3958;
                    float _4026 = fma(_4018, _2428, _4012);
                    float _4028 = fma(_4020, _2428, _4016);
                    float _4030 = _3962 * _3958;
                    float _4032 = _3986 * _3958;
                    float _4034 = fma(_3914, _3894, _3998);
                    float _4036 = fma(_4024, _2430, _4022);
                    float _4038 = fma(_4030, _2430, _4026);
                    float _4040 = fma(_4032, _2430, _4028);
                    float _4042 = fma(_4002, _3958, _4036);
                    float _4044 = -_4000;
                    float _4046 = fma(_4044, _3958, _4038);
                    float _4048 = -_4034;
                    float _4050 = fma(_4048, _3958, _4040);
                    _1978 = _4030;
                    _1980 = _3972;
                    _1982 = _4010;
                    _1984 = _3952;
                    _2264 = _4020;
                    _2476 = _3882;
                    _2478 = _4002;
                    _2266 = _3894;
                    _2480 = _3926;
                    _2268 = _3950;
                    _2482 = _4024;
                    _2270 = _3910;
                    _2508 = true;
                    _2528 = as_type<int>(_4046);
                    _2500 = _3256;
                    _2542 = as_type<int>(_4050);
                    _2496 = _3254;
                    _2534 = as_type<int>(_4042);
                    _2492 = _3252;
                    _2544 = 0.0;
                    _2546 = 0.0;
                    _2548 = _3936;
                    _2504 = 0.0;
                    _2516 = 0.0;
                    _2512 = 0.0;
                }
            }
        }
    }
    _3596 = false;
    float _4052 = _1978;
    float _4054 = _1980;
    float _4056 = _1982;
    float _4058 = _1984;
    float _4060 = _2264;
    float _4062 = _2476;
    float _4064 = _2478;
    float _4066 = _2266;
    float _4068 = _2480;
    float _4070 = _2268;
    float _4072 = _2482;
    float _4074 = _2270;
    bool _4076 = _2508;
    int _4078 = _2528;
    float _4080 = _2500;
    int _4082 = _2542;
    float _4084 = _2488;
    float _4086 = _2496;
    int _4088 = _2534;
    float _4090 = _2492;
    float _4092 = _2544;
    float _4094 = _2546;
    float _4096 = _2548;
    float _4098 = _2504;
    float _4100 = _2516;
    float _4102 = _2512;
    float _4104 = _2522;
    float _4106 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _4108 = _4052;
    float _4110 = _4054;
    float _4112 = _4056;
    float _4114 = _4058;
    float _4116 = _4094;
    float _4118 = _4096;
    float _4120 = _4092;
    float _4122 = _4100;
    float _4124 = _4102;
    float _4126 = _4098;
    float _4128 = _4084;
    if (_1670)
    {
        float _4130 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _4132 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _4134 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _4136 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _4108 = _4130;
        _4110 = _4132;
        _4112 = _4134;
        _4114 = _4136;
    }
    float _4138 = _4108;
    float _4140 = _4110;
    float _4142 = _4112;
    float _4144 = _4114;
    float _4146 = _4060;
    float _4148 = _4062;
    float _4150 = _4064;
    float _4152 = _4066;
    if (_1670)
    {
        float _4154 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _4156 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _4158 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _4160 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _4146 = _4154;
        _4148 = _4156;
        _4150 = _4158;
        _4152 = _4160;
    }
    float _4162 = _4146;
    float _4164 = _4148;
    float _4166 = _4150;
    float _4168 = _4152;
    float _4170 = _4068;
    float _4172 = _4070;
    float _4174 = _4072;
    float _4176 = _4074;
    if (_1670)
    {
        float _4178 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _4180 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _4182 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _4184 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _4170 = _4178;
        _4172 = _4180;
        _4174 = _4182;
        _4176 = _4184;
    }
    float _4186 = _4170;
    float _4188 = _4172;
    float _4190 = _4174;
    float _4192 = _4176;
    float _4194 = _4076 ? as_type<float>(_4078) : _1614;
    float _4196 = _4080 * 2.0;
    float _4198 = _4076 ? as_type<float>(_4082) : _1626;
    float _4200 = _4084 * 2.0;
    float _4202 = _4076 ? as_type<float>(_2446) : _1754;
    float _4204 = _4196 * _4086;
    float _4206 = _4076 ? as_type<float>(_4088) : _1748;
    float _4208 = _4084 * _4084;
    float _4210 = _4208 * 2.0;
    float _4212 = _4076 ? as_type<float>(_2448) : _1760;
    float _4214 = fma(_4200, _4090, _4204);
    float _4216 = _4076 ? as_type<float>(_4082) : _848;
    float _4218 = -_4204;
    float _4220 = fma(_4200, _4090, _4218);
    float _4222 = _4076 ? as_type<float>(_2450) : _1766;
    float _4224 = _4086 * 2.0;
    float _4226 = _4196 * _4090;
    float _4228 = _4076 ? as_type<float>(_4088) : _2462;
    float _4230 = _4090 * 2.0;
    float _4232 = _4076 ? as_type<float>(_2448) : _376;
    float _4234 = _4196 * _4084;
    float _4236 = -_4226;
    float _4238 = fma(_4224, _4084, _4236);
    float _4240 = fma(_4224, _4084, _4226);
    float _4242 = _4076 ? as_type<float>(_2446) : _374;
    float _4244 = fma(_4230, _4086, _4234);
    float _4246 = _4076 ? as_type<float>(_2450) : _378;
    float _4248 = -_4234;
    float _4250 = fma(_4230, _4086, _4248);
    float _4252 = _4090 * _4090;
    float _4254 = _4086 * _4086;
    float _4256 = _4076 ? as_type<float>(_4078) : _846;
    float _4258 = fma(_4252, -2.0, 1.0);
    float _4260 = fma(_4254, -2.0, 1.0);
    float _4262 = fma(_4254, -2.0, _4258);
    float _4264 = -_4210;
    float _4266 = _4264 + _4260;
    float _4268 = fma(_4212, _4106, _4206);
    float _4270 = fma(_4222, _4106, _4198);
    float _4272 = fma(_4202, _4106, _4194);
    float _4274 = _4224;
    float _4276 = _4222;
    float _4278 = _4138;
    float _4280 = _4252;
    float _4282 = _4254;
    float _4284 = _4196;
    float _4286 = _4202;
    float _4288 = _4206;
    float _4290 = _4140;
    float _4292 = _4142;
    float _4294 = _4144;
    float _4296 = _4246;
    float _4298 = _4228;
    float _4300 = _4240;
    if (_1670)
    {
        float _4302 = _4268 * _4140;
        _4274 = _4302;
    }
    float _4304 = _4274;
    float _4306 = _4188;
    float _4308 = _4166;
    float _4310 = _4190;
    float _4312 = _4164;
    float _4314 = _4168;
    if (_1670)
    {
        float _4316 = _4268 * _4164;
        _4276 = _4316;
    }
    float _4318 = _4276;
    float _4320 = _4318;
    if (_1670)
    {
        float _4322 = fma(_4272, _4138, _4304);
        _4278 = _4322;
    }
    float _4324 = _4278;
    float _4326 = -_4210;
    float _4328 = _4326 + 1.0;
    float _4330 = _4324;
    float _4332 = _4328;
    if (_1670)
    {
        float _4334 = _4268 * _4188;
        _4306 = _4334;
    }
    float _4336 = _4306;
    float _4338 = _4336;
    if (_1670)
    {
        float _4340 = fma(_4272, _4162, _4318);
        _2484 = _4340;
    }
    float _4342 = _2484;
    float _4344 = _4342;
    if (_1670)
    {
        float _4346 = fma(_4270, _4142, _4324);
        _4330 = _4346;
    }
    float _4348 = _4330;
    float _4350 = fma(_4252, -2.0, _4328);
    float _4352 = _4348;
    if (_1670)
    {
        float _4354 = fma(_4272, _4186, _4336);
        _4338 = _4354;
    }
    float _4356 = _4338;
    float _4358 = _4356;
    if (_1670)
    {
        float _4360 = fma(_4270, _4166, _4342);
        _4308 = _4360;
    }
    float _4362 = _4308;
    if (_1670)
    {
        float _4364 = _4348 + _4144;
        _4116 = _4364;
    }
    float _4366 = _4116;
    float _4368 = _4366;
    float _4370 = _4366;
    if (_1670)
    {
        float _4372 = fma(_4270, _4190, _4356);
        _4310 = _4372;
    }
    float _4374 = _4310;
    if (_1670)
    {
        float _4376 = _4362 + _4168;
        _4118 = _4376;
    }
    float _4378 = _4118;
    float _4380 = _4378;
    float _4382 = _4378;
    if (_1670)
    {
        float _4384 = _4374 + _4192;
        _4120 = _4384;
    }
    float _4386 = _4120;
    float _4388 = _4386;
    float _4390 = _4386;
    if (!_1670)
    {
        bool _4392 = !_1896;
        if (!_4392)
        {
            float _4394 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            uint _4396 = uint(int(uint(_182) >> uint(2)));
            float _4398 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4396)]);
            int _4400 = _182 + 4;
            uint _4402 = uint(int(uint(_4400) >> uint(2)));
            float _4404 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4402)]);
            int _4406 = _182 + 8;
            uint _4408 = uint(int(uint(_4406) >> uint(2)));
            float _4410 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4408)]);
            int _4412 = _182 + 12;
            uint _4414 = uint(int(uint(_4412) >> uint(2)));
            float _4416 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4414)]);
            uint _4418 = uint(int(uint(_182) >> uint(2)));
            float _4420 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4418)]);
            int _4422 = _182 + 4;
            uint _4424 = uint(int(uint(_4422) >> uint(2)));
            float _4426 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4424)]);
            int _4428 = _182 + 8;
            uint _4430 = uint(int(uint(_4428) >> uint(2)));
            float _4432 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4430)]);
            int _4434 = _182 + 12;
            uint _4436 = uint(int(uint(_4434) >> uint(2)));
            float _4438 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4436)]);
            uint _4440 = uint(int(uint(_182) >> uint(2)));
            float _4442 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4440)]);
            int _4444 = _182 + 4;
            uint _4446 = uint(int(uint(_4444) >> uint(2)));
            float _4448 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4446)]);
            int _4450 = _182 + 8;
            uint _4452 = uint(int(uint(_4450) >> uint(2)));
            float _4454 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4452)]);
            int _4456 = _182 + 12;
            uint _4458 = uint(int(uint(_4456) >> uint(2)));
            float _4460 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4458)]);
            float _4462 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _4464 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _4466 = _4404 * _4268;
            float _4468 = _4426 * _4268;
            float _4470 = _4448 * _4268;
            float _4472 = fma(_4398, _4272, _4466);
            float _4474 = fma(_4420, _4272, _4468);
            float _4476 = fma(_4442, _4272, _4470);
            float _4478 = fma(_4410, _4270, _4472);
            float _4480 = fma(_4432, _4270, _4474);
            float _4482 = fma(_4454, _4270, _4476);
            float _4484 = _4394 + _4478;
            float _4486 = _4462 + _4480;
            float _4488 = _4464 + _4482;
            _4332 = _4398;
            _4280 = _4478;
            _4320 = _4410;
            _4282 = _4416;
            _4284 = _4420;
            _4344 = _4480;
            _4286 = _4432;
            _4288 = _4438;
            _4352 = _4442;
            _4290 = _4482;
            _4292 = _4454;
            _4294 = _4460;
            _4370 = _4484;
            _4390 = _4488;
            _4382 = _4486;
            _4490 = true;
        }
        else
        {
            if (!_1956)
            {
                _4368 = _4272;
            }
            float _4492 = _4368;
            _4370 = _4492;
            if (!_1956)
            {
                _4380 = _4268;
            }
            float _4494 = _4380;
            _4382 = _4494;
            if (!_1956)
            {
                _4388 = _4270;
            }
            float _4496 = _4388;
            bool _4498 = !_1956;
            _4390 = _4496;
            if (!_4498)
            {
                uint _4500 = uint(int(uint(_182) >> uint(2)));
                float _4502 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4500)]);
                int _4504 = _182 + 4;
                uint _4506 = uint(int(uint(_4504) >> uint(2)));
                float _4508 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4506)]);
                int _4510 = _182 + 8;
                uint _4512 = uint(int(uint(_4510) >> uint(2)));
                float _4514 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4512)]);
                int _4516 = _182 + 12;
                uint _4518 = uint(int(uint(_4516) >> uint(2)));
                float _4520 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4518)]);
                uint _4522 = uint(int(uint(_182) >> uint(2)));
                float _4524 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4522)]);
                int _4526 = _182 + 4;
                uint _4528 = uint(int(uint(_4526) >> uint(2)));
                float _4530 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4528)]);
                int _4532 = _182 + 8;
                uint _4534 = uint(int(uint(_4532) >> uint(2)));
                float _4536 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4534)]);
                int _4538 = _182 + 12;
                uint _4540 = uint(int(uint(_4538) >> uint(2)));
                float _4542 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4540)]);
                uint _4544 = uint(int(uint(_182) >> uint(2)));
                float _4546 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4544)]);
                int _4548 = _182 + 4;
                uint _4550 = uint(int(uint(_4548) >> uint(2)));
                float _4552 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4550)]);
                int _4554 = _182 + 8;
                uint _4556 = uint(int(uint(_4554) >> uint(2)));
                float _4558 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4556)]);
                int _4560 = _182 + 12;
                uint _4562 = uint(int(uint(_4560) >> uint(2)));
                float _4564 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4562)]);
                float _4566 = _4508 * _4268;
                float _4568 = _4530 * _4268;
                float _4570 = _4552 * _4268;
                float _4572 = fma(_4502, _4272, _4566);
                float _4574 = fma(_4524, _4272, _4568);
                float _4576 = fma(_4546, _4272, _4570);
                float _4578 = fma(_4514, _4270, _4572);
                float _4580 = fma(_4536, _4270, _4574);
                float _4582 = fma(_4558, _4270, _4576);
                float _4584 = _4578 + _4520;
                float _4586 = _4580 + _4542;
                float _4588 = _4582 + _4564;
                _4332 = _4502;
                _4280 = _4572;
                _4320 = _4578;
                _4282 = _4520;
                _4284 = _4524;
                _4344 = _4574;
                _4286 = _4580;
                _4288 = _4542;
                _4352 = _4546;
                _4290 = _4576;
                _4292 = _4582;
                _4294 = _4564;
                _4370 = _4584;
                _4390 = _4588;
                _4382 = _4586;
            }
        }
    }
    _4490 = false;
    float _4590 = _4332;
    float _4592 = _4280;
    float _4594 = _4320;
    float _4596 = _4282;
    float _4598 = _4284;
    float _4600 = _4344;
    float _4602 = _4286;
    float _4604 = _4288;
    float _4606 = _4352;
    float _4608 = _4290;
    float _4610 = _4292;
    float _4612 = _4294;
    float _4614 = _4370;
    float _4616 = _4390;
    float _4618 = _4382;
    float _4620 = _4590;
    float _4622 = _4592;
    float _4624 = _4594;
    float _4626 = _4596;
    if (_1670)
    {
        float _4628 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _4630 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _4632 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _4634 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _4620 = _4628;
        _4622 = _4630;
        _4624 = _4632;
        _4626 = _4634;
    }
    float _4636 = _4620;
    float _4638 = _4622;
    float _4640 = _4624;
    float _4642 = _4626;
    float _4644 = _4598;
    float _4646 = _4600;
    float _4648 = _4602;
    float _4650 = _4604;
    if (_1670)
    {
        float _4652 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _4654 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _4656 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _4658 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _4644 = _4652;
        _4646 = _4654;
        _4648 = _4656;
        _4650 = _4658;
    }
    float _4660 = _4644;
    float _4662 = _4646;
    float _4664 = _4648;
    float _4666 = _4650;
    float _4668 = _4606;
    float _4670 = _4608;
    float _4672 = _4610;
    float _4674 = _4612;
    if (_1670)
    {
        float _4676 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _4678 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _4680 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _4682 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _4668 = _4676;
        _4670 = _4678;
        _4672 = _4680;
        _4674 = _4682;
    }
    float _4684 = _4668;
    float _4686 = _4670;
    float _4688 = _4672;
    float _4690 = _4674;
    float _4692 = _4232 * 59.999996185302734375;
    float _4694 = _4242 * 59.999996185302734375;
    float _4696 = _4246 * 59.999996185302734375;
    float _4698 = _4642;
    float _4700 = _4638;
    float _4702 = _4640;
    float _4704 = _4636;
    float _4706 = _4638;
    if (_1670)
    {
        float _4708 = _4692 * _4638;
        _4698 = _4708;
    }
    float _4710 = _4698;
    float _4712 = _4666;
    float _4714 = _4710;
    float _4716 = _4662;
    float _4718 = _4664;
    float _4720 = _4660;
    float _4722 = _4662;
    float _4724 = _4664;
    if (_1670)
    {
        float _4726 = _4692 * _4662;
        _4712 = _4726;
    }
    float _4728 = _4712;
    float _4730 = _4728;
    if (_1670)
    {
        float _4732 = fma(_4694, _4636, _4710);
        _4714 = _4732;
    }
    float _4734 = _4714;
    float _4736 = _4690;
    float _4738 = _4734;
    float _4740 = _4686;
    float _4742 = _4688;
    float _4744 = _4684;
    float _4746 = _4686;
    float _4748 = _4688;
    if (_1670)
    {
        float _4750 = _4692 * _4686;
        _4736 = _4750;
    }
    float _4752 = _4736;
    float _4754 = _4752;
    if (_1670)
    {
        float _4756 = fma(_4694, _4660, _4728);
        _4730 = _4756;
    }
    float _4758 = _4730;
    float _4760 = _4758;
    if (_1670)
    {
        float _4762 = fma(_4696, _4640, _4734);
        _4738 = _4762;
    }
    float _4764 = _4738;
    float _4766 = _4764;
    float _4768 = _4764;
    if (_1670)
    {
        float _4770 = fma(_4694, _4684, _4752);
        _4754 = _4770;
    }
    float _4772 = _4754;
    float _4774 = _4772;
    if (_1670)
    {
        float _4776 = fma(_4696, _4664, _4758);
        _4760 = _4776;
    }
    float _4778 = _4760;
    float _4780 = _4778;
    float _4782 = _4778;
    if (_1670)
    {
        float _4784 = fma(_4696, _4688, _4772);
        _4774 = _4784;
    }
    float _4786 = _4774;
    float _4788 = _4786;
    float _4790 = _4786;
    if (!_1670)
    {
        bool _4792 = !_1896;
        if (!_4792)
        {
            uint _4794 = uint(int(uint(_182) >> uint(2)));
            float _4796 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4794)]);
            int _4798 = _182 + 4;
            uint _4800 = uint(int(uint(_4798) >> uint(2)));
            float _4802 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4800)]);
            int _4804 = _182 + 8;
            uint _4806 = uint(int(uint(_4804) >> uint(2)));
            float _4808 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4806)]);
            int _4810 = _182 + 12;
            uint _4812 = uint(int(uint(_4810) >> uint(2)));
            float _4814 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4812)]);
            uint _4816 = uint(int(uint(_182) >> uint(2)));
            float _4818 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4816)]);
            int _4820 = _182 + 4;
            uint _4822 = uint(int(uint(_4820) >> uint(2)));
            float _4824 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4822)]);
            int _4826 = _182 + 8;
            uint _4828 = uint(int(uint(_4826) >> uint(2)));
            float _4830 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4828)]);
            uint _4832 = uint(int(uint(_182) >> uint(2)));
            float _4834 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4832)]);
            int _4836 = _182 + 4;
            uint _4838 = uint(int(uint(_4836) >> uint(2)));
            float _4840 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4838)]);
            int _4842 = _182 + 8;
            uint _4844 = uint(int(uint(_4842) >> uint(2)));
            float _4846 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4844)]);
            int _4848 = _182 + 12;
            uint _4850 = uint(int(uint(_4848) >> uint(2)));
            float _4852 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4850)]);
            float _4854 = _4802 * _4692;
            float _4856 = _4824 * _4692;
            float _4858 = _4840 * _4692;
            float _4860 = fma(_4796, _4694, _4854);
            float _4862 = fma(_4818, _4694, _4856);
            float _4864 = fma(_4834, _4694, _4858);
            float _4866 = fma(_4808, _4696, _4860);
            float _4868 = fma(_4830, _4696, _4862);
            float _4870 = fma(_4846, _4696, _4864);
            _4312 = _4860;
            _4314 = _4814;
            _4358 = _4862;
            _4296 = _4846;
            _852 = _4852;
            _4782 = _4868;
            _4768 = _4866;
            _4790 = _4870;
            _4872 = true;
        }
        else
        {
            if (!_1956)
            {
                _4766 = _4694;
            }
            float _4874 = _4766;
            _4768 = _4874;
            if (!_1956)
            {
                _4780 = _4692;
            }
            float _4876 = _4780;
            _4782 = _4876;
            if (!_1956)
            {
                _4788 = _4696;
            }
            float _4878 = _4788;
            bool _4880 = !_1956;
            _4790 = _4878;
            if (!_4880)
            {
                uint _4882 = uint(int(uint(_182) >> uint(2)));
                float _4884 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4882)]);
                int _4886 = _182 + 4;
                uint _4888 = uint(int(uint(_4886) >> uint(2)));
                float _4890 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4888)]);
                int _4892 = _182 + 8;
                uint _4894 = uint(int(uint(_4892) >> uint(2)));
                float _4896 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4894)]);
                int _4898 = _182 + 12;
                uint _4900 = uint(int(uint(_4898) >> uint(2)));
                float _4902 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4900)]);
                uint _4904 = uint(int(uint(_182) >> uint(2)));
                float _4906 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4904)]);
                int _4908 = _182 + 4;
                uint _4910 = uint(int(uint(_4908) >> uint(2)));
                float _4912 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4910)]);
                int _4914 = _182 + 8;
                uint _4916 = uint(int(uint(_4914) >> uint(2)));
                float _4918 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4916)]);
                uint _4920 = uint(int(uint(_182) >> uint(2)));
                float _4922 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4920)]);
                int _4924 = _182 + 4;
                uint _4926 = uint(int(uint(_4924) >> uint(2)));
                float _4928 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4926)]);
                int _4930 = _182 + 8;
                uint _4932 = uint(int(uint(_4930) >> uint(2)));
                float _4934 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4932)]);
                int _4936 = _182 + 12;
                uint _4938 = uint(int(uint(_4936) >> uint(2)));
                float _4940 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4938)]);
                float _4942 = _4890 * _4692;
                float _4944 = _4912 * _4692;
                float _4946 = _4928 * _4692;
                float _4948 = fma(_4884, _4694, _4942);
                float _4950 = fma(_4906, _4694, _4944);
                float _4952 = fma(_4922, _4694, _4946);
                float _4954 = fma(_4896, _4696, _4948);
                float _4956 = fma(_4918, _4696, _4950);
                float _4958 = fma(_4934, _4696, _4952);
                _4312 = _4948;
                _4314 = _4902;
                _4358 = _4950;
                _4296 = _4934;
                _852 = _4940;
                _4782 = _4956;
                _4768 = _4954;
                _4790 = _4958;
            }
        }
    }
    _4872 = false;
    float _4960 = _4312;
    float _4962 = _4314;
    float _4964 = _4358;
    float _4966 = _4296;
    float _4968 = _852;
    float _4970 = _4782;
    float _4972 = _4768;
    float _4974 = _4790;
    float _4976 = -_4268;
    float _4978 = _4976 + _4228;
    float _4980 = -_4272;
    float _4982 = _4980 + _4256;
    float _4984 = -_4270;
    float _4986 = _4984 + _4216;
    float _4988 = _4960;
    float _4990 = _4962;
    float _4992 = _4964;
    float _4994 = _4968;
    float _4996 = _4966;
    float _4998 = _4972;
    float _5000 = _4970;
    float _5002 = _4974;
    if (_1670)
    {
        float _5004 = _4978 * _4638;
        _4988 = _5004;
    }
    float _5006 = _4988;
    float _5008 = _5006;
    if (_1670)
    {
        float _5010 = _4978 * _4662;
        _4990 = _5010;
    }
    float _5012 = _4990;
    float _5014 = _5012;
    if (_1670)
    {
        float _5016 = _4978 * _4686;
        _4992 = _5016;
    }
    float _5018 = _4992;
    float _5020 = _5018;
    if (_1670)
    {
        float _5022 = fma(_4982, _4636, _5006);
        _5008 = _5022;
    }
    float _5024 = _5008;
    if (_1670)
    {
        float _5026 = fma(_4982, _4660, _5012);
        _5014 = _5026;
    }
    float _5028 = _5014;
    if (_1670)
    {
        float _5030 = fma(_4982, _4684, _5018);
        _5020 = _5030;
    }
    float _5032 = _5020;
    if (_1670)
    {
        float _5034 = fma(_4986, _4640, _5024);
        _4994 = _5034;
    }
    float _5036 = _4994;
    float _5038 = _5036;
    float _5040 = _5036;
    if (_1670)
    {
        float _5042 = fma(_4986, _4664, _5028);
        _4298 = _5042;
    }
    float _5044 = _4298;
    float _5046 = _5044;
    float _5048 = _5044;
    if (_1670)
    {
        float _5050 = fma(_4986, _4688, _5032);
        _4996 = _5050;
    }
    float _5052 = _4996;
    float _5054 = _5052;
    float _5056 = _5052;
    if (!_1670)
    {
        bool _5058 = !_1896;
        if (!_5058)
        {
            uint _5060 = uint(int(uint(_182) >> uint(2)));
            float _5062 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5060)]);
            int _5064 = _182 + 4;
            uint _5066 = uint(int(uint(_5064) >> uint(2)));
            float _5068 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5066)]);
            int _5070 = _182 + 8;
            uint _5072 = uint(int(uint(_5070) >> uint(2)));
            float _5074 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5072)]);
            uint _5076 = uint(int(uint(_182) >> uint(2)));
            float _5078 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5076)]);
            int _5080 = _182 + 4;
            uint _5082 = uint(int(uint(_5080) >> uint(2)));
            float _5084 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5082)]);
            int _5086 = _182 + 8;
            uint _5088 = uint(int(uint(_5086) >> uint(2)));
            float _5090 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5088)]);
            uint _5092 = uint(int(uint(_182) >> uint(2)));
            float _5094 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5092)]);
            int _5096 = _182 + 4;
            uint _5098 = uint(int(uint(_5096) >> uint(2)));
            float _5100 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5098)]);
            int _5102 = _182 + 8;
            uint _5104 = uint(int(uint(_5102) >> uint(2)));
            float _5106 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5104)]);
            float _5108 = _5068 * _4978;
            float _5110 = _5084 * _4978;
            float _5112 = _5100 * _4978;
            float _5114 = fma(_5062, _4982, _5108);
            float _5116 = fma(_5078, _4982, _5110);
            float _5118 = fma(_5094, _4982, _5112);
            float _5120 = fma(_5074, _4986, _5114);
            float _5122 = fma(_5090, _4986, _5116);
            float _5124 = fma(_5106, _4986, _5118);
            _5040 = _5120;
            _5048 = _5122;
            _5056 = _5124;
            _5126 = true;
        }
        else
        {
            if (!_1956)
            {
                _5038 = _4982;
            }
            float _5128 = _5038;
            _5040 = _5128;
            if (!_1956)
            {
                _5046 = _4978;
            }
            float _5130 = _5046;
            _5048 = _5130;
            if (!_1956)
            {
                _5054 = _4986;
            }
            float _5132 = _5054;
            bool _5134 = !_1956;
            _5056 = _5132;
            if (!_5134)
            {
                uint _5136 = uint(int(uint(_182) >> uint(2)));
                float _5138 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5136)]);
                int _5140 = _182 + 4;
                uint _5142 = uint(int(uint(_5140) >> uint(2)));
                float _5144 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5142)]);
                int _5146 = _182 + 8;
                uint _5148 = uint(int(uint(_5146) >> uint(2)));
                float _5150 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5148)]);
                uint _5152 = uint(int(uint(_182) >> uint(2)));
                float _5154 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5152)]);
                int _5156 = _182 + 4;
                uint _5158 = uint(int(uint(_5156) >> uint(2)));
                float _5160 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5158)]);
                int _5162 = _182 + 8;
                uint _5164 = uint(int(uint(_5162) >> uint(2)));
                float _5166 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5164)]);
                uint _5168 = uint(int(uint(_182) >> uint(2)));
                float _5170 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5168)]);
                int _5172 = _182 + 4;
                uint _5174 = uint(int(uint(_5172) >> uint(2)));
                float _5176 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5174)]);
                int _5178 = _182 + 8;
                uint _5180 = uint(int(uint(_5178) >> uint(2)));
                float _5182 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5180)]);
                float _5184 = _5144 * _4978;
                float _5186 = _5160 * _4978;
                float _5188 = _5176 * _4978;
                float _5190 = fma(_5138, _4982, _5184);
                float _5192 = fma(_5154, _4982, _5186);
                float _5194 = fma(_5170, _4982, _5188);
                float _5196 = fma(_5150, _4986, _5190);
                float _5198 = fma(_5166, _4986, _5192);
                float _5200 = fma(_5182, _4986, _5194);
                _5040 = _5196;
                _5048 = _5198;
                _5056 = _5200;
            }
        }
    }
    _5126 = false;
    float _5202 = _5040;
    float _5204 = _5048;
    float _5206 = _5056;
    int _5208 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 24;
    uint _5210 = uint(int(uint(_5208) >> uint(2)));
    float _5212 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_5210)]);
    int _5214 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 16;
    uint _5216 = uint(int(uint(_5214) >> uint(2)));
    float _5218 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_5216)]);
    uint _5220 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
    float _5222 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_5220)]);
    int _5224 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 8;
    uint _5226 = uint(int(uint(_5224) >> uint(2)));
    float _5228 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_5226)]);
    float _5230 = fma(_4614, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
    float _5232 = fma(_4616, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
    float _5234 = fma(_4614, 6.2500002968590706586837768554688e-05, 0.5);
    float _5236 = fma(_4616, 6.2500002968590706586837768554688e-05, 0.5);
    float _5238 = fma(_4616, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
    float _5240 = fma(_4614, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
    float _5242 = fma(_4614, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
    float _5244 = fma(_4616, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
    float _5246 = _5212 * _5212;
    float _5248 = fma(_5218, _5218, _5246);
    float _5250 = rsqrt(_5248);
    float _5252 = _5250 * (-20.0);
    float _5254 = fma(_5218, _5252, _5222);
    float _5256 = fma(_5212, _5252, _5228);
    float _5258 = _5254 * 0.5;
    float _5260 = _5256 * 0.5;
    float _5262 = floor(_5260);
    float _5264 = floor(_5258);
    float _5266 = fma(_5262, 2.0, -32.0);
    float _5268 = -_5266;
    float _5270 = _5268 + _4616;
    float _5272 = fma(_5264, 2.0, -32.0);
    float _5274 = _5270 * 0.015625;
    float _5276 = -_5272;
    float _5278 = _5276 + _4614;
    float _5280 = _5278 * 0.015625;
    float2 _17597 = float2(_5280, _5274);
    float2 _5282 = dm_bs(spvDescriptorSet0.cp_t_tcb_26.sample(spvDescriptorSet0.cp_t_tcb_26Smplr, select(_17597, float2(0.0), isnan(_17597)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_26, spvDescriptorSet0.cp_t_tcb_26Smplr_w, select(_17597, float2(0.0), isnan(_17597)), level(0.0)).xy;
    float _5284 = _5282.x;
    float _5286 = _5282.y;
    float2 _17609 = float2(_5230, _5232);
    float _5288 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_17609, float2(0.0), isnan(_17609)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_17609, float2(0.0), isnan(_17609)), level(0.0)).x;
    float2 _17617 = float2(_5234, _5236);
    float2 _5290 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_17617, float2(0.0), isnan(_17617)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_17617, float2(0.0), isnan(_17617)), level(0.0)).xy;
    float _5292 = _5290.x;
    float _5294 = _5290.y;
    float2 _17629 = float2(_5230, _5238);
    float _5296 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_17629, float2(0.0), isnan(_17629)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_17629, float2(0.0), isnan(_17629)), level(0.0)).x;
    float2 _17637 = float2(_5240, _5232);
    float _5298 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_17637, float2(0.0), isnan(_17637)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_17637, float2(0.0), isnan(_17637)), level(0.0)).x;
    float2 _17645 = float2(_5240, _5238);
    float _5300 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_17645, float2(0.0), isnan(_17645)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_17645, float2(0.0), isnan(_17645)), level(0.0)).x;
    float2 _17653 = float2(_5242, _5236);
    float _5302 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_17653, float2(0.0), isnan(_17653)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_17653, float2(0.0), isnan(_17653)), level(0.0)).x;
    float2 _17661 = float2(_5234, _5244);
    float _5304 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_17661, float2(0.0), isnan(_17661)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_17661, float2(0.0), isnan(_17661)), level(0.0)).x;
    float2 _17669 = float2(_5234, _5236);
    float _5306 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_17669, float2(0.0), isnan(_17669)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_17669, float2(0.0), isnan(_17669)), level(0.0)).y;
    float2 _17677 = float2(_5242, _5236);
    float2 _5308 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_17677, float2(0.0), isnan(_17677)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_17677, float2(0.0), isnan(_17677)), level(0.0)).xy;
    float _5310 = _5308.x;
    float _5312 = _5308.y;
    float2 _17689 = float2(_5234, _5244);
    float2 _5314 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_17689, float2(0.0), isnan(_17689)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_17689, float2(0.0), isnan(_17689)), level(0.0)).xy;
    float _5316 = _5314.x;
    float _5318 = _5314.y;
    float _5320 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[73]);
    float _5322 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[72]);
    float _5324 = _1860 * 19.23889923095703125;
    float _5326 = _1854 * 19.23889923095703125;
    float _5328 = _5324 * 0.15915493667125701904296875;
    float _5330 = _5326 * 0.15915493667125701904296875;
    float _5332 = _5328 * 6.283185482025146484375;
    float _5334 = sin(_5332);
    float _5336 = fma(_200, 3.1415927410125732421875, -1.57079637050628662109375);
    float _5338 = _5336 * 0.15915493667125701904296875;
    float _5340 = _5330 * 6.283185482025146484375;
    float _5342 = sin(_5340);
    float _5344 = _5338 * 6.283185482025146484375;
    float _5346 = cos(_5344);
    float _5348 = _5334 * 34873.41015625;
    float _5350 = _5338 * 6.283185482025146484375;
    float _5352 = sin(_5350);
    float _5354 = _5342 * 34873.41015625;
    float _5356 = 1.0 / _4106;
    float _5358 = floor(_5348);
    float _5360 = floor(_5354);
    float _5362 = -_5358;
    float _5364 = _5362 + _5348;
    float _5366 = -_5360;
    float _5368 = _5354 + _5366;
    float _5370 = _5286 * 14.99999904632568359375;
    float _5372 = _5284 * 14.99999904632568359375;
    float _5374 = -_5292;
    float _5376 = _5374 + _5288;
    float _5378 = -_5292;
    float _5380 = _5378 + _5296;
    float _5382 = _5370 * _5346;
    float _5384 = _5370 * _5352;
    float _5386 = _5370 * _5370;
    float _5388 = _5376 * 2000.0;
    float _5390 = fma(_5372, _5352, _5382);
    float _5392 = _5356 * 59.999996185302734375;
    float _5394 = -_5384;
    float _5396 = fma(_5372, _5346, _5394);
    float _5398 = fma(_5372, _5372, _5386);
    float _5400 = _5202 * _5392;
    float _5402 = _5204 * _5392;
    float _5404 = _5206 * _5392;
    float _5406 = _5380 * 2000.0;
    float _5408 = _5292 * 2000.0;
    float _5410 = -_5292;
    float _5412 = _5410 + _5298;
    float _5414 = fma(_5364, 0.800000011920928955078125, 0.20000000298023223876953125);
    float _5416 = -_5294;
    float _5418 = _5292 + _5416;
    float _5420 = _5408 + (-2.0);
    float _5422 = -_5292;
    float _5424 = _5422 + _5300;
    float _5426 = _5412 * 2000.0;
    float _5428 = abs(_5388);
    float _5430 = abs(_5406);
    float _5432 = precise::max(_5428, _5430);
    float _5434 = -_5292;
    float _5436 = _5434 + _5302;
    float _5438 = -_5320;
    float _5440 = _5438 + 1.0;
    float _5442 = _5418 * 2000.0;
    float _5444 = _5424 * 2000.0;
    bool _5446 = _4618 >= _5420;
    bool _5448 = isnan(_4618);
    bool _5450 = _5446 || _5448;
    bool _5452 = isnan(_5420);
    bool _5454 = _5450 || _5452;
    float _5456 = -_5292;
    float _5458 = _5456 + _5304;
    float _5460 = abs(_5426);
    float _5462 = precise::max(_5432, _5460);
    float _5464 = _5436 * 1000.0;
    float _5466 = fma(_206, _5320, _5440);
    float _5468 = abs(_5442);
    bool _5470 = _5468 < 2.0;
    bool _5472 = !_5454;
    bool _5474 = _5470 || _5472;
    float _5476 = fma(_5368, _5368, 0.0400000028312206268310546875);
    float _5478 = abs(_5444);
    float _5480 = precise::max(_5462, _5478);
    float _5482 = _5458 * 1000.0;
    float _5484 = fma(_5464, _5464, 0.0625);
    float _5486 = fma(_5414, _5414, _5476);
    float _5488 = sqrt(_5398);
    float _5490 = fma(_5482, _5482, _5484);
    float _5492 = rsqrt(_5490);
    float _5494 = sqrt(_5486);
    float _5496 = _5492 * 0.25;
    float _5498 = sqrt(_5488);
    bool _5500 = _5496 < 0.891006529331207275390625;
    bool _5502 = _5500 || _5474;
    float _5504 = _5494 + 9.9999997473787516355514526367188e-06;
    bool _5506 = _5480 >= 2.0;
    bool _5508 = isnan(_5480);
    bool _5510 = _5506 || _5508;
    bool _5512 = isnan(2.0);
    bool _5514 = _5510 || _5512;
    bool _5516 = _5514 || _5502;
    float _5518 = _5294 * 2000.0;
    float _5520 = 1.0 / _5504;
    float _5522 = _5518;
    float _5524 = _5396;
    float _5526 = _5404;
    float _5528 = _5400;
    float _5530 = _5318;
    float _5532 = _5312;
    if (!_5516)
    {
        float _5534 = _5482 * _5492;
        float _5536 = _5464 * _5492;
        float _5538 = 1.0 / _5496;
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
        float _5580 = fma(_5578, _5548, _5408);
        _5522 = _5580;
    }
    float _5582 = _5522;
    float _5584 = -_5582;
    float _5586 = _4618 + _5584;
    float _5588 = _5520 * _5368;
    bool _5590 = _5498 >= 0.5;
    float _5592 = _5520 * 0.20000000298023223876953125;
    float _5594 = abs(_5586);
    float _5596 = _5594 * 0.20000000298023223876953125;
    float _5598 = precise::clamp(_5596, 0.0, 1.0);
    bool _5600 = _5498 >= 1.0;
    float _5602 = _4220 * _5588;
    float _5604 = -_5520;
    float _5606 = _5414 * _5604;
    float _5608 = -_5598;
    float _5610 = _5608 + 1.0;
    float _5612 = _4266 * _5588;
    float _5614 = _4244 * _5588;
    float _5616 = fma(_4262, _5592, _5602);
    float _5618 = _5610 * _5610;
    float _5620 = fma(_4214, _5592, _5612);
    float _5622 = fma(_4238, _5592, _5614);
    float _5624 = _5322 * 500.0;
    float _5626 = _5618 * _5618;
    float _5628 = _5322 * 300.0;
    float _5630 = fma(_4250, _5606, _5620);
    float _5632 = _4350 * 0.100000001490116119384765625;
    float _5634 = _5466 * _5626;
    float _5636 = fma(_4240, _5606, _5616);
    float _5638 = -_5292;
    float _5640 = _5638 + _5310;
    float _5642 = -_5292;
    float _5644 = _5642 + _5316;
    float _5646 = _5616;
    float _5648 = _5606;
    float _5650 = _5624;
    if (_5590)
    {
        float _5652 = _5628 * _5634;
        _5646 = _5652;
    }
    float _5654 = _5646;
    float _5656 = fma(_4350, _5606, _5622);
    float _5658 = _5654;
    if (_5600)
    {
        float _5660 = _5624 * _5634;
        _5648 = _5660;
    }
    float _5662 = _5648;
    if (_5590)
    {
        float _5664 = _5390 * _5654;
        _5650 = _5664;
    }
    float _5666 = _5650;
    if (_5590)
    {
        float _5668 = _5396 * _5654;
        _5524 = _5668;
    }
    float _5670 = _5524;
    float _5672 = _5402;
    if (_5600)
    {
        float _5674 = _5498 * _5662;
        _5658 = _5674;
    }
    float _5676 = _5658;
    if (_5590)
    {
        float _5678 = fma(_4106, _5666, _5404);
        _5526 = _5678;
    }
    float _5680 = _5526;
    float _5682 = _4250 * 0.100000001490116119384765625;
    float _5684 = _4240 * 0.100000001490116119384765625;
    float _5686 = fma(_4238, 0.20000000298023223876953125, _5632);
    if (_5600)
    {
        float _5688 = fma(_4106, _5676, _5402);
        _5672 = _5688;
    }
    float _5690 = _5672;
    float _5692 = _5690;
    if (_5590)
    {
        float _5694 = fma(_4106, _5670, _5400);
        _5528 = _5694;
    }
    float _5696 = _5528;
    float _5698 = fma(_4214, 0.20000000298023223876953125, _5682);
    float _5700 = fma(_4262, 0.20000000298023223876953125, _5684);
    float _5702 = _5686 * _4098;
    float _5704 = -_5690;
    float _5706 = _4970 + _5704;
    float _5708 = _5698 * _4100;
    float _5710 = _5700 * _4102;
    float _5712 = -_5702;
    float _5714 = fma(_5700, _4100, _5712);
    float _5716 = -_5696;
    float _5718 = _4972 + _5716;
    float _5720 = -_5708;
    float _5722 = fma(_5686, _4102, _5720);
    float _5724 = _4238 * (-0.20000000298023223876953125);
    float _5726 = _5706 + _5714;
    float _5728 = -_5710;
    float _5730 = fma(_5698, _4098, _5728);
    float _5732 = _5718 + _5722;
    float _5734 = _4214 * (-0.20000000298023223876953125);
    float _5736 = -_5680;
    float _5738 = _4974 + _5736;
    float _5740 = _5726 * _5726;
    float _5742 = _4262 * (-0.20000000298023223876953125);
    float _5744 = _5724 * _4098;
    float _5746 = _5738 + _5730;
    float _5748 = fma(_5732, _5732, _5740);
    float _5750 = _5734 * _4100;
    float _5752 = -_5744;
    float _5754 = fma(_5742, _4100, _5752);
    float _5756 = fma(_5746, _5746, _5748);
    float _5758 = -_5750;
    float _5760 = fma(_5724, _4102, _5758);
    float _5762 = _5742 * _4102;
    float _5764 = _5706 + _5754;
    float _5766 = rsqrt(_5756);
    float _5768 = _5718 + _5760;
    float _5770 = -_5762;
    float _5772 = fma(_5734, _4098, _5770);
    float _5774 = _5764 * _5764;
    float _5776 = _5738 + _5772;
    float _5778 = fma(_5768, _5768, _5774);
    float _5780 = sqrt(_5756);
    float _5782 = -_5294;
    float _5784 = _5292 + _5782;
    float _5786 = _5640 * 1000.0;
    float _5788 = fma(_5776, _5776, _5778);
    float _5790 = _5408 + (-2.0);
    float _5792 = _5784 * 2000.0;
    float _5794 = _5726 * _5766;
    bool _5796 = _4618 >= _5790;
    bool _5798 = isnan(_4618);
    bool _5800 = _5796 || _5798;
    bool _5802 = isnan(_5790);
    bool _5804 = _5800 || _5802;
    float _5806 = _4250 * 0.980571091175079345703125;
    float _5808 = rsqrt(_5788);
    float _5810 = _5732 * _5766;
    float _5812 = abs(_5792);
    bool _5814 = _5812 < 2.0;
    bool _5816 = !_5804;
    bool _5818 = _5814 || _5816;
    float _5820 = _4240 * 0.980571091175079345703125;
    float _5822 = _5746 * _5766;
    bool _5824 = _5780 != 0.0;
    bool _5826 = isnan(_5780);
    bool _5828 = _5824 || _5826;
    bool _5830 = isnan(0.0);
    bool _5832 = _5828 || _5830;
    float _5834 = fma(_4266, 0.19611422717571258544921875, _5806);
    float _5836 = fma(_4220, 0.19611422717571258544921875, _5820);
    float _5838 = sqrt(_5788);
    float _5840 = _5832 ? _5794 : 0.0;
    float _5842 = fma(_5786, _5786, 0.0625);
    float _5844 = _5832 ? _5810 : 0.0;
    float _5846 = _5832 ? _5822 : 0.0;
    float _5848 = _5840 * _5834;
    float _5850 = _5764 * _5808;
    float _5852 = _5776 * _5808;
    float _5854 = fma(_5844, _5836, _5848);
    float _5856 = _5644 * 1000.0;
    float _5858 = _4350 * 0.980571091175079345703125;
    float _5860 = _5768 * _5808;
    float _5862 = fma(_5856, _5856, _5842);
    bool _5864 = _5838 != 0.0;
    bool _5866 = isnan(_5838);
    bool _5868 = _5864 || _5866;
    bool _5870 = isnan(0.0);
    bool _5872 = _5868 || _5870;
    float _5874 = fma(_4244, 0.19611422717571258544921875, _5858);
    float _5876 = _5872 ? _5850 : 0.0;
    float _5878 = rsqrt(_5862);
    float _5880 = _5872 ? _5860 : 0.0;
    float _5882 = fma(_5846, _5874, _5854);
    float _5884 = _5872 ? _5852 : 0.0;
    float _5886 = _5876 * _5630;
    float _5888 = _5756 * _5882;
    float _5890 = fma(_5880, _5636, _5886);
    float _5892 = _5874 * _5888;
    float _5894 = _5836 * _5888;
    float _5896 = fma(_5884, _5656, _5890);
    float _5898 = _5834 * _5888;
    float _5900 = _5878 * 0.25;
    float _5902 = _5788 * _5896;
    float _5904 = _5636 * _5902;
    bool _5906 = _5900 < 0.891006529331207275390625;
    bool _5908 = _5906 || _5818;
    float _5910 = -_5892;
    float _5912 = _5700 * _5910;
    float _5914 = _5630 * _5902;
    float _5916 = -_5898;
    float _5918 = _5686 * _5916;
    bool _5920 = _5480 >= 2.0;
    bool _5922 = isnan(_5480);
    bool _5924 = _5920 || _5922;
    bool _5926 = isnan(2.0);
    bool _5928 = _5924 || _5926;
    bool _5930 = _5928 || _5908;
    float _5932 = -_5894;
    float _5934 = -_5912;
    float _5936 = fma(_5686, _5932, _5934);
    float _5938 = _5656 * _5902;
    float _5940 = -_5914;
    float _5942 = _5724 * _5940;
    float _5944 = -_5892;
    float _5946 = -_5918;
    float _5948 = fma(_5698, _5944, _5946);
    float _5950 = -_5892;
    float _5952 = -_5938;
    float _5954 = _5950 + _5952;
    float _5956 = -_5938;
    float _5958 = -_5942;
    float _5960 = fma(_5734, _5956, _5958);
    float _5962 = -_5938;
    float _5964 = _5742 * _5962;
    float _5966 = -_5894;
    float _5968 = _5698 * _5966;
    float _5970 = -_5904;
    float _5972 = _5734 * _5970;
    float _5974 = _5948 + _5960;
    float _5976 = -_5904;
    float _5978 = -_5964;
    float _5980 = fma(_5724, _5976, _5978);
    float _5982 = -_5898;
    float _5984 = -_5968;
    float _5986 = fma(_5700, _5982, _5984);
    float _5988 = -_5914;
    float _5990 = -_5972;
    float _5992 = fma(_5742, _5988, _5990);
    float _5994 = _5786 * _5878;
    float _5996 = -_5894;
    float _5998 = -_5904;
    float _6000 = _5996 + _5998;
    float _6002 = -_5898;
    float _6004 = -_5914;
    float _6006 = _6002 + _6004;
    float _6008 = _5936 + _5980;
    float _6010 = _5986 + _5992;
    float _6012 = _5856 * _5878;
    float _6014 = _2466 * 0.5;
    float _6016 = _2466 * 0.300000011920928955078125;
    bool _6018 = !_5930;
    float _6020 = _5696;
    float _6022 = _6000;
    float _6024 = _5954;
    float _6056;
    float _6058;
    float _6060;
    float _6062;
    if (!_6018)
    {
        float _6026 = -_5294;
        float _6028 = _6026 + _5312;
        float _6030 = -_5294;
        float _6032 = _6030 + _5318;
        float _6034 = _5294 * 2000.0;
        float _6036 = _6028 * 1000.0;
        float _6038 = _6032 * 1000.0;
        float _6040 = fma(_6036, _6036, 0.0625);
        float _6042 = fma(_6038, _6038, _6040);
        float _6044 = rsqrt(_6042);
        float _6046 = -_6036;
        float _6048 = fma(_6046, _6044, -0.0);
        float _6050 = -_6038;
        float _6052 = fma(_6050, _6044, -0.0);
        float _6054 = _6044 * 0.25;
        _6056 = _6034;
        _6058 = _6054;
        _6060 = _6048;
        _6062 = _6052;
        _6064 = true;
    }
    else
    {
        float _6066 = _6012 * _6012;
        float _6068 = 1.0 / _5900;
        float _6070 = -_6012;
        float _6072 = (-0.0) + _6070;
        float _6074 = fma(_5994, _5994, _6066);
        float _6076 = sqrt(_6074);
        bool _6078 = _6076 > 9.9999997473787516355514526367188e-05;
        float _6080 = _6076 * _6068;
        float _6082 = _6066;
        _6062 = _6072;
        _5532 = _6080;
        if (_6078)
        {
            float _6084 = abs(_5994);
            float _6086 = abs(_6012);
            float _6088 = precise::max(_6084, _6086);
            _5530 = _6088;
        }
        float _6090 = _5530;
        float _6092 = -_5994;
        float _6094 = (-0.0) + _6092;
        _6060 = _6094;
        if (!_6078)
        {
            _6082 = 0.0;
        }
        float _6096 = _6082;
        float _6098 = _6090;
        float _6100 = _6096;
        if (_6078)
        {
            float _6102 = 1.0 / _6090;
            _6098 = _6102;
        }
        float _6104 = _6098;
        if (_6078)
        {
            float _6106 = _6076 * _6104;
            _6100 = _6106;
        }
        float _6108 = _6100;
        float _6110 = _6108 * 0.9649016857147216796875;
        float _6112 = -_6110;
        float _6114 = fma(_6112, _6080, _5408);
        _6056 = _6114;
        _6058 = _5900;
    }
    _6064 = false;
    float _6116 = _6056;
    float _6118 = _6058;
    float _6120 = _6060;
    float _6122 = _6062;
    float _6124 = _5532;
    float _6126 = -_4618;
    float _6128 = _6126 + _6116;
    bool _6130 = _6116 >= _4618;
    bool _6132 = isnan(_6116);
    bool _6134 = _6130 || _6132;
    bool _6136 = isnan(_4618);
    bool _6138 = _6134 || _6136;
    float _6140 = -_6116;
    float _6142 = fma(_5306, 2000.0, _6140);
    bool _6144 = _6116 > _4618;
    float _6146 = _6128 * _6128;
    float _6148 = precise::max(_1664, 0.001000000047497451305389404296875);
    bool _6150 = !_6144;
    float _6152 = _6150 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _6154 = _4104 >= 0.5;
    float _6156 = sqrt(_6146);
    int _6158 = ~as_type<int>(_6152);
    int _6160 = _6158 + 1;
    int _6162 = _6160 + 1;
    float _6164 = abs(_6142);
    bool _6166 = _6164 >= 2.0;
    bool _6168 = isnan(_6164);
    bool _6170 = _6166 || _6168;
    bool _6172 = isnan(2.0);
    bool _6174 = _6170 || _6172;
    int _6176 = _6162;
    float _6178 = _6152;
    float _6180 = _6124;
    float _6182 = _6120;
    if (_6138)
    {
        int _6184 = ~as_type<int>(_6152);
        int _6186 = _6184 + 1;
        _6176 = _6186;
    }
    int _6188 = _6176;
    bool _6190 = _6118 >= 0.891006529331207275390625;
    bool _6192 = _6190 && _6174;
    float _6194 = float(_6188);
    float _6196 = precise::min(_6148, 10000.0);
    float _6198 = _6156 * _6194;
    bool _6200 = !_6154;
    float _6202 = _6156;
    float _6204 = _6198;
    float _6206 = _6194;
    float _6300;
    float _6302;
    float _6304;
    float _6538;
    float _6540;
    float _6542;
    float _6544;
    float _6546;
    float _6548;
    float _6584;
    float _6586;
    float _6588;
    if (!_6200)
    {
        bool _6208 = _4260 > _4210;
        bool _6210 = _4260 >= _4210;
        bool _6212 = isnan(_4260);
        bool _6214 = _6210 || _6212;
        bool _6216 = isnan(_4210);
        bool _6218 = _6214 || _6216;
        int _6220 = _6218 ? 0 : 1;
        int _6222 = ~_6220;
        int _6224 = _6222 + 1;
        int _6226 = _6224 + 1;
        int _6228 = _6226;
        int _6230 = _6218 ? (-1) : 0;
        if (!_6208)
        {
            int _6232 = ~_6220;
            int _6234 = _6232 + 1;
            _6228 = _6234;
        }
        int _6236 = _6228;
        bool _6238 = _4104 != 1.0;
        bool _6240 = isnan(_4104);
        bool _6242 = _6238 || _6240;
        bool _6244 = isnan(1.0);
        bool _6246 = _6242 || _6244;
        float _6248 = float(_6236);
        float _6250 = _4266 * _6248;
        float _6252 = _4220 * _6248;
        float _6254 = _4244 * _6248;
        float _6256 = _4970 * _6118;
        float _6258 = _6250 * _6118;
        float _6260 = fma(_4972, _6120, _6256);
        float _6262 = fma(_6252, _6120, _6258);
        float _6264 = fma(_4974, _6122, _6260);
        float _6266 = fma(_6254, _6122, _6262);
        float _6268 = abs(_6266);
        float _6270 = -_6268;
        float _6272 = _6270 + 1.0;
        bool _6274 = _6264 <= 0.0;
        float _6276 = float(_6274);
        float _6278 = abs(_6272);
        float _6280 = log2(_6278);
        float _6282 = _6264 * _6276;
        float _6284 = -_6282;
        float _6286 = fma(_6120, _6284, _4972);
        float _6288 = -_6282;
        float _6290 = fma(_6118, _6288, _4970);
        float _6292 = -_6282;
        float _6294 = fma(_6122, _6292, _4974);
        float _6296 = _6280 * 0.20000000298023223876953125;
        float _6298 = exp2(_6296);
        _6300 = _6286;
        _6302 = _6290;
        _6304 = _6294;
        int _6350;
        float _6412;
        int _6414;
        float _6416;
        float _6418;
        if (!_6246)
        {
            float _6306 = _6290 * _6290;
            float _6308 = _4098 * 0.89999997615814208984375;
            float _6310 = _4102 * 0.89999997615814208984375;
            float _6312 = _4100 * 0.89999997615814208984375;
            float _6314 = fma(_6286, _6286, _6306);
            float _6316 = fma(_6294, _6294, _6314);
            float _6318 = sqrt(_6316);
            bool _6320 = _6318 > 0.5;
            bool _6322 = !_6320;
            if (!_6322)
            {
                bool _6324 = _6266 > 0.0;
                bool _6326 = _6266 >= 0.0;
                bool _6328 = isnan(_6266);
                bool _6330 = _6326 || _6328;
                bool _6332 = isnan(0.0);
                bool _6334 = _6330 || _6332;
                float _6336 = precise::max(_1828, 0.100000001490116119384765625);
                int _6338 = _6334 ? 0 : 1;
                float _6340 = precise::max(_1818, 0.100000001490116119384765625);
                int _6342 = ~_6338;
                int _6344 = _6342 + 1;
                int _6346 = _6344 + 1;
                int _6348 = _6346;
                _6230 = _6334 ? (-1) : 0;
                _6350 = _6324 ? (-1) : 0;
                if (!_6324)
                {
                    int _6352 = ~_6338;
                    int _6354 = _6352 + 1;
                    _6348 = _6354;
                }
                int _6356 = _6348;
                float _6358 = _6336 + _6340;
                float _6360 = float(_6356);
                float _6362 = 1.0 / _6358;
                float _6364 = _6252 * _6360;
                float _6366 = _6254 * _6360;
                float _6368 = _6250 * _6360;
                float _6370 = _6294 * _6364;
                float _6372 = _6290 * _6366;
                float _6374 = -_6370;
                float _6376 = fma(_6286, _6366, _6374);
                float _6378 = _6286 * _6368;
                float _6380 = -_6372;
                float _6382 = fma(_6294, _6368, _6380);
                float _6384 = _6376 * _6376;
                float _6386 = -_6378;
                float _6388 = fma(_6290, _6364, _6386);
                float _6390 = _6362 * 0.4000000059604644775390625;
                float _6392 = fma(_6382, _6382, _6384);
                float _6394 = _6318 * _6390;
                float _6396 = fma(_6388, _6388, _6392);
                float _6398 = sqrt(_6396);
                float _6400 = _6398 + 9.9999997473787516355514526367188e-06;
                float _6402 = 1.0 / _6400;
                float _6404 = _6394 * _6402;
                float _6406 = fma(_6382, _6404, _6308);
                float _6408 = fma(_6376, _6404, _6310);
                float _6410 = fma(_6388, _6404, _6312);
                _6412 = _6406;
                _6414 = 1065353216;
                _6416 = _6408;
                _6418 = _6410;
                _6420 = true;
            }
            else
            {
                bool _6422 = _6298 > 0.5;
                bool _6424 = _6198 > (-0.800000011920928955078125);
                bool _6426 = _6424 && _6422;
                bool _6428 = !_6426;
                int _6430 = _6428 ? 1065353216 : 1056964608;
                _6412 = _6308;
                _6350 = _6426 ? (-1) : 0;
                _6414 = _6430;
                _6416 = _6310;
                _6418 = _6312;
                _6420 = true;
            }
        }
        else
        {
            bool _6432 = _6266 > 0.0;
            bool _6434 = _6266 >= 0.0;
            bool _6436 = isnan(_6266);
            bool _6438 = _6434 || _6436;
            bool _6440 = isnan(0.0);
            bool _6442 = _6438 || _6440;
            int _6444 = _6442 ? 0 : 1;
            int _6446 = ~_6444;
            int _6448 = _6446 + 1;
            int _6450 = _6448 + 1;
            int _6452 = _6450;
            _6230 = _6442 ? (-1) : 0;
            if (!_6432)
            {
                int _6454 = ~_6444;
                int _6456 = _6454 + 1;
                _6452 = _6456;
            }
            int _6458 = _6452;
            bool _6460 = _6298 >= 0.300000011920928955078125;
            bool _6462 = isnan(_6298);
            bool _6464 = _6460 || _6462;
            bool _6466 = isnan(0.300000011920928955078125);
            bool _6468 = _6464 || _6466;
            float _6470 = float(_6458);
            float _6472 = _6254 * _6470;
            float _6474 = _6252 * _6470;
            float _6476 = _6250 * _6470;
            float _6478 = _6472 * _6118;
            float _6480 = _6474 * _6122;
            float _6482 = _6476 * _6120;
            float _6484 = -_6478;
            float _6486 = fma(_6476, _6122, _6484);
            float _6488 = _6298 * 10.0;
            float _6490 = -_6480;
            float _6492 = fma(_6472, _6120, _6490);
            float _6494 = -_6482;
            float _6496 = fma(_6474, _6118, _6494);
            float _6498 = _6488 * _6486;
            float _6500 = _6488 * _6492;
            float _6502 = _6488 * _6496;
            int _6504 = _6468 ? as_type<int>(_4104) : 1065353216;
            _6412 = _6498;
            _6350 = _6468 ? (-1) : 0;
            _6414 = _6504;
            _6416 = _6500;
            _6418 = _6502;
        }
        _6420 = false;
        int _6506 = _6230;
        float _6508 = _6412;
        int _6510 = _6350;
        int _6512 = _6414;
        float _6514 = _6416;
        float _6516 = _6418;
        bool _6518 = _6128 >= (-0.20000000298023223876953125);
        bool _6520 = isnan(_6128);
        bool _6522 = _6518 || _6520;
        bool _6524 = isnan(-0.20000000298023223876953125);
        bool _6526 = _6522 || _6524;
        float _6528 = _5696 * 0.20000000298023223876953125;
        float _6530 = _5690 * 0.20000000298023223876953125;
        float _6532 = _5680 * 0.20000000298023223876953125;
        int _6534 = _6506;
        int _6536 = _6510;
        _6538 = _6530;
        _6022 = _6528;
        _6024 = _6532;
        _6540 = 0.0;
        _6542 = 0.0;
        _6544 = 0.0;
        _6546 = _6514;
        _6548 = _6516;
        _778 = _6526;
        if (_6526)
        {
            bool _6550 = _6198 > 2.0;
            _6534 = _6550 ? (-1) : 0;
        }
        int _6552 = _6534;
        if (!_6526)
        {
            _6536 = -1;
        }
        int _6554 = _6536;
        int _6556 = _6554;
        if (_6526)
        {
            bool _6558 = _6128 >= (-0.20000000298023223876953125);
            int _6560 = (_6558 ? (-1) : 0) & _6552;
            _6556 = _6560;
        }
        int _6562 = _6556;
        int _6564 = ~_6562;
        bool _6566 = !_6192;
        int _6568 = _6564 & (_6566 ? (-1) : 0);
        bool _6570 = !_6192;
        int _6572 = _6562 & (_6570 ? (-1) : 0);
        int _6574 = _6568 | _6572;
        int _6576 = _6562 & (_6192 ? (-1) : 0);
        int _6578 = _6574 | _6576;
        int _6580 = ~_6578;
        float _6582 = (_6580 != 0) ? as_type<float>(_6512) : 0.0;
        _6584 = _6582;
        _6586 = 0.0;
        _6588 = _6508;
        _6590 = true;
    }
    else
    {
        bool _6592 = _6198 < 0.0;
        bool _6594 = _6592 && _6192;
        bool _6596 = _6198 > (-0.800000011920928955078125);
        bool _6598 = _6596 && _6594;
        if (_6598)
        {
            float _6600 = _4970 * _6118;
            _1986 = _6600;
        }
        float _6602 = _1986;
        float _6604 = _6602;
        if (!_6598)
        {
            _6202 = 0.0;
        }
        float _6606 = _6202;
        float _6608 = _6606;
        if (!_6598)
        {
            _6020 = _6006;
        }
        float _6610 = _6020;
        float _6612 = _6610;
        if (_6598)
        {
            float _6614 = fma(_4972, _6120, _6602);
            _6604 = _6614;
        }
        float _6616 = _6604;
        float _6618 = _6616;
        if (!_6598)
        {
            _6178 = _5974;
        }
        float _6620 = _6178;
        float _6622 = _6620;
        if (!_6598)
        {
            _6180 = _6008;
        }
        float _6624 = _6180;
        float _6626 = _6624;
        if (_6598)
        {
            float _6628 = fma(_4974, _6122, _6616);
            _6618 = _6628;
        }
        float _6630 = _6618;
        float _6632 = _6630;
        if (!_6598)
        {
            _5692 = _6010;
        }
        float _6634 = _5692;
        float _6636 = _6634;
        if (!_6598)
        {
            _6204 = _4098;
        }
        float _6638 = _6204;
        float _6640 = _6638;
        if (_6598)
        {
            float _6642 = -_6120;
            float _6644 = fma(_6642, _6630, _4972);
            _4998 = _6644;
        }
        float _6646 = _4998;
        _6300 = _6646;
        if (_6598)
        {
            float _6648 = -_6118;
            float _6650 = fma(_6648, _6630, _4970);
            _5000 = _6650;
        }
        float _6652 = _5000;
        _6302 = _6652;
        if (_6598)
        {
            float _6654 = -_6122;
            float _6656 = fma(_6654, _6630, _4974);
            _5002 = _6656;
        }
        float _6658 = _5002;
        _6304 = _6658;
        if (!_6598)
        {
            _1988 = _4102;
        }
        float _6660 = _1988;
        float _6662 = _6660;
        if (!_6598)
        {
            _6632 = _4100;
        }
        float _6664 = _6632;
        float _6666 = _6664;
        if (!_6598)
        {
            _6206 = _4104;
        }
        float _6668 = _6206;
        _6584 = _6668;
        if (_6598)
        {
            _6608 = _6128;
        }
        float _6670 = _6608;
        _6586 = _6670;
        if (_6598)
        {
            _6612 = _6006;
        }
        float _6672 = _6612;
        _6538 = _6672;
        if (_6598)
        {
            _6622 = _5974;
        }
        float _6674 = _6622;
        _6540 = _6674;
        if (_6598)
        {
            _6626 = _6008;
        }
        float _6676 = _6626;
        _6542 = _6676;
        if (_6598)
        {
            _6636 = _6010;
        }
        float _6678 = _6636;
        _6544 = _6678;
        if (_6598)
        {
            _6640 = _4098;
        }
        float _6680 = _6640;
        _6588 = _6680;
        if (_6598)
        {
            _6662 = _4102;
        }
        float _6682 = _6662;
        _6546 = _6682;
        if (_6598)
        {
            _6666 = _4100;
        }
        float _6684 = _6666;
        _6548 = _6684;
        if (_6598)
        {
            _6584 = 0.5;
        }
    }
    _6590 = false;
    float _6686 = _6584;
    float _6688 = _6538;
    float _6690 = _6022;
    float _6692 = _6024;
    float _6694 = _6300;
    float _6696 = _6302;
    float _6698 = _6540;
    float _6700 = _6542;
    float _6702 = _6544;
    float _6704 = _6304;
    float _6706 = _6586;
    float _6708 = _6546;
    float _6710 = _6588;
    float _6712 = _6548;
    bool _6714 = _778;
    float _6716 = 1.0 / _6196;
    bool _6718 = _6686 >= 0.5;
    float _6720 = _6716 * _6688;
    float _6722 = _6716 * _6690;
    float _6724 = _6716 * _6692;
    float _6726 = _2466 * _2466;
    float _6728 = _6720 * _6720;
    float _6730 = fma(_6014, _6014, _6726);
    float _6732 = fma(_6722, _6722, _6728);
    float _6734 = _6730 * 0.083333335816860198974609375;
    float _6736 = fma(_6724, _6724, _6732);
    float _6738 = _6016 * _6016;
    float _6740 = fma(_6016, _6016, _6726);
    float _6742 = sqrt(_6736);
    float _6744 = fma(_6014, _6014, _6738);
    float _6746 = _6740 * 0.083333335816860198974609375;
    float _6748 = _4220 * _6734;
    float _6750 = _4266 * _6734;
    float _6752 = _4244 * _6734;
    float _6754 = _4262 * _6746;
    float _6756 = _4214 * _6746;
    float _6758 = _4220 * _6748;
    float _6760 = _4220 * _6752;
    float _6762 = _4266 * _6752;
    float _6764 = _4244 * _6752;
    float _6766 = _4238 * _6746;
    float _6768 = _4266 * _6748;
    float _6770 = _4266 * _6750;
    float _6772 = _6744 * 0.083333335816860198974609375;
    bool _6774 = _6742 > 80.0;
    float _6776 = _4220 * _6750;
    float _6778 = _4244 * _6748;
    float _6780 = _4244 * _6750;
    float _6782 = fma(_4262, _6754, _6758);
    float _6784 = fma(_4262, _6756, _6776);
    float _6786 = fma(_4262, _6766, _6760);
    float _6788 = fma(_4214, _6754, _6768);
    float _6790 = _4240 * _6772;
    float _6792 = fma(_4238, _6754, _6778);
    float _6794 = fma(_4214, _6756, _6770);
    float _6796 = fma(_4238, _6756, _6780);
    float _6798 = _4250 * _6772;
    float _6800 = fma(_4214, _6766, _6762);
    float _6802 = fma(_4238, _6766, _6764);
    float _6804 = _4350 * _6772;
    float _6806 = fma(_4240, _6790, _6782);
    float _6808 = fma(_4250, _6790, _6788);
    float _6810 = fma(_4350, _6790, _6792);
    float _6812 = fma(_4350, _6798, _6796);
    float _6814 = fma(_4250, _6804, _6800);
    float _6816 = fma(_4350, _6804, _6802);
    float _6818 = _6754;
    float _6820 = _6794;
    float _6822 = _6784;
    float _6824 = _6696;
    float _6826 = _6694;
    float _6828 = _6808;
    float _6830 = _6806;
    float _6832 = _6810;
    float _6834 = _6704;
    float _6836 = _6704;
    if (_6774)
    {
        float _6838 = rsqrt(_6736);
        _6818 = _6838;
    }
    float _6840 = _6818;
    float _6842 = fma(_4240, _6804, _6786);
    float _6844 = fma(_4240, _6798, _6784);
    float _6846 = _6808 * _6816;
    float _6848 = fma(_4250, _6798, _6794);
    float _6850 = _6814 * _6812;
    float _6852 = _6814 * _4102;
    float _6854 = _6844;
    if (!_6774)
    {
        _6820 = _6722;
    }
    float _6856 = _6820;
    float _6858 = _6848 * _6810;
    float _6860 = _6814 * _6810;
    float _6862 = -_6850;
    float _6864 = fma(_6848, _6816, _6862);
    float _6866 = _6808 * _4102;
    float _6868 = -_6858;
    float _6870 = fma(_6808, _6812, _6868);
    float _6872 = -_6860;
    float _6874 = _6846 + _6872;
    float _6876 = _6856;
    if (!_6774)
    {
        _4300 = _6720;
    }
    float _6878 = _4300;
    float _6880 = _6848 * _4102;
    float _6882 = _6840;
    float _6884 = _6878;
    if (_6774)
    {
        float _6886 = _6840 * 80.0;
        _6822 = _6886;
    }
    float _6888 = _6822;
    float _6890 = _6844 * _6874;
    if (!_6774)
    {
        _6882 = _6724;
    }
    float _6892 = _6882;
    float _6894 = fma(_6842, _4098, _6852);
    float _6896 = _6892;
    if (_6774)
    {
        float _6898 = _6722 * _6888;
        _6876 = _6898;
    }
    float _6900 = _6876;
    float _6902 = -_6890;
    float _6904 = fma(_6806, _6864, _6902);
    if (_6774)
    {
        float _6906 = _6720 * _6888;
        _6884 = _6906;
    }
    float _6908 = _6884;
    if (_6774)
    {
        float _6910 = _6724 * _6888;
        _6896 = _6910;
    }
    float _6912 = _6896;
    float _6914 = fma(_6806, _4098, _6866);
    float _6916 = fma(_6842, _6870, _6904);
    float _6918 = fma(_6844, _4098, _6880);
    float _6920 = fma(_6816, _4100, _6894);
    float _6922 = fma(_6810, _4100, _6914);
    float _6924 = _4106 * 0.01666666753590106964111328125;
    bool _6926 = _6916 != 0.0;
    bool _6928 = isnan(_6916);
    bool _6930 = _6926 || _6928;
    bool _6932 = isnan(0.0);
    bool _6934 = _6930 || _6932;
    float _6936 = fma(_6812, _4100, _6918);
    float _6938 = _6920 * _4102;
    float _6940 = _6922 * _4100;
    float _6942 = fma(_6924, _6900, _6694);
    float _6944 = _6936 * _4098;
    float _6946 = -_6938;
    float _6948 = fma(_6936, _4100, _6946);
    float _6950 = -_6940;
    float _6952 = fma(_6920, _4098, _6950);
    float _6954 = fma(_6924, _6908, _6696);
    float _6956 = -_6944;
    float _6958 = fma(_6922, _4102, _6956);
    float _6960 = _6948 + _6698;
    float _6962 = _6952 + _6700;
    float _6964 = _6942;
    float _6966 = _6954;
    float _6968 = _6942;
    float _6970 = _6954;
    if (!_6934)
    {
        _6824 = _6812;
    }
    float _6972 = _6824;
    float _6974 = _6972;
    if (!_6934)
    {
        _6826 = _6816;
    }
    float _6976 = _6826;
    float _6978 = _6976;
    if (!_6934)
    {
        _4122 = _6848;
    }
    float _6980 = _4122;
    float _6982 = _6980;
    if (!_6934)
    {
        _4124 = _6814;
    }
    float _6984 = _4124;
    float _6986 = _6984;
    if (!_6934)
    {
        _4126 = _6842;
    }
    float _6988 = _4126;
    bool _6990 = !_6934;
    float _6992 = _6988;
    if (!_6990)
    {
        float _6994 = 1.0 / _6916;
        float _6996 = _6806 * _6814;
        float _6998 = _6844 * _6816;
        float _7000 = _6842 * _6848;
        float _7002 = _6842 * _6810;
        float _7004 = -_6996;
        float _7006 = fma(_6842, _6808, _7004);
        float _7008 = _6806 * _6812;
        float _7010 = _6844 * _6808;
        float _7012 = -_6998;
        float _7014 = fma(_6842, _6812, _7012);
        float _7016 = -_7000;
        float _7018 = fma(_6844, _6814, _7016);
        float _7020 = -_6846;
        float _7022 = _7020 + _6860;
        float _7024 = -_7002;
        float _7026 = fma(_6806, _6816, _7024);
        float _7028 = -_7008;
        float _7030 = fma(_6844, _6810, _7028);
        float _7032 = -_7010;
        float _7034 = fma(_6806, _6848, _7032);
        float _7036 = _7014 * _6994;
        float _7038 = _7018 * _6994;
        float _7040 = _7022 * _6994;
        float _7042 = _7026 * _6994;
        float _7044 = _6864 * _6994;
        float _7046 = _6870 * _6994;
        float _7048 = _7006 * _6994;
        float _7050 = _7030 * _6994;
        float _7052 = _7034 * _6994;
        _6828 = _7040;
        _6982 = _7042;
        _6986 = _7048;
        _6830 = _7044;
        _6854 = _7036;
        _6992 = _7038;
        _6832 = _7046;
        _6974 = _7050;
        _6978 = _7052;
    }
    float _7054 = _6828;
    float _7056 = _6982;
    float _7058 = _6986;
    float _7060 = _6830;
    float _7062 = _6854;
    float _7064 = _6992;
    float _7066 = _6832;
    float _7068 = _6974;
    float _7070 = _6978;
    float _7072 = _6962 * _7054;
    float _7074 = _6962 * _7056;
    float _7076 = _6962 * _7058;
    float _7078 = _6958 + _6702;
    float _7080 = fma(_6960, _7060, _7072);
    float _7082 = fma(_6960, _7062, _7074);
    float _7084 = fma(_6960, _7064, _7076);
    float _7086 = fma(_6924, _6912, _6704);
    float _7088 = fma(_7078, _7066, _7080);
    float _7090 = fma(_7078, _7068, _7082);
    float _7092 = fma(_7078, _7070, _7084);
    bool _7094 = !_6718;
    float _7096 = _7086;
    float _7098 = _7070;
    float _7100 = _7068;
    float _7102 = _7086;
    float _7104 = _7090;
    float _7106 = _7088;
    float _7108 = _7092;
    if (!_7094)
    {
        float _7110 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
        float _7112 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
        float _7114 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
        float _7116 = _6954 * _6954;
        float _7118 = fma(_6942, _6942, _7116);
        float _7120 = fma(_7086, _7086, _7118);
        float _7122 = sqrt(_7120);
        float _7124 = _7122 + 9.9999997473787516355514526367188e-06;
        float _7126 = 1.0 / _7124;
        float _7128 = _6954 * _7126;
        float _7130 = _7086 * _7126;
        if (_1670)
        {
            float _7132 = _7112 * _4638;
            _4700 = _7132;
        }
        float _7134 = _4700;
        float _7136 = _7134;
        if (_1670)
        {
            float _7138 = _7112 * _4662;
            _4716 = _7138;
        }
        float _7140 = _4716;
        float _7142 = _7140;
        if (_1670)
        {
            float _7144 = _7112 * _4686;
            _4740 = _7144;
        }
        float _7146 = _4740;
        float _7148 = _6942 * _7126;
        float _7150 = _7146;
        if (_1670)
        {
            float _7152 = fma(_7110, _4636, _7134);
            _7136 = _7152;
        }
        float _7154 = _7136;
        if (_1670)
        {
            float _7156 = fma(_7110, _4660, _7140);
            _7142 = _7156;
        }
        float _7158 = _7142;
        if (_1670)
        {
            float _7160 = fma(_7110, _4684, _7146);
            _7150 = _7160;
        }
        float _7162 = _7150;
        float _7164 = _7162;
        if (_1670)
        {
            float _7166 = fma(_7114, _4640, _7154);
            _4702 = _7166;
        }
        float _7168 = _4702;
        float _7170 = _7168;
        float _7172 = _7168;
        if (_1670)
        {
            float _7174 = fma(_7114, _4664, _7158);
            _4718 = _7174;
        }
        float _7176 = _4718;
        float _7178 = _7176;
        float _7180 = _7176;
        if (_1670)
        {
            float _7182 = fma(_7114, _4688, _7162);
            _4742 = _7182;
        }
        float _7184 = _4742;
        float _7186 = _7184;
        float _7188 = _7184;
        if (!_1670)
        {
            bool _7190 = !_1896;
            if (!_7190)
            {
                uint _7192 = uint(int(uint(_182) >> uint(2)));
                float _7194 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7192)]);
                int _7196 = _182 + 4;
                uint _7198 = uint(int(uint(_7196) >> uint(2)));
                float _7200 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7198)]);
                int _7202 = _182 + 8;
                uint _7204 = uint(int(uint(_7202) >> uint(2)));
                float _7206 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7204)]);
                uint _7208 = uint(int(uint(_182) >> uint(2)));
                float _7210 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7208)]);
                int _7212 = _182 + 4;
                uint _7214 = uint(int(uint(_7212) >> uint(2)));
                float _7216 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7214)]);
                int _7218 = _182 + 8;
                uint _7220 = uint(int(uint(_7218) >> uint(2)));
                float _7222 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7220)]);
                uint _7224 = uint(int(uint(_182) >> uint(2)));
                float _7226 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7224)]);
                int _7228 = _182 + 4;
                uint _7230 = uint(int(uint(_7228) >> uint(2)));
                float _7232 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7230)]);
                int _7234 = _182 + 8;
                uint _7236 = uint(int(uint(_7234) >> uint(2)));
                float _7238 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7236)]);
                int _7240 = _182 + 12;
                uint _7242 = uint(int(uint(_7240) >> uint(2)));
                float _7244 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7242)]);
                float _7246 = _7200 * _7112;
                float _7248 = _7216 * _7112;
                float _7250 = _7232 * _7112;
                float _7252 = fma(_7194, _7110, _7246);
                float _7254 = fma(_7210, _7110, _7248);
                float _7256 = fma(_7226, _7110, _7250);
                float _7258 = fma(_7206, _7114, _7252);
                float _7260 = fma(_7222, _7114, _7254);
                float _7262 = fma(_7238, _7114, _7256);
                _7180 = _7260;
                _7172 = _7258;
                _7188 = _7262;
                _7164 = _7256;
                _6834 = _7244;
                _7264 = true;
            }
            else
            {
                if (!_1956)
                {
                    _7170 = _7110;
                }
                float _7266 = _7170;
                _7172 = _7266;
                if (!_1956)
                {
                    _7178 = _7112;
                }
                float _7268 = _7178;
                _7180 = _7268;
                if (!_1956)
                {
                    _7186 = _7114;
                }
                float _7270 = _7186;
                bool _7272 = !_1956;
                _7188 = _7270;
                if (!_7272)
                {
                    uint _7274 = uint(int(uint(_182) >> uint(2)));
                    float _7276 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7274)]);
                    int _7278 = _182 + 4;
                    uint _7280 = uint(int(uint(_7278) >> uint(2)));
                    float _7282 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7280)]);
                    int _7284 = _182 + 8;
                    uint _7286 = uint(int(uint(_7284) >> uint(2)));
                    float _7288 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7286)]);
                    uint _7290 = uint(int(uint(_182) >> uint(2)));
                    float _7292 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7290)]);
                    int _7294 = _182 + 4;
                    uint _7296 = uint(int(uint(_7294) >> uint(2)));
                    float _7298 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7296)]);
                    int _7300 = _182 + 8;
                    uint _7302 = uint(int(uint(_7300) >> uint(2)));
                    float _7304 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7302)]);
                    uint _7306 = uint(int(uint(_182) >> uint(2)));
                    float _7308 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7306)]);
                    int _7310 = _182 + 4;
                    uint _7312 = uint(int(uint(_7310) >> uint(2)));
                    float _7314 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7312)]);
                    int _7316 = _182 + 8;
                    uint _7318 = uint(int(uint(_7316) >> uint(2)));
                    float _7320 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7318)]);
                    int _7322 = _182 + 12;
                    uint _7324 = uint(int(uint(_7322) >> uint(2)));
                    float _7326 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7324)]);
                    float _7328 = _7282 * _7112;
                    float _7330 = _7298 * _7112;
                    float _7332 = _7314 * _7112;
                    float _7334 = fma(_7276, _7110, _7328);
                    float _7336 = fma(_7292, _7110, _7330);
                    float _7338 = fma(_7308, _7110, _7332);
                    float _7340 = fma(_7288, _7114, _7334);
                    float _7342 = fma(_7304, _7114, _7336);
                    float _7344 = fma(_7320, _7114, _7338);
                    _7180 = _7342;
                    _7172 = _7340;
                    _7188 = _7344;
                    _7164 = _7338;
                    _6834 = _7326;
                }
            }
        }
        _7264 = false;
        float _7346 = _7180;
        float _7348 = _7172;
        float _7350 = _7188;
        float _7352 = _7164;
        float _7354 = _6834;
        float _7356 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
        float _7358 = _7356 * 59.999996185302734375;
        float _7360 = _7346 * _7358;
        float _7362 = _7348 * _7358;
        float _7364 = _4106 * _7360;
        float _7366 = _7350 * _7358;
        float _7368 = _4106 * _7362;
        float _7370 = _7364 * _6118;
        float _7372 = _4106 * _7366;
        float _7374 = fma(_7368, _6120, _7370);
        float _7376 = fma(_7372, _6122, _7374);
        float _7378 = -_6118;
        float _7380 = fma(_7376, _7378, _7364);
        float _7382 = -_6120;
        float _7384 = fma(_7376, _7382, _7368);
        float _7386 = -_6122;
        float _7388 = fma(_7376, _7386, _7372);
        float _7390 = _7380 * _7380;
        float _7392 = fma(_7384, _7384, _7390);
        float _7394 = fma(_7388, _7388, _7392);
        float _7396 = sqrt(_7394);
        float _7398 = _7396 + 9.9999997473787516355514526367188e-06;
        float _7400 = 1.0 / _7398;
        float _7402 = _7380 * _7400;
        float _7404 = _7384 * _7400;
        float _7406 = _7388 * _7400;
        float _7408 = _6954 * _7402;
        float _7410 = fma(_6942, _7404, _7408);
        float _7412 = fma(_7086, _7406, _7410);
        float _7414 = _7412 * 0.5;
        bool _7416 = _7412 >= 0.0;
        float _7418 = float(_7416);
        float _7420 = precise::min(_7396, _7414);
        float _7422 = _7420 * _7418;
        float _7424 = -_7422;
        float _7426 = fma(_7402, _7424, _6954);
        float _7428 = -_7422;
        float _7430 = fma(_7404, _7428, _6942);
        float _7432 = -_7422;
        float _7434 = fma(_7406, _7432, _7086);
        float _7436 = _7426 * _7426;
        float _7438 = fma(_7430, _7430, _7436);
        float _7440 = fma(_7434, _7434, _7438);
        float _7442 = sqrt(_7440);
        bool _7444 = _7442 > 0.5;
        bool _7446 = isnan(_7442);
        bool _7448 = _7444 || _7446;
        bool _7450 = isnan(0.5);
        bool _7452 = _7448 || _7450;
        float _7454 = _7406;
        float _7456 = _7398;
        _4706 = _7430;
        _7098 = _7434;
        _4720 = _7426;
        _4722 = _7380;
        _4724 = _7412;
        _7100 = _7358;
        _4744 = _7420;
        _4746 = _7352;
        _4748 = _7350;
        _6836 = _7354;
        _6182 = _7442;
        if (!_7452)
        {
            float _7458 = _1666 * 20.0;
            _7096 = _7458;
        }
        float _7460 = _7096;
        float _7462 = _7460;
        if (_7452)
        {
            float _7464 = _1666 * 10.0;
            _1990 = _7464;
        }
        float _7466 = _1990;
        float _7468 = _7466;
        if (!_7452)
        {
            float _7470 = _4106 * _7460;
            _7462 = _7470;
        }
        float _7472 = _7462;
        float _7474 = _7472;
        if (_7452)
        {
            float _7476 = _4106 * _7466;
            _7468 = _7476;
        }
        float _7478 = _7468;
        float _7480 = _7478;
        if (!_7452)
        {
            float _7482 = _7472 * 0.01666666753590106964111328125;
            _7474 = _7482;
        }
        float _7484 = _7474;
        float _7486 = _7484;
        if (_7452)
        {
            float _7488 = _7478 * 0.01666666753590106964111328125;
            _7480 = _7488;
        }
        float _7490 = _7480;
        _1992 = _7490;
        if (!_7452)
        {
            float _7492 = precise::min(_7442, _7484);
            _7454 = _7492;
        }
        float _7494 = _7454;
        _4704 = _7494;
        if (_7452)
        {
            float _7496 = precise::min(_7442, _7490);
            _7456 = _7496;
        }
        float _7498 = _7456;
        if (!_7452)
        {
            float _7500 = -_7148;
            float _7502 = fma(_7500, _7494, _7430);
            _6964 = _7502;
        }
        float _7504 = _6964;
        float _7506 = _7504;
        if (!_7452)
        {
            float _7508 = -_7128;
            float _7510 = fma(_7508, _7494, _7426);
            _6966 = _7510;
        }
        float _7512 = _6966;
        float _7514 = _7512;
        if (!_7452)
        {
            float _7516 = -_7130;
            float _7518 = fma(_7516, _7494, _7434);
            _7486 = _7518;
        }
        float _7520 = _7486;
        _7102 = _7520;
        if (_7452)
        {
            float _7522 = -_7148;
            float _7524 = fma(_7522, _7498, _7430);
            _7506 = _7524;
        }
        float _7526 = _7506;
        _6968 = _7526;
        if (_7452)
        {
            float _7528 = -_7128;
            float _7530 = fma(_7528, _7498, _7426);
            _7514 = _7530;
        }
        float _7532 = _7514;
        _6970 = _7532;
        if (_7452)
        {
            float _7534 = -_7130;
            float _7536 = fma(_7534, _7498, _7434);
            _7102 = _7536;
        }
    }
    float _7538 = _4704;
    float _7540 = _4706;
    float _7542 = _7098;
    float _7544 = _4720;
    float _7546 = _4722;
    float _7548 = _4724;
    float _7550 = _7100;
    float _7552 = _4744;
    float _7554 = _4746;
    float _7556 = _4748;
    float _7558 = _6836;
    float _7560 = _6182;
    float _7562 = _6968;
    float _7564 = _6970;
    float _7566 = _7102;
    float _7568 = _1992;
    bool _7570 = !_1670;
    float _7572 = _7538;
    float _7574 = _7568;
    float _7576 = _7560;
    float _7578 = _7540;
    float _7580 = _7542;
    float _7582 = _7544;
    float _7584 = _7546;
    float _7586 = _7548;
    float _7588 = _7550;
    float _7590 = _7552;
    float _7592 = _7554;
    float _7594 = _7556;
    float _7596 = _7558;
    float _7674;
    float _7676;
    float _7678;
    if (!_7570)
    {
        float _7598 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _7600 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _7602 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _7604 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _7606 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _7608 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _7610 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _7612 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _7614 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _7616 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _7618 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        float _7620 = _7602 * _7604;
        float _7622 = _7602 * _7606;
        float _7624 = -_7620;
        float _7626 = fma(_7598, _7608, _7624);
        float _7628 = -_7622;
        float _7630 = fma(_7600, _7608, _7628);
        float _7632 = _7600 * _7604;
        float _7634 = _7616 * _7604;
        float _7636 = _7614 * _7626;
        float _7638 = _7612 * _7606;
        float _7640 = -_7632;
        float _7642 = fma(_7598, _7606, _7640);
        float _7644 = -_7634;
        float _7646 = fma(_7612, _7608, _7644);
        float _7648 = -_7636;
        float _7650 = fma(_7612, _7630, _7648);
        float _7652 = -_7638;
        float _7654 = fma(_7614, _7604, _7652);
        float _7656 = fma(_7616, _7642, _7650);
        float _7658 = _7614 * _7608;
        float _7660 = -_7658;
        float _7662 = fma(_7616, _7606, _7660);
        float _7664 = 1.0 / _7656;
        float _7666 = _7664 * _6706;
        float _7668 = _7662 * _7666;
        float _7670 = _7646 * _7666;
        float _7672 = _7654 * _7666;
        _7674 = _7672;
        _7676 = _7668;
        _7578 = _7664;
        _7580 = _7646;
        _7582 = _7604;
        _7584 = _7606;
        _7586 = _7608;
        _7588 = _7610;
        _7590 = _7612;
        _7592 = _7614;
        _7594 = _7616;
        _7596 = _7618;
        _7678 = _7670;
        _7680 = true;
    }
    else
    {
        bool _7682 = _1894 != 0;
        bool _7684 = _1954 != 0;
        bool _7686 = _7684 || _7682;
        if (!_7686)
        {
            _7572 = 0.0;
        }
        float _7688 = _7572;
        _7676 = _7688;
        if (!_7686)
        {
            _7574 = _6706;
        }
        float _7690 = _7574;
        _7678 = _7690;
        if (!_7686)
        {
            _7576 = 0.0;
        }
        float _7692 = _7576;
        bool _7694 = !_7686;
        _7674 = _7692;
        if (!_7694)
        {
            uint _7696 = uint(int(uint(_182) >> uint(2)));
            float _7698 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7696)]);
            int _7700 = _182 + 4;
            uint _7702 = uint(int(uint(_7700) >> uint(2)));
            float _7704 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7702)]);
            int _7706 = _182 + 8;
            uint _7708 = uint(int(uint(_7706) >> uint(2)));
            float _7710 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7708)]);
            uint _7712 = uint(int(uint(_182) >> uint(2)));
            float _7714 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7712)]);
            int _7716 = _182 + 4;
            uint _7718 = uint(int(uint(_7716) >> uint(2)));
            float _7720 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7718)]);
            int _7722 = _182 + 8;
            uint _7724 = uint(int(uint(_7722) >> uint(2)));
            float _7726 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7724)]);
            int _7728 = _182 + 12;
            uint _7730 = uint(int(uint(_7728) >> uint(2)));
            float _7732 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7730)]);
            uint _7734 = uint(int(uint(_182) >> uint(2)));
            float _7736 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7734)]);
            int _7738 = _182 + 4;
            uint _7740 = uint(int(uint(_7738) >> uint(2)));
            float _7742 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7740)]);
            int _7744 = _182 + 8;
            uint _7746 = uint(int(uint(_7744) >> uint(2)));
            float _7748 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7746)]);
            int _7750 = _182 + 12;
            uint _7752 = uint(int(uint(_7750) >> uint(2)));
            float _7754 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7752)]);
            float _7756 = _7710 * _7714;
            float _7758 = _7710 * _7720;
            float _7760 = _7704 * _7714;
            float _7762 = -_7756;
            float _7764 = fma(_7698, _7726, _7762);
            float _7766 = -_7758;
            float _7768 = fma(_7704, _7726, _7766);
            float _7770 = -_7760;
            float _7772 = fma(_7698, _7720, _7770);
            float _7774 = _7742 * _7764;
            float _7776 = _7736 * _7720;
            float _7778 = -_7774;
            float _7780 = fma(_7736, _7768, _7778);
            float _7782 = _7748 * _7714;
            float _7784 = fma(_7748, _7772, _7780);
            float _7786 = _7742 * _7726;
            float _7788 = -_7782;
            float _7790 = fma(_7736, _7726, _7788);
            float _7792 = -_7776;
            float _7794 = fma(_7742, _7714, _7792);
            float _7796 = -_7786;
            float _7798 = fma(_7748, _7720, _7796);
            float _7800 = 1.0 / _7784;
            float _7802 = _7800 * _6706;
            float _7804 = _7798 * _7802;
            float _7806 = _7790 * _7802;
            float _7808 = _7794 * _7802;
            _7674 = _7808;
            _7676 = _7804;
            _7578 = _7790;
            _7580 = _7800;
            _7582 = _7714;
            _7584 = _7720;
            _7586 = _7726;
            _7588 = _7732;
            _7590 = _7736;
            _7592 = _7794;
            _7594 = _7748;
            _7596 = _7754;
            _7678 = _7806;
        }
    }
    _7680 = false;
    float _7810 = _7674;
    float _7812 = _7676;
    float _7814 = _7578;
    float _7816 = _7580;
    float _7818 = _7582;
    float _7820 = _7584;
    float _7822 = _7586;
    float _7824 = _7588;
    float _7826 = _7590;
    float _7828 = _7592;
    float _7830 = _7594;
    float _7832 = _7596;
    float _7834 = _7678;
    float _7836 = _4270 + _7810;
    float _7838 = _7562 * 0.01666666753590106964111328125;
    float _7840 = _4272 + _7812;
    float _7842 = _7564 * 0.01666666753590106964111328125;
    float _7844 = _7566 * 0.01666666753590106964111328125;
    bool _7846 = !_1670;
    float _7848 = _7818;
    float _7850 = _7820;
    float _7852 = _7822;
    float _7854 = _7824;
    float _7856 = _7814;
    float _7858 = _7816;
    float _7860 = _7826;
    float _7862 = _7828;
    float _7864 = _7830;
    float _7866 = _7832;
    float _7868 = _7844;
    float _7990;
    float _7992;
    if (!_7846)
    {
        float _7870 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _7872 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _7874 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _7876 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _7878 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _7880 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _7882 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _7884 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _7886 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _7888 = _7874 * _7876;
        float _7890 = _7874 * _7878;
        float _7892 = _7872 * _7876;
        float _7894 = -_7888;
        float _7896 = fma(_7870, _7880, _7894);
        float _7898 = -_7890;
        float _7900 = fma(_7872, _7880, _7898);
        float _7902 = -_7892;
        float _7904 = fma(_7870, _7878, _7902);
        float _7906 = _7886 * _7872;
        float _7908 = _7884 * _7896;
        float _7910 = _7886 * _7876;
        float _7912 = _7884 * _7880;
        float _7914 = _7882 * _7878;
        float _7916 = -_7908;
        float _7918 = fma(_7882, _7900, _7916);
        float _7920 = -_7906;
        float _7922 = fma(_7884, _7874, _7920);
        float _7924 = -_7914;
        float _7926 = fma(_7884, _7876, _7924);
        float _7928 = fma(_7886, _7904, _7918);
        float _7930 = _7884 * _7870;
        float _7932 = 1.0 / _7928;
        float _7934 = -_7930;
        float _7936 = fma(_7882, _7872, _7934);
        float _7938 = _7882 * _7874;
        float _7940 = -_7910;
        float _7942 = fma(_7882, _7880, _7940);
        float _7944 = -_7912;
        float _7946 = fma(_7886, _7878, _7944);
        float _7948 = -_7938;
        float _7950 = fma(_7886, _7870, _7948);
        float _7952 = -_7870;
        float _7954 = fma(_7952, _7880, _7888);
        float _7956 = _7942 * _7932;
        float _7958 = _7946 * _7932;
        float _7960 = _7926 * _7932;
        float _7962 = _7954 * _7932;
        float _7964 = _7842 * _7956;
        float _7966 = _7842 * _7958;
        float _7968 = _7838 * _7932;
        float _7970 = _7842 * _7960;
        float _7972 = _7922 * _7932;
        float _7974 = _7950 * _7932;
        float _7976 = fma(_7900, _7968, _7966);
        float _7978 = fma(_7838, _7962, _7964);
        float _7980 = _7936 * _7932;
        float _7982 = fma(_7904, _7968, _7970);
        float _7984 = fma(_7844, _7972, _7976);
        float _7986 = fma(_7844, _7974, _7978);
        float _7988 = fma(_7844, _7980, _7982);
        _7848 = _7968;
        _7850 = _7878;
        _7852 = _7880;
        _7854 = _7904;
        _7856 = _7980;
        _7858 = _7964;
        _7860 = _7960;
        _7862 = _7884;
        _7864 = _7950;
        _7866 = _7932;
        _7990 = _7984;
        _7992 = _7986;
        _7868 = _7988;
        _7994 = true;
    }
    else
    {
        bool _7996 = _1894 != 0;
        bool _7998 = _1954 != 0;
        bool _8000 = _7998 || _7996;
        if (!_8000)
        {
            _1960 = _7838;
        }
        float _8002 = _1960;
        _7990 = _8002;
        if (!_8000)
        {
            _1898 = _7842;
        }
        float _8004 = _1898;
        bool _8006 = !_8000;
        _7992 = _8004;
        if (!_8006)
        {
            uint _8008 = uint(int(uint(_182) >> uint(2)));
            float _8010 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8008)]);
            int _8012 = _182 + 4;
            uint _8014 = uint(int(uint(_8012) >> uint(2)));
            float _8016 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8014)]);
            int _8018 = _182 + 8;
            uint _8020 = uint(int(uint(_8018) >> uint(2)));
            float _8022 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8020)]);
            uint _8024 = uint(int(uint(_182) >> uint(2)));
            float _8026 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_8024)]);
            int _8028 = _182 + 4;
            uint _8030 = uint(int(uint(_8028) >> uint(2)));
            float _8032 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_8030)]);
            int _8034 = _182 + 8;
            uint _8036 = uint(int(uint(_8034) >> uint(2)));
            float _8038 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_8036)]);
            uint _8040 = uint(int(uint(_182) >> uint(2)));
            float _8042 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_8040)]);
            int _8044 = _182 + 4;
            uint _8046 = uint(int(uint(_8044) >> uint(2)));
            float _8048 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_8046)]);
            int _8050 = _182 + 8;
            uint _8052 = uint(int(uint(_8050) >> uint(2)));
            float _8054 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_8052)]);
            float _8056 = _8022 * _8026;
            float _8058 = _8022 * _8032;
            float _8060 = _8016 * _8026;
            float _8062 = -_8056;
            float _8064 = fma(_8010, _8038, _8062);
            float _8066 = -_8058;
            float _8068 = fma(_8016, _8038, _8066);
            float _8070 = _8048 * _8010;
            float _8072 = _8054 * _8016;
            float _8074 = _8048 * _8064;
            float _8076 = -_8060;
            float _8078 = fma(_8010, _8032, _8076);
            float _8080 = -_8070;
            float _8082 = fma(_8042, _8016, _8080);
            float _8084 = _8048 * _8038;
            float _8086 = -_8074;
            float _8088 = fma(_8042, _8068, _8086);
            float _8090 = _8054 * _8026;
            float _8092 = _8042 * _8032;
            float _8094 = -_8072;
            float _8096 = fma(_8048, _8022, _8094);
            float _8098 = fma(_8054, _8078, _8088);
            float _8100 = _8042 * _8022;
            float _8102 = -_8084;
            float _8104 = fma(_8054, _8032, _8102);
            float _8106 = -_8090;
            float _8108 = fma(_8042, _8038, _8106);
            float _8110 = 1.0 / _8098;
            float _8112 = -_8092;
            float _8114 = fma(_8048, _8026, _8112);
            float _8116 = -_8100;
            float _8118 = fma(_8054, _8010, _8116);
            float _8120 = -_8010;
            float _8122 = fma(_8120, _8038, _8056);
            float _8124 = _8104 * _8110;
            float _8126 = _8108 * _8110;
            float _8128 = _8114 * _8110;
            float _8130 = _7838 * _8110;
            float _8132 = _8124 * _7842;
            float _8134 = _8126 * _7842;
            float _8136 = _8122 * _8110;
            float _8138 = _8128 * _7842;
            float _8140 = _8096 * _8110;
            float _8142 = _8118 * _8110;
            float _8144 = fma(_8068, _8130, _8132);
            float _8146 = fma(_8136, _7838, _8134);
            float _8148 = _8082 * _8110;
            float _8150 = fma(_8078, _8130, _8138);
            float _8152 = fma(_8140, _7844, _8144);
            float _8154 = fma(_8142, _7844, _8146);
            float _8156 = fma(_8148, _7844, _8150);
            _7848 = _8026;
            _7850 = _8032;
            _7852 = _8038;
            _7854 = _8090;
            _7856 = _8084;
            _7858 = _8110;
            _7860 = _8126;
            _7862 = _8048;
            _7864 = _8142;
            _7866 = _8100;
            _7990 = _8152;
            _7992 = _8154;
            _7868 = _8156;
        }
    }
    _7994 = false;
    float _8158 = _7848;
    float _8160 = _7850;
    float _8162 = _7852;
    float _8164 = _7854;
    float _8166 = _7856;
    float _8168 = _7858;
    float _8170 = _7860;
    float _8172 = _7862;
    float _8174 = _7864;
    float _8176 = _7866;
    float _8178 = _7990;
    float _8180 = _7992;
    float _8182 = _7868;
    float _8184 = _7090 * _7090;
    float _8186 = _4106 * (-0.0291463173925876617431640625);
    float _8188 = fma(_7088, _7088, _8184);
    float _8190 = exp2(_8186);
    float _8192 = fma(_7092, _7092, _8188);
    float _8194 = sqrt(_8192);
    float _8196 = _8194 * 0.01666666753590106964111328125;
    bool _8198 = _8196 > 1.57079637050628662109375;
    float _8200 = _8196;
    if (_8198)
    {
        float _8202 = rsqrt(_8192);
        _8200 = _8202;
    }
    float _8204 = _8200;
    float _8206 = _8204;
    if (_8198)
    {
        float _8208 = _8204 * 94.24777984619140625;
        _8206 = _8208;
    }
    float _8210 = _8206;
    if (_8198)
    {
        float _8212 = _7090 * _8210;
        _7104 = _8212;
    }
    float _8214 = _7104;
    if (_8198)
    {
        float _8216 = _7088 * _8210;
        _7106 = _8216;
    }
    float _8218 = _7106;
    if (_8198)
    {
        float _8220 = _7092 * _8210;
        _7108 = _8220;
    }
    float _8222 = _7108;
    float _8224 = fma(_6924, _8214, _6708);
    float _8226 = fma(_6924, _8218, _6710);
    float _8228 = fma(_6924, _8222, _6712);
    float _8230 = _8224 * _8190;
    float _8232 = _8226 * _8190;
    float _8234 = _8228 * _8190;
    float _8236 = _8230 * _8230;
    float _8238 = fma(_8232, _8232, _8236);
    float _8240 = fma(_8234, _8234, _8238);
    float _8242 = sqrt(_8240);
    bool _8244 = _8242 > 31.4159259796142578125;
    float _8246 = _8242;
    float _8248 = _8230;
    float _8250 = _8232;
    float _8252 = _8234;
    if (_8244)
    {
        float _8254 = rsqrt(_8240);
        _8246 = _8254;
    }
    float _8256 = _8246;
    float _8258 = _8256;
    if (_8244)
    {
        float _8260 = _8256 * 31.4159259796142578125;
        _8258 = _8260;
    }
    float _8262 = _8258;
    if (_8244)
    {
        float _8264 = _8230 * _8262;
        _8248 = _8264;
    }
    float _8266 = _8248;
    if (_8244)
    {
        float _8268 = _8232 * _8262;
        _8250 = _8268;
    }
    float _8270 = _8250;
    if (_8244)
    {
        float _8272 = _8234 * _8262;
        _8252 = _8272;
    }
    float _8274 = _8252;
    float _8276 = _6924 * _8266;
    float _8278 = _6924 * _8270;
    float _8280 = _6924 * _8274;
    float _8282 = _8276 * _8276;
    float _8284 = fma(_8278, _8278, _8282);
    float _8286 = fma(_8280, _8280, _8284);
    float _8288 = sqrt(_8286);
    float _8290 = rsqrt(_8286);
    float _8292 = _8288 * 0.5;
    bool _8294 = _8288 != 0.0;
    bool _8296 = isnan(_8288);
    bool _8298 = _8294 || _8296;
    bool _8300 = isnan(0.0);
    bool _8302 = _8298 || _8300;
    float _8304 = _8292 * 0.15915493667125701904296875;
    float _8306 = _8304 * 6.283185482025146484375;
    float _8308 = sin(_8306);
    float _8310 = _8280 * _8290;
    float _8312 = _8276 * _8290;
    float _8314 = _8278 * _8290;
    float _8316 = _8302 ? _8310 : 0.0;
    float _8318 = _8302 ? _8312 : 0.0;
    float _8320 = _8304 * 6.283185482025146484375;
    float _8322 = cos(_8320);
    float _8324 = _8302 ? _8314 : 0.0;
    float _8326 = _8316 * _8308;
    float _8328 = _8318 * _8308;
    float _8330 = _8324 * _8308;
    float _8332 = _8326 * _4090;
    float _8334 = _8328 * _4084;
    float _8336 = _8328 * _4090;
    float _8338 = _8328 * _4080;
    float _8340 = -_8332;
    float _8342 = fma(_8328, _4086, _8340);
    float _8344 = -_8334;
    float _8346 = fma(_8330, _4090, _8344);
    float _8348 = _8330 * _4080;
    float _8350 = _8330 * _4086;
    float _8352 = _8326 * _4080;
    float _8354 = fma(_8330, _4084, _8336);
    float _8356 = fma(_8322, _4090, _8338);
    float _8358 = fma(_8322, _4084, _8348);
    float _8360 = -_8350;
    float _8362 = fma(_8326, _4084, _8360);
    float _8364 = fma(_8322, _4086, _8352);
    float _8366 = fma(_8326, _4086, _8354);
    float _8368 = _8358 + _8342;
    float _8370 = _8356 + _8362;
    float _8372 = _8364 + _8346;
    float _8374 = -_8366;
    float _8376 = fma(_8322, _4080, _8374);
    uint _8378 = uint(int(uint(_1636) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8378)] = as_type<uint>(_8368);
    int _8380 = _1636 + 4;
    uint _8382 = uint(int(uint(_8380) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8382)] = as_type<uint>(_8370);
    int _8384 = _1636 + 8;
    uint _8386 = uint(int(uint(_8384) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8386)] = as_type<uint>(_8372);
    int _8388 = _1636 + 12;
    uint _8390 = uint(int(uint(_8388) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8390)] = as_type<uint>(_8376);
    uint _8392 = uint(int(uint(_1750) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8392)] = as_type<uint>(_8270);
    int _8394 = _1750 + 4;
    uint _8396 = uint(int(uint(_8394) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8396)] = as_type<uint>(_8266);
    int _8398 = _1750 + 8;
    uint _8400 = uint(int(uint(_8398) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8400)] = as_type<uint>(_8274);
    int _8402 = _1750 + 12;
    uint _8404 = uint(int(uint(_8402) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_8404)] = as_type<uint>(_6686);
    float _8406 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    float _8408 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[71]);
    int _8410 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 48;
    uint _8412 = uint(int(uint(_8410) >> uint(2)));
    float _8414 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8412)]);
    int _8416 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 52;
    uint _8418 = uint(int(uint(_8416) >> uint(2)));
    float _8420 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8418)]);
    int _8422 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 56;
    uint _8424 = uint(int(uint(_8422) >> uint(2)));
    float _8426 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8424)]);
    int _8428 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 60;
    uint _8430 = uint(int(uint(_8428) >> uint(2)));
    float _8432 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8430)]);
    int _8434 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 36;
    uint _8436 = uint(int(uint(_8434) >> uint(2)));
    float _8438 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8436)]);
    int _8440 = as_type<int>(_8406) & 512;
    bool _8442 = _8440 != 0;
    int _8444 = as_type<int>(_8406) & 1024;
    bool _8446 = _8444 != 0;
    float _8448 = _8158;
    float _8450 = _8160;
    float _8452 = _8162;
    float _8454 = _8164;
    float _8456 = _8326;
    float _8458 = _8406;
    bool _8460 = _8446;
    bool _8462 = _6714;
    if (_8442)
    {
        float _8464 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _8466 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _8468 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _8470 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _8448 = _8464;
        _8450 = _8466;
        _8452 = _8468;
        _8454 = _8470;
    }
    float _8472 = _8448;
    float _8474 = _8450;
    float _8476 = _8452;
    float _8478 = _8454;
    float _8480 = _8342;
    float _8482 = _8166;
    float _8484 = _8354;
    float _8486 = _8168;
    if (_8442)
    {
        float _8488 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _8490 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _8492 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _8494 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _8480 = _8488;
        _8482 = _8490;
        _8484 = _8492;
        _8486 = _8494;
    }
    float _8496 = _8480;
    float _8498 = _8482;
    float _8500 = _8484;
    float _8502 = _8486;
    float _8504 = _8170;
    float _8506 = _8172;
    float _8508 = _8174;
    float _8510 = _8176;
    if (_8442)
    {
        float _8512 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _8514 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _8516 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _8518 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _8504 = _8512;
        _8506 = _8514;
        _8508 = _8516;
        _8510 = _8518;
    }
    float _8520 = _8504;
    float _8522 = _8506;
    float _8524 = _8508;
    float _8526 = _8510;
    float _8528 = _4268 + _8408;
    float _8530 = _8528 + _7834;
    float _8532 = _8432;
    float _8534 = _8408;
    if (!_8442)
    {
        _8532 = 0.0;
    }
    float _8536 = _8532;
    int _8538 = as_type<int>(_8406) & 2048;
    bool _8540 = _8538 != 0;
    float _8542 = _8536;
    if (_8442)
    {
        float _8544 = _8530 * _8474;
        _1812 = _8544;
    }
    float _8546 = _1812;
    float _8548 = _8498;
    float _8550 = _8546;
    float _8552 = _8520;
    float _8554 = _8500;
    if (_8442)
    {
        float _8556 = _8530 * _8498;
        _8548 = _8556;
    }
    float _8558 = _8548;
    float _8560 = _8558;
    if (_8442)
    {
        float _8562 = _8530 * _8522;
        _8456 = _8562;
    }
    float _8564 = _8456;
    float _8566 = _8564;
    if (_8442)
    {
        float _8568 = fma(_7840, _8472, _8546);
        _8550 = _8568;
    }
    float _8570 = _8550;
    float _8572 = _8570;
    if (_8442)
    {
        float _8574 = fma(_7840, _8496, _8558);
        _8560 = _8574;
    }
    float _8576 = _8560;
    if (_8442)
    {
        float _8578 = fma(_7840, _8520, _8564);
        _8552 = _8578;
    }
    float _8580 = _8552;
    float _8582 = _8580;
    if (_8442)
    {
        float _8584 = fma(_7836, _8476, _8570);
        _8572 = _8584;
    }
    float _8586 = _8572;
    float _8588 = _8586;
    if (_8442)
    {
        float _8590 = fma(_7836, _8500, _8576);
        _8554 = _8590;
    }
    float _8592 = _8554;
    if (_8442)
    {
        float _8594 = fma(_7836, _8524, _8580);
        _8582 = _8594;
    }
    float _8596 = _8582;
    if (!_8442)
    {
        _8566 = 0.0;
        _4128 = 0.0;
    }
    float _8598 = _8566;
    float _8600 = _4128;
    float _8602 = _8598;
    float _8604 = _8600;
    if (_8442)
    {
        float _8606 = _8478 + _8586;
        _8542 = _8606;
    }
    float _8608 = _8542;
    float _8610 = _8608;
    if (_8442)
    {
        float _8612 = _8502 + _8592;
        _8602 = _8612;
    }
    float _8614 = _8602;
    float _8616 = _8614;
    if (_8442)
    {
        float _8618 = _8526 + _8596;
        _8604 = _8618;
    }
    float _8620 = _8604;
    bool _8622 = !_8446;
    float _8624 = _8620;
    if (!_8622)
    {
        float _8626 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _8628 = uint(int(uint(_182) >> uint(2)));
        float _8630 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_8628)]);
        int _8632 = _182 + 4;
        uint _8634 = uint(int(uint(_8632) >> uint(2)));
        float _8636 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_8634)]);
        int _8638 = _182 + 8;
        uint _8640 = uint(int(uint(_8638) >> uint(2)));
        float _8642 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_8640)]);
        uint _8644 = uint(int(uint(_182) >> uint(2)));
        float _8646 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8644)]);
        int _8648 = _182 + 4;
        uint _8650 = uint(int(uint(_8648) >> uint(2)));
        float _8652 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8650)]);
        int _8654 = _182 + 8;
        uint _8656 = uint(int(uint(_8654) >> uint(2)));
        float _8658 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8656)]);
        uint _8660 = uint(int(uint(_182) >> uint(2)));
        float _8662 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_8660)]);
        int _8664 = _182 + 4;
        uint _8666 = uint(int(uint(_8664) >> uint(2)));
        float _8668 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_8666)]);
        int _8670 = _182 + 8;
        uint _8672 = uint(int(uint(_8670) >> uint(2)));
        float _8674 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_8672)]);
        float _8676 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _8678 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _8680 = _8530 * _8636;
        float _8682 = _8530 * _8652;
        float _8684 = _8530 * _8668;
        float _8686 = fma(_7840, _8630, _8680);
        float _8688 = fma(_7840, _8646, _8682);
        float _8690 = fma(_7840, _8662, _8684);
        float _8692 = fma(_7836, _8642, _8686);
        float _8694 = fma(_7836, _8658, _8688);
        float _8696 = fma(_7836, _8674, _8690);
        float _8698 = _8626 + _8692;
        float _8700 = _8676 + _8694;
        float _8702 = _8678 + _8696;
        _8588 = _8692;
        _8534 = _8636;
        _8458 = _8642;
        _8616 = _8700;
        _8610 = _8698;
        _8624 = _8702;
    }
    float _8704 = _8588;
    float _8706 = _8534;
    float _8708 = _8458;
    float _8710 = _8616;
    float _8712 = _8610;
    float _8714 = _8624;
    bool _8716 = !_8540;
    float _8718 = _8710;
    float _8720 = _8712;
    float _8722 = _8714;
    float _8724 = _8704;
    float _8726 = _8706;
    float _8728 = _8708;
    if (!_8716)
    {
        uint _8730 = uint(int(uint(_182) >> uint(2)));
        float _8732 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_8730)]);
        int _8734 = _182 + 4;
        uint _8736 = uint(int(uint(_8734) >> uint(2)));
        float _8738 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_8736)]);
        int _8740 = _182 + 8;
        uint _8742 = uint(int(uint(_8740) >> uint(2)));
        float _8744 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_8742)]);
        int _8746 = _182 + 12;
        uint _8748 = uint(int(uint(_8746) >> uint(2)));
        float _8750 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_8748)]);
        uint _8752 = uint(int(uint(_182) >> uint(2)));
        float _8754 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8752)]);
        int _8756 = _182 + 4;
        uint _8758 = uint(int(uint(_8756) >> uint(2)));
        float _8760 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8758)]);
        int _8762 = _182 + 8;
        uint _8764 = uint(int(uint(_8762) >> uint(2)));
        float _8766 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8764)]);
        int _8768 = _182 + 12;
        uint _8770 = uint(int(uint(_8768) >> uint(2)));
        float _8772 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_8770)]);
        uint _8774 = uint(int(uint(_182) >> uint(2)));
        float _8776 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_8774)]);
        int _8778 = _182 + 4;
        uint _8780 = uint(int(uint(_8778) >> uint(2)));
        float _8782 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_8780)]);
        int _8784 = _182 + 8;
        uint _8786 = uint(int(uint(_8784) >> uint(2)));
        float _8788 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_8786)]);
        int _8790 = _182 + 12;
        uint _8792 = uint(int(uint(_8790) >> uint(2)));
        float _8794 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_8792)]);
        float _8796 = _8530 * _8738;
        float _8798 = _8530 * _8760;
        float _8800 = _8530 * _8782;
        float _8802 = fma(_7840, _8732, _8796);
        float _8804 = fma(_7840, _8754, _8798);
        float _8806 = fma(_7840, _8776, _8800);
        float _8808 = fma(_7836, _8744, _8802);
        float _8810 = fma(_7836, _8766, _8804);
        float _8812 = fma(_7836, _8788, _8806);
        float _8814 = _8808 + _8750;
        float _8816 = _8810 + _8772;
        float _8818 = _8812 + _8794;
        _8718 = _8816;
        _8720 = _8814;
        _8722 = _8818;
        _8724 = _8808;
        _8726 = _8738;
        _8728 = _8744;
    }
    float _8820 = _8718;
    float _8822 = _8720;
    float _8824 = _8722;
    float _8826 = _8724;
    float _8828 = _8726;
    float _8830 = _8728;
    float _8832 = -_8820;
    float _8834 = _8420 + _8832;
    float _8836 = -_8822;
    float _8838 = _8414 + _8836;
    float _8840 = -_8824;
    float _8842 = _8426 + _8840;
    bool _8844 = _322 > 0.001000000047497451305389404296875;
    bool _8846 = isnan(_322);
    bool _8848 = _8844 || _8846;
    bool _8850 = isnan(0.001000000047497451305389404296875);
    bool _8852 = _8848 || _8850;
    float _8854 = _8834 * _8834;
    float _8856 = fma(_8838, _8838, _8854);
    float _8858 = fma(_8842, _8842, _8856);
    float _8860 = sqrt(_8858);
    float _8862 = _8826;
    float _8864 = _8830;
    float _8866 = _8828;
    int _8868 = as_type<int>(_8858);
    int _8870 = as_type<int>(_8822);
    if (!_8852)
    {
        _8862 = 0.0;
    }
    float _8872 = _8862;
    float _8874 = _8872;
    if (!_8852)
    {
        _8864 = 0.0;
    }
    float _8876 = _8864;
    float _8878 = _8876;
    if (!_8852)
    {
        _332 = 0.0;
    }
    float _8880 = _332;
    float _8882 = _8880;
    if (!_8852)
    {
        bool _8884 = _8860 > _8438;
        float _8886 = float(_8884);
        _8866 = _8886;
    }
    float _8888 = _8866;
    bool _8890 = !_8852;
    float _8892 = _8888;
    if (!_8890)
    {
        int _8894 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 64;
        uint _8896 = uint(int(uint(_8894) >> uint(2)));
        float _8898 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8896)]);
        int _8900 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 68;
        uint _8902 = uint(int(uint(_8900) >> uint(2)));
        float _8904 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8902)]);
        int _8906 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 72;
        uint _8908 = uint(int(uint(_8906) >> uint(2)));
        float _8910 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8908)]);
        int _8912 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 76;
        uint _8914 = uint(int(uint(_8912) >> uint(2)));
        float _8916 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8914)]);
        int _8918 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 80;
        uint _8920 = uint(int(uint(_8918) >> uint(2)));
        float _8922 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8920)]);
        int _8924 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 84;
        uint _8926 = uint(int(uint(_8924) >> uint(2)));
        float _8928 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8926)]);
        int _8930 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 88;
        uint _8932 = uint(int(uint(_8930) >> uint(2)));
        float _8934 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8932)]);
        int _8936 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 96;
        uint _8938 = uint(int(uint(_8936) >> uint(2)));
        float _8940 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8938)]);
        int _8942 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 100;
        uint _8944 = uint(int(uint(_8942) >> uint(2)));
        float _8946 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8944)]);
        int _8948 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 104;
        uint _8950 = uint(int(uint(_8948) >> uint(2)));
        float _8952 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8950)]);
        uint _8954 = uint(int(uint(_186) >> uint(2)));
        float _8956 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_8954)]);
        bool _8958 = _8860 > _8438;
        float _8960 = -_8820;
        float _8962 = _8904 + _8960;
        float _8964 = -_8822;
        float _8966 = _8898 + _8964;
        float _8968 = -_8824;
        float _8970 = _8910 + _8968;
        float _8972 = -_8820;
        float _8974 = _8928 + _8972;
        float _8976 = _8962 * _8962;
        float _8978 = -_8822;
        float _8980 = _8922 + _8978;
        float _8982 = -_8824;
        float _8984 = _8934 + _8982;
        float _8986 = -_8820;
        float _8988 = _8946 + _8986;
        float _8990 = _8974 * _8974;
        float _8992 = -_8822;
        float _8994 = _8940 + _8992;
        float _8996 = fma(_8966, _8966, _8976);
        float _8998 = _8988 * _8988;
        float _9000 = fma(_8980, _8980, _8990);
        float _9002 = -_8824;
        float _9004 = _8952 + _9002;
        float _9006 = fma(_8970, _8970, _8996);
        float _9008 = fma(_8994, _8994, _8998);
        float _9010 = fma(_8984, _8984, _9000);
        float _9012 = _8994;
        int _9014 = as_type<int>(_8956);
        if (!_8958)
        {
            int _9016 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 32;
            uint _9018 = uint(int(uint(_9016) >> uint(2)));
            float _9020 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9018)]);
            _9012 = _9020;
        }
        float _9022 = _9012;
        float _9024 = sqrt(_9006);
        float _9026 = fma(_9004, _9004, _9008);
        int _9028 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 40;
        uint _9030 = uint(int(uint(_9028) >> uint(2)));
        float _9032 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9030)]);
        float _9034 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
        float _9036 = sqrt(_9010);
        float _9038 = sqrt(_9026);
        bool _9040 = _9024 > _8438;
        bool _9042 = _9036 > _8438;
        float _9044 = _9006;
        if (!_9040)
        {
            int _9046 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 32;
            uint _9048 = uint(int(uint(_9046) >> uint(2)));
            float _9050 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9048)]);
            _9044 = _9050;
        }
        float _9052 = _9044;
        bool _9054 = _9038 > _8438;
        float _9056 = _8916;
        if (!_9042)
        {
            int _9058 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 32;
            uint _9060 = uint(int(uint(_9058) >> uint(2)));
            float _9062 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9060)]);
            _9056 = _9062;
        }
        float _9064 = _9056;
        float _9066 = _8350;
        if (!_9054)
        {
            int _9068 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 32;
            uint _9070 = uint(int(uint(_9068) >> uint(2)));
            float _9072 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_9070)]);
            _9066 = _9072;
        }
        float _9074 = _9066;
        int _9076 = as_type<int>(_8956) << 24;
        int _9078 = _9076 >> 24;
        float _9080 = float(_9078);
        float _9082 = _9080 * 0.0078740157186985015869140625;
        float _9084 = precise::min(_9082, 1.0);
        float _9086 = precise::max(_9084, -1.0);
        int _9088 = as_type<int>(_8956) << 16;
        bool _9090 = _9086 > 0.0;
        bool _9092 = _9090 || _8958;
        int _9094 = as_type<int>(_8956) << 8;
        int _9096 = _9088 >> 24;
        int _9098 = as_type<int>(_8956) >> 24;
        if (!_8958)
        {
            bool _9100 = _9086 >= 0.0;
            bool _9102 = isnan(_9086);
            bool _9104 = _9100 || _9102;
            bool _9106 = isnan(0.0);
            bool _9108 = _9104 || _9106;
            _8460 = _9108;
        }
        bool _9110 = _8460;
        int _9112 = _9094 >> 24;
        float _9114 = float(_9096);
        float _9116 = float(_9098);
        bool _9118 = _9110;
        if (!_8958)
        {
            int _9120 = _9110 ? 0 : 1;
            _8868 = _9120;
        }
        int _9122 = _8868;
        float _9124 = _9114 * 0.0078740157186985015869140625;
        float _9126 = float(_9112);
        float _9128 = _9116 * 0.0078740157186985015869140625;
        float _9130 = _9126;
        int _9132 = _9122;
        if (!_8958)
        {
            int _9134 = ~_9122;
            int _9136 = _9134 + 1;
            int _9138 = _9136 + 1;
            _9014 = _9138;
        }
        int _9140 = _9014;
        int _9142 = _9140;
        if (!_9092)
        {
            int _9144 = ~_9122;
            int _9146 = _9144 + 1;
            _9142 = _9146;
        }
        int _9148 = _9142;
        float _9150 = precise::min(_9124, 1.0);
        int _9152 = _9148;
        int _9154 = as_type<int>(_9150);
        if (!_8958)
        {
            float _9156 = float(_9148);
            _9152 = as_type<int>(_9156);
        }
        int _9158 = _9152;
        int _9160 = _9158;
        if (!_8958)
        {
            bool _9162 = _8860 >= _9022;
            bool _9164 = isnan(_8860);
            bool _9166 = _9162 || _9164;
            bool _9168 = isnan(_9022);
            bool _9170 = _9166 || _9168;
            _9118 = _9170;
        }
        bool _9172 = _9118;
        float _9174 = _9126 * 0.0078740157186985015869140625;
        float _9176 = precise::min(_9128, 1.0);
        float _9178 = precise::max(_9150, -1.0);
        float _9180 = precise::min(_9174, 1.0);
        bool _9182 = _9172;
        int _9184 = as_type<int>(_9180);
        int _9186 = as_type<int>(_9176);
        if (_8958)
        {
            _9130 = 1.0;
        }
        float _9188 = _9130;
        float _9190 = _9188;
        if (!_8958)
        {
            float _9192 = _9172 ? as_type<float>(_9158) : (-1.0);
            _9190 = _9192;
        }
        float _9194 = _9190;
        float _9196 = precise::max(_9180, -1.0);
        if (!_9040)
        {
            bool _9198 = _9178 >= 0.0;
            bool _9200 = isnan(_9178);
            bool _9202 = _9198 || _9200;
            bool _9204 = isnan(0.0);
            bool _9206 = _9202 || _9204;
            _9182 = _9206;
        }
        bool _9208 = _9182;
        float _9210 = precise::max(_9176, -1.0);
        if (!_9042)
        {
            bool _9212 = _9196 >= 0.0;
            bool _9214 = isnan(_9196);
            bool _9216 = _9212 || _9214;
            bool _9218 = isnan(0.0);
            bool _9220 = _9216 || _9218;
            _8462 = _9220;
        }
        bool _9222 = _8462;
        bool _9224 = _9222;
        if (!_9040)
        {
            int _9226 = _9208 ? 0 : 1;
            _9154 = _9226;
        }
        int _9228 = _9154;
        bool _9230 = _9178 > 0.0;
        bool _9232 = _9230 || _9040;
        bool _9234 = _9196 > 0.0;
        bool _9236 = _9234 || _9042;
        bool _9238 = _9210 > 0.0;
        bool _9240 = _9238 || _9054;
        bool _9242 = _9232;
        bool _9244 = _9236;
        bool _9246 = _9240;
        float _9248 = as_type<float>(_9228);
        if (!_9042)
        {
            int _9250 = _9222 ? 0 : 1;
            _9184 = _9250;
        }
        int _9252 = _9184;
        float _9254 = 1.0 / _9032;
        float _9256 = as_type<float>(_9252);
        if (!_9054)
        {
            bool _9258 = _9210 >= 0.0;
            bool _9260 = isnan(_9210);
            bool _9262 = _9258 || _9260;
            bool _9264 = isnan(0.0);
            bool _9266 = _9262 || _9264;
            _9224 = _9266;
        }
        bool _9268 = _9224;
        if (!_9054)
        {
            int _9270 = _9268 ? 0 : 1;
            _9160 = _9270;
        }
        int _9272 = _9160;
        float _9274 = as_type<float>(_9272);
        if (!_9040)
        {
            int _9276 = ~_9228;
            int _9278 = _9276 + 1;
            int _9280 = _9278 + 1;
            _9186 = _9280;
        }
        int _9282 = _9186;
        int _9284 = _9282;
        if (!_9042)
        {
            int _9286 = ~_9252;
            int _9288 = _9286 + 1;
            int _9290 = _9288 + 1;
            _9132 = _9290;
        }
        int _9292 = _9132;
        int _9294 = _9292;
        if (!_9054)
        {
            int _9296 = ~_9272;
            int _9298 = _9296 + 1;
            int _9300 = _9298 + 1;
            _8870 = _9300;
        }
        int _9302 = _8870;
        int _9304 = _9302;
        if (!_9232)
        {
            int _9306 = ~_9228;
            int _9308 = _9306 + 1;
            _9284 = _9308;
        }
        int _9310 = _9284;
        int _9312 = _9310;
        if (!_9236)
        {
            int _9314 = ~_9252;
            int _9316 = _9314 + 1;
            _9294 = _9316;
        }
        int _9318 = _9294;
        int _9320 = _9318;
        if (!_9240)
        {
            int _9322 = ~_9272;
            int _9324 = _9322 + 1;
            _9304 = _9324;
        }
        int _9326 = _9304;
        int _9328 = _9326;
        if (!_9040)
        {
            bool _9330 = _9024 >= _9052;
            bool _9332 = isnan(_9024);
            bool _9334 = _9330 || _9332;
            bool _9336 = isnan(_9052);
            bool _9338 = _9334 || _9336;
            _9242 = _9338;
        }
        bool _9340 = _9242;
        if (!_9042)
        {
            bool _9342 = _9036 >= _9064;
            bool _9344 = isnan(_9036);
            bool _9346 = _9342 || _9344;
            bool _9348 = isnan(_9064);
            bool _9350 = _9346 || _9348;
            _9244 = _9350;
        }
        bool _9352 = _9244;
        if (!_9054)
        {
            bool _9354 = _9038 >= _9074;
            bool _9356 = isnan(_9038);
            bool _9358 = _9354 || _9356;
            bool _9360 = isnan(_9074);
            bool _9362 = _9358 || _9360;
            _9246 = _9362;
        }
        bool _9364 = _9246;
        if (!_9040)
        {
            float _9366 = float(_9310);
            _9312 = as_type<int>(_9366);
        }
        int _9368 = _9312;
        if (!_9042)
        {
            float _9370 = float(_9318);
            _9320 = as_type<int>(_9370);
        }
        int _9372 = _9320;
        if (!_9054)
        {
            float _9374 = float(_9326);
            _9328 = as_type<int>(_9374);
        }
        int _9376 = _9328;
        float _9378 = _9034 * _9254;
        if (_9040)
        {
            _9256 = 1.0;
        }
        float _9380 = _9256;
        float _9382 = _9380;
        if (_9042)
        {
            _9248 = 1.0;
        }
        float _9384 = _9248;
        float _9386 = _9384;
        if (_9054)
        {
            _9274 = 1.0;
        }
        float _9388 = _9274;
        float _9390 = _9388;
        if (!_9040)
        {
            float _9392 = _9340 ? as_type<float>(_9368) : (-1.0);
            _9382 = _9392;
        }
        float _9394 = _9382;
        if (!_9042)
        {
            float _9396 = _9352 ? as_type<float>(_9372) : (-1.0);
            _9386 = _9396;
        }
        float _9398 = _9386;
        if (!_9054)
        {
            float _9400 = _9364 ? as_type<float>(_9376) : (-1.0);
            _9390 = _9400;
        }
        float _9402 = _9390;
        float _9404 = abs(_9086);
        float _9406 = fma(_9378, _9194, _9404);
        float _9408 = precise::clamp(_9406, 0.0, 1.0);
        float _9410 = abs(_9178);
        float _9412 = fma(_9378, _9394, _9410);
        float _9414 = precise::clamp(_9412, 0.0, 1.0);
        float _9416 = abs(_9196);
        float _9418 = fma(_9378, _9398, _9416);
        float _9420 = precise::clamp(_9418, 0.0, 1.0);
        float _9422 = abs(_9210);
        float _9424 = fma(_9378, _9402, _9422);
        float _9426 = precise::clamp(_9424, 0.0, 1.0);
        float _9428 = _9408 * _9194;
        float _9430 = _9414 * _9394;
        float _9432 = _9420 * _9398;
        float _9434 = _9426 * _9402;
        _8892 = _9428;
        _8874 = _9430;
        _8878 = _9432;
        _8882 = _9434;
    }
    float _9436 = _8892;
    float _9438 = _8874;
    float _9440 = _8878;
    float _9442 = _8882;
    float _9444 = precise::min(_9436, 1.0);
    float _9446 = precise::min(_9438, 1.0);
    float _9448 = -_240;
    float _9450 = _9448 + _7840;
    float _9452 = precise::max(_9444, -1.0);
    float _9454 = precise::max(_9446, -1.0);
    float _9456 = -_252;
    float _9458 = _9456 + _7836;
    float _9460 = precise::min(_9440, 1.0);
    float _9462 = _9452 * 127.0;
    float _9464 = precise::min(_9442, 1.0);
    float _9466 = _9454 * 127.0;
    float _9468 = precise::max(_9460, -1.0);
    float _9470 = precise::max(_9464, -1.0);
    float _9472 = rint(_9462);
    int _9474 = int(_9472);
    int _9476 = _182 + 4;
    float _9478 = _9468 * 127.0;
    float _9480 = _9470 * 127.0;
    float _9482 = rint(_9466);
    int _9484 = int(_9482);
    float _9486 = rint(_9478);
    int _9488 = int(_9486);
    uint _9490 = extract_bits(uint(_9474), 0u, 8u);
    int _9492 = int(_9490) & 255;
    float _9494 = rint(_9480);
    int _9496 = int(_9494);
    uint _9498 = extract_bits(uint(_9492), 0u, 8u);
    int _9500 = int(_9498) & 255;
    uint _9502 = extract_bits(uint(_9484), 0u, 8u);
    int _9504 = int(_9502) & 255;
    int _9506 = _9504 << 8;
    int _9508 = _9500 | _9506;
    uint _9510 = extract_bits(uint(_9492), 16u, 8u);
    int _9512 = int(_9510) & 255;
    int _9514 = _9512 << 16;
    int _9516 = _9508 | _9514;
    uint _9518 = extract_bits(uint(_9492), 24u, 8u);
    int _9520 = int(_9518) & 255;
    int _9522 = _9520 << 24;
    int _9524 = _9516 | _9522;
    float _9526 = -_246;
    float _9528 = _9526 + _8530;
    uint _9530 = extract_bits(uint(_9524), 0u, 8u);
    int _9532 = int(_9530) & 255;
    uint _9534 = extract_bits(uint(_9524), 8u, 8u);
    int _9536 = int(_9534) & 255;
    int _9538 = _9536 << 8;
    int _9540 = _9532 | _9538;
    uint _9542 = extract_bits(uint(_9488), 0u, 8u);
    int _9544 = int(_9542) & 255;
    int _9546 = _9544 << 16;
    int _9548 = _9540 | _9546;
    uint _9550 = extract_bits(uint(_9524), 24u, 8u);
    int _9552 = int(_9550) & 255;
    int _9554 = _9552 << 24;
    int _9556 = _9548 | _9554;
    uint _9558 = extract_bits(uint(_9556), 0u, 8u);
    int _9560 = int(_9558) & 255;
    uint _9562 = extract_bits(uint(_9556), 8u, 8u);
    int _9564 = int(_9562) & 255;
    int _9566 = _9564 << 8;
    int _9568 = _9560 | _9566;
    uint _9570 = extract_bits(uint(_9556), 16u, 8u);
    int _9572 = int(_9570) & 255;
    int _9574 = _9572 << 16;
    int _9576 = _9568 | _9574;
    uint _9578 = extract_bits(uint(_9496), 0u, 8u);
    int _9580 = int(_9578) & 255;
    int _9582 = _9580 << 24;
    int _9584 = _9576 | _9582;
    int _9586 = _182 + 8;
    uint _9588 = uint(int(uint(_186) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_9588)] = uint(_9584);
    uint _9590 = uint(int(uint(_186) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_9590)] = as_type<uint>(_280);
    uint _9592 = uint(int(uint(_182) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_9592)] = as_type<uint>(_7840);
    uint _9594 = uint(int(uint(_9476) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_9594)] = as_type<uint>(_8530);
    uint _9596 = uint(int(uint(_9586) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_9596)] = as_type<uint>(_7836);
    uint _9598 = uint(int(uint(_182) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_9598)] = as_type<uint>(_8178);
    uint _9600 = uint(int(uint(_9476) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_9600)] = as_type<uint>(_8180);
    uint _9602 = uint(int(uint(_9586) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_9602)] = as_type<uint>(_8182);
    uint _9604 = uint(int(uint(_182) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_9604)] = as_type<uint>(_9450);
    uint _9606 = uint(int(uint(_9476) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_9606)] = as_type<uint>(_9528);
    uint _9608 = uint(int(uint(_9586) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_9608)] = as_type<uint>(_9458);
    float _9610 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _9612 = _9528 * _9528;
    float _9614 = _8180 * _8180;
    float _9616 = fma(_9450, _9450, _9612);
    float _9618 = fma(_8178, _8178, _9614);
    float _9620 = fma(_9458, _9458, _9616);
    float _9622 = fma(_8182, _8182, _9618);
    float _9624 = sqrt(_9620);
    float _9626 = sqrt(_9622);
    bool _9628 = _9624 >= 9.9999999747524270787835121154785e-07;
    bool _9630 = isnan(_9624);
    bool _9632 = _9628 || _9630;
    bool _9634 = isnan(9.9999999747524270787835121154785e-07);
    bool _9636 = _9632 || _9634;
    float _9638 = _9626;
    if (!_9636)
    {
        bool _9640 = _188 != _192;
        bool _9642 = isnan(_188);
        bool _9644 = _9640 || _9642;
        bool _9646 = isnan(_192);
        bool _9648 = _9644 || _9646;
        _9650 = _9648;
        if (!_9650)
        {
            float _9652 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
            bool _9654 = _9652 > 0.0;
            bool _9656 = !_9654;
            if (!_9656)
            {
                float _9658 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
                float _9660 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
                float _9662 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
                float _9664 = _9660 * _9660;
                float _9666 = fma(_9658, _9658, _9664);
                float _9668 = fma(_9662, _9662, _9666);
                float _9670 = rsqrt(_9668);
                float _9672 = _9670 * 9.9999999747524270787835121154785e-07;
                float _9674 = _9658 * _9672;
                float _9676 = _9660 * _9672;
                float _9678 = _9662 * _9672;
                _418 = as_type<int>(_9674);
                _420 = as_type<int>(_9676);
                _422 = as_type<int>(_9678);
                _9650 = true;
            }
            else
            {
                bool _9680 = _9626 >= 9.9999999747524270787835121154785e-07;
                bool _9682 = isnan(_9626);
                bool _9684 = _9680 || _9682;
                bool _9686 = isnan(9.9999999747524270787835121154785e-07);
                bool _9688 = _9684 || _9686;
                if (!_9688)
                {
                    float _9690 = _8530 * _8530;
                    float _9692 = fma(_7840, _7840, _9690);
                    float _9694 = fma(_7836, _7836, _9692);
                    float _9696 = sqrt(_9694);
                    bool _9698 = _9696 >= 9.9999999747524270787835121154785e-07;
                    bool _9700 = isnan(_9696);
                    bool _9702 = _9698 || _9700;
                    bool _9704 = isnan(9.9999999747524270787835121154785e-07);
                    bool _9706 = _9702 || _9704;
                    float _9708 = _9696;
                    if (_9706)
                    {
                        float _9710 = rsqrt(_9694);
                        _9708 = _9710;
                    }
                    float _9712 = _9708;
                    if (!_9706)
                    {
                        _406 = 0;
                    }
                    int _9714 = _406;
                    int _9716 = _9714;
                    if (!_9706)
                    {
                        _408 = 897988541;
                    }
                    int _9718 = _408;
                    int _9720 = _9718;
                    if (!_9706)
                    {
                        _410 = 0;
                    }
                    int _9722 = _410;
                    int _9724 = _9722;
                    if (_9706)
                    {
                        float _9726 = _9712 * 9.9999999747524270787835121154785e-07;
                        _9638 = _9726;
                    }
                    float _9728 = _9638;
                    if (_9706)
                    {
                        float _9730 = _7840 * _9728;
                        _9716 = as_type<int>(_9730);
                    }
                    int _9732 = _9716;
                    _418 = _9732;
                    if (_9706)
                    {
                        float _9734 = _8530 * _9728;
                        _9720 = as_type<int>(_9734);
                    }
                    int _9736 = _9720;
                    _420 = _9736;
                    if (_9706)
                    {
                        float _9738 = _7836 * _9728;
                        _9724 = as_type<int>(_9738);
                    }
                    int _9740 = _9724;
                    _422 = _9740;
                    _9650 = true;
                }
                else
                {
                    float _9742 = rsqrt(_9622);
                    float _9744 = _9742 * 9.9999999747524270787835121154785e-07;
                    float _9746 = _8178 * _9744;
                    float _9748 = _8180 * _9744;
                    float _9750 = _8182 * _9744;
                    _418 = as_type<int>(_9746);
                    _420 = as_type<int>(_9748);
                    _422 = as_type<int>(_9750);
                    _9650 = true;
                }
            }
        }
    }
    else
    {
        float _9752 = _9626 * _9610;
        bool _9754 = _9752 >= 0.001000000047497451305389404296875;
        bool _9756 = isnan(_9752);
        bool _9758 = _9754 || _9756;
        bool _9760 = isnan(0.001000000047497451305389404296875);
        bool _9762 = _9758 || _9760;
        bool _9764 = _9752 > 0.0;
        bool _9766 = !_9762;
        bool _9768 = _9764 && _9766;
        bool _9770 = _9624 < 0.001000000047497451305389404296875;
        bool _9772 = _9770 && _9768;
        if (!_9772)
        {
            _412 = as_type<int>(_9450);
        }
        int _9774 = _412;
        int _9776 = _9774;
        if (_9772)
        {
            float _9778 = _9610 * _8178;
            _9776 = as_type<int>(_9778);
        }
        int _9780 = _9776;
        _418 = _9780;
        if (!_9772)
        {
            _414 = as_type<int>(_9528);
        }
        int _9782 = _414;
        int _9784 = _9782;
        if (_9772)
        {
            float _9786 = _9610 * _8180;
            _9784 = as_type<int>(_9786);
        }
        int _9788 = _9784;
        _420 = _9788;
        if (!_9772)
        {
            _416 = as_type<int>(_9458);
        }
        int _9790 = _416;
        _422 = _9790;
        if (_9772)
        {
            float _9792 = _9610 * _8182;
            _422 = as_type<int>(_9792);
        }
    }
    _9650 = false;
    int _9794 = _418;
    int _9796 = _420;
    int _9798 = _422;
    uint _9800 = uint(int(uint(_182) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_9800)] = uint(_9794);
    uint _9802 = uint(int(uint(_9476) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_9802)] = uint(_9796);
    uint _9804 = uint(int(uint(_9586) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_9804)] = uint(_9798);
}

