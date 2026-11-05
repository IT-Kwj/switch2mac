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
    sampler cp_t_tcb_14Smplr_w [[id(25)]];
    sampler cp_t_tcb_2ASmplr_w [[id(26)]];
    sampler cp_t_tcb_2CSmplr_w [[id(27)]];
    constant dm_border_t* dm_border [[id(28)]];
};

static inline __attribute__((always_inline))
void _85(thread const int& _15367, thread const int& _15368, thread const int& _15369, thread const int& _15370, thread int& _15371, thread int& _15372, thread int& _15373, thread int& _15374, thread int& _15375, thread int& _15376)
{
    float _15379 = as_type<float>(_15369) + 0.0;
    bool _15381 = _15379 != 0.0;
    bool _15383 = isnan(_15379);
    bool _15385 = _15381 || _15383;
    bool _15387 = isnan(0.0);
    bool _15389 = _15385 || _15387;
    int _15391 = _15367;
    int _15393 = _15368;
    int _15395 = _15369;
    int _15397 = _15389 ? (-1) : 0;
    if (!_15389)
    {
        float _15399 = as_type<float>(_15369) * 1.0;
        _15391 = as_type<int>(_15399);
    }
    int _15401 = _15391;
    bool _15403 = !_15389;
    int _15405 = _15401;
    int _15407 = _15401;
    if (!_15403)
    {
        float _15409 = as_type<float>(_15369) + 0.0;
        bool _15411 = _15409 >= 0.0;
        bool _15413 = isnan(_15409);
        bool _15415 = _15411 || _15413;
        bool _15417 = isnan(0.0);
        bool _15419 = _15415 || _15417;
        _15397 = _15419 ? (-1) : 0;
        if (!_15419)
        {
            _15405 = 2147483647;
        }
        int _15421 = _15405;
        bool _15423 = !_15419;
        int _15425 = _15421;
        _15407 = _15421;
        if (!_15423)
        {
            float _15427 = as_type<float>(_15369) + 0.0;
            bool _15429 = _15427 > as_type<float>(0x7f800000u /* inf */);
            bool _15431 = isnan(_15427);
            bool _15433 = _15429 || _15431;
            bool _15435 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _15437 = _15433 || _15435;
            _15397 = _15437 ? (-1) : 0;
            if (_15437)
            {
                float _15439 = as_type<float>(_15369) + 1.0;
                _15425 = as_type<int>(_15439);
            }
            int _15441 = _15425;
            int _15443 = _15441;
            _15407 = _15441;
            if (!_15437)
            {
                float _15445 = 0.0 + as_type<float>(_15369);
                bool _15447 = _15445 != as_type<float>(0x7f800000u /* inf */);
                bool _15449 = isnan(_15445);
                bool _15451 = _15447 || _15449;
                bool _15453 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _15455 = _15451 || _15453;
                _15397 = _15455 ? (-1) : 0;
                if (!_15455)
                {
                    _15443 = _15369;
                }
                int _15457 = _15443;
                bool _15459 = !_15455;
                _15407 = _15457;
                if (!_15459)
                {
                    float _15461 = as_type<float>(_15369) * 18446744073709551616.0;
                    float _15463 = rsqrt(_15461);
                    float _15465 = _15461 * _15463;
                    float _15467 = _15463 * 0.5;
                    float _15469 = -_15465;
                    float _15471 = 0.0 + _15469;
                    float _15473 = fma(_15467, _15471, 0.5);
                    float _15475 = fma(_15465, _15473, _15465);
                    float _15477 = -_15475;
                    float _15479 = 0.0 + _15477;
                    float _15481 = fma(_15475, _15479, _15461);
                    float _15483 = fma(_15467, _15481, _15475);
                    float _15485 = _15483 * 2.3283064365386962890625e-10;
                    _15407 = as_type<int>(_15485);
                    _15393 = as_type<int>(_15475);
                    _15395 = as_type<int>(_15471);
                }
            }
        }
    }
    int _15487 = _15407;
    int _15489 = _15393;
    int _15491 = _15395;
    int _15493 = _15397;
    _15371 = _15370;
    _15372 = 0;
    _15373 = _15487;
    _15374 = _15489;
    _15375 = _15491;
    _15376 = _15493;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _5968 = false;
    bool _5496 = false;
    bool _4596 = false;
    bool _4340 = false;
    bool _3546 = false;
    bool _2902 = false;
    bool _2946 = false;
    bool _2732 = false;
    bool _552 = false;
    float _89 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _91 = as_type<float>(gl_LocalInvocationID.x);
    float _93 = as_type<float>(gl_WorkGroupID.x);
    int _95 = as_type<int>(_93) << 5;
    int _97 = _95 + as_type<int>(_91);
    float _99 = trunc(_89);
    int _101 = int(_99);
    bool _105 = _97 >= _101;
    int _107 = _101;
    if (_105)
    {
        _107 = 0;
    }
    int _109 = _107;
    int _111 = _109;
    int _113 = _109;
    if (!_105)
    {
        int _115 = _97 << 4;
        int _117 = _115 + 12;
        uint _120 = uint(int(uint(_117) >> uint(2)));
        float _122 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_120)]);
        float _124 = trunc(_122);
        int _126 = int(_124);
        bool _128 = _126 >= 1;
        int _130 = _128 ? (-1) : 0;
        if (!_128)
        {
            _111 = 0;
        }
        int _132 = _111;
        bool _134 = !_128;
        _113 = _132;
        if (!_134)
        {
            float _136 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _138 = uint(int(uint(_117) >> uint(2)));
            float _140 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_138)]);
            float _142 = float(_126);
            float _144 = -_140;
            float _146 = _136 + _144;
            bool _148 = _146 > _142;
            int _150 = as_type<int>(_136);
            if (!_148)
            {
                bool _152 = _136 >= _140;
                bool _154 = isnan(_136);
                bool _156 = _152 || _154;
                bool _158 = isnan(_140);
                bool _160 = _156 || _158;
                _130 = _160 ? (-1) : 0;
            }
            int _162 = _130;
            if (_148)
            {
                _150 = 0;
            }
            int _164 = _150;
            _113 = _164;
            if (!_148)
            {
                int _166 = ~_162;
                int _168 = (_166 != 0) ? 0 : 1;
                _113 = _168;
            }
        }
    }
    int _170 = _113;
    int _172 = _170 & 1;
    bool _174 = _172 != 0;
    if (!_174)
    {
        return;
    }
    float _176 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[86]);
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[68]);
    int _180 = _97 << 4;
    float _182 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[85]);
    int _184 = _180 + 12;
    float _186 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    uint _188 = uint(int(uint(_184) >> uint(2)));
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_188)]);
    float _192 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _194 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[84]);
    uint _196 = uint(int(uint(_180) >> uint(2)));
    float _198 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_196)]);
    float _200 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    float _202 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
    float _204 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
    float _208 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
    uint _210 = uint(int(uint(_180) >> uint(2)));
    float _212 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_210)]);
    int _214 = _180 + 4;
    uint _216 = uint(int(uint(_214) >> uint(2)));
    float _218 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_216)]);
    int _220 = _180 + 8;
    uint _222 = uint(int(uint(_220) >> uint(2)));
    float _224 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_222)]);
    uint _226 = uint(int(uint(_184) >> uint(2)));
    float _228 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_226)]);
    uint _230 = uint(int(uint(_180) >> uint(2)));
    float _232 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_230)]);
    int _234 = _180 + 4;
    uint _236 = uint(int(uint(_234) >> uint(2)));
    float _238 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_236)]);
    int _240 = _180 + 8;
    uint _242 = uint(int(uint(_240) >> uint(2)));
    float _244 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_242)]);
    int _246 = _180 + 12;
    uint _248 = uint(int(uint(_246) >> uint(2)));
    float _250 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_248)]);
    float _252 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[128]);
    float _254 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[129]);
    float _256 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[130]);
    float _258 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[131]);
    uint _260 = uint(int(uint(_180) >> uint(2)));
    float _262 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_260)]);
    int _264 = _180 + 4;
    uint _266 = uint(int(uint(_264) >> uint(2)));
    float _268 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_266)]);
    int _270 = _180 + 8;
    uint _272 = uint(int(uint(_270) >> uint(2)));
    float _274 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_272)]);
    int _276 = _180 + 12;
    uint _278 = uint(int(uint(_276) >> uint(2)));
    float _280 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_278)]);
    uint _282 = uint(int(uint(_184) >> uint(2)));
    float _284 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_282)]);
    bool _286 = _176 > 0.0;
    float _288 = abs(_178);
    float _290 = log2(_288);
    bool _292 = _182 > 0.0;
    float _294 = 0.0;
    float _296 = _194;
    float _298 = _202;
    float _300 = _192;
    float _302 = _200;
    float _304 = _212;
    float _306 = _218;
    float _308 = _224;
    float _310 = _252;
    float _312 = _254;
    float _314 = _256;
    float _316 = _258;
    float _318 = _250;
    if (_286)
    {
        float _320 = 1.0 / _176;
        _294 = _320;
    }
    float _322 = _294;
    float _324 = -_190;
    float _326 = _186 + _324;
    float _328 = _192 * _290;
    float _330 = _194 * _182;
    float _332 = exp2(_328);
    float _334 = _322;
    float _336 = _328;
    if (_286)
    {
        float _338 = _326 * _322;
        _334 = _338;
    }
    float _340 = _334;
    if (_292)
    {
        float _342 = -_330;
        float _344 = fma(_198, _342, _194);
        _296 = _344;
    }
    float _346 = _296;
    int _348 = as_type<int>(_200) & 512;
    bool _350 = _348 != 0;
    float _352 = _192 * _202;
    float _354 = _346;
    bool _356 = _350;
    if (_286)
    {
        float _358 = precise::min(_340, 1.0);
        _298 = _358;
    }
    float _360 = _298;
    if (_286)
    {
        float _362 = _360 * _346;
        _354 = _362;
    }
    float _364 = _354;
    float _366 = _204 * _352;
    float _368 = _206 * _352;
    float _370 = _208 * _352;
    float _372 = _192 * _364;
    float _374 = _228 * _192;
    float _376 = fma(_212, _332, _366);
    float _378 = fma(_218, _332, _368);
    float _380 = fma(_224, _332, _370);
    float _382 = fma(_212, _374, _232);
    float _384 = fma(_218, _374, _238);
    float _386 = fma(_224, _374, _244);
    float _388 = _252 * _372;
    float _390 = _254 * _372;
    float _392 = _256 * _372;
    bool _394 = !_350;
    float _396 = _374;
    float _398 = _364;
    float _400 = _366;
    float _402 = _370;
    float _404 = _372;
    float _406 = _280;
    int _408 = as_type<int>(_262);
    int _410 = as_type<int>(_268);
    int _412 = as_type<int>(_274);
    int _414 = as_type<int>(_262);
    int _416 = as_type<int>(_268);
    int _418 = as_type<int>(_274);
    int _420 = as_type<int>(_262);
    int _422 = as_type<int>(_268);
    int _424 = as_type<int>(_274);
    float _546;
    float _548;
    float _550;
    if (!_394)
    {
        float _426 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _428 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _430 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _432 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _434 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _436 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _438 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _440 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _442 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _444 = _430 * _432;
        float _446 = _430 * _434;
        float _448 = _428 * _432;
        float _450 = -_444;
        float _452 = fma(_426, _436, _450);
        float _454 = -_446;
        float _456 = fma(_428, _436, _454);
        float _458 = -_448;
        float _460 = fma(_426, _434, _458);
        float _462 = _440 * _426;
        float _464 = _440 * _452;
        float _466 = _442 * _428;
        float _468 = _438 * _434;
        float _470 = -_462;
        float _472 = fma(_438, _428, _470);
        float _474 = -_464;
        float _476 = fma(_438, _456, _474);
        float _478 = _440 * _436;
        float _480 = _442 * _432;
        float _482 = -_468;
        float _484 = fma(_440, _432, _482);
        float _486 = fma(_442, _460, _476);
        float _488 = -_478;
        float _490 = fma(_442, _434, _488);
        float _492 = -_480;
        float _494 = fma(_438, _436, _492);
        float _496 = _438 * _430;
        float _498 = 1.0 / _486;
        float _500 = -_426;
        float _502 = fma(_500, _436, _444);
        float _504 = -_466;
        float _506 = fma(_440, _430, _504);
        float _508 = -_496;
        float _510 = fma(_442, _426, _508);
        float _512 = _490 * _498;
        float _514 = _494 * _498;
        float _516 = _484 * _498;
        float _518 = _388 * _498;
        float _520 = _390 * _512;
        float _522 = _390 * _514;
        float _524 = _390 * _516;
        float _526 = _502 * _498;
        float _528 = _506 * _498;
        float _530 = fma(_456, _518, _520);
        float _532 = _510 * _498;
        float _534 = _472 * _498;
        float _536 = fma(_388, _526, _522);
        float _538 = fma(_460, _518, _524);
        float _540 = fma(_392, _528, _530);
        float _542 = fma(_392, _532, _536);
        float _544 = fma(_392, _534, _538);
        _300 = _438;
        _400 = _440;
        _302 = _442;
        _402 = _532;
        _304 = _426;
        _306 = _512;
        _308 = _430;
        _404 = _522;
        _310 = _538;
        _312 = _518;
        _314 = _536;
        _316 = _444;
        _546 = _542;
        _548 = _540;
        _550 = _544;
        _318 = _486;
        _406 = _460;
        _552 = true;
    }
    else
    {
        int _554 = as_type<int>(_200) & 1024;
        bool _556 = _554 != 0;
        if (_556)
        {
            _356 = true;
        }
        bool _558 = _356;
        bool _560 = _558;
        if (!_556)
        {
            int _562 = as_type<int>(_200) & 2048;
            bool _564 = _562 != 0;
            _560 = _564;
        }
        bool _566 = _560;
        if (!_566)
        {
            _336 = _388;
        }
        float _568 = _336;
        _548 = _568;
        if (!_566)
        {
            _396 = _390;
        }
        float _570 = _396;
        _546 = _570;
        if (!_566)
        {
            _398 = _392;
        }
        float _572 = _398;
        bool _574 = !_566;
        _550 = _572;
        if (!_574)
        {
            uint _576 = uint(int(uint(_180) >> uint(2)));
            float _578 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_576)]);
            int _580 = _180 + 4;
            uint _582 = uint(int(uint(_580) >> uint(2)));
            float _584 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_582)]);
            int _586 = _180 + 8;
            uint _588 = uint(int(uint(_586) >> uint(2)));
            float _590 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_588)]);
            uint _592 = uint(int(uint(_180) >> uint(2)));
            float _594 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_592)]);
            int _596 = _180 + 4;
            uint _598 = uint(int(uint(_596) >> uint(2)));
            float _600 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_598)]);
            int _602 = _180 + 8;
            uint _604 = uint(int(uint(_602) >> uint(2)));
            float _606 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_604)]);
            uint _608 = uint(int(uint(_180) >> uint(2)));
            float _610 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_608)]);
            int _612 = _180 + 4;
            uint _614 = uint(int(uint(_612) >> uint(2)));
            float _616 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_614)]);
            int _618 = _180 + 8;
            uint _620 = uint(int(uint(_618) >> uint(2)));
            float _622 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_620)]);
            float _624 = _590 * _594;
            float _626 = _590 * _600;
            float _628 = _584 * _594;
            float _630 = -_624;
            float _632 = fma(_578, _606, _630);
            float _634 = -_626;
            float _636 = fma(_584, _606, _634);
            float _638 = -_628;
            float _640 = fma(_578, _600, _638);
            float _642 = _616 * _578;
            float _644 = _616 * _632;
            float _646 = _622 * _584;
            float _648 = _610 * _600;
            float _650 = -_642;
            float _652 = fma(_610, _584, _650);
            float _654 = -_644;
            float _656 = fma(_610, _636, _654);
            float _658 = _616 * _606;
            float _660 = _622 * _594;
            float _662 = -_648;
            float _664 = fma(_616, _594, _662);
            float _666 = fma(_622, _640, _656);
            float _668 = -_658;
            float _670 = fma(_622, _600, _668);
            float _672 = -_660;
            float _674 = fma(_610, _606, _672);
            float _676 = _610 * _590;
            float _678 = 1.0 / _666;
            float _680 = -_578;
            float _682 = fma(_680, _606, _624);
            float _684 = -_646;
            float _686 = fma(_616, _590, _684);
            float _688 = -_676;
            float _690 = fma(_622, _578, _688);
            float _692 = _670 * _678;
            float _694 = _674 * _678;
            float _696 = _664 * _678;
            float _698 = _388 * _678;
            float _700 = _390 * _692;
            float _702 = _390 * _694;
            float _704 = _390 * _696;
            float _706 = _682 * _678;
            float _708 = _686 * _678;
            float _710 = fma(_636, _698, _700);
            float _712 = _690 * _678;
            float _714 = _652 * _678;
            float _716 = fma(_388, _706, _702);
            float _718 = fma(_640, _698, _704);
            float _720 = fma(_392, _708, _710);
            float _722 = fma(_392, _712, _716);
            float _724 = fma(_392, _714, _718);
            _300 = _610;
            _400 = _616;
            _302 = _622;
            _402 = _712;
            _304 = _578;
            _306 = _692;
            _308 = _590;
            _404 = _702;
            _310 = _718;
            _312 = _698;
            _314 = _716;
            _316 = _624;
            _546 = _722;
            _548 = _720;
            _550 = _724;
            _318 = _666;
            _406 = _640;
        }
    }
    _552 = false;
    float _726 = _300;
    float _728 = _400;
    float _730 = _302;
    float _732 = _402;
    float _734 = _304;
    float _736 = _306;
    float _738 = _308;
    float _740 = _404;
    float _742 = _310;
    float _744 = _312;
    float _746 = _314;
    float _748 = _316;
    float _750 = _546;
    float _752 = _548;
    float _754 = _550;
    float _756 = _318;
    float _758 = _406;
    uint _760 = uint(int(uint(_184) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_760)] = as_type<uint>(_284);
    float _762 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    int _764 = as_type<int>(_762) & 512;
    bool _766 = _764 != 0;
    int _768 = as_type<int>(_762) & 1024;
    bool _770 = _768 != 0;
    float _772 = _726;
    float _774 = _728;
    float _776 = _730;
    float _778 = _732;
    float _780 = _756;
    float _782 = _754;
    float _784 = _758;
    float _786 = _752;
    if (_766)
    {
        float _788 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _790 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _792 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _794 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _772 = _788;
        _774 = _790;
        _776 = _792;
        _778 = _794;
    }
    float _796 = _772;
    float _798 = _774;
    float _800 = _776;
    float _802 = _778;
    float _804 = _734;
    float _806 = _736;
    float _808 = _738;
    float _810 = _740;
    if (_766)
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
    float _828 = _742;
    float _830 = _744;
    float _832 = _746;
    float _834 = _748;
    if (_766)
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
    float _852 = _384 + _750;
    float _854 = _382 + _752;
    float _856 = _386 + _754;
    if (!_766)
    {
        _780 = 0.0;
    }
    float _858 = _780;
    float _860 = _858;
    if (!_766)
    {
        _782 = 0.0;
    }
    float _862 = _782;
    float _864 = _862;
    if (!_766)
    {
        _784 = 0.0;
    }
    float _866 = _784;
    int _868 = as_type<int>(_762) & 2048;
    bool _870 = _868 != 0;
    float _872 = _796;
    float _874 = _866;
    if (_766)
    {
        float _876 = _852 * _798;
        _786 = _876;
    }
    float _878 = _786;
    float _880 = _822;
    float _882 = _846;
    float _884 = _844;
    float _886 = _824;
    if (_766)
    {
        float _888 = _852 * _822;
        _880 = _888;
    }
    float _890 = _880;
    float _892 = _890;
    if (_766)
    {
        float _894 = fma(_854, _796, _878);
        _872 = _894;
    }
    float _896 = _872;
    float _898 = _896;
    if (_766)
    {
        float _900 = _852 * _846;
        _882 = _900;
    }
    float _902 = _882;
    if (_766)
    {
        float _904 = fma(_854, _820, _890);
        _892 = _904;
    }
    float _906 = _892;
    if (_766)
    {
        float _908 = fma(_856, _800, _896);
        _898 = _908;
    }
    float _910 = _898;
    if (_766)
    {
        float _912 = fma(_854, _844, _902);
        _884 = _912;
    }
    float _914 = _884;
    float _916 = _914;
    if (_766)
    {
        float _918 = fma(_856, _824, _906);
        _886 = _918;
    }
    float _920 = _886;
    if (_766)
    {
        float _922 = _802 + _910;
        _860 = _922;
    }
    float _924 = _860;
    float _926 = _924;
    if (_766)
    {
        float _928 = fma(_856, _848, _914);
        _916 = _928;
    }
    float _930 = _916;
    if (_766)
    {
        float _932 = _826 + _920;
        _864 = _932;
    }
    float _934 = _864;
    float _936 = _934;
    if (_766)
    {
        float _938 = _850 + _930;
        _874 = _938;
    }
    float _940 = _874;
    bool _942 = !_770;
    float _944 = _940;
    if (!_942)
    {
        float _946 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _948 = uint(int(uint(_180) >> uint(2)));
        float _950 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_948)]);
        int _952 = _180 + 4;
        uint _954 = uint(int(uint(_952) >> uint(2)));
        float _956 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_954)]);
        int _958 = _180 + 8;
        uint _960 = uint(int(uint(_958) >> uint(2)));
        float _962 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_960)]);
        uint _964 = uint(int(uint(_180) >> uint(2)));
        float _966 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_964)]);
        int _968 = _180 + 4;
        uint _970 = uint(int(uint(_968) >> uint(2)));
        float _972 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_970)]);
        int _974 = _180 + 8;
        uint _976 = uint(int(uint(_974) >> uint(2)));
        float _978 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_976)]);
        uint _980 = uint(int(uint(_180) >> uint(2)));
        float _982 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_980)]);
        int _984 = _180 + 4;
        uint _986 = uint(int(uint(_984) >> uint(2)));
        float _988 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_986)]);
        int _990 = _180 + 8;
        uint _992 = uint(int(uint(_990) >> uint(2)));
        float _994 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_992)]);
        float _996 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _998 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1000 = _852 * _956;
        float _1002 = _852 * _972;
        float _1004 = _852 * _988;
        float _1006 = fma(_854, _950, _1000);
        float _1008 = fma(_854, _966, _1002);
        float _1010 = fma(_854, _982, _1004);
        float _1012 = fma(_856, _962, _1006);
        float _1014 = fma(_856, _978, _1008);
        float _1016 = fma(_856, _994, _1010);
        float _1018 = _946 + _1012;
        float _1020 = _996 + _1014;
        float _1022 = _998 + _1016;
        _936 = _1020;
        _926 = _1018;
        _944 = _1022;
    }
    float _1024 = _936;
    float _1026 = _926;
    float _1028 = _944;
    bool _1030 = !_870;
    float _1032 = _1024;
    float _1034 = _1026;
    float _1036 = _1028;
    if (!_1030)
    {
        uint _1038 = uint(int(uint(_180) >> uint(2)));
        float _1040 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1038)]);
        int _1042 = _180 + 4;
        uint _1044 = uint(int(uint(_1042) >> uint(2)));
        float _1046 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1044)]);
        int _1048 = _180 + 8;
        uint _1050 = uint(int(uint(_1048) >> uint(2)));
        float _1052 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1050)]);
        int _1054 = _180 + 12;
        uint _1056 = uint(int(uint(_1054) >> uint(2)));
        float _1058 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1056)]);
        uint _1060 = uint(int(uint(_180) >> uint(2)));
        float _1062 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1060)]);
        int _1064 = _180 + 4;
        uint _1066 = uint(int(uint(_1064) >> uint(2)));
        float _1068 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1066)]);
        int _1070 = _180 + 8;
        uint _1072 = uint(int(uint(_1070) >> uint(2)));
        float _1074 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1072)]);
        int _1076 = _180 + 12;
        uint _1078 = uint(int(uint(_1076) >> uint(2)));
        float _1080 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1078)]);
        uint _1082 = uint(int(uint(_180) >> uint(2)));
        float _1084 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1082)]);
        int _1086 = _180 + 4;
        uint _1088 = uint(int(uint(_1086) >> uint(2)));
        float _1090 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1088)]);
        int _1092 = _180 + 8;
        uint _1094 = uint(int(uint(_1092) >> uint(2)));
        float _1096 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1094)]);
        int _1098 = _180 + 12;
        uint _1100 = uint(int(uint(_1098) >> uint(2)));
        float _1102 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1100)]);
        float _1104 = _852 * _1046;
        float _1106 = _852 * _1068;
        float _1108 = fma(_854, _1040, _1104);
        float _1110 = _852 * _1090;
        float _1112 = fma(_854, _1062, _1106);
        float _1114 = fma(_854, _1084, _1110);
        float _1116 = fma(_856, _1052, _1108);
        float _1118 = fma(_856, _1074, _1112);
        float _1120 = fma(_856, _1096, _1114);
        float _1122 = _1116 + _1058;
        float _1124 = _1118 + _1080;
        float _1126 = _1120 + _1102;
        _1032 = _1124;
        _1034 = _1122;
        _1036 = _1126;
    }
    float _1128 = _1032;
    float _1130 = _1034;
    float _1132 = _1036;
    float _1134 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[8]);
    float _1136 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[9]);
    float _1138 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[10]);
    float _1140 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[11]);
    float _1142 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1144 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1146 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[70]);
    float _1148 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1150 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1152 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1154 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1156 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1158 = _1136 * _1128;
    float _1160 = fma(_1134, _1130, _1158);
    float _1162 = fma(_1138, _1132, _1160);
    float _1164 = _1140 + _1162;
    float _1166 = -_1164;
    bool _1168 = _1142 >= _1166;
    bool _1170 = isnan(_1142);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan(_1166);
    bool _1176 = _1172 || _1174;
    float _1178 = -_1164;
    bool _1180 = _1144 >= _1178;
    bool _1182 = isnan(_1144);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan(_1178);
    bool _1188 = _1184 || _1186;
    int _1190 = _1176 ? 0 : 1;
    int _1192 = 2;
    if (_1176)
    {
        _1192 = 1;
    }
    int _1194 = _1192;
    int _1196 = _1194;
    if (_1188)
    {
        _1196 = _1190;
    }
    int _1198 = _1196;
    int _1200 = _1198 << 6;
    int _1202 = _1200 + 96;
    uint _1204 = uint(int(uint(_1202) >> uint(2)));
    float _1206 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1204)]);
    int _1208 = _1202 + 4;
    uint _1210 = uint(int(uint(_1208) >> uint(2)));
    float _1212 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1210)]);
    int _1214 = _1202 + 8;
    uint _1216 = uint(int(uint(_1214) >> uint(2)));
    float _1218 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1216)]);
    int _1220 = _1202 + 12;
    uint _1222 = uint(int(uint(_1220) >> uint(2)));
    float _1224 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1222)]);
    int _1226 = _1200 + 48;
    int _1228 = _1200 + 64;
    uint _1230 = uint(int(uint(_1226) >> uint(2)));
    float _1232 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1230)]);
    int _1234 = _1226 + 4;
    uint _1236 = uint(int(uint(_1234) >> uint(2)));
    float _1238 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1236)]);
    int _1240 = _1226 + 8;
    uint _1242 = uint(int(uint(_1240) >> uint(2)));
    float _1244 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1242)]);
    int _1246 = _1226 + 12;
    uint _1248 = uint(int(uint(_1246) >> uint(2)));
    float _1250 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1248)]);
    uint _1252 = uint(int(uint(_1228) >> uint(2)));
    float _1254 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1252)]);
    int _1256 = _1228 + 4;
    uint _1258 = uint(int(uint(_1256) >> uint(2)));
    float _1260 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1258)]);
    int _1262 = _1228 + 8;
    uint _1264 = uint(int(uint(_1262) >> uint(2)));
    float _1266 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1264)]);
    int _1268 = _1228 + 12;
    uint _1270 = uint(int(uint(_1268) >> uint(2)));
    float _1272 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1270)]);
    int _1274 = _1200 + 80;
    float _1276 = _1146 + 1.0;
    float _1278 = _1276 + _1128;
    uint _1280 = uint(int(uint(_1274) >> uint(2)));
    float _1282 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1280)]);
    int _1284 = _1274 + 4;
    uint _1286 = uint(int(uint(_1284) >> uint(2)));
    float _1288 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1286)]);
    int _1290 = _1274 + 8;
    uint _1292 = uint(int(uint(_1290) >> uint(2)));
    float _1294 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1292)]);
    int _1296 = _1274 + 12;
    uint _1298 = uint(int(uint(_1296) >> uint(2)));
    float _1300 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1298)]);
    float _1302 = _1278 * _1150;
    float _1304 = fma(_1148, _1130, _1302);
    float _1306 = fma(_1152, _1132, _1304);
    float _1308 = _1154 + _1306;
    float _1310 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _1312 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _1314 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _1316 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _1318 = trunc(_1308);
    int _1320 = int(_1318);
    int _1322 = ~as_type<int>(_1156);
    int _1324 = _1320 + _1322;
    int _1326 = _1324 + 1;
    float _1328 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    bool _1330 = _1326 >= 0;
    int _1332 = as_type<int>(_388);
    float _1334 = as_type<float>(_1198);
    if (_1330)
    {
        float _1336 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1332 = as_type<int>(_1336);
    }
    int _1338 = _1332;
    float _1340 = _1278 * _1212;
    float _1342 = fma(_1206, _1130, _1340);
    float _1344 = fma(_1218, _1132, _1342);
    float _1346 = _1224 + _1344;
    float _1348 = _1278 * _1238;
    float _1350 = 1.0 / _1346;
    float _1352 = fma(_1232, _1130, _1348);
    float _1354 = _1278 * _1260;
    float _1356 = fma(_1244, _1132, _1352);
    float _1358 = fma(_1254, _1130, _1354);
    float _1360 = _1250 + _1356;
    float _1362 = fma(_1266, _1132, _1358);
    float _1364 = _1360 * _1350;
    float _1366 = _1272 + _1362;
    bool _1368 = _1364 >= 0.0;
    float _1370 = _1366 * _1350;
    bool _1372 = _1364 <= 1.0;
    bool _1374 = _1372 && _1368;
    bool _1376 = _1370 >= 0.0;
    bool _1378 = _1376 && _1374;
    bool _1380 = _1370 <= 1.0;
    bool _1382 = _1380 && _1378;
    float _1384 = _1278 * _1288;
    float _1386 = fma(_1282, _1130, _1384);
    float _1388 = _1370;
    int _1390 = _1382 ? (-1) : 0;
    if (_1382)
    {
        float _1392 = float(_1198);
        _1334 = _1392;
    }
    float _1394 = _1334;
    float _1396 = _1254;
    float _1398 = _1394;
    if (_1382)
    {
        float _1400 = rint(_1394);
        float _1402 = precise::max(_1400, 0.0);
        uint _1404 = uint(_1402);
        uint _1406 = clamp(_1404, 0u, 65535u);
        _1396 = as_type<float>(_1406);
    }
    float _1408 = _1396;
    float _1410 = fma(_1294, _1132, _1386);
    float _1412 = _1300 + _1410;
    float _1414 = _1412 * _1350;
    float _1416 = _1408;
    if (_1382)
    {
        float3 _8206 = float3(_1364, _1370, float(as_type<int>(_1408)));
        float3 _8210 = select(_8206, float3(0.0), isnan(_8206));
        float _1418 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _8210.xy, uint(rint(_8210.z)), _1414, level(0.0));
        _1416 = _1418;
    }
    float _1420 = _1416;
    float _1422 = _1278 * _1312;
    float _1424 = fma(_1310, _1130, _1422);
    float _1426 = fma(_1314, _1132, _1424);
    float _1428 = _1316 + _1426;
    float _1430 = trunc(_1428);
    int _1432 = int(_1430);
    bool _1434 = _1338 <= _1326;
    bool _1436 = !_1330;
    bool _1438 = _1434 || _1436;
    int _1440 = ~as_type<int>(_1328);
    int _1442 = _1432 + _1440;
    int _1444 = _1442 + 1;
    bool _1446 = _1444 < 0;
    bool _1448 = _1446 || _1438;
    float _1450 = _1424;
    if (!_1448)
    {
        float _1452 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1450 = _1452;
    }
    float _1454 = _1450;
    bool _1456 = as_type<int>(_1454) <= _1444;
    bool _1458 = _1456 || _1448;
    float _1460 = _1454;
    if (_1458)
    {
        _1388 = 1.0;
    }
    float _1462 = _1388;
    float _1464 = _1462;
    if (!_1458)
    {
        float _1466 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1468 = _1444 * as_type<int>(_1466);
        int _1470 = _1468 + _1326;
        int _1472 = _1470 << 2;
        uint _1474 = uint(int(uint(_1470) >> uint(2)));
        int _1476 = 12 & _1472;
        int _1478 = int(_1474) << 4;
        int _1480 = _1478 + _1476;
        int _1482 = _1480 + 400;
        uint _1484 = uint(int(uint(_1482) >> uint(2)));
        float _1486 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1484)]);
        float _1488 = floor(_1308);
        float _1490 = floor(_1428);
        float _1492 = -_1488;
        float _1494 = _1308 + _1492;
        float _1496 = -_1490;
        float _1498 = _1428 + _1496;
        float _1500 = rint(_1486);
        float _1502 = precise::max(_1500, 0.0);
        uint _1504 = uint(_1502);
        uint _1506 = clamp(_1504, 0u, 65535u);
        float3 _8343 = float3(_1494, _1498, float(int(_1506)));
        float3 _8345 = select(_8343, float3(0.0), isnan(_8343));
        float _1508 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _8345.xy, uint(rint(_8345.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _8345.xy, uint(rint(_8345.z)), level(0.0)).x;
        int _1510 = _1470 << 4;
        int _1512 = _1510 + 2048;
        uint _1514 = uint(int(uint(_1512) >> uint(2)));
        float _1516 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1514)]);
        int _1518 = _1512 + 4;
        uint _1520 = uint(int(uint(_1518) >> uint(2)));
        float _1522 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1520)]);
        int _1524 = _1512 + 8;
        uint _1526 = uint(int(uint(_1524) >> uint(2)));
        float _1528 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1526)]);
        int _1530 = _1512 + 12;
        uint _1532 = uint(int(uint(_1530) >> uint(2)));
        float _1534 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1532)]);
        float _1536 = _1278 * _1522;
        float _1538 = fma(_1516, _1130, _1536);
        float _1540 = fma(_1528, _1132, _1538);
        float _1542 = _1534 + _1540;
        float _1544 = precise::clamp(_1542, 0.0, 1.0);
        float _1546 = -_1544;
        float _1548 = _1546 + _1508;
        float _1550 = fma(_1548, 500.0, 1.5);
        float _1552 = exp2(_1550);
        float _1554 = 0.0 + _1552;
        float _1556 = precise::clamp(_1554, 0.0, 1.0);
        _1460 = as_type<float>(_1512);
        _1464 = _1556;
    }
    float _1558 = _1460;
    float _1560 = _1464;
    uint _1562 = uint(int(uint(_180) >> uint(2)));
    float _1564 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1562)]);
    float _1566 = _1558;
    if (!_1382)
    {
        _1566 = 1.0;
    }
    float _1568 = _1566;
    bool _1570 = _326 > 0.001000000047497451305389404296875;
    bool _1572 = isnan(_326);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan(0.001000000047497451305389404296875);
    bool _1578 = _1574 || _1576;
    float _1580 = _1568;
    if (_1382)
    {
        bool _1582 = _1420 >= _1414;
        bool _1584 = isnan(_1420);
        bool _1586 = _1582 || _1584;
        bool _1588 = isnan(_1414);
        bool _1590 = _1586 || _1588;
        float _1592 = float(_1590);
        _1580 = _1592;
    }
    float _1594 = _1580;
    float _1596 = -_1594;
    float _1598 = fma(_1596, _1560, 1.0);
    float _1600 = -_1564;
    float _1602 = _1598 + _1600;
    float _1604 = _1598;
    if (_1578)
    {
        float _1606 = fma(_1602, 0.0500000007450580596923828125, _1564);
        _1604 = _1606;
    }
    float _1608 = _1604;
    float _1610 = precise::max(0.0, _1608);
    float _1612 = precise::min(_1610, 0.999000012874603271484375);
    uint _1614 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1614)] = as_type<uint>(_1612);
    float _1616 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    uint _1618 = uint(int(uint(_180) >> uint(2)));
    float _1620 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1618)]);
    int _1622 = _180 + 4;
    uint _1624 = uint(int(uint(_1622) >> uint(2)));
    float _1626 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1624)]);
    int _1628 = _180 + 8;
    uint _1630 = uint(int(uint(_1628) >> uint(2)));
    float _1632 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1630)]);
    int _1634 = _180 + 12;
    uint _1636 = uint(int(uint(_1634) >> uint(2)));
    float _1638 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1636)]);
    float _1640 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[71]);
    int _1642 = _97 << 5;
    float _1644 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[82]);
    uint _1646 = uint(int(uint(_1642) >> uint(2)));
    float _1648 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1646)]);
    int _1650 = _1642 + 4;
    uint _1652 = uint(int(uint(_1650) >> uint(2)));
    float _1654 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1652)]);
    int _1656 = _1642 + 8;
    uint _1658 = uint(int(uint(_1656) >> uint(2)));
    float _1660 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1658)]);
    int _1662 = _1642 + 12;
    uint _1664 = uint(int(uint(_1662) >> uint(2)));
    float _1666 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1664)]);
    float _1668 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[79]);
    float _1670 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[80]);
    int _1672 = as_type<int>(_1616) & 512;
    bool _1674 = _1672 != 0;
    float _1676 = 0.0;
    float _1678 = 0.0;
    float _1680 = 0.0;
    float _1682 = 0.0;
    if (_1674)
    {
        float _1684 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1686 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1688 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1690 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1676 = _1684;
        _1678 = _1686;
        _1680 = _1688;
        _1682 = _1690;
    }
    float _1692 = _1676;
    float _1694 = _1678;
    float _1696 = _1680;
    float _1698 = _1682;
    float _1700 = _1206;
    float _1702 = _1342;
    float _1704 = _1346;
    float _1706 = _1224;
    if (_1674)
    {
        float _1708 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1710 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1712 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1714 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1700 = _1708;
        _1702 = _1710;
        _1704 = _1712;
        _1706 = _1714;
    }
    float _1716 = _1700;
    float _1718 = _1702;
    float _1720 = _1704;
    float _1722 = _1706;
    float _1724 = 0.0;
    float _1726 = 0.0;
    float _1728 = 0.0;
    float _1730 = 0.0;
    if (_1674)
    {
        float _1732 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1734 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1736 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1738 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1724 = _1732;
        _1726 = _1734;
        _1728 = _1736;
        _1730 = _1738;
    }
    float _1740 = _1724;
    float _1742 = _1726;
    float _1744 = _1728;
    float _1746 = _1730;
    float _1748 = -_1640;
    float _1750 = _1626 + _1748;
    int _1752 = as_type<int>(_1616) & 1024;
    bool _1754 = _1752 != 0;
    int _1756 = _1642 + 16;
    uint _1758 = uint(int(uint(_180) >> uint(2)));
    float _1760 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1758)]);
    int _1762 = _180 + 4;
    uint _1764 = uint(int(uint(_1762) >> uint(2)));
    float _1766 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1764)]);
    int _1768 = _180 + 8;
    uint _1770 = uint(int(uint(_1768) >> uint(2)));
    float _1772 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1770)]);
    int _1774 = _180 + 12;
    uint _1776 = uint(int(uint(_1774) >> uint(2)));
    float _1778 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_1776)]);
    float _1780 = _1638;
    float _1782 = _1648;
    float _1784 = _1654;
    float _1786 = _1660;
    if (!_1674)
    {
        _1398 = 0.0;
    }
    float _1788 = _1398;
    float _1790 = _1788;
    if (!_1674)
    {
        _1780 = 0.0;
    }
    float _1792 = _1780;
    uint _1794 = uint(int(uint(_1756) >> uint(2)));
    float _1796 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1794)]);
    int _1798 = _1756 + 4;
    uint _1800 = uint(int(uint(_1798) >> uint(2)));
    float _1802 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1800)]);
    int _1804 = _1756 + 8;
    uint _1806 = uint(int(uint(_1804) >> uint(2)));
    float _1808 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1806)]);
    int _1810 = _1756 + 12;
    uint _1812 = uint(int(uint(_1810) >> uint(2)));
    float _1814 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1812)]);
    float _1816 = precise::max(0.0, _1644);
    float _1818 = 0.0;
    float _1820 = _1792;
    float _1822 = _1816;
    float _1824 = _1816;
    if (!_1674)
    {
        _1818 = 0.0;
    }
    float _1826 = _1818;
    uint _1828 = uint(int(uint(_180) >> uint(2)));
    float _1830 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_1828)]);
    int _1832 = _180 + 4;
    uint _1834 = uint(int(uint(_1832) >> uint(2)));
    float _1836 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_1834)]);
    int _1838 = _180 + 8;
    uint _1840 = uint(int(uint(_1838) >> uint(2)));
    float _1842 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_1840)]);
    int _1844 = _180 + 12;
    uint _1846 = uint(int(uint(_1844) >> uint(2)));
    float _1848 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_1846)]);
    int _1850 = as_type<int>(_1616) & 2048;
    bool _1852 = _1850 != 0;
    float _1854 = _1648 + _1654;
    bool _1856 = _1816 != 0.0;
    bool _1858 = isnan(_1816);
    bool _1860 = _1856 || _1858;
    bool _1862 = isnan(0.0);
    bool _1864 = _1860 || _1862;
    float _1866 = _1694;
    float _1868 = _1718;
    float _1870 = _1742;
    float _1872 = _1696;
    float _1874 = _1720;
    float _1876 = _1744;
    float _1878 = _1698;
    float _1880 = _1826;
    float _1882 = _1746;
    float _1884 = _1692;
    float _1886 = _1740;
    float _1888 = _1854;
    if (_1674)
    {
        float _1890 = _1750 * _1694;
        _1866 = _1890;
    }
    float _1892 = _1866;
    float _1894 = _1892;
    if (_1674)
    {
        float _1896 = _1750 * _1718;
        _1868 = _1896;
    }
    float _1898 = _1868;
    float _1900 = _1898;
    if (_1674)
    {
        float _1902 = fma(_1620, _1692, _1892);
        _1894 = _1902;
    }
    float _1904 = _1894;
    int _1906 = as_type<int>(_1904);
    if (_1674)
    {
        float _1908 = fma(_1620, _1716, _1898);
        _1900 = _1908;
    }
    float _1910 = _1900;
    int _1912 = as_type<int>(_1910);
    if (_1674)
    {
        float _1914 = _1750 * _1742;
        _1870 = _1914;
    }
    float _1916 = _1870;
    float _1918 = _1916;
    if (_1674)
    {
        float _1920 = fma(_1632, _1696, _1904);
        _1872 = _1920;
    }
    float _1922 = _1872;
    int _1924 = as_type<int>(_1922);
    if (_1674)
    {
        float _1926 = fma(_1632, _1720, _1910);
        _1874 = _1926;
    }
    float _1928 = _1874;
    if (_1674)
    {
        float _1930 = fma(_1620, _1740, _1916);
        _1918 = _1930;
    }
    float _1932 = _1918;
    float _1934 = _1932;
    if (_1674)
    {
        float _1936 = _1698 + _1922;
        _1790 = _1936;
    }
    float _1938 = _1790;
    float _1940 = _1938;
    if (_1674)
    {
        float _1942 = _1722 + _1928;
        _1820 = _1942;
    }
    float _1944 = _1820;
    if (_1674)
    {
        float _1946 = fma(_1632, _1744, _1932);
        _1876 = _1946;
    }
    float _1948 = _1876;
    float _1950 = _1948;
    if (!_1754)
    {
        _1878 = _1938;
    }
    float _1952 = _1878;
    float _1954 = _1952;
    if (_1674)
    {
        float _1956 = _1746 + _1948;
        _1880 = _1956;
    }
    float _1958 = _1880;
    float _1960 = _1958;
    if (!_1754)
    {
        _1882 = _1944;
    }
    float _1962 = _1882;
    bool _1964 = !_1754;
    float _1966 = _1962;
    int _1968 = as_type<int>(_1778);
    float _1970 = _1796;
    float _1972 = _1802;
    float _1974 = _1808;
    float _1976 = _1814;
    if (!_1964)
    {
        float _1978 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1980 = uint(int(uint(_180) >> uint(2)));
        float _1982 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1980)]);
        int _1984 = _180 + 4;
        uint _1986 = uint(int(uint(_1984) >> uint(2)));
        float _1988 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1986)]);
        int _1990 = _180 + 8;
        uint _1992 = uint(int(uint(_1990) >> uint(2)));
        float _1994 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1992)]);
        uint _1996 = uint(int(uint(_180) >> uint(2)));
        float _1998 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1996)]);
        int _2000 = _180 + 4;
        uint _2002 = uint(int(uint(_2000) >> uint(2)));
        float _2004 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2002)]);
        int _2006 = _180 + 8;
        uint _2008 = uint(int(uint(_2006) >> uint(2)));
        float _2010 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2008)]);
        uint _2012 = uint(int(uint(_180) >> uint(2)));
        float _2014 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2012)]);
        int _2016 = _180 + 4;
        uint _2018 = uint(int(uint(_2016) >> uint(2)));
        float _2020 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2018)]);
        int _2022 = _180 + 8;
        uint _2024 = uint(int(uint(_2022) >> uint(2)));
        float _2026 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2024)]);
        float _2028 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _2030 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _2032 = _1750 * _1988;
        float _2034 = _1750 * _2004;
        float _2036 = _1750 * _2020;
        float _2038 = fma(_1620, _1982, _2032);
        float _2040 = fma(_1620, _1998, _2034);
        float _2042 = fma(_1620, _2014, _2036);
        float _2044 = fma(_1632, _1994, _2038);
        float _2046 = fma(_1632, _2010, _2040);
        float _2048 = fma(_1632, _2026, _2042);
        float _2050 = _1978 + _2044;
        float _2052 = _2028 + _2046;
        float _2054 = _2030 + _2048;
        _1884 = _1982;
        _1906 = as_type<int>(_2038);
        _1924 = as_type<int>(_2044);
        _1954 = _2050;
        _1886 = _1998;
        _1934 = _2040;
        _1950 = _2046;
        _1966 = _2052;
        _1912 = as_type<int>(_2042);
        _1968 = as_type<int>(_2028);
        _1960 = _2054;
    }
    float _2056 = _1884;
    int _2058 = _1906;
    int _2060 = _1924;
    float _2062 = _1954;
    float _2064 = _1886;
    float _2066 = _1934;
    float _2068 = _1950;
    float _2070 = _1966;
    int _2072 = _1912;
    int _2074 = _1968;
    float _2076 = _1960;
    bool _2078 = !_1852;
    float _2080 = _2064;
    float _2082 = _2062;
    float _2084 = _2076;
    float _2086 = _2070;
    float _2088 = _2066;
    int _2090 = _2072;
    int _2092 = _2058;
    int _2094 = _2060;
    float _2096 = _2056;
    float _2098 = _2068;
    int _2100 = _2074;
    if (!_2078)
    {
        uint _2102 = uint(int(uint(_180) >> uint(2)));
        float _2104 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2102)]);
        int _2106 = _180 + 4;
        uint _2108 = uint(int(uint(_2106) >> uint(2)));
        float _2110 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2108)]);
        int _2112 = _180 + 8;
        uint _2114 = uint(int(uint(_2112) >> uint(2)));
        float _2116 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2114)]);
        int _2118 = _180 + 12;
        uint _2120 = uint(int(uint(_2118) >> uint(2)));
        float _2122 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2120)]);
        uint _2124 = uint(int(uint(_180) >> uint(2)));
        float _2126 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2124)]);
        int _2128 = _180 + 4;
        uint _2130 = uint(int(uint(_2128) >> uint(2)));
        float _2132 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2130)]);
        int _2134 = _180 + 8;
        uint _2136 = uint(int(uint(_2134) >> uint(2)));
        float _2138 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2136)]);
        int _2140 = _180 + 12;
        uint _2142 = uint(int(uint(_2140) >> uint(2)));
        float _2144 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2142)]);
        uint _2146 = uint(int(uint(_180) >> uint(2)));
        float _2148 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2146)]);
        int _2150 = _180 + 4;
        uint _2152 = uint(int(uint(_2150) >> uint(2)));
        float _2154 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2152)]);
        int _2156 = _180 + 8;
        uint _2158 = uint(int(uint(_2156) >> uint(2)));
        float _2160 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2158)]);
        int _2162 = _180 + 12;
        uint _2164 = uint(int(uint(_2162) >> uint(2)));
        float _2166 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2164)]);
        float _2168 = _1750 * _2110;
        float _2170 = _1750 * _2132;
        float _2172 = _1750 * _2154;
        float _2174 = fma(_1620, _2104, _2168);
        float _2176 = fma(_1620, _2126, _2170);
        float _2178 = fma(_1620, _2148, _2172);
        float _2180 = fma(_1632, _2116, _2174);
        float _2182 = fma(_1632, _2138, _2176);
        float _2184 = fma(_1632, _2160, _2178);
        float _2186 = _2180 + _2122;
        float _2188 = _2182 + _2144;
        float _2190 = _2184 + _2166;
        _2080 = _2126;
        _2082 = _2186;
        _2084 = _2190;
        _2086 = _2188;
        _2088 = _2176;
        _2090 = as_type<int>(_2178);
        _2092 = as_type<int>(_2174);
        _2094 = as_type<int>(_2180);
        _2096 = _2104;
        _2098 = _2182;
    }
    float _2192 = _2080;
    float _2194 = _2082;
    float _2196 = _2084;
    float _2198 = _2086;
    float _2200 = _2088;
    int _2202 = _2090;
    int _2204 = _2092;
    int _2206 = _2094;
    float _2208 = _2096;
    float _2210 = _2098;
    float _2212 = _1660 + _1854;
    int _2214 = _2204;
    int _2216 = _2206;
    float _2218 = _2194;
    float _2220 = _2196;
    float _2222 = _2194;
    float _2224 = _2196;
    int _2226 = as_type<int>(_2212);
    int _2228 = _2202;
    float _2230 = _2192;
    float _2232 = _2200;
    float _2234 = _2210;
    float _2236 = _2198;
    float _2238 = _2208;
    if (!_1864)
    {
        _1390 = 0;
    }
    int _2240 = _1390;
    int _2242 = _2240;
    if (!_1864)
    {
        _2214 = as_type<int>(_1760);
    }
    int _2244 = _2214;
    float _2246 = -_1666;
    bool _2248 = _2212 != _2246;
    bool _2250 = isnan(_2212);
    bool _2252 = _2248 || _2250;
    bool _2254 = isnan(_2246);
    bool _2256 = _2252 || _2254;
    int _2258 = _2244;
    bool _2260 = _2256;
    int _2262 = _2244;
    if (!_1864)
    {
        _2216 = as_type<int>(_1766);
    }
    int _2264 = _2216;
    int _2266 = _2256 ? 0 : 1;
    int _2268 = _2264;
    int _2270 = _2266;
    int _2272 = _2266;
    int _2274 = _2264;
    if (!_1864)
    {
        _2100 = as_type<int>(_1772);
    }
    int _2276 = _2100;
    bool _2278 = !_1864;
    float _2280 = 0.0;
    int _2282 = _2276;
    if (!_2278)
    {
        uint _2284 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
        float _2286 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2284)]);
        int _2288 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 16;
        uint _2290 = uint(int(uint(_2288) >> uint(2)));
        float _2292 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2290)]);
        int _2294 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 8;
        uint _2296 = uint(int(uint(_2294) >> uint(2)));
        float _2298 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2296)]);
        int _2300 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 24;
        uint _2302 = uint(int(uint(_2300) >> uint(2)));
        float _2304 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2302)]);
        float _2306 = _1816 * 0.5;
        float _2308 = 1.0 / _1816;
        float _2310 = -_2292;
        float _2312 = fma(_2306, _2310, _2286);
        float _2314 = -_2306;
        float _2316 = _2314 + _2312;
        float _2318 = -_2304;
        float _2320 = fma(_2306, _2318, _2298);
        float _2322 = -_2316;
        float _2324 = _2322 + _2194;
        float _2326 = -_2306;
        float _2328 = _2326 + _2320;
        float _2330 = _2324 * _2308;
        float _2332 = -_2328;
        float _2334 = _2332 + _2196;
        float _2336 = floor(_2330);
        float _2338 = _2334 * _2308;
        float _2340 = floor(_2338);
        float _2342 = -_2336;
        float _2344 = fma(_1816, _2342, _2324);
        bool _2346 = _2344 != _2324;
        bool _2348 = isnan(_2344);
        bool _2350 = _2346 || _2348;
        bool _2352 = isnan(_2324);
        bool _2354 = _2350 || _2352;
        float _2356 = -_2340;
        float _2358 = fma(_1816, _2356, _2334);
        bool _2360 = _2358 == _2334;
        bool _2362 = !_2354;
        bool _2364 = _2360 && _2362;
        bool _2366 = !_2364;
        int _2368 = as_type<int>(_2324);
        _1940 = _2334;
        _2242 = _2366 ? (-1) : 0;
        _1888 = _2336;
        _2260 = _2364;
        _2226 = as_type<int>(_2328);
        _2228 = as_type<int>(_2338);
        _2230 = _2308;
        _2280 = _2316;
        if (_2364)
        {
            _2258 = as_type<int>(_1760);
        }
        int _2370 = _2258;
        int _2372 = _2370;
        if (!_2364)
        {
            float _2374 = _2316 + _2344;
            _2218 = _2374;
        }
        float _2376 = _2218;
        _2222 = _2376;
        if (_2364)
        {
            _2268 = as_type<int>(_1766);
        }
        int _2378 = _2268;
        int _2380 = _2378;
        if (!_2364)
        {
            float _2382 = _2328 + _2358;
            _2220 = _2382;
        }
        float _2384 = _2220;
        _2224 = _2384;
        if (_2364)
        {
            _2368 = as_type<int>(_1772);
        }
        int _2386 = _2368;
        _2282 = _2386;
        if (!_2364)
        {
            _2270 = 1;
        }
        int _2388 = _2270;
        _2272 = _2388;
        if (!_2364)
        {
            _2372 = 0;
        }
        int _2390 = _2372;
        _2262 = _2390;
        if (!_2364)
        {
            _2380 = 0;
        }
        int _2392 = _2380;
        _2274 = _2392;
        if (!_2364)
        {
            _2282 = 0;
        }
    }
    int _2394 = _2272;
    float _2396 = _2222;
    float _2398 = _2224;
    float _2400 = _1940;
    int _2402 = _2242;
    float _2404 = _1888;
    bool _2406 = _2260;
    int _2408 = _2226;
    int _2410 = _2228;
    int _2412 = _2262;
    float _2414 = _2230;
    int _2416 = _2274;
    float _2418 = _2280;
    int _2420 = _2282;
    int _2422 = _2394 & 1;
    bool _2424 = _2422 != 0;
    float _2426 = -_1640;
    float _2428 = _852 + _2426;
    float _2430 = _2418;
    float _2432 = _2414;
    bool _2434 = _2406;
    int _2436 = _2394;
    int _2438 = _2408;
    int _2440 = _2410;
    float _2442 = _2198;
    float _2444 = _2198;
    float _2446 = _2400;
    float _2448 = _2404;
    if (!_2424)
    {
        _2430 = _1648;
    }
    float _2450 = _2430;
    float _2452 = 0.0;
    float _2454 = _2450;
    if (!_2424)
    {
        _2452 = _1654;
    }
    float _2456 = _2452;
    float _2458 = _2456;
    if (!_2424)
    {
        _2432 = _1660;
    }
    float _2460 = _2432;
    float _2462 = _2460;
    if (!_2424)
    {
        _2232 = _1666;
    }
    float _2464 = _2232;
    float _2466 = _2464;
    if (!_2424)
    {
        _2234 = _1796;
    }
    float _2468 = _2234;
    float _2470 = _2468;
    float _2472 = _2468;
    if (!_2424)
    {
        _2434 = false;
    }
    bool _2474 = _2434;
    bool _2476 = _2474;
    if (!_2424)
    {
        _2236 = _1802;
    }
    float _2478 = _2236;
    float _2480 = _2478;
    float _2482 = _2478;
    if (!_2424)
    {
        _2238 = _1808;
    }
    float _2484 = _2238;
    float _2486 = _2484;
    float _2488 = _2484;
    if (!_2424)
    {
        _2436 = as_type<int>(_1814);
    }
    int _2490 = _2436;
    int _2492 = _2490;
    if (!_2424)
    {
        _2438 = as_type<int>(_1620);
    }
    int _2494 = _2438;
    int _2496 = _2494;
    if (!_2424)
    {
        _2440 = as_type<int>(_1750);
    }
    int _2498 = _2440;
    int _2500 = 0;
    int _2502 = _2498;
    if (!_2424)
    {
        _2500 = as_type<int>(_1632);
    }
    int _2504 = _2500;
    bool _2506 = !_2424;
    int _2508 = _2504;
    int _2510 = _2504;
    if (!_2506)
    {
        float _2512 = fma(_2396, 6.2500002968590706586837768554688e-05, 0.5);
        float _2514 = fma(_2398, 6.2500002968590706586837768554688e-05, 0.5);
        float _2516 = fma(_2396, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
        float _2518 = fma(_2398, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
        float _2520 = fma(_2398, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
        float2 _9786 = float2(_2512, _2514);
        float2 _2524 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_9786, float2(0.0), isnan(_9786)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_9786, float2(0.0), isnan(_9786)), level(0.0)).xy;
        float _2526 = _2524.x;
        float _2528 = _2524.y;
        float _2530 = fma(_2396, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
        float _2532 = fma(_2396, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
        float _2534 = fma(_2398, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
        float2 _9807 = float2(_2516, _2518);
        float _2536 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_9807, float2(0.0), isnan(_9807)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_9807, float2(0.0), isnan(_9807)), level(0.0)).x;
        float2 _9815 = float2(_2516, _2520);
        float _2538 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_9815, float2(0.0), isnan(_9815)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_9815, float2(0.0), isnan(_9815)), level(0.0)).x;
        float2 _9823 = float2(_2530, _2518);
        float _2540 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_9823, float2(0.0), isnan(_9823)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_9823, float2(0.0), isnan(_9823)), level(0.0)).x;
        float2 _9831 = float2(_2532, _2514);
        float2 _2542 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_9831, float2(0.0), isnan(_9831)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_9831, float2(0.0), isnan(_9831)), level(0.0)).xy;
        float _2544 = _2542.x;
        float _2546 = _2542.y;
        float2 _9843 = float2(_2512, _2534);
        float2 _2548 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_9843, float2(0.0), isnan(_9843)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_9843, float2(0.0), isnan(_9843)), level(0.0)).xy;
        float _2550 = _2548.x;
        float _2552 = _2548.y;
        float2 _9855 = float2(_2530, _2520);
        float _2554 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_9855, float2(0.0), isnan(_9855)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_9855, float2(0.0), isnan(_9855)), level(0.0)).x;
        float _2556 = -_2528;
        float _2558 = _2526 + _2556;
        float _2560 = _2558 * 2000.0;
        float _2562 = abs(_2560);
        bool _2564 = _2562 >= 2.0;
        bool _2566 = isnan(_2562);
        bool _2568 = _2564 || _2566;
        bool _2570 = isnan(2.0);
        bool _2572 = _2568 || _2570;
        float _2574 = _2560;
        float _2576 = _2516;
        float _2578 = _2552;
        int _2580 = as_type<int>(_2520);
        if (_2572)
        {
            int _2582 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 4;
            uint _2584 = uint(int(uint(_2582) >> uint(2)));
            float _2586 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_2584)]);
            _2574 = _2586;
        }
        float _2588 = _2574;
        float _2590 = -_2526;
        float _2592 = _2590 + _2536;
        float _2594 = -_2526;
        float _2596 = _2594 + _2538;
        float _2598 = _2592 * 2000.0;
        float _2600 = _2596 * 2000.0;
        float _2602 = -_2526;
        float _2604 = _2602 + _2544;
        float _2606 = -_2526;
        float _2608 = _2606 + _2540;
        float _2610 = abs(_2598);
        float _2612 = abs(_2600);
        float _2614 = precise::max(_2610, _2612);
        float _2616 = _2526 * 2000.0;
        float _2618 = -_2526;
        float _2620 = _2618 + _2550;
        float _2622 = _2604 * 1000.0;
        float _2624 = _2608 * 2000.0;
        float _2626 = _2588;
        int _2628 = as_type<int>(_2624);
        if (_2572)
        {
            float _2630 = _2616 + (-2.0);
            _2576 = _2630;
        }
        float _2632 = _2576;
        float _2634 = _2620 * 1000.0;
        float _2636 = -_2526;
        float _2638 = _2636 + _2554;
        float _2640 = abs(_2624);
        float _2642 = precise::max(_2614, _2640);
        float _2644 = _2638 * 2000.0;
        float _2646 = abs(_2644);
        float _2648 = precise::max(_2642, _2646);
        if (_2572)
        {
            float _2650 = _2588 + 10.0;
            _2626 = _2650;
        }
        float _2652 = _2626;
        bool _2654 = _2652 < _2632;
        bool _2656 = !_2572;
        bool _2658 = _2654 || _2656;
        float _2660 = fma(_2622, _2622, 0.0625);
        float _2662 = fma(_2634, _2634, _2660);
        float _2664 = rsqrt(_2662);
        float _2666 = _2664 * 0.25;
        float _2668 = _2622 * _2664;
        bool _2670 = _2666 < 0.891006529331207275390625;
        bool _2672 = _2670 || _2658;
        bool _2674 = _2648 >= 2.0;
        bool _2676 = isnan(_2648);
        bool _2678 = _2674 || _2676;
        bool _2680 = isnan(2.0);
        bool _2682 = _2678 || _2680;
        bool _2684 = _2682 || _2672;
        float _2686 = _2634 * _2664;
        bool _2688 = !_2684;
        float _2690 = _2668;
        float _2692 = _2666;
        float _2724;
        float _2726;
        float _2728;
        float _2730;
        if (!_2688)
        {
            float _2694 = -_2528;
            float _2696 = _2694 + _2546;
            float _2698 = -_2528;
            float _2700 = _2698 + _2552;
            float _2702 = _2528 * 2000.0;
            float _2704 = _2696 * 1000.0;
            float _2706 = _2700 * 1000.0;
            float _2708 = fma(_2704, _2704, 0.0625);
            float _2710 = fma(_2706, _2706, _2708);
            float _2712 = rsqrt(_2710);
            float _2714 = -_2706;
            float _2716 = fma(_2714, _2712, -0.0);
            float _2718 = -_2704;
            float _2720 = fma(_2718, _2712, -0.0);
            float _2722 = _2712 * 0.25;
            _2724 = _2702;
            _2726 = _2720;
            _2728 = _2716;
            _2730 = _2722;
            _2732 = true;
        }
        else
        {
            float _2734 = _2686 * _2686;
            float _2736 = 1.0 / _2666;
            float _2738 = -_2668;
            float _2740 = (-0.0) + _2738;
            float _2742 = fma(_2668, _2668, _2734);
            float _2744 = -_2686;
            float _2746 = (-0.0) + _2744;
            float _2748 = sqrt(_2742);
            bool _2750 = _2748 > 9.9999997473787516355514526367188e-05;
            float _2752 = _2748 * _2736;
            float _2754 = _2734;
            _2726 = _2740;
            _2728 = _2746;
            _2730 = _2666;
            if (_2750)
            {
                float _2756 = abs(_2668);
                float _2758 = abs(_2686);
                float _2760 = precise::max(_2756, _2758);
                _2578 = _2760;
            }
            float _2762 = _2578;
            if (!_2750)
            {
                _2754 = 0.0;
            }
            float _2764 = _2754;
            float _2766 = _2762;
            float _2768 = _2764;
            if (_2750)
            {
                float _2770 = 1.0 / _2762;
                _2766 = _2770;
            }
            float _2772 = _2766;
            if (_2750)
            {
                float _2774 = _2748 * _2772;
                _2768 = _2774;
            }
            float _2776 = _2768;
            float _2778 = _2776 * 0.9649016857147216796875;
            float _2780 = -_2778;
            float _2782 = fma(_2780, _2752, _2616);
            _2724 = _2782;
        }
        _2732 = false;
        float _2784 = _2724;
        float _2786 = _2726;
        float _2788 = _2728;
        float _2790 = _2730;
        float2 _10163 = float2(_2512, _2514);
        float _2792 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_10163, float2(0.0), isnan(_10163)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_10163, float2(0.0), isnan(_10163)), level(0.0)).y;
        float _2794 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[81]);
        bool _2796 = _2198 >= _2784;
        int _2798 = (_2796 ? (-1) : 0) | _2402;
        float _2800 = 0.0 + _2794;
        float _2802 = precise::clamp(_2800, 0.0, 1.0);
        bool _2804 = _1848 >= _2802;
        int _2806 = (_2804 ? (-1) : 0) & _2798;
        int _2808 = ~_2806;
        float _2810 = _2784;
        float _2812 = _2784;
        float _2874;
        float _2876;
        float _2878;
        float _2880;
        float _2882;
        float _2884;
        float _2886;
        float _2888;
        bool _2890;
        float _2892;
        float _2894;
        float _2896;
        float _2898;
        int _2900;
        if (!(_2808 != 0))
        {
            float _2814 = _1836 * 6.283185482025146484375;
            float _2816 = _1830 * 6.283185482025146484375;
            float _2818 = _1842 * 6.283185482025146484375;
            if (_2402 != 0)
            {
                float _2820 = fma(_1836, _1816, _2784);
                _2442 = _2820;
            }
            float _2822 = _2442;
            float _2824 = _2814 * _2814;
            float _2826 = fma(_2816, _2816, _2824);
            float _2828 = fma(_2818, _2818, _2826);
            float _2830 = sqrt(_2828);
            float _2832 = rsqrt(_2828);
            float _2834 = _2830 * 0.5;
            bool _2836 = _2830 != 0.0;
            bool _2838 = isnan(_2830);
            bool _2840 = _2836 || _2838;
            bool _2842 = isnan(0.0);
            bool _2844 = _2840 || _2842;
            float _2846 = _2834 * 0.15915493667125701904296875;
            float _2848 = _2846 * 6.283185482025146484375;
            float _2850 = sin(_2848);
            float _2852 = _2816 * _2832;
            float _2854 = _2814 * _2832;
            float _2856 = _2818 * _2832;
            float _2858 = _2844 ? _2852 : 0.0;
            float _2860 = _2846 * 6.283185482025146484375;
            float _2862 = cos(_2860);
            float _2864 = _2844 ? _2854 : 0.0;
            float _2866 = _2844 ? _2856 : 0.0;
            float _2868 = _2858 * _2850;
            float _2870 = _2864 * _2850;
            float _2872 = _2866 * _2850;
            _2874 = _2864;
            _2876 = _2866;
            _2878 = _2828;
            _2880 = _2846;
            _2882 = _2832;
            _2884 = _2830;
            _2886 = _2822;
            _2888 = _2822;
            _2890 = _2844;
            _2892 = _2870;
            _2894 = _2872;
            _2896 = _2868;
            _2898 = _2862;
            _2900 = 0;
            _2902 = true;
        }
        else
        {
            float _2904 = _2786 * _2786;
            float _2906 = fma(_2788, _2788, _2904);
            float _2908 = sqrt(_2906);
            float _2910 = precise::max(_2908, -1.0);
            float _2912 = precise::min(_2910, 1.0);
            float _2914 = abs(_2912);
            float _2916 = fma(_2914, -0.5, 0.5);
            int _2918 = as_type<int>(_2916) + (-218103808);
            bool _2920 = uint(_2918) >= 1920991232u;
            bool _2922 = !_2920;
            int _2944;
            if (!_2922)
            {
                int _2924 = 1056964608;
                int _2926 = as_type<int>(_1836);
                int _2928 = as_type<int>(_2916);
                int _2930 = 10432;
                int _2932;
                int _2934;
                int _2936;
                int _2938;
                int _2940;
                int _2942;
                _85(_2924, _2926, _2928, _2930, _2932, _2934, _2936, _2938, _2940, _2942);
                _2944 = _2936;
                _2946 = true;
            }
            else
            {
                float _2948 = rsqrt(_2916);
                float _2950 = _2916 * _2948;
                float _2952 = _2948 * 0.5;
                float _2954 = -_2950;
                float _2956 = 0.0 + _2954;
                float _2958 = fma(_2952, _2956, 0.5);
                float _2960 = fma(_2950, _2958, _2950);
                float _2962 = -_2960;
                float _2964 = 0.0 + _2962;
                float _2966 = fma(_2960, _2964, _2916);
                float _2968 = fma(_2952, _2966, _2960);
                _2944 = as_type<int>(_2968);
            }
            _2946 = false;
            int _2970 = _2944;
            float _2972 = abs(_2912);
            bool _2974 = _2972 > 0.569999992847442626953125;
            float _2976 = _2908 + 9.9999997473787516355514526367188e-06;
            float _2978 = _1842 * 6.283185482025146484375;
            float _2980 = abs(_2912);
            float _2982 = _2974 ? as_type<float>(_2970) : _2980;
            float _2984 = 1.0 / _2976;
            float _2986 = _2978 * _2790;
            float _2988 = _2982 * _2982;
            float _2990 = _2978 * _2786;
            float _2992 = fma(_2988, 0.0517513789236545562744140625, 0.01816697604954242706298828125);
            float _2994 = fma(_2988, _2992, 0.0467568598687648773193359375);
            float _2996 = fma(_2988, _2994, 0.074846573173999786376953125);
            float _2998 = _2984 * _2786;
            float _3000 = fma(_2988, _2996, 0.166670143604278564453125);
            float _3002 = _2988 * _3000;
            float _3004 = fma(_2982, _3002, _2982);
            float _3006 = _3004;
            if (_2974)
            {
                float _3008 = fma(_3004, -2.0, 1.57079637050628662109375);
                _3006 = _3008;
            }
            float _3010 = _3006;
            float _3012 = _2986 * _2986;
            bool _3014 = _2912 >= 0.0;
            bool _3016 = isnan(_2912);
            bool _3018 = _3014 || _3016;
            bool _3020 = isnan(0.0);
            bool _3022 = _3018 || _3020;
            float _3024 = _2978 * _2788;
            float _3026 = fma(_2990, _2990, _3012);
            bool _3028 = !_3022;
            float _3030 = -_3010;
            float _3032 = _3028 ? _3030 : _3010;
            float _3034 = fma(_3024, _3024, _3026);
            float _3036 = -_2788;
            float _3038 = _2984 * _3036;
            float _3040 = _3032 * _2998;
            float _3042 = -_2784;
            float _3044 = fma(_2792, 2000.0, _3042);
            float _3046 = sqrt(_3034);
            float _3048 = _3032 * _3038;
            float _3050 = _3040 * _3040;
            float _3052 = abs(_3044);
            bool _3054 = _3052 >= 2.0;
            bool _3056 = isnan(_3052);
            bool _3058 = _3054 || _3056;
            bool _3060 = isnan(2.0);
            bool _3062 = _3058 || _3060;
            float _3064 = fma(_3048, _3048, _3050);
            float _3066 = rsqrt(_3034);
            bool _3068 = _2790 <= 0.891006529331207275390625;
            bool _3070 = !_3062;
            bool _3072 = _3068 || _3070;
            float _3074 = sqrt(_3064);
            float _3076 = _3046 * 0.5;
            bool _3078 = _3046 != 0.0;
            bool _3080 = isnan(_3046);
            bool _3082 = _3078 || _3080;
            bool _3084 = isnan(0.0);
            bool _3086 = _3082 || _3084;
            float _3088 = _3076 * 0.15915493667125701904296875;
            _2886 = _3034;
            _2628 = as_type<int>(_3088);
            _2890 = _3072;
            _2900 = 1065353216;
            if (_3072)
            {
                float _3090 = _2784 + (-1000.0);
                _2810 = _3090;
            }
            float _3092 = _2810;
            float _3094 = rsqrt(_3064);
            float _3096 = _2990 * _3066;
            float _3098 = _3024 * _3066;
            float _3100 = _2986 * _3066;
            float _3102 = _3086 ? _3096 : 0.0;
            float _3104 = _3074 * 0.5;
            float _3106 = _3088 * 6.283185482025146484375;
            float _3108 = sin(_3106);
            bool _3110 = _3074 != 0.0;
            bool _3112 = isnan(_3074);
            bool _3114 = _3110 || _3112;
            bool _3116 = isnan(0.0);
            bool _3118 = _3114 || _3116;
            float _3120 = _3104 * 0.15915493667125701904296875;
            float _3122 = _3086 ? _3098 : 0.0;
            float _3124 = _3086 ? _3100 : 0.0;
            float _3126 = _3048 * _3094;
            float _3128 = _3120 * 6.283185482025146484375;
            float _3130 = sin(_3128);
            float _3132 = _3040 * _3094;
            float _3134 = _3118 ? _3126 : 0.0;
            float _3136 = _3118 ? _3132 : 0.0;
            float _3138 = _3120 * 6.283185482025146484375;
            float _3140 = cos(_3138);
            float _3142 = _3102 * _3108;
            float _3144 = _3122 * _3108;
            float _3146 = _3124 * _3108;
            float _3148 = _3088 * 6.283185482025146484375;
            float _3150 = cos(_3148);
            float _3152 = _3134 * _3130;
            float _3154 = _3136 * _3130;
            float _3156 = _3154 * _3144;
            float _3158 = _3140 * _3142;
            float _3160 = _3140 * _3144;
            float _3162 = fma(_3152, _3142, _3156);
            float _3164 = fma(_3152, _3150, _3158);
            float _3166 = _3154 * _3142;
            float _3168 = fma(_3154, _3150, _3160);
            float _3170 = fma(_3154, _3146, _3164);
            float _3172 = -_3166;
            float _3174 = fma(_3152, _3144, _3172);
            float _3176 = -_3152;
            float _3178 = fma(_3176, _3146, _3168);
            float _3180 = fma(_3140, _3146, _3174);
            float _3182 = -_3162;
            float _3184 = fma(_3140, _3150, _3182);
            _2812 = _3092;
            _2874 = _3150;
            _2876 = _3152;
            _2878 = _3166;
            _2880 = _3154;
            _2882 = _3142;
            _2884 = _3162;
            _2690 = _3094;
            _1822 = _3108;
            _2692 = _3120;
            _2580 = as_type<int>(_3066);
            _2888 = _3092;
            _2892 = _3180;
            _2894 = _3178;
            _2896 = _3170;
            _2898 = _3184;
        }
        _2902 = false;
        float _3186 = _2812;
        float _3188 = _2874;
        float _3190 = _2876;
        float _3192 = _2878;
        float _3194 = _2880;
        float _3196 = _2882;
        float _3198 = _2884;
        float _3200 = _2886;
        float _3202 = _2690;
        float _3204 = _1822;
        float _3206 = _2692;
        int _3208 = _2580;
        int _3210 = _2628;
        float _3212 = _2888;
        bool _3214 = _2890;
        float _3216 = _2892;
        float _3218 = _2894;
        float _3220 = _2896;
        float _3222 = _2898;
        int _3224 = _2900;
        bool _3226 = !_1674;
        bool _3228 = _3214;
        int _3230 = _3208;
        int _3232 = _3210;
        _1970 = _3186;
        _1972 = _3188;
        _1974 = _3190;
        _1976 = _3192;
        _1782 = _3194;
        _1784 = _3196;
        _1786 = _3198;
        _2444 = _3200;
        _2446 = _3202;
        _1824 = _3204;
        _2448 = _3206;
        _2458 = _3216;
        _2462 = _3218;
        _2454 = _3220;
        _2466 = _3222;
        _2492 = _3224;
        if (!_3226)
        {
            float _3234 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _3236 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _3238 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _3240 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _3242 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[28]);
            float _3244 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[29]);
            float _3246 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[30]);
            float _3248 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[31]);
            float _3250 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _3252 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _3254 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _3256 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _3258 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _3260 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _3262 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _3264 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _3266 = _3240 * _3244;
            float _3268 = _3240 * _3246;
            float _3270 = _3240 * _3242;
            float _3272 = _3256 * _3238;
            float _3274 = _3256 * _3236;
            float _3276 = _3256 * _3234;
            float _3278 = _3256 * _3246;
            float _3280 = _3256 * _3244;
            float _3282 = _3256 * _3242;
            float _3284 = -_3266;
            float _3286 = fma(_3236, _3248, _3284);
            float _3288 = -_3272;
            float _3290 = fma(_3254, _3240, _3288);
            float _3292 = -_3274;
            float _3294 = fma(_3252, _3240, _3292);
            float _3296 = -_3276;
            float _3298 = fma(_3250, _3240, _3296);
            float _3300 = _3238 * _3244;
            float _3302 = _3238 * _3242;
            float _3304 = _3254 * _3244;
            float _3306 = _3254 * _3242;
            float _3308 = -_3268;
            float _3310 = fma(_3238, _3248, _3308);
            float _3312 = -_3270;
            float _3314 = fma(_3234, _3248, _3312);
            float _3316 = -_3278;
            float _3318 = fma(_3254, _3248, _3316);
            float _3320 = -_3280;
            float _3322 = fma(_3252, _3248, _3320);
            float _3324 = -_3282;
            float _3326 = fma(_3250, _3248, _3324);
            float _3328 = _3236 * _3242;
            float _3330 = -_3300;
            float _3332 = fma(_3236, _3246, _3330);
            float _3334 = -_3302;
            float _3336 = fma(_3234, _3246, _3334);
            float _3338 = -_3304;
            float _3340 = fma(_3252, _3246, _3338);
            float _3342 = -_3306;
            float _3344 = fma(_3250, _3246, _3342);
            float _3346 = _3254 * _3236;
            float _3348 = _3254 * _3234;
            float _3350 = -_3328;
            float _3352 = fma(_3234, _3244, _3350);
            float _3354 = _3252 * _3234;
            float _3356 = -_3346;
            float _3358 = fma(_3252, _3238, _3356);
            float _3360 = -_3348;
            float _3362 = fma(_3250, _3238, _3360);
            float _3364 = _3254 * _3314;
            float _3366 = -_3354;
            float _3368 = fma(_3250, _3236, _3366);
            float _3370 = _3254 * _3286;
            float _3372 = _3252 * _3242;
            float _3374 = -_3364;
            float _3376 = fma(_3250, _3310, _3374);
            float _3378 = _3252 * _3314;
            float _3380 = _3252 * _3336;
            float _3382 = -_3370;
            float _3384 = fma(_3252, _3310, _3382);
            float _3386 = fma(_3256, _3336, _3376);
            float _3388 = -_3372;
            float _3390 = fma(_3250, _3244, _3388);
            float _3392 = -_3378;
            float _3394 = fma(_3250, _3286, _3392);
            float _3396 = -_3380;
            float _3398 = fma(_3250, _3332, _3396);
            float _3400 = fma(_3256, _3332, _3384);
            float _3402 = _3260 * _3386;
            float _3404 = _3262 * _3286;
            float _3406 = fma(_3256, _3352, _3394);
            float _3408 = fma(_3254, _3352, _3398);
            float _3410 = -_3402;
            float _3412 = fma(_3258, _3400, _3410);
            float _3414 = -_3404;
            float _3416 = fma(_3260, _3310, _3414);
            float _3418 = _3262 * _3314;
            float _3420 = _3260 * _3314;
            float _3422 = fma(_3262, _3406, _3412);
            float _3424 = _3262 * _3326;
            float _3426 = _3262 * _3294;
            float _3428 = -_3420;
            float _3430 = fma(_3258, _3286, _3428);
            float _3432 = -_3264;
            float _3434 = fma(_3432, _3408, _3422);
            float _3436 = -_3424;
            float _3438 = fma(_3258, _3318, _3436);
            float _3440 = -_3418;
            float _3442 = fma(_3258, _3310, _3440);
            float _3444 = _3262 * _3298;
            float _3446 = 1.0 / _3434;
            float _3448 = _3262 * _3322;
            float _3450 = _3260 * _3326;
            float _3452 = fma(_3264, _3332, _3416);
            float _3454 = fma(_3264, _3352, _3430);
            float _3456 = -_3426;
            float _3458 = fma(_3260, _3290, _3456);
            float _3460 = -_3444;
            float _3462 = fma(_3258, _3290, _3460);
            float _3464 = -_3448;
            float _3466 = fma(_3260, _3318, _3464);
            float _3468 = -_3450;
            float _3470 = fma(_3258, _3322, _3468);
            float _3472 = fma(_3264, _3336, _3442);
            float _3474 = _3260 * _3298;
            float _3476 = fma(_3264, _3340, _3466);
            float _3478 = fma(_3264, _3344, _3438);
            float _3480 = fma(_3264, _3390, _3470);
            float _3482 = -_3474;
            float _3484 = fma(_3258, _3294, _3482);
            float _3486 = fma(_3264, _3358, _3458);
            float _3488 = _3400 * _3446;
            float _3490 = _3452 * _3446;
            float _3492 = _3386 * _3446;
            float _3494 = _3454 * _3446;
            float _3496 = _3472 * _3446;
            float _3498 = _3406 * _3446;
            float _3500 = _3492 * _2396;
            float _3502 = _3490 * _3212;
            float _3504 = _3494 * _3212;
            float _3506 = _3476 * _3446;
            float _3508 = -_3500;
            float _3510 = fma(_3496, _3212, _3508);
            float _3512 = -_3502;
            float _3514 = fma(_3488, _2396, _3512);
            float _3516 = -_3504;
            float _3518 = fma(_3498, _2396, _3516);
            float _3520 = _3478 * _3446;
            float _3522 = _3480 * _3446;
            float _3524 = fma(_3264, _3362, _3462);
            float _3526 = fma(_3264, _3368, _3484);
            float _3528 = fma(_3506, _2398, _3514);
            float _3530 = -_3520;
            float _3532 = fma(_3530, _2398, _3510);
            float _3534 = fma(_3522, _2398, _3518);
            float _3536 = -_3486;
            float _3538 = fma(_3536, _3446, _3528);
            float _3540 = fma(_3524, _3446, _3532);
            float _3542 = -_3526;
            float _3544 = fma(_3542, _3446, _3534);
            _1970 = _3488;
            _1972 = _3528;
            _1974 = _3500;
            _1976 = _3534;
            _1782 = _3498;
            _1784 = _3450;
            _1786 = _3452;
            _2444 = _3506;
            _2446 = _3446;
            _1824 = _3486;
            _2448 = _3256;
            _2476 = true;
            _2496 = as_type<int>(_3538);
            _2502 = as_type<int>(_3540);
            _2510 = as_type<int>(_3544);
            _2488 = 0.0;
            _2482 = 0.0;
            _2472 = 0.0;
            _3546 = true;
        }
        else
        {
            bool _3548 = !_1754;
            if (!_3548)
            {
                float _3550 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                uint _3552 = uint(int(uint(_180) >> uint(2)));
                float _3554 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3552)]);
                int _3556 = _180 + 4;
                uint _3558 = uint(int(uint(_3556) >> uint(2)));
                float _3560 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3558)]);
                int _3562 = _180 + 8;
                uint _3564 = uint(int(uint(_3562) >> uint(2)));
                float _3566 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3564)]);
                uint _3568 = uint(int(uint(_180) >> uint(2)));
                float _3570 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3568)]);
                int _3572 = _180 + 4;
                uint _3574 = uint(int(uint(_3572) >> uint(2)));
                float _3576 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3574)]);
                int _3578 = _180 + 8;
                uint _3580 = uint(int(uint(_3578) >> uint(2)));
                float _3582 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3580)]);
                uint _3584 = uint(int(uint(_180) >> uint(2)));
                float _3586 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3584)]);
                int _3588 = _180 + 4;
                uint _3590 = uint(int(uint(_3588) >> uint(2)));
                float _3592 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3590)]);
                int _3594 = _180 + 8;
                uint _3596 = uint(int(uint(_3594) >> uint(2)));
                float _3598 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3596)]);
                float _3600 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _3602 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _3604 = _3566 * _3570;
                float _3606 = _3566 * _3576;
                float _3608 = -_3604;
                float _3610 = fma(_3554, _3582, _3608);
                float _3612 = _3560 * _3570;
                float _3614 = -_3606;
                float _3616 = fma(_3560, _3582, _3614);
                float _3618 = _3592 * _3610;
                float _3620 = -_3612;
                float _3622 = fma(_3554, _3576, _3620);
                float _3624 = -_3618;
                float _3626 = fma(_3586, _3616, _3624);
                float _3628 = fma(_3598, _3622, _3626);
                float _3630 = _3550 * _3582;
                float _3632 = 1.0 / _3628;
                float _3634 = _3550 * _3576;
                float _3636 = _3550 * _3570;
                float _3638 = _3598 * _3570;
                float _3640 = _3592 * _3582;
                float _3642 = -_3630;
                float _3644 = fma(_3566, _3600, _3642);
                float _3646 = -_3634;
                float _3648 = fma(_3560, _3600, _3646);
                float _3650 = -_3636;
                float _3652 = fma(_3554, _3600, _3650);
                float _3654 = -_3554;
                float _3656 = fma(_3654, _3582, _3604);
                float _3658 = -_3638;
                float _3660 = fma(_3586, _3582, _3658);
                float _3662 = -_3640;
                float _3664 = fma(_3598, _3576, _3662);
                float _3666 = _3586 * _3576;
                float _3668 = _3586 * _3566;
                float _3670 = _3592 * _3554;
                float _3672 = _3598 * _3560;
                float _3674 = -_3666;
                float _3676 = fma(_3592, _3570, _3674);
                float _3678 = -_3668;
                float _3680 = fma(_3598, _3554, _3678);
                float _3682 = _3598 * _3648;
                float _3684 = -_3670;
                float _3686 = fma(_3586, _3560, _3684);
                float _3688 = _3664 * _3632;
                float _3690 = _3660 * _3632;
                float _3692 = _3598 * _3652;
                float _3694 = _3676 * _3632;
                float _3696 = -_3672;
                float _3698 = fma(_3592, _3566, _3696);
                float _3700 = _3592 * _3652;
                float _3702 = -_3682;
                float _3704 = fma(_3592, _3644, _3702);
                float _3706 = _3688 * _3212;
                float _3708 = _3690 * _3212;
                float _3710 = _3656 * _3632;
                float _3712 = _3616 * _3632;
                float _3714 = _3694 * _3212;
                float _3716 = _3622 * _3632;
                float _3718 = fma(_3710, _2396, _3708);
                float _3720 = fma(_3712, _2396, _3706);
                float _3722 = -_3692;
                float _3724 = fma(_3586, _3644, _3722);
                float _3726 = fma(_3716, _2396, _3714);
                float _3728 = _3680 * _3632;
                float _3730 = _3698 * _3632;
                float _3732 = _3686 * _3632;
                float _3734 = -_3700;
                float _3736 = fma(_3586, _3648, _3734);
                float _3738 = fma(_3728, _2398, _3718);
                float _3740 = fma(_3730, _2398, _3720);
                float _3742 = fma(_3602, _3610, _3724);
                float _3744 = fma(_3602, _3616, _3704);
                float _3746 = fma(_3732, _2398, _3726);
                float _3748 = fma(_3602, _3622, _3736);
                float _3750 = fma(_3742, _3632, _3738);
                float _3752 = -_3744;
                float _3754 = fma(_3752, _3632, _3740);
                float _3756 = -_3748;
                float _3758 = fma(_3756, _3632, _3746);
                _1970 = _3740;
                _1972 = _3692;
                _1974 = _3728;
                _1976 = _3698;
                _1782 = _3746;
                _1784 = _3680;
                _1786 = _3676;
                _2444 = _3586;
                _2446 = _3744;
                _1824 = _3598;
                _2448 = _3720;
                _2476 = true;
                _2496 = as_type<int>(_3754);
                _2502 = as_type<int>(_3750);
                _2510 = as_type<int>(_3758);
                _2488 = 0.0;
                _2482 = 0.0;
                _2472 = 0.0;
                _3546 = true;
            }
            else
            {
                if (!_1852)
                {
                    _3228 = true;
                }
                bool _3760 = _3228;
                _2476 = _3760;
                if (!_1852)
                {
                    _2480 = 0.0;
                    _2470 = 0.0;
                }
                float _3762 = _2480;
                float _3764 = _2470;
                _2482 = _3762;
                _2472 = _3764;
                if (!_1852)
                {
                    _2486 = 0.0;
                }
                float _3766 = _2486;
                _2488 = _3766;
                if (!_1852)
                {
                    _3230 = as_type<int>(_2396);
                }
                int _3768 = _3230;
                _2496 = _3768;
                if (!_1852)
                {
                    _3232 = as_type<int>(_3212);
                }
                int _3770 = _3232;
                _2502 = _3770;
                if (!_1852)
                {
                    _2508 = as_type<int>(_2398);
                }
                int _3772 = _2508;
                bool _3774 = !_1852;
                _2510 = _3772;
                if (!_3774)
                {
                    uint _3776 = uint(int(uint(_180) >> uint(2)));
                    float _3778 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3776)]);
                    int _3780 = _180 + 4;
                    uint _3782 = uint(int(uint(_3780) >> uint(2)));
                    float _3784 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3782)]);
                    int _3786 = _180 + 8;
                    uint _3788 = uint(int(uint(_3786) >> uint(2)));
                    float _3790 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3788)]);
                    int _3792 = _180 + 12;
                    uint _3794 = uint(int(uint(_3792) >> uint(2)));
                    float _3796 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3794)]);
                    uint _3798 = uint(int(uint(_180) >> uint(2)));
                    float _3800 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3798)]);
                    int _3802 = _180 + 4;
                    uint _3804 = uint(int(uint(_3802) >> uint(2)));
                    float _3806 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3804)]);
                    int _3808 = _180 + 8;
                    uint _3810 = uint(int(uint(_3808) >> uint(2)));
                    float _3812 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3810)]);
                    int _3814 = _180 + 12;
                    uint _3816 = uint(int(uint(_3814) >> uint(2)));
                    float _3818 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3816)]);
                    uint _3820 = uint(int(uint(_180) >> uint(2)));
                    float _3822 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3820)]);
                    int _3824 = _180 + 4;
                    uint _3826 = uint(int(uint(_3824) >> uint(2)));
                    float _3828 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3826)]);
                    int _3830 = _180 + 8;
                    uint _3832 = uint(int(uint(_3830) >> uint(2)));
                    float _3834 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3832)]);
                    int _3836 = _180 + 12;
                    uint _3838 = uint(int(uint(_3836) >> uint(2)));
                    float _3840 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3838)]);
                    float _3842 = _3790 * _3800;
                    float _3844 = _3790 * _3806;
                    float _3846 = _3784 * _3800;
                    float _3848 = _3812 * _3796;
                    float _3850 = -_3842;
                    float _3852 = fma(_3778, _3812, _3850);
                    float _3854 = -_3844;
                    float _3856 = fma(_3784, _3812, _3854);
                    float _3858 = -_3846;
                    float _3860 = fma(_3778, _3806, _3858);
                    float _3862 = _3828 * _3812;
                    float _3864 = _3828 * _3852;
                    float _3866 = _3806 * _3796;
                    float _3868 = _3800 * _3796;
                    float _3870 = -_3862;
                    float _3872 = fma(_3834, _3806, _3870);
                    float _3874 = -_3864;
                    float _3876 = fma(_3822, _3856, _3874);
                    float _3878 = _3822 * _3806;
                    float _3880 = _3834 * _3784;
                    float _3882 = _3822 * _3790;
                    float _3884 = fma(_3834, _3860, _3876);
                    float _3886 = -_3848;
                    float _3888 = fma(_3790, _3818, _3886);
                    float _3890 = -_3866;
                    float _3892 = fma(_3784, _3818, _3890);
                    float _3894 = -_3868;
                    float _3896 = fma(_3778, _3818, _3894);
                    float _3898 = _3834 * _3800;
                    float _3900 = -_3878;
                    float _3902 = fma(_3828, _3800, _3900);
                    float _3904 = 1.0 / _3884;
                    float _3906 = -_3880;
                    float _3908 = fma(_3828, _3790, _3906);
                    float _3910 = -_3778;
                    float _3912 = fma(_3910, _3812, _3842);
                    float _3914 = -_3882;
                    float _3916 = fma(_3834, _3778, _3914);
                    float _3918 = _3828 * _3778;
                    float _3920 = _3834 * _3892;
                    float _3922 = _3834 * _3896;
                    float _3924 = _3828 * _3896;
                    float _3926 = -_3898;
                    float _3928 = fma(_3822, _3812, _3926);
                    float _3930 = -_3918;
                    float _3932 = fma(_3822, _3784, _3930);
                    float _3934 = -_3920;
                    float _3936 = fma(_3828, _3888, _3934);
                    float _3938 = -_3922;
                    float _3940 = fma(_3822, _3888, _3938);
                    float _3942 = -_3924;
                    float _3944 = fma(_3822, _3892, _3942);
                    float _3946 = fma(_3856, _3840, _3936);
                    float _3948 = fma(_3852, _3840, _3940);
                    float _3950 = _3872 * _3904;
                    float _3952 = _3928 * _3904;
                    float _3954 = _3902 * _3904;
                    float _3956 = _3912 * _3904;
                    float _3958 = _3950 * _3212;
                    float _3960 = _3952 * _3212;
                    float _3962 = _3954 * _3212;
                    float _3964 = _3856 * _3904;
                    float _3966 = _3860 * _3904;
                    float _3968 = fma(_3956, _2396, _3960);
                    float _3970 = _3916 * _3904;
                    float _3972 = fma(_3964, _2396, _3958);
                    float _3974 = fma(_3966, _2396, _3962);
                    float _3976 = _3908 * _3904;
                    float _3978 = _3932 * _3904;
                    float _3980 = fma(_3860, _3840, _3944);
                    float _3982 = fma(_3970, _2398, _3968);
                    float _3984 = fma(_3976, _2398, _3972);
                    float _3986 = fma(_3978, _2398, _3974);
                    float _3988 = fma(_3948, _3904, _3982);
                    float _3990 = -_3946;
                    float _3992 = fma(_3990, _3904, _3984);
                    float _3994 = -_3980;
                    float _3996 = fma(_3994, _3904, _3986);
                    _1970 = _3946;
                    _1972 = _3984;
                    _1974 = _3980;
                    _1976 = _3982;
                    _1782 = _3976;
                    _1784 = _3918;
                    _1786 = _3966;
                    _2444 = _3822;
                    _2446 = _3828;
                    _1824 = _3948;
                    _2448 = _3840;
                    _2476 = true;
                    _2496 = as_type<int>(_3992);
                    _2502 = as_type<int>(_3988);
                    _2510 = as_type<int>(_3996);
                    _2488 = 0.0;
                    _2482 = 0.0;
                    _2472 = 0.0;
                }
            }
        }
    }
    _3546 = false;
    float _3998 = _1970;
    float _4000 = _1972;
    float _4002 = _1974;
    float _4004 = _1976;
    float _4006 = _1782;
    float _4008 = _1784;
    float _4010 = _1786;
    float _4012 = _2444;
    float _4014 = _2446;
    float _4016 = _1824;
    float _4018 = _2448;
    bool _4020 = _2476;
    int _4022 = _2496;
    int _4024 = _2502;
    float _4026 = _2458;
    int _4028 = _2510;
    float _4030 = _2462;
    float _4032 = _2454;
    float _4034 = _2466;
    float _4036 = _2488;
    float _4038 = _2482;
    float _4040 = _2472;
    int _4042 = _2492;
    float _4044 = _3998;
    float _4046 = _4000;
    float _4048 = _4002;
    float _4050 = _4004;
    if (_1674)
    {
        float _4052 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _4054 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _4056 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _4058 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _4044 = _4052;
        _4046 = _4054;
        _4048 = _4056;
        _4050 = _4058;
    }
    float _4060 = _4044;
    float _4062 = _4046;
    float _4064 = _4048;
    float _4066 = _4050;
    float _4068 = _4006;
    float _4070 = _4008;
    float _4072 = _4010;
    if (_1674)
    {
        float _4074 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _4076 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _4078 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        _4068 = _4074;
        _4070 = _4076;
        _4072 = _4078;
    }
    float _4080 = _4068;
    float _4082 = _4070;
    float _4084 = _4072;
    float _4086 = _4012;
    float _4088 = _4014;
    float _4090 = _4016;
    float _4092 = _4018;
    if (_1674)
    {
        float _4094 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _4096 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _4098 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _4100 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _4086 = _4094;
        _4088 = _4096;
        _4090 = _4098;
        _4092 = _4100;
    }
    float _4102 = _4086;
    float _4104 = _4088;
    float _4106 = _4090;
    float _4108 = _4092;
    float _4110 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _4112 = _4020 ? as_type<float>(_4022) : _1620;
    float _4114 = _4020 ? as_type<float>(_4022) : _854;
    float _4116 = _4020 ? as_type<float>(_4024) : _1750;
    float _4118 = _4020 ? as_type<float>(_4024) : _2428;
    float _4120 = _4026 * _4026;
    float _4122 = _4020 ? as_type<float>(_4028) : _1632;
    float _4124 = _4020 ? as_type<float>(_4028) : _856;
    float _4126 = _4020 ? as_type<float>(_2412) : _1760;
    float _4128 = _4020 ? as_type<float>(_2412) : _376;
    float _4130 = _4030 * _4030;
    float _4132 = _4020 ? as_type<float>(_2416) : _378;
    float _4134 = fma(_4120, -2.0, 1.0);
    float _4136 = _4020 ? as_type<float>(_2416) : _1766;
    float _4138 = _4032 * _4032;
    float _4140 = _4020 ? as_type<float>(_2420) : _1772;
    float _4142 = _4020 ? as_type<float>(_2420) : _380;
    float _4144 = _4034 * 2.0;
    float _4146 = fma(_4130, -2.0, 1.0);
    float _4148 = fma(_4130, -2.0, _4134);
    float _4150 = fma(_4138, -2.0, 1.0);
    float _4152 = _4032 * 2.0;
    float _4154 = _4144 * _4030;
    float _4156 = fma(_4138, -2.0, _4146);
    float _4158 = _4026 * 2.0;
    float _4160 = _4144 * _4032;
    float _4162 = _4132 * 59.999996185302734375;
    float _4164 = fma(_4152, _4026, _4154);
    float _4166 = -_4154;
    float _4168 = fma(_4152, _4026, _4166);
    float _4170 = _4144 * _4026;
    float _4172 = fma(_4158, _4030, _4160);
    float _4174 = -_4160;
    float _4176 = fma(_4158, _4030, _4174);
    float _4178 = _4128 * 59.999996185302734375;
    float _4180 = _4030 * 2.0;
    float _4182 = _4142 * 59.999996185302734375;
    float _4184 = fma(_4120, -2.0, _4150);
    float _4186 = -_4170;
    float _4188 = fma(_4180, _4032, _4186);
    float _4190 = fma(_4180, _4032, _4170);
    float _4192 = _4066;
    float _4194 = _4158;
    float _4196 = _4144;
    float _4198 = _4112;
    float _4200 = _4128;
    float _4202 = _4062;
    float _4204 = _4064;
    if (_1674)
    {
        float _4206 = _4162 * _4062;
        _4192 = _4206;
    }
    float _4208 = _4192;
    float _4210 = _4208;
    float _4212 = _4082;
    if (_1674)
    {
        float _4214 = _4162 * _4082;
        _4194 = _4214;
    }
    float _4216 = _4194;
    float _4218 = _4216;
    float _4220 = _4108;
    float _4222 = _4104;
    if (_1674)
    {
        float _4224 = _4162 * _4104;
        _4196 = _4224;
    }
    float _4226 = _4196;
    float _4228 = _4226;
    if (_1674)
    {
        float _4230 = fma(_4178, _4060, _4208);
        _4210 = _4230;
    }
    float _4232 = _4210;
    if (_1674)
    {
        float _4234 = fma(_4178, _4080, _4216);
        _4218 = _4234;
    }
    float _4236 = _4218;
    if (_1674)
    {
        float _4238 = fma(_4178, _4102, _4226);
        _4228 = _4238;
    }
    float _4240 = _4228;
    float _4242 = fma(_4126, _4110, _4112);
    float _4244 = fma(_4136, _4110, _4116);
    float _4246 = fma(_4140, _4110, _4122);
    if (_1674)
    {
        float _4248 = fma(_4182, _4064, _4232);
        _4220 = _4248;
    }
    float _4250 = _4220;
    float _4252 = _4250;
    float _4254 = _4250;
    if (_1674)
    {
        float _4256 = fma(_4182, _4084, _4236);
        _4198 = _4256;
    }
    float _4258 = _4198;
    float _4260 = _4258;
    float _4262 = _4258;
    if (_1674)
    {
        float _4264 = fma(_4182, _4106, _4240);
        _4200 = _4264;
    }
    float _4266 = _4200;
    float _4268 = _4266;
    float _4270 = _4266;
    if (!_1674)
    {
        bool _4272 = !_1754;
        if (!_4272)
        {
            uint _4274 = uint(int(uint(_180) >> uint(2)));
            float _4276 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4274)]);
            int _4278 = _180 + 4;
            uint _4280 = uint(int(uint(_4278) >> uint(2)));
            float _4282 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4280)]);
            int _4284 = _180 + 8;
            uint _4286 = uint(int(uint(_4284) >> uint(2)));
            float _4288 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4286)]);
            uint _4290 = uint(int(uint(_180) >> uint(2)));
            float _4292 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4290)]);
            int _4294 = _180 + 4;
            uint _4296 = uint(int(uint(_4294) >> uint(2)));
            float _4298 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4296)]);
            int _4300 = _180 + 8;
            uint _4302 = uint(int(uint(_4300) >> uint(2)));
            float _4304 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4302)]);
            uint _4306 = uint(int(uint(_180) >> uint(2)));
            float _4308 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4306)]);
            int _4310 = _180 + 4;
            uint _4312 = uint(int(uint(_4310) >> uint(2)));
            float _4314 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4312)]);
            int _4316 = _180 + 8;
            uint _4318 = uint(int(uint(_4316) >> uint(2)));
            float _4320 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4318)]);
            float _4322 = _4282 * _4162;
            float _4324 = _4298 * _4162;
            float _4326 = _4314 * _4162;
            float _4328 = fma(_4276, _4178, _4322);
            float _4330 = fma(_4292, _4178, _4324);
            float _4332 = fma(_4308, _4178, _4326);
            float _4334 = fma(_4288, _4182, _4328);
            float _4336 = fma(_4304, _4182, _4330);
            float _4338 = fma(_4320, _4182, _4332);
            _4262 = _4336;
            _4270 = _4338;
            _4254 = _4334;
            _4340 = true;
        }
        else
        {
            if (!_1852)
            {
                _4252 = _4178;
            }
            float _4342 = _4252;
            _4254 = _4342;
            if (!_1852)
            {
                _4260 = _4162;
            }
            float _4344 = _4260;
            _4262 = _4344;
            if (!_1852)
            {
                _4268 = _4182;
            }
            float _4346 = _4268;
            bool _4348 = !_1852;
            _4270 = _4346;
            if (!_4348)
            {
                uint _4350 = uint(int(uint(_180) >> uint(2)));
                float _4352 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4350)]);
                int _4354 = _180 + 4;
                uint _4356 = uint(int(uint(_4354) >> uint(2)));
                float _4358 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4356)]);
                int _4360 = _180 + 8;
                uint _4362 = uint(int(uint(_4360) >> uint(2)));
                float _4364 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4362)]);
                uint _4366 = uint(int(uint(_180) >> uint(2)));
                float _4368 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4366)]);
                int _4370 = _180 + 4;
                uint _4372 = uint(int(uint(_4370) >> uint(2)));
                float _4374 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4372)]);
                int _4376 = _180 + 8;
                uint _4378 = uint(int(uint(_4376) >> uint(2)));
                float _4380 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4378)]);
                uint _4382 = uint(int(uint(_180) >> uint(2)));
                float _4384 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4382)]);
                int _4386 = _180 + 4;
                uint _4388 = uint(int(uint(_4386) >> uint(2)));
                float _4390 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4388)]);
                int _4392 = _180 + 8;
                uint _4394 = uint(int(uint(_4392) >> uint(2)));
                float _4396 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4394)]);
                float _4398 = _4358 * _4162;
                float _4400 = _4374 * _4162;
                float _4402 = _4390 * _4162;
                float _4404 = fma(_4352, _4178, _4398);
                float _4406 = fma(_4368, _4178, _4400);
                float _4408 = fma(_4384, _4178, _4402);
                float _4410 = fma(_4364, _4182, _4404);
                float _4412 = fma(_4380, _4182, _4406);
                float _4414 = fma(_4396, _4182, _4408);
                _4262 = _4412;
                _4270 = _4414;
                _4254 = _4410;
            }
        }
    }
    _4340 = false;
    float _4416 = _4262;
    float _4418 = _4270;
    float _4420 = _4254;
    float _4422 = _1842 * 19.23889923095703125;
    float _4424 = _1848 * 19.23889923095703125;
    float _4426 = -_4242;
    float _4428 = _4426 + _4114;
    float _4430 = -_4244;
    float _4432 = _4430 + _4118;
    float _4434 = _4422 * 0.15915493667125701904296875;
    float _4436 = _4424 * 0.15915493667125701904296875;
    float _4438 = _1670 * 0.5;
    if (_1674)
    {
        float _4440 = _4432 * _4062;
        _4202 = _4440;
    }
    float _4442 = _4202;
    float _4444 = _4442;
    if (_1674)
    {
        float _4446 = _4432 * _4082;
        _4212 = _4446;
    }
    float _4448 = _4212;
    float _4450 = _4436 * 6.283185482025146484375;
    float _4452 = sin(_4450);
    float _4454 = _4448;
    if (_1674)
    {
        float _4456 = _4432 * _4104;
        _4222 = _4456;
    }
    float _4458 = _4222;
    float _4460 = _4458;
    if (_1674)
    {
        float _4462 = fma(_4428, _4060, _4442);
        _4444 = _4462;
    }
    float _4464 = _4444;
    float _4466 = -_4246;
    float _4468 = _4466 + _4124;
    float _4470 = _4464;
    if (_1674)
    {
        float _4472 = fma(_4428, _4080, _4448);
        _4454 = _4472;
    }
    float _4474 = _4454;
    if (_1674)
    {
        float _4476 = fma(_4428, _4102, _4458);
        _4460 = _4476;
    }
    float _4478 = _4460;
    float _4480 = precise::max(_1668, 0.001000000047497451305389404296875);
    if (_1674)
    {
        float _4482 = fma(_4468, _4064, _4464);
        _4204 = _4482;
    }
    float _4484 = _4204;
    float _4486 = _4434 * 6.283185482025146484375;
    float _4488 = sin(_4486);
    float _4490 = precise::max(_4438, 0.001000000047497451305389404296875);
    float _4492 = _4484;
    float _4494 = _4484;
    if (_1674)
    {
        float _4496 = fma(_4468, _4106, _4478);
        _4470 = _4496;
    }
    float _4498 = _4470;
    float _4500 = precise::min(_4480, 10000.0);
    float _4502 = precise::min(_4490, 10000.0);
    float _4504 = _4452 * 34873.41015625;
    float _4506 = _4488 * 34873.41015625;
    float _4508 = _4488;
    float _4510 = _4498;
    float _4512 = _4498;
    if (_1674)
    {
        float _4514 = fma(_4468, _4084, _4474);
        _4508 = _4514;
    }
    float _4516 = _4508;
    float _4518 = floor(_4506);
    float _4520 = -_4518;
    float _4522 = _4506 + _4520;
    float _4524 = _4516;
    float _4526 = _4516;
    if (!_1674)
    {
        bool _4528 = !_1754;
        if (!_4528)
        {
            uint _4530 = uint(int(uint(_180) >> uint(2)));
            float _4532 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4530)]);
            int _4534 = _180 + 4;
            uint _4536 = uint(int(uint(_4534) >> uint(2)));
            float _4538 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4536)]);
            int _4540 = _180 + 8;
            uint _4542 = uint(int(uint(_4540) >> uint(2)));
            float _4544 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4542)]);
            uint _4546 = uint(int(uint(_180) >> uint(2)));
            float _4548 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4546)]);
            int _4550 = _180 + 4;
            uint _4552 = uint(int(uint(_4550) >> uint(2)));
            float _4554 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4552)]);
            int _4556 = _180 + 8;
            uint _4558 = uint(int(uint(_4556) >> uint(2)));
            float _4560 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4558)]);
            uint _4562 = uint(int(uint(_180) >> uint(2)));
            float _4564 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4562)]);
            int _4566 = _180 + 4;
            uint _4568 = uint(int(uint(_4566) >> uint(2)));
            float _4570 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4568)]);
            int _4572 = _180 + 8;
            uint _4574 = uint(int(uint(_4572) >> uint(2)));
            float _4576 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4574)]);
            float _4578 = _4538 * _4432;
            float _4580 = _4554 * _4432;
            float _4582 = fma(_4532, _4428, _4578);
            float _4584 = _4570 * _4432;
            float _4586 = fma(_4548, _4428, _4580);
            float _4588 = fma(_4564, _4428, _4584);
            float _4590 = fma(_4544, _4468, _4582);
            float _4592 = fma(_4560, _4468, _4586);
            float _4594 = fma(_4576, _4468, _4588);
            _4526 = _4592;
            _4512 = _4594;
            _4494 = _4590;
            _4596 = true;
        }
        else
        {
            if (!_1852)
            {
                _4492 = _4428;
            }
            float _4598 = _4492;
            _4494 = _4598;
            if (!_1852)
            {
                _4524 = _4432;
            }
            float _4600 = _4524;
            _4526 = _4600;
            if (!_1852)
            {
                _4510 = _4468;
            }
            float _4602 = _4510;
            bool _4604 = !_1852;
            _4512 = _4602;
            if (!_4604)
            {
                uint _4606 = uint(int(uint(_180) >> uint(2)));
                float _4608 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4606)]);
                int _4610 = _180 + 4;
                uint _4612 = uint(int(uint(_4610) >> uint(2)));
                float _4614 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4612)]);
                int _4616 = _180 + 8;
                uint _4618 = uint(int(uint(_4616) >> uint(2)));
                float _4620 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4618)]);
                uint _4622 = uint(int(uint(_180) >> uint(2)));
                float _4624 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4622)]);
                int _4626 = _180 + 4;
                uint _4628 = uint(int(uint(_4626) >> uint(2)));
                float _4630 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4628)]);
                int _4632 = _180 + 8;
                uint _4634 = uint(int(uint(_4632) >> uint(2)));
                float _4636 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4634)]);
                uint _4638 = uint(int(uint(_180) >> uint(2)));
                float _4640 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4638)]);
                int _4642 = _180 + 4;
                uint _4644 = uint(int(uint(_4642) >> uint(2)));
                float _4646 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4644)]);
                int _4648 = _180 + 8;
                uint _4650 = uint(int(uint(_4648) >> uint(2)));
                float _4652 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4650)]);
                float _4654 = _4614 * _4432;
                float _4656 = _4630 * _4432;
                float _4658 = fma(_4608, _4428, _4654);
                float _4660 = _4646 * _4432;
                float _4662 = fma(_4624, _4428, _4656);
                float _4664 = fma(_4640, _4428, _4660);
                float _4666 = fma(_4620, _4468, _4658);
                float _4668 = fma(_4636, _4468, _4662);
                float _4670 = fma(_4652, _4468, _4664);
                _4526 = _4668;
                _4512 = _4670;
                _4494 = _4666;
            }
        }
    }
    _4596 = false;
    float _4672 = _4526;
    float _4674 = _4512;
    float _4676 = _4494;
    float _4678 = 1.0 / _4110;
    float _4680 = _4184 * 0.100000001490116119384765625;
    float _4682 = _4502 * _4502;
    float _4684 = floor(_4504);
    float _4686 = _4678 * (-59.999996185302734375);
    float _4688 = fma(_4672, _4686, _4416);
    float _4690 = _4176 * 0.100000001490116119384765625;
    float _4692 = fma(_4674, _4686, _4418);
    float _4694 = _4164 * (-0.20000000298023223876953125);
    float _4696 = -_4684;
    float _4698 = _4696 + _4504;
    float _4700 = fma(_4164, 0.20000000298023223876953125, _4690);
    float _4702 = fma(_4676, _4686, _4420);
    float _4704 = fma(_4188, 0.20000000298023223876953125, _4680);
    float _4706 = fma(_4698, 0.800000011920928955078125, 0.20000000298023223876953125);
    float _4708 = _4188 * (-0.20000000298023223876953125);
    float _4710 = _4694 * _4036;
    float _4712 = _4700 * _4036;
    float _4714 = _4502 * 0.5;
    float _4716 = _4502 * 0.300000011920928955078125;
    float _4718 = -_4710;
    float _4720 = fma(_4708, _4038, _4718);
    float _4722 = -_4712;
    float _4724 = fma(_4704, _4038, _4722);
    float _4726 = fma(_4714, _4714, _4682);
    float _4728 = _4716 * _4716;
    float _4730 = _4702 + _4720;
    float _4732 = fma(_4716, _4716, _4682);
    float _4734 = _4702 + _4724;
    float _4736 = _4190 * 0.100000001490116119384765625;
    float _4738 = fma(_4522, _4522, 0.0400000028312206268310546875);
    float _4740 = fma(_4714, _4714, _4728);
    float _4742 = _4148 * (-0.20000000298023223876953125);
    float _4744 = fma(_4148, 0.20000000298023223876953125, _4736);
    float _4746 = _4708 * _4040;
    float _4748 = fma(_4706, _4706, _4738);
    float _4750 = _4704 * _4040;
    float _4752 = _4742 * _4038;
    float _4754 = -_4746;
    float _4756 = fma(_4742, _4036, _4754);
    float _4758 = _4726 * 0.083333335816860198974609375;
    float _4760 = -_4750;
    float _4762 = fma(_4744, _4036, _4760);
    float _4764 = sqrt(_4748);
    float _4766 = _4744 * _4038;
    float _4768 = -_4752;
    float _4770 = fma(_4694, _4040, _4768);
    float _4772 = _4688 + _4756;
    float _4774 = _4168 * _4758;
    float _4776 = -_4766;
    float _4778 = fma(_4700, _4040, _4776);
    float _4780 = _4692 + _4770;
    float _4782 = _4732 * 0.083333335816860198974609375;
    float _4784 = _4688 + _4762;
    float _4786 = _4692 + _4778;
    float _4788 = _4772 * _4772;
    float _4790 = _4168 * _4774;
    float _4792 = _4156 * _4774;
    float _4794 = _4148 * _4782;
    float _4796 = _4172 * _4774;
    float _4798 = _4156 * _4758;
    float _4800 = fma(_4730, _4730, _4788);
    float _4802 = _4784 * _4784;
    float _4804 = _4764 + 9.9999997473787516355514526367188e-06;
    float _4806 = fma(_4148, _4794, _4790);
    float _4808 = fma(_4164, _4794, _4792);
    float _4810 = fma(_4188, _4794, _4796);
    float _4812 = _4172 * _4758;
    float _4814 = _4164 * _4782;
    float _4816 = _4168 * _4798;
    float _4818 = fma(_4734, _4734, _4802);
    float _4820 = _4740 * 0.083333335816860198974609375;
    float _4822 = 1.0 / _4804;
    float _4824 = _4168 * _4812;
    float _4826 = _4156 * _4812;
    float _4828 = fma(_4148, _4814, _4816);
    float _4830 = _4188 * _4782;
    float _4832 = _4172 * _4812;
    float _4834 = fma(_4786, _4786, _4818);
    float _4836 = fma(_4780, _4780, _4800);
    float _4838 = fma(_4148, _4830, _4824);
    float _4840 = fma(_4164, _4830, _4826);
    float _4842 = rsqrt(_4834);
    float _4844 = fma(_4188, _4830, _4832);
    float _4846 = _4156 * _4798;
    float _4848 = _4172 * _4798;
    float _4850 = _4190 * 0.980571091175079345703125;
    float _4852 = _4190 * _4820;
    float _4854 = _4822 * _4522;
    float _4856 = fma(_4164, _4814, _4846);
    float _4858 = sqrt(_4834);
    float _4860 = fma(_4188, _4814, _4848);
    float _4862 = fma(_4168, 0.19611422717571258544921875, _4850);
    float _4864 = _4168 * _4854;
    float _4866 = _4176 * 0.980571091175079345703125;
    float _4868 = _4156 * _4854;
    float _4870 = _4172 * _4854;
    float _4872 = _4822 * 0.20000000298023223876953125;
    float _4874 = rsqrt(_4836);
    float _4876 = _4784 * _4842;
    float _4878 = fma(_4190, _4852, _4806);
    float _4880 = fma(_4176, _4852, _4808);
    float _4882 = fma(_4156, 0.19611422717571258544921875, _4866);
    float _4884 = -_4822;
    float _4886 = _4706 * _4884;
    float _4888 = fma(_4164, _4872, _4868);
    float _4890 = _4734 * _4842;
    float _4892 = sqrt(_4836);
    bool _4894 = _4858 != 0.0;
    bool _4896 = isnan(_4858);
    bool _4898 = _4894 || _4896;
    bool _4900 = isnan(0.0);
    bool _4902 = _4898 || _4900;
    float _4904 = fma(_4148, _4872, _4864);
    float _4906 = fma(_4188, _4872, _4870);
    float _4908 = fma(_4176, _4886, _4888);
    float _4910 = _4902 ? _4876 : 0.0;
    float _4912 = _4786 * _4842;
    float _4914 = fma(_4184, _4852, _4810);
    float _4916 = _4772 * _4874;
    float _4918 = _4730 * _4874;
    float _4920 = _4780 * _4874;
    float _4922 = _4910 * _4882;
    float _4924 = _4902 ? _4890 : 0.0;
    float _4926 = fma(_4190, _4886, _4904);
    float _4928 = fma(_4184, _4886, _4906);
    float _4930 = _4184 * 0.980571091175079345703125;
    bool _4932 = _4892 != 0.0;
    bool _4934 = isnan(_4892);
    bool _4936 = _4932 || _4934;
    bool _4938 = isnan(0.0);
    bool _4940 = _4936 || _4938;
    float _4942 = fma(_4924, _4862, _4922);
    float _4944 = _4902 ? _4912 : 0.0;
    float _4946 = fma(_4172, 0.19611422717571258544921875, _4930);
    float _4948 = _4940 ? _4916 : 0.0;
    float _4950 = 1.0 / _4500;
    float _4952 = _4940 ? _4918 : 0.0;
    float _4954 = _4176 * _4820;
    float _4956 = _4940 ? _4920 : 0.0;
    float _4958 = _4948 * _4908;
    float _4960 = _4184 * _4820;
    float _4962 = fma(_4176, _4954, _4856);
    float _4964 = fma(_4952, _4926, _4958);
    float _4966 = fma(_4944, _4946, _4942);
    float _4968 = fma(_4190, _4954, _4828);
    float _4970 = fma(_4184, _4954, _4860);
    float _4972 = fma(_4956, _4928, _4964);
    float _4974 = _4834 * _4966;
    float _4976 = fma(_4184, _4960, _4844);
    float _4978 = fma(_4176, _4960, _4840);
    float _4980 = _4836 * _4972;
    float _4982 = _4862 * _4974;
    float _4984 = _4882 * _4974;
    float _4986 = _4946 * _4974;
    float _4988 = _4926 * _4980;
    float _4990 = _4908 * _4980;
    float _4992 = _4928 * _4980;
    float _4994 = _4962 * _4914;
    float _4996 = -_4982;
    float _4998 = -_4988;
    float _5000 = _4996 + _4998;
    float _5002 = -_4984;
    float _5004 = -_4990;
    float _5006 = _5002 + _5004;
    float _5008 = -_4986;
    float _5010 = -_4992;
    float _5012 = _5008 + _5010;
    float _5014 = fma(_4190, _4960, _4838);
    float _5016 = _5000 * _4950;
    float _5018 = _5006 * _4950;
    float _5020 = _5012 * _4950;
    float _5022 = _4880 * _4038;
    float _5024 = _4978 * _4038;
    float _5026 = _5018 * _5018;
    float _5028 = _4978 * _4970;
    float _5030 = -_4994;
    float _5032 = fma(_4880, _4970, _5030);
    float _5034 = _4962 * _4038;
    float _5036 = fma(_5016, _5016, _5026);
    float _5038 = fma(_5014, _4040, _5024);
    float _5040 = _4880 * _4976;
    float _5042 = _4978 * _4914;
    float _5044 = fma(_5020, _5020, _5036);
    float _5046 = fma(_4878, _4040, _5022);
    float _5048 = -_5028;
    float _5050 = fma(_4962, _4976, _5048);
    float _5052 = fma(_4968, _4040, _5034);
    float _5054 = sqrt(_5044);
    float _5056 = fma(_4914, _4036, _5046);
    float _5058 = fma(_4976, _4036, _5038);
    float _5060 = -_5042;
    float _5062 = _5040 + _5060;
    float _5064 = fma(_4970, _4036, _5052);
    float _5066 = _5056 * _4036;
    float _5068 = _5058 * _4038;
    float _5070 = _4968 * _5062;
    float _5072 = -_5066;
    float _5074 = fma(_5058, _4040, _5072);
    float _5076 = _5064 * _4040;
    float _5078 = -_5068;
    float _5080 = fma(_5064, _4036, _5078);
    float _5082 = -_5070;
    float _5084 = fma(_4878, _5050, _5082);
    float _5086 = -_4986;
    float _5088 = _4744 * _5086;
    float _5090 = -_5076;
    float _5092 = fma(_5056, _4038, _5090);
    float _5094 = -_4990;
    float _5096 = _4708 * _5094;
    bool _5098 = _5054 > 80.0;
    float _5100 = fma(_5014, _5032, _5084);
    float _5102 = -_4982;
    float _5104 = -_5088;
    float _5106 = fma(_4704, _5102, _5104);
    float _5108 = -_4984;
    float _5110 = _4704 * _5108;
    float _5112 = -_4982;
    float _5114 = _4700 * _5112;
    float _5116 = -_4992;
    float _5118 = _4742 * _5116;
    bool _5120 = _5100 != 0.0;
    bool _5122 = isnan(_5100);
    bool _5124 = _5120 || _5122;
    bool _5126 = isnan(0.0);
    bool _5128 = _5124 || _5126;
    float _5130 = -_4986;
    float _5132 = -_5110;
    float _5134 = fma(_4700, _5130, _5132);
    float _5136 = -_4988;
    float _5138 = _4694 * _5136;
    float _5140 = -_4992;
    float _5142 = -_5096;
    float _5144 = fma(_4694, _5140, _5142);
    float _5146 = -_4988;
    float _5148 = -_5118;
    float _5150 = fma(_4708, _5146, _5148);
    float _5152 = -_4984;
    float _5154 = -_5114;
    float _5156 = fma(_4744, _5152, _5154);
    float _5158 = -_4990;
    float _5160 = -_5138;
    float _5162 = fma(_4742, _5158, _5160);
    float _5164 = _5096;
    float _5166 = _5134;
    float _5168 = _5144;
    float _5170 = _4962;
    float _5172 = _4880;
    float _5174 = _4978;
    float _5176 = _4744;
    float _5178 = _4968;
    float _5180 = _4878;
    float _5182 = _5014;
    float _5184 = _5150;
    float _5186 = _4914;
    float _5188 = _5018;
    float _5190 = _5020;
    if (_5098)
    {
        float _5192 = rsqrt(_5044);
        _5164 = _5192;
    }
    float _5194 = _5164;
    float _5196 = _5106 + _5150;
    float _5198 = _5134 + _5144;
    float _5200 = _5196 + _5074;
    if (!_5128)
    {
        _5166 = _4970;
    }
    float _5202 = _5166;
    float _5204 = _5202;
    if (!_5128)
    {
        _5168 = _4976;
    }
    float _5206 = _5168;
    bool _5208 = !_5128;
    float _5210 = _5206;
    if (!_5208)
    {
        float _5212 = 1.0 / _5100;
        float _5214 = _5014 * _4962;
        float _5216 = _4968 * _4976;
        float _5218 = _4878 * _4978;
        float _5220 = _4878 * _4970;
        float _5222 = _5014 * _4914;
        float _5224 = _4968 * _4880;
        float _5226 = -_5040;
        float _5228 = _5226 + _5042;
        float _5230 = -_5214;
        float _5232 = fma(_4968, _4978, _5230);
        float _5234 = -_5216;
        float _5236 = fma(_5014, _4970, _5234);
        float _5238 = -_5218;
        float _5240 = fma(_5014, _4880, _5238);
        float _5242 = -_5220;
        float _5244 = fma(_4968, _4914, _5242);
        float _5246 = -_5222;
        float _5248 = fma(_4878, _4976, _5246);
        float _5250 = -_5224;
        float _5252 = fma(_4878, _4962, _5250);
        float _5254 = _5228 * _5212;
        float _5256 = _5232 * _5212;
        float _5258 = _5050 * _5212;
        float _5260 = _5032 * _5212;
        float _5262 = _5236 * _5212;
        float _5264 = _5248 * _5212;
        float _5266 = _5240 * _5212;
        float _5268 = _5244 * _5212;
        float _5270 = _5252 * _5212;
        _5170 = _5264;
        _5172 = _5254;
        _5174 = _5266;
        _5176 = _5240;
        _5178 = _5262;
        _5180 = _5258;
        _5182 = _5256;
        _5184 = _5236;
        _5204 = _5268;
        _5186 = _5260;
        _5210 = _5270;
    }
    float _5272 = _5170;
    float _5274 = _5172;
    float _5276 = _5174;
    float _5278 = _5176;
    float _5280 = _5178;
    float _5282 = _5180;
    float _5284 = _5182;
    float _5286 = _5184;
    float _5288 = _5204;
    float _5290 = _5186;
    float _5292 = _5210;
    float _5294 = _5278;
    float _5296 = _5286;
    float _5298 = _5292;
    if (_5098)
    {
        float _5300 = _5194 * 80.0;
        _5294 = _5300;
    }
    float _5302 = _5294;
    float _5304 = _5156 + _5162;
    float _5306 = _5198 + _5080;
    float _5308 = _5200 * _5272;
    float _5310 = _5302;
    if (!_5098)
    {
        _5296 = _5016;
    }
    float _5312 = _5296;
    float _5314 = _5200 * _5274;
    float _5316 = _5200 * _5276;
    float _5318 = _5312;
    if (_5098)
    {
        float _5320 = _5016 * _5302;
        _5318 = _5320;
    }
    float _5322 = _5318;
    float _5324 = _4110 * 0.01666666753590106964111328125;
    if (_5098)
    {
        float _5326 = _5018 * _5302;
        _5188 = _5326;
    }
    float _5328 = _5188;
    if (_5098)
    {
        float _5330 = _5020 * _5302;
        _5190 = _5330;
    }
    float _5332 = _5190;
    float _5334 = _5304 + _5092;
    float _5336 = fma(_5306, _5280, _5308);
    float _5338 = fma(_5306, _5282, _5314);
    float _5340 = fma(_5306, _5284, _5316);
    float _5342 = fma(_5324, _5322, _4420);
    float _5344 = fma(_5324, _5328, _4416);
    float _5346 = fma(_5324, _5332, _4418);
    float _5348 = fma(_5334, _5288, _5336);
    float _5350 = fma(_5334, _5290, _5338);
    float _5352 = fma(_5334, _5292, _5340);
    float _5354 = _5342 * 0.01666666753590106964111328125;
    float _5356 = _5344 * 0.01666666753590106964111328125;
    float _5358 = _5346 * 0.01666666753590106964111328125;
    bool _5360 = !_1674;
    float _5362 = _5342;
    float _5364 = _5358;
    float _5366 = _5348;
    float _5368 = _5350;
    float _5370 = _5352;
    float _5492;
    float _5494;
    if (!_5360)
    {
        float _5372 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _5374 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _5376 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _5378 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _5380 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _5382 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _5384 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _5386 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _5388 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _5390 = _5376 * _5378;
        float _5392 = _5376 * _5380;
        float _5394 = _5374 * _5378;
        float _5396 = -_5390;
        float _5398 = fma(_5372, _5382, _5396);
        float _5400 = -_5392;
        float _5402 = fma(_5374, _5382, _5400);
        float _5404 = -_5394;
        float _5406 = fma(_5372, _5380, _5404);
        float _5408 = _5386 * _5372;
        float _5410 = _5386 * _5398;
        float _5412 = _5388 * _5374;
        float _5414 = _5384 * _5380;
        float _5416 = -_5408;
        float _5418 = fma(_5384, _5374, _5416);
        float _5420 = -_5410;
        float _5422 = fma(_5384, _5402, _5420);
        float _5424 = _5386 * _5382;
        float _5426 = _5388 * _5378;
        float _5428 = _5384 * _5376;
        float _5430 = fma(_5388, _5406, _5422);
        float _5432 = -_5424;
        float _5434 = fma(_5388, _5380, _5432);
        float _5436 = -_5426;
        float _5438 = fma(_5384, _5382, _5436);
        float _5440 = -_5414;
        float _5442 = fma(_5386, _5378, _5440);
        float _5444 = 1.0 / _5430;
        float _5446 = -_5428;
        float _5448 = fma(_5388, _5372, _5446);
        float _5450 = -_5372;
        float _5452 = fma(_5450, _5382, _5390);
        float _5454 = -_5412;
        float _5456 = fma(_5386, _5376, _5454);
        float _5458 = _5434 * _5444;
        float _5460 = _5438 * _5444;
        float _5462 = _5442 * _5444;
        float _5464 = _5354 * _5444;
        float _5466 = _5356 * _5458;
        float _5468 = _5356 * _5460;
        float _5470 = _5452 * _5444;
        float _5472 = _5356 * _5462;
        float _5474 = _5456 * _5444;
        float _5476 = _5448 * _5444;
        float _5478 = fma(_5402, _5464, _5466);
        float _5480 = fma(_5354, _5470, _5468);
        float _5482 = _5418 * _5444;
        float _5484 = fma(_5406, _5464, _5472);
        float _5486 = fma(_5358, _5474, _5478);
        float _5488 = fma(_5358, _5476, _5480);
        float _5490 = fma(_5358, _5482, _5484);
        _5310 = _5478;
        _5492 = _5488;
        _5494 = _5486;
        _5364 = _5490;
        _5496 = true;
    }
    else
    {
        bool _5498 = _1752 != 0;
        bool _5500 = _1850 != 0;
        bool _5502 = _5500 || _5498;
        if (!_5502)
        {
            _5298 = _5354;
        }
        float _5504 = _5298;
        _5494 = _5504;
        if (!_5502)
        {
            _5362 = _5356;
        }
        float _5506 = _5362;
        bool _5508 = !_5502;
        _5492 = _5506;
        if (!_5508)
        {
            uint _5510 = uint(int(uint(_180) >> uint(2)));
            float _5512 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5510)]);
            int _5514 = _180 + 4;
            uint _5516 = uint(int(uint(_5514) >> uint(2)));
            float _5518 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5516)]);
            int _5520 = _180 + 8;
            uint _5522 = uint(int(uint(_5520) >> uint(2)));
            float _5524 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5522)]);
            uint _5526 = uint(int(uint(_180) >> uint(2)));
            float _5528 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5526)]);
            int _5530 = _180 + 4;
            uint _5532 = uint(int(uint(_5530) >> uint(2)));
            float _5534 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5532)]);
            int _5536 = _180 + 8;
            uint _5538 = uint(int(uint(_5536) >> uint(2)));
            float _5540 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5538)]);
            uint _5542 = uint(int(uint(_180) >> uint(2)));
            float _5544 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5542)]);
            int _5546 = _180 + 4;
            uint _5548 = uint(int(uint(_5546) >> uint(2)));
            float _5550 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5548)]);
            int _5552 = _180 + 8;
            uint _5554 = uint(int(uint(_5552) >> uint(2)));
            float _5556 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_5554)]);
            float _5558 = _5524 * _5528;
            float _5560 = _5524 * _5534;
            float _5562 = _5518 * _5528;
            float _5564 = -_5558;
            float _5566 = fma(_5512, _5540, _5564);
            float _5568 = -_5560;
            float _5570 = fma(_5518, _5540, _5568);
            float _5572 = -_5562;
            float _5574 = fma(_5512, _5534, _5572);
            float _5576 = _5550 * _5512;
            float _5578 = _5550 * _5566;
            float _5580 = _5556 * _5518;
            float _5582 = _5544 * _5534;
            float _5584 = -_5576;
            float _5586 = fma(_5544, _5518, _5584);
            float _5588 = -_5578;
            float _5590 = fma(_5544, _5570, _5588);
            float _5592 = _5550 * _5540;
            float _5594 = _5556 * _5528;
            float _5596 = -_5580;
            float _5598 = fma(_5550, _5524, _5596);
            float _5600 = fma(_5556, _5574, _5590);
            float _5602 = _5544 * _5524;
            float _5604 = -_5582;
            float _5606 = fma(_5550, _5528, _5604);
            float _5608 = -_5592;
            float _5610 = fma(_5556, _5534, _5608);
            float _5612 = 1.0 / _5600;
            float _5614 = -_5594;
            float _5616 = fma(_5544, _5540, _5614);
            float _5618 = -_5602;
            float _5620 = fma(_5556, _5512, _5618);
            float _5622 = -_5512;
            float _5624 = fma(_5622, _5540, _5558);
            float _5626 = _5606 * _5612;
            float _5628 = _5610 * _5612;
            float _5630 = _5616 * _5612;
            float _5632 = _5624 * _5612;
            float _5634 = _5626 * _5356;
            float _5636 = _5628 * _5356;
            float _5638 = _5630 * _5356;
            float _5640 = _5354 * _5612;
            float _5642 = _5598 * _5612;
            float _5644 = _5620 * _5612;
            float _5646 = fma(_5632, _5354, _5638);
            float _5648 = fma(_5570, _5640, _5636);
            float _5650 = _5586 * _5612;
            float _5652 = fma(_5574, _5640, _5634);
            float _5654 = fma(_5644, _5358, _5646);
            float _5656 = fma(_5642, _5358, _5648);
            float _5658 = fma(_5650, _5358, _5652);
            _5310 = _5652;
            _5492 = _5654;
            _5494 = _5656;
            _5364 = _5658;
        }
    }
    _5496 = false;
    float _5660 = _5310;
    float _5662 = _5492;
    float _5664 = _5494;
    float _5666 = _5364;
    float _5668 = _5348 * _5348;
    float _5670 = _4110 * (-0.0291463173925876617431640625);
    float _5672 = fma(_5350, _5350, _5668);
    float _5674 = exp2(_5670);
    float _5676 = fma(_5352, _5352, _5672);
    float _5678 = sqrt(_5676);
    float _5680 = _5678 * 0.01666666753590106964111328125;
    bool _5682 = _5680 > 1.57079637050628662109375;
    float _5684 = _5680;
    float _5686 = _5660;
    if (_5682)
    {
        float _5688 = rsqrt(_5676);
        _5684 = _5688;
    }
    float _5690 = _5684;
    if (_5682)
    {
        float _5692 = _5690 * 94.24777984619140625;
        _5686 = _5692;
    }
    float _5694 = _5686;
    float _5696 = _5694;
    if (_5682)
    {
        float _5698 = _5348 * _5694;
        _5366 = _5698;
    }
    float _5700 = _5366;
    if (_5682)
    {
        float _5702 = _5350 * _5694;
        _5368 = _5702;
    }
    float _5704 = _5368;
    if (_5682)
    {
        float _5706 = _5352 * _5694;
        _5370 = _5706;
    }
    float _5708 = _5370;
    float _5710 = fma(_5324, _5700, _4038);
    float _5712 = fma(_5324, _5704, _4040);
    float _5714 = fma(_5324, _5708, _4036);
    float _5716 = _5710 * _5674;
    float _5718 = _5712 * _5674;
    float _5720 = _5714 * _5674;
    float _5722 = _5716 * _5716;
    float _5724 = fma(_5718, _5718, _5722);
    float _5726 = fma(_5720, _5720, _5724);
    float _5728 = sqrt(_5726);
    bool _5730 = _5728 > 31.4159259796142578125;
    float _5732 = _5728;
    float _5734 = _5716;
    float _5736 = _5718;
    float _5738 = _5720;
    if (_5730)
    {
        float _5740 = rsqrt(_5726);
        _5732 = _5740;
    }
    float _5742 = _5732;
    if (_5730)
    {
        float _5744 = _5742 * 31.4159259796142578125;
        _5696 = _5744;
    }
    float _5746 = _5696;
    if (_5730)
    {
        float _5748 = _5716 * _5746;
        _5734 = _5748;
    }
    float _5750 = _5734;
    if (_5730)
    {
        float _5752 = _5718 * _5746;
        _5736 = _5752;
    }
    float _5754 = _5736;
    if (_5730)
    {
        float _5756 = _5720 * _5746;
        _5738 = _5756;
    }
    float _5758 = _5738;
    float _5760 = _5324 * _5750;
    float _5762 = _5324 * _5754;
    float _5764 = _5324 * _5758;
    float _5766 = _5760 * _5760;
    float _5768 = fma(_5762, _5762, _5766);
    float _5770 = fma(_5764, _5764, _5768);
    float _5772 = sqrt(_5770);
    float _5774 = rsqrt(_5770);
    float _5776 = _5772 * 0.5;
    bool _5778 = _5772 != 0.0;
    bool _5780 = isnan(_5772);
    bool _5782 = _5778 || _5780;
    bool _5784 = isnan(0.0);
    bool _5786 = _5782 || _5784;
    float _5788 = _5776 * 0.15915493667125701904296875;
    float _5790 = _5788 * 6.283185482025146484375;
    float _5792 = sin(_5790);
    float _5794 = _5764 * _5774;
    float _5796 = _5760 * _5774;
    float _5798 = _5762 * _5774;
    float _5800 = _5786 ? _5794 : 0.0;
    float _5802 = _5788 * 6.283185482025146484375;
    float _5804 = cos(_5802);
    float _5806 = _5786 ? _5796 : 0.0;
    float _5808 = _5786 ? _5798 : 0.0;
    float _5810 = _5800 * _5792;
    float _5812 = _5806 * _5792;
    float _5814 = _5808 * _5792;
    float _5816 = _5810 * _4026;
    float _5818 = _5812 * _4034;
    float _5820 = _5812 * _4032;
    float _5822 = _5812 * _4026;
    float _5824 = -_5816;
    float _5826 = fma(_5812, _4030, _5824);
    float _5828 = fma(_5804, _4026, _5818);
    float _5830 = -_5820;
    float _5832 = fma(_5814, _4026, _5830);
    float _5834 = _5814 * _4034;
    float _5836 = _5814 * _4030;
    float _5838 = _5810 * _4034;
    float _5840 = fma(_5814, _4032, _5822);
    float _5842 = fma(_5804, _4032, _5834);
    float _5844 = -_5836;
    float _5846 = fma(_5810, _4032, _5844);
    float _5848 = fma(_5804, _4030, _5838);
    float _5850 = fma(_5810, _4030, _5840);
    float _5852 = _5842 + _5826;
    float _5854 = _5828 + _5846;
    float _5856 = _5848 + _5832;
    float _5858 = -_5850;
    float _5860 = fma(_5804, _4034, _5858);
    uint _5862 = uint(int(uint(_1642) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_5862)] = as_type<uint>(_5852);
    int _5864 = _1642 + 4;
    uint _5866 = uint(int(uint(_5864) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_5866)] = as_type<uint>(_5854);
    int _5868 = _1642 + 8;
    uint _5870 = uint(int(uint(_5868) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_5870)] = as_type<uint>(_5856);
    int _5872 = _1642 + 12;
    uint _5874 = uint(int(uint(_5872) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_5874)] = as_type<uint>(_5860);
    uint _5876 = uint(int(uint(_1756) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_5876)] = as_type<uint>(_5754);
    int _5878 = _1756 + 4;
    uint _5880 = uint(int(uint(_5878) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_5880)] = as_type<uint>(_5750);
    int _5882 = _1756 + 8;
    uint _5884 = uint(int(uint(_5882) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_5884)] = as_type<uint>(_5758);
    int _5886 = _1756 + 12;
    uint _5888 = uint(int(uint(_5886) >> uint(2)));
    (*spvDescriptorSet0.cp_s14)._m0[int(_5888)] = uint(_4042);
    float _5890 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[71]);
    int _5892 = _180 + 4;
    float _5894 = -_232;
    float _5896 = _5894 + _4242;
    uint _5898 = uint(int(uint(_184) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_5898)] = as_type<uint>(_284);
    float _5900 = -_244;
    float _5902 = _5900 + _4246;
    uint _5904 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_5904)] = as_type<uint>(_4242);
    float _5906 = _5662 * _5662;
    float _5908 = _4244 + _5890;
    int _5910 = _180 + 8;
    float _5912 = -_238;
    float _5914 = _5912 + _5908;
    uint _5916 = uint(int(uint(_5892) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_5916)] = as_type<uint>(_5908);
    uint _5918 = uint(int(uint(_5910) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_5918)] = as_type<uint>(_4246);
    uint _5920 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_5920)] = as_type<uint>(_5664);
    uint _5922 = uint(int(uint(_5892) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_5922)] = as_type<uint>(_5662);
    uint _5924 = uint(int(uint(_5910) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_5924)] = as_type<uint>(_5666);
    uint _5926 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_5926)] = as_type<uint>(_5896);
    uint _5928 = uint(int(uint(_5892) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_5928)] = as_type<uint>(_5914);
    uint _5930 = uint(int(uint(_5910) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_5930)] = as_type<uint>(_5902);
    float _5932 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _5934 = _5914 * _5914;
    float _5936 = fma(_5664, _5664, _5906);
    float _5938 = fma(_5896, _5896, _5934);
    float _5940 = fma(_5666, _5666, _5936);
    float _5942 = fma(_5902, _5902, _5938);
    float _5944 = sqrt(_5940);
    float _5946 = sqrt(_5942);
    bool _5948 = _5946 >= 9.9999999747524270787835121154785e-07;
    bool _5950 = isnan(_5946);
    bool _5952 = _5948 || _5950;
    bool _5954 = isnan(9.9999999747524270787835121154785e-07);
    bool _5956 = _5952 || _5954;
    if (!_5956)
    {
        bool _5958 = _186 != _190;
        bool _5960 = isnan(_186);
        bool _5962 = _5958 || _5960;
        bool _5964 = isnan(_190);
        bool _5966 = _5962 || _5964;
        _5968 = _5966;
        if (!_5968)
        {
            float _5970 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
            bool _5972 = _5970 > 0.0;
            bool _5974 = !_5972;
            if (!_5974)
            {
                float _5976 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
                float _5978 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
                float _5980 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
                float _5982 = _5978 * _5978;
                float _5984 = fma(_5976, _5976, _5982);
                float _5986 = fma(_5980, _5980, _5984);
                float _5988 = rsqrt(_5986);
                float _5990 = _5988 * 9.9999999747524270787835121154785e-07;
                float _5992 = _5976 * _5990;
                float _5994 = _5978 * _5990;
                float _5996 = _5980 * _5990;
                _420 = as_type<int>(_5992);
                _422 = as_type<int>(_5994);
                _424 = as_type<int>(_5996);
                _5968 = true;
            }
            else
            {
                bool _5998 = _5944 >= 9.9999999747524270787835121154785e-07;
                bool _6000 = isnan(_5944);
                bool _6002 = _5998 || _6000;
                bool _6004 = isnan(9.9999999747524270787835121154785e-07);
                bool _6006 = _6002 || _6004;
                if (!_6006)
                {
                    float _6008 = _5908 * _5908;
                    float _6010 = fma(_4242, _4242, _6008);
                    float _6012 = fma(_4246, _4246, _6010);
                    float _6014 = sqrt(_6012);
                    bool _6016 = _6014 >= 9.9999999747524270787835121154785e-07;
                    bool _6018 = isnan(_6014);
                    bool _6020 = _6016 || _6018;
                    bool _6022 = isnan(9.9999999747524270787835121154785e-07);
                    bool _6024 = _6020 || _6022;
                    float _6026 = _6014;
                    if (_6024)
                    {
                        float _6028 = rsqrt(_6012);
                        _6026 = _6028;
                    }
                    float _6030 = _6026;
                    if (!_6024)
                    {
                        _408 = 0;
                    }
                    int _6032 = _408;
                    int _6034 = _6032;
                    if (!_6024)
                    {
                        _410 = 897988541;
                    }
                    int _6036 = _410;
                    int _6038 = _6036;
                    if (!_6024)
                    {
                        _412 = 0;
                    }
                    int _6040 = _412;
                    float _6042 = _6030;
                    int _6044 = _6040;
                    if (_6024)
                    {
                        float _6046 = _6030 * 9.9999999747524270787835121154785e-07;
                        _6042 = _6046;
                    }
                    float _6048 = _6042;
                    if (_6024)
                    {
                        float _6050 = _4242 * _6048;
                        _6034 = as_type<int>(_6050);
                    }
                    int _6052 = _6034;
                    _420 = _6052;
                    if (_6024)
                    {
                        float _6054 = _5908 * _6048;
                        _6038 = as_type<int>(_6054);
                    }
                    int _6056 = _6038;
                    _422 = _6056;
                    if (_6024)
                    {
                        float _6058 = _4246 * _6048;
                        _6044 = as_type<int>(_6058);
                    }
                    int _6060 = _6044;
                    _424 = _6060;
                    _5968 = true;
                }
                else
                {
                    float _6062 = rsqrt(_5940);
                    float _6064 = _6062 * 9.9999999747524270787835121154785e-07;
                    float _6066 = _5664 * _6064;
                    float _6068 = _5662 * _6064;
                    float _6070 = _5666 * _6064;
                    _420 = as_type<int>(_6066);
                    _422 = as_type<int>(_6068);
                    _424 = as_type<int>(_6070);
                    _5968 = true;
                }
            }
        }
    }
    else
    {
        float _6072 = _5944 * _5932;
        bool _6074 = _6072 >= 0.001000000047497451305389404296875;
        bool _6076 = isnan(_6072);
        bool _6078 = _6074 || _6076;
        bool _6080 = isnan(0.001000000047497451305389404296875);
        bool _6082 = _6078 || _6080;
        bool _6084 = _6072 > 0.0;
        bool _6086 = !_6082;
        bool _6088 = _6084 && _6086;
        bool _6090 = _5946 < 0.001000000047497451305389404296875;
        bool _6092 = _6090 && _6088;
        if (!_6092)
        {
            _414 = as_type<int>(_5896);
        }
        int _6094 = _414;
        int _6096 = _6094;
        if (_6092)
        {
            float _6098 = _5932 * _5664;
            _6096 = as_type<int>(_6098);
        }
        int _6100 = _6096;
        _420 = _6100;
        if (!_6092)
        {
            _416 = as_type<int>(_5914);
        }
        int _6102 = _416;
        int _6104 = _6102;
        if (_6092)
        {
            float _6106 = _5932 * _5662;
            _6104 = as_type<int>(_6106);
        }
        int _6108 = _6104;
        _422 = _6108;
        if (!_6092)
        {
            _418 = as_type<int>(_5902);
        }
        int _6110 = _418;
        _424 = _6110;
        if (_6092)
        {
            float _6112 = _5932 * _5666;
            _424 = as_type<int>(_6112);
        }
    }
    _5968 = false;
    int _6114 = _420;
    int _6116 = _422;
    int _6118 = _424;
    uint _6120 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_6120)] = uint(_6114);
    uint _6122 = uint(int(uint(_5892) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_6122)] = uint(_6116);
    uint _6124 = uint(int(uint(_5910) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_6124)] = uint(_6118);
}

