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
    device _23* cp_s14 [[id(15)]];
    device _23* cp_s15 [[id(16)]];
    texture2d<float> cp_t_tcb_2A [[id(17)]];
    sampler cp_t_tcb_2ASmplr [[id(18)]];
    texture2d<float> cp_t_tcb_2C [[id(19)]];
    sampler cp_t_tcb_2CSmplr [[id(20)]];
    texture2d<float> cp_t_tcb_26 [[id(21)]];
    sampler cp_t_tcb_26Smplr [[id(22)]];
    sampler cp_t_tcb_2ASmplr_w [[id(23)]];
    sampler cp_t_tcb_2CSmplr_w [[id(24)]];
    sampler cp_t_tcb_26Smplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
};

static inline __attribute__((always_inline))
void _77(thread const int& _22066, thread const int& _22067, thread const int& _22068, thread const int& _22069, thread int& _22070, thread int& _22071, thread int& _22072, thread int& _22073, thread int& _22074, thread int& _22075)
{
    float _22078 = as_type<float>(_22068) + 0.0;
    bool _22080 = _22078 != 0.0;
    bool _22082 = isnan(_22078);
    bool _22084 = _22080 || _22082;
    bool _22086 = isnan(0.0);
    bool _22088 = _22084 || _22086;
    int _22090 = _22066;
    int _22092 = _22067;
    int _22094 = _22068;
    int _22096 = _22088 ? (-1) : 0;
    if (!_22088)
    {
        float _22098 = as_type<float>(_22068) * 1.0;
        _22090 = as_type<int>(_22098);
    }
    int _22100 = _22090;
    bool _22102 = !_22088;
    int _22104 = _22100;
    int _22106 = _22100;
    if (!_22102)
    {
        float _22108 = as_type<float>(_22068) + 0.0;
        bool _22110 = _22108 >= 0.0;
        bool _22112 = isnan(_22108);
        bool _22114 = _22110 || _22112;
        bool _22116 = isnan(0.0);
        bool _22118 = _22114 || _22116;
        _22096 = _22118 ? (-1) : 0;
        if (!_22118)
        {
            _22104 = 2147483647;
        }
        int _22120 = _22104;
        bool _22122 = !_22118;
        int _22124 = _22120;
        _22106 = _22120;
        if (!_22122)
        {
            float _22126 = as_type<float>(_22068) + 0.0;
            bool _22128 = _22126 > as_type<float>(0x7f800000u /* inf */);
            bool _22130 = isnan(_22126);
            bool _22132 = _22128 || _22130;
            bool _22134 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _22136 = _22132 || _22134;
            _22096 = _22136 ? (-1) : 0;
            if (_22136)
            {
                float _22138 = as_type<float>(_22068) + 1.0;
                _22124 = as_type<int>(_22138);
            }
            int _22140 = _22124;
            int _22142 = _22140;
            _22106 = _22140;
            if (!_22136)
            {
                float _22144 = 0.0 + as_type<float>(_22068);
                bool _22146 = _22144 != as_type<float>(0x7f800000u /* inf */);
                bool _22148 = isnan(_22144);
                bool _22150 = _22146 || _22148;
                bool _22152 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _22154 = _22150 || _22152;
                _22096 = _22154 ? (-1) : 0;
                if (!_22154)
                {
                    _22142 = _22068;
                }
                int _22156 = _22142;
                bool _22158 = !_22154;
                _22106 = _22156;
                if (!_22158)
                {
                    float _22160 = as_type<float>(_22068) * 18446744073709551616.0;
                    float _22162 = rsqrt(_22160);
                    float _22164 = _22160 * _22162;
                    float _22166 = _22162 * 0.5;
                    float _22168 = -_22164;
                    float _22170 = 0.0 + _22168;
                    float _22172 = fma(_22166, _22170, 0.5);
                    float _22174 = fma(_22164, _22172, _22164);
                    float _22176 = -_22174;
                    float _22178 = 0.0 + _22176;
                    float _22180 = fma(_22174, _22178, _22160);
                    float _22182 = fma(_22166, _22180, _22174);
                    float _22184 = _22182 * 2.3283064365386962890625e-10;
                    _22106 = as_type<int>(_22184);
                    _22092 = as_type<int>(_22174);
                    _22094 = as_type<int>(_22170);
                }
            }
        }
    }
    int _22186 = _22106;
    int _22188 = _22092;
    int _22190 = _22094;
    int _22192 = _22096;
    _22070 = _22069;
    _22071 = 0;
    _22072 = _22186;
    _22073 = _22188;
    _22074 = _22190;
    _22075 = _22192;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _8734 = false;
    bool _7096 = false;
    bool _6788 = false;
    bool _6388 = false;
    bool _5698 = false;
    bool _5526 = false;
    bool _5174 = false;
    bool _4238 = false;
    bool _3984 = false;
    bool _3608 = false;
    bool _2718 = false;
    bool _2064 = false;
    bool _2108 = false;
    bool _1896 = false;
    bool _518 = false;
    float _81 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _83 = as_type<float>(gl_LocalInvocationID.x);
    float _85 = as_type<float>(gl_WorkGroupID.x);
    int _87 = as_type<int>(_85) << 5;
    int _89 = _87 + as_type<int>(_83);
    float _91 = trunc(_81);
    int _93 = int(_91);
    bool _97 = _89 >= _93;
    int _99 = 0;
    if (_97)
    {
        _99 = 0;
    }
    int _101 = _99;
    int _103 = _101;
    int _105 = _101;
    if (!_97)
    {
        int _107 = _89 << 4;
        int _109 = _107 + 12;
        uint _112 = uint(int(uint(_109) >> uint(2)));
        float _114 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_112)]);
        float _116 = trunc(_114);
        int _118 = int(_116);
        bool _120 = _118 >= 1;
        int _122 = _120 ? (-1) : 0;
        if (!_120)
        {
            _103 = 0;
        }
        int _124 = _103;
        bool _126 = !_120;
        _105 = _124;
        if (!_126)
        {
            float _128 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _130 = uint(int(uint(_109) >> uint(2)));
            float _132 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_130)]);
            float _134 = float(_118);
            float _136 = -_132;
            float _138 = _128 + _136;
            bool _140 = _138 > _134;
            int _142 = as_type<int>(_128);
            if (!_140)
            {
                bool _144 = _128 >= _132;
                bool _146 = isnan(_128);
                bool _148 = _144 || _146;
                bool _150 = isnan(_132);
                bool _152 = _148 || _150;
                _122 = _152 ? (-1) : 0;
            }
            int _154 = _122;
            if (_140)
            {
                _142 = 0;
            }
            int _156 = _142;
            _105 = _156;
            if (!_140)
            {
                int _158 = ~_154;
                int _160 = (_158 != 0) ? 0 : 1;
                _105 = _160;
            }
        }
    }
    int _162 = _105;
    int _164 = _162 & 1;
    bool _166 = _164 != 0;
    if (!_166)
    {
        return;
    }
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[86]);
    float _170 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[68]);
    int _172 = _89 << 4;
    float _174 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[85]);
    int _176 = _172 + 12;
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    uint _180 = uint(int(uint(_176) >> uint(2)));
    float _182 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_180)]);
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _186 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[84]);
    uint _188 = uint(int(uint(_172) >> uint(2)));
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_188)]);
    int _192 = _172 + 4;
    uint _194 = uint(int(uint(_192) >> uint(2)));
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_194)]);
    float _198 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    float _200 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
    float _202 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
    float _204 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
    uint _208 = uint(int(uint(_172) >> uint(2)));
    float _210 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_208)]);
    int _212 = _172 + 4;
    uint _214 = uint(int(uint(_212) >> uint(2)));
    float _216 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_214)]);
    int _218 = _172 + 8;
    uint _220 = uint(int(uint(_218) >> uint(2)));
    float _222 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_220)]);
    uint _224 = uint(int(uint(_176) >> uint(2)));
    float _226 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_224)]);
    uint _228 = uint(int(uint(_172) >> uint(2)));
    float _230 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_228)]);
    int _232 = _172 + 4;
    uint _234 = uint(int(uint(_232) >> uint(2)));
    float _236 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_234)]);
    int _238 = _172 + 8;
    uint _240 = uint(int(uint(_238) >> uint(2)));
    float _242 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_240)]);
    float _244 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[128]);
    float _246 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[129]);
    float _248 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[130]);
    uint _250 = uint(int(uint(_172) >> uint(2)));
    float _252 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_250)]);
    int _254 = _172 + 4;
    uint _256 = uint(int(uint(_254) >> uint(2)));
    float _258 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_256)]);
    int _260 = _172 + 8;
    uint _262 = uint(int(uint(_260) >> uint(2)));
    float _264 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_262)]);
    uint _266 = uint(int(uint(_176) >> uint(2)));
    float _268 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_266)]);
    bool _270 = _168 > 0.0;
    float _272 = abs(_170);
    float _274 = log2(_272);
    bool _276 = _174 > 0.0;
    float _278 = 0.0;
    float _280 = _186;
    float _282 = _200;
    float _284 = _210;
    float _286 = _216;
    float _288 = _222;
    int _290 = _270 ? (-1) : 0;
    if (_270)
    {
        float _292 = 1.0 / _168;
        _278 = _292;
    }
    float _294 = _278;
    float _296 = -_182;
    float _298 = _178 + _296;
    float _300 = _184 * _274;
    float _302 = _186 * _174;
    float _304 = exp2(_300);
    float _306 = 0.0;
    float _308 = _298;
    if (_270)
    {
        float _310 = _298 * _294;
        _306 = _310;
    }
    float _312 = _306;
    if (_276)
    {
        float _314 = -_302;
        float _316 = fma(_190, _314, _186);
        _280 = _316;
    }
    float _318 = _280;
    int _320 = as_type<int>(_198) & 512;
    bool _322 = _320 != 0;
    float _324 = _184 * _200;
    float _326 = _318;
    bool _328 = _322;
    if (_270)
    {
        float _330 = precise::min(_312, 1.0);
        _282 = _330;
    }
    float _332 = _282;
    float _334 = _202 * _324;
    if (_270)
    {
        float _336 = _332 * _318;
        _326 = _336;
    }
    float _338 = _326;
    float _340 = _204 * _324;
    float _342 = _206 * _324;
    float _344 = _184 * _338;
    float _346 = _226 * _184;
    float _348 = fma(_210, _304, _334);
    float _350 = fma(_216, _304, _340);
    float _352 = fma(_222, _304, _342);
    float _354 = fma(_210, _346, _230);
    float _356 = fma(_216, _346, _236);
    float _358 = fma(_222, _346, _242);
    float _360 = _244 * _344;
    float _362 = _246 * _344;
    float _364 = _248 * _344;
    bool _366 = !_322;
    float _368 = _304;
    float _370 = _346;
    float _372 = _362;
    float _374 = _364;
    float _376 = _356;
    int _378 = as_type<int>(_252);
    int _380 = as_type<int>(_258);
    int _382 = as_type<int>(_264);
    int _384 = as_type<int>(_252);
    int _386 = as_type<int>(_258);
    int _388 = as_type<int>(_264);
    int _390 = as_type<int>(_252);
    int _392 = as_type<int>(_258);
    int _394 = as_type<int>(_264);
    float _516;
    if (!_366)
    {
        float _396 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _398 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _400 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _402 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _404 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _406 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _408 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _410 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _412 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _414 = _400 * _402;
        float _416 = _400 * _404;
        float _418 = _398 * _402;
        float _420 = -_414;
        float _422 = fma(_396, _406, _420);
        float _424 = -_416;
        float _426 = fma(_398, _406, _424);
        float _428 = -_418;
        float _430 = fma(_396, _404, _428);
        float _432 = _410 * _396;
        float _434 = _410 * _422;
        float _436 = _412 * _398;
        float _438 = _408 * _404;
        float _440 = -_432;
        float _442 = fma(_408, _398, _440);
        float _444 = -_434;
        float _446 = fma(_408, _426, _444);
        float _448 = _410 * _406;
        float _450 = _412 * _402;
        float _452 = -_438;
        float _454 = fma(_410, _402, _452);
        float _456 = fma(_412, _430, _446);
        float _458 = -_448;
        float _460 = fma(_412, _404, _458);
        float _462 = -_450;
        float _464 = fma(_408, _406, _462);
        float _466 = _408 * _400;
        float _468 = 1.0 / _456;
        float _470 = -_396;
        float _472 = fma(_470, _406, _414);
        float _474 = -_436;
        float _476 = fma(_410, _400, _474);
        float _478 = -_466;
        float _480 = fma(_412, _396, _478);
        float _482 = _460 * _468;
        float _484 = _464 * _468;
        float _486 = _454 * _468;
        float _488 = _360 * _468;
        float _490 = _362 * _482;
        float _492 = _362 * _484;
        float _494 = _472 * _468;
        float _496 = _362 * _486;
        float _498 = _476 * _468;
        float _500 = _480 * _468;
        float _502 = fma(_426, _488, _490);
        float _504 = fma(_360, _494, _492);
        float _506 = _442 * _468;
        float _508 = fma(_430, _488, _496);
        float _510 = fma(_364, _498, _502);
        float _512 = fma(_364, _500, _504);
        float _514 = fma(_364, _506, _508);
        _284 = _396;
        _286 = _482;
        _288 = _400;
        _370 = _456;
        _372 = _512;
        _516 = _510;
        _374 = _514;
        _518 = true;
    }
    else
    {
        int _520 = as_type<int>(_198) & 1024;
        bool _522 = _520 != 0;
        _290 = _522 ? (-1) : 0;
        if (_522)
        {
            _328 = true;
        }
        bool _524 = _328;
        bool _526 = _524;
        if (!_522)
        {
            int _528 = as_type<int>(_198) & 2048;
            bool _530 = _528 != 0;
            _526 = _530;
        }
        bool _532 = _526;
        if (!_532)
        {
            _368 = _360;
        }
        float _534 = _368;
        bool _536 = !_532;
        _516 = _534;
        if (!_536)
        {
            uint _538 = uint(int(uint(_172) >> uint(2)));
            float _540 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_538)]);
            int _542 = _172 + 4;
            uint _544 = uint(int(uint(_542) >> uint(2)));
            float _546 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_544)]);
            int _548 = _172 + 8;
            uint _550 = uint(int(uint(_548) >> uint(2)));
            float _552 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_550)]);
            uint _554 = uint(int(uint(_172) >> uint(2)));
            float _556 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_554)]);
            int _558 = _172 + 4;
            uint _560 = uint(int(uint(_558) >> uint(2)));
            float _562 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_560)]);
            int _564 = _172 + 8;
            uint _566 = uint(int(uint(_564) >> uint(2)));
            float _568 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_566)]);
            uint _570 = uint(int(uint(_172) >> uint(2)));
            float _572 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_570)]);
            int _574 = _172 + 4;
            uint _576 = uint(int(uint(_574) >> uint(2)));
            float _578 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_576)]);
            int _580 = _172 + 8;
            uint _582 = uint(int(uint(_580) >> uint(2)));
            float _584 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_582)]);
            float _586 = _552 * _556;
            float _588 = _552 * _562;
            float _590 = _546 * _556;
            float _592 = -_586;
            float _594 = fma(_540, _568, _592);
            float _596 = -_588;
            float _598 = fma(_546, _568, _596);
            float _600 = -_590;
            float _602 = fma(_540, _562, _600);
            float _604 = _578 * _540;
            float _606 = _578 * _594;
            float _608 = _584 * _546;
            float _610 = _572 * _562;
            float _612 = -_604;
            float _614 = fma(_572, _546, _612);
            float _616 = -_606;
            float _618 = fma(_572, _598, _616);
            float _620 = _578 * _568;
            float _622 = _584 * _556;
            float _624 = -_610;
            float _626 = fma(_578, _556, _624);
            float _628 = fma(_584, _602, _618);
            float _630 = -_620;
            float _632 = fma(_584, _562, _630);
            float _634 = -_622;
            float _636 = fma(_572, _568, _634);
            float _638 = _572 * _552;
            float _640 = 1.0 / _628;
            float _642 = -_540;
            float _644 = fma(_642, _568, _586);
            float _646 = -_608;
            float _648 = fma(_578, _552, _646);
            float _650 = -_638;
            float _652 = fma(_584, _540, _650);
            float _654 = _632 * _640;
            float _656 = _636 * _640;
            float _658 = _626 * _640;
            float _660 = _360 * _640;
            float _662 = _362 * _654;
            float _664 = _362 * _656;
            float _666 = _644 * _640;
            float _668 = _362 * _658;
            float _670 = _648 * _640;
            float _672 = _652 * _640;
            float _674 = fma(_598, _660, _662);
            float _676 = fma(_360, _666, _664);
            float _678 = _614 * _640;
            float _680 = fma(_602, _660, _668);
            float _682 = fma(_364, _670, _674);
            float _684 = fma(_364, _672, _676);
            float _686 = fma(_364, _678, _680);
            _284 = _540;
            _286 = _654;
            _288 = _552;
            _370 = _628;
            _372 = _684;
            _516 = _682;
            _374 = _686;
        }
    }
    _518 = false;
    float _688 = _284;
    float _690 = _286;
    float _692 = _288;
    float _694 = _370;
    float _696 = _372;
    float _698 = _516;
    float _700 = _374;
    int _702 = _290;
    uint _704 = uint(int(uint(_176) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_704)] = as_type<uint>(_268);
    float _706 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    uint _708 = uint(int(uint(_172) >> uint(2)));
    float _710 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_708)]);
    int _712 = _172 + 4;
    uint _714 = uint(int(uint(_712) >> uint(2)));
    float _716 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_714)]);
    int _718 = _172 + 8;
    uint _720 = uint(int(uint(_718) >> uint(2)));
    float _722 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_720)]);
    int _724 = _172 + 12;
    uint _726 = uint(int(uint(_724) >> uint(2)));
    float _728 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_726)]);
    float _730 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[71]);
    int _732 = _89 << 5;
    float _734 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[82]);
    uint _736 = uint(int(uint(_732) >> uint(2)));
    float _738 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_736)]);
    int _740 = _732 + 4;
    uint _742 = uint(int(uint(_740) >> uint(2)));
    float _744 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_742)]);
    int _746 = _732 + 8;
    uint _748 = uint(int(uint(_746) >> uint(2)));
    float _750 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_748)]);
    int _752 = _732 + 12;
    uint _754 = uint(int(uint(_752) >> uint(2)));
    float _756 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_754)]);
    uint _758 = uint(int(uint(_172) >> uint(2)));
    float _760 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_758)]);
    int _762 = _172 + 4;
    uint _764 = uint(int(uint(_762) >> uint(2)));
    float _766 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_764)]);
    int _768 = _172 + 8;
    uint _770 = uint(int(uint(_768) >> uint(2)));
    float _772 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_770)]);
    int _774 = _172 + 12;
    uint _776 = uint(int(uint(_774) >> uint(2)));
    float _778 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_776)]);
    float _780 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[80]);
    float _782 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[79]);
    int _784 = as_type<int>(_706) & 512;
    bool _786 = _784 != 0;
    float _788 = _688;
    float _790 = _690;
    float _792 = _692;
    float _794 = _694;
    int _796 = _702;
    int _798 = as_type<int>(_706);
    float _800 = _698;
    int _802 = as_type<int>(_700);
    float _804 = as_type<float>(_732);
    if (_786)
    {
        float _806 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _808 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _810 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _812 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _788 = _806;
        _790 = _808;
        _792 = _810;
        _794 = _812;
    }
    float _814 = _788;
    float _816 = _790;
    float _818 = _792;
    float _820 = _794;
    float _822 = 0.0;
    float _824 = 0.0;
    float _826 = 0.0;
    float _828 = 0.0;
    if (_786)
    {
        float _830 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _832 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _834 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _836 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _822 = _830;
        _824 = _832;
        _826 = _834;
        _828 = _836;
    }
    float _838 = _822;
    float _840 = _824;
    float _842 = _826;
    float _844 = _828;
    float _846 = 0.0;
    float _848 = 0.0;
    float _850 = 0.0;
    float _852 = 0.0;
    if (_786)
    {
        float _854 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _856 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _858 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _860 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _846 = _854;
        _848 = _856;
        _850 = _858;
        _852 = _860;
    }
    float _862 = _846;
    float _864 = _848;
    float _866 = _850;
    float _868 = _852;
    float _870 = -_730;
    float _872 = _716 + _870;
    float _874 = precise::max(0.0, _734);
    bool _876 = _874 != 0.0;
    bool _878 = isnan(_874);
    bool _880 = _876 || _878;
    bool _882 = isnan(0.0);
    bool _884 = _880 || _882;
    uint _886 = uint(int(uint(_172) >> uint(2)));
    float _888 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_886)]);
    int _890 = _732 + 16;
    int _892 = _172 + 8;
    uint _894 = uint(int(uint(_892) >> uint(2)));
    float _896 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_894)]);
    float _898 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[2607]);
    uint _900 = uint(int(uint(_172) >> uint(2)));
    float _902 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_900)]);
    int _904 = _172 + 4;
    uint _906 = uint(int(uint(_904) >> uint(2)));
    float _908 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_906)]);
    int _910 = _172 + 8;
    uint _912 = uint(int(uint(_910) >> uint(2)));
    float _914 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_912)]);
    int _916 = _172 + 12;
    uint _918 = uint(int(uint(_916) >> uint(2)));
    float _920 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_918)]);
    uint _922 = uint(int(uint(_890) >> uint(2)));
    float _924 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_922)]);
    int _926 = _890 + 4;
    uint _928 = uint(int(uint(_926) >> uint(2)));
    float _930 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_928)]);
    int _932 = _890 + 8;
    uint _934 = uint(int(uint(_932) >> uint(2)));
    float _936 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_934)]);
    int _938 = _890 + 12;
    uint _940 = uint(int(uint(_938) >> uint(2)));
    float _942 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_940)]);
    float _944 = _728;
    float _946 = _716;
    int _948 = as_type<int>(_778);
    float _950 = _738;
    float _952 = _744;
    float _954 = _750;
    float _956 = _756;
    float _958 = _722;
    float _960 = as_type<float>(_890);
    if (!_786)
    {
        _944 = 0.0;
    }
    float _962 = _944;
    float _964 = _962;
    if (!_786)
    {
        _946 = 0.0;
    }
    float _966 = _946;
    float _968 = _966;
    if (!_884)
    {
        _796 = 0;
    }
    int _970 = _796;
    int _972 = 0;
    int _974 = _970;
    if (!_884)
    {
        _972 = as_type<int>(_766);
    }
    int _976 = _972;
    int _978 = _976;
    int _980 = _976;
    if (!_884)
    {
        _948 = as_type<int>(_772);
    }
    int _982 = _948;
    float _984 = _816;
    float _986 = _840;
    float _988 = _818;
    float _990 = _864;
    float _992 = _842;
    float _994 = _838;
    float _996 = _866;
    float _998 = _868;
    float _1000 = _844;
    float _1002 = _820;
    int _1004 = _982;
    if (_786)
    {
        float _1006 = _872 * _816;
        _984 = _1006;
    }
    float _1008 = _984;
    float _1010 = _1008;
    if (_786)
    {
        float _1012 = fma(_710, _814, _1008);
        _1010 = _1012;
    }
    float _1014 = _1010;
    if (_786)
    {
        float _1016 = _872 * _840;
        _986 = _1016;
    }
    float _1018 = _986;
    int _1020 = as_type<int>(_706) & 1024;
    bool _1022 = _1020 != 0;
    float _1024 = _1018;
    if (_786)
    {
        float _1026 = fma(_722, _818, _1014);
        _988 = _1026;
    }
    float _1028 = _988;
    if (_786)
    {
        float _1030 = _872 * _864;
        _990 = _1030;
    }
    float _1032 = _990;
    float _1034 = _1032;
    if (_786)
    {
        float _1036 = fma(_710, _838, _1018);
        _1024 = _1036;
    }
    float _1038 = _1024;
    float _1040 = _738 + _744;
    float _1042 = _1038;
    if (_786)
    {
        float _1044 = fma(_710, _862, _1032);
        _1034 = _1044;
    }
    float _1046 = _1034;
    float _1048 = _1046;
    if (_786)
    {
        float _1050 = fma(_722, _842, _1038);
        _992 = _1050;
    }
    float _1052 = _992;
    float _1054 = _750 + _1040;
    float _1056 = _1052;
    float _1058 = _1054;
    if (!_786)
    {
        _994 = 0.0;
    }
    float _1060 = _994;
    float _1062 = _1060;
    if (_786)
    {
        float _1064 = fma(_722, _866, _1046);
        _996 = _1064;
    }
    float _1066 = _996;
    float _1068 = _1066;
    if (_786)
    {
        float _1070 = _844 + _1052;
        _1062 = _1070;
    }
    float _1072 = _1062;
    float _1074 = -_756;
    bool _1076 = _1054 != _1074;
    bool _1078 = isnan(_1054);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan(_1074);
    bool _1084 = _1080 || _1082;
    float _1086 = _1072;
    bool _1088 = _1084;
    if (_786)
    {
        float _1090 = _820 + _1028;
        _964 = _1090;
    }
    float _1092 = _964;
    float _1094 = _1092;
    if (_786)
    {
        float _1096 = _868 + _1066;
        _968 = _1096;
    }
    float _1098 = _968;
    int _1100 = as_type<int>(_706) & 2048;
    bool _1102 = _1100 != 0;
    int _1104 = _1084 ? 0 : 1;
    float _1106 = _1098;
    int _1108 = _1104;
    int _1110 = _1104;
    if (!_884)
    {
        _798 = as_type<int>(_760);
    }
    int _1112 = _798;
    int _1114 = _1112;
    if (!_1022)
    {
        _998 = _1072;
    }
    float _1116 = _998;
    bool _1118 = !_1022;
    float _1120 = _1116;
    int _1122 = 0;
    int _1124 = 0;
    float _1126 = _930;
    float _1128 = _936;
    float _1130 = _942;
    float _1132 = _888;
    float _1134 = _896;
    float _1136 = _898;
    if (!_1118)
    {
        float _1138 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1140 = uint(int(uint(_172) >> uint(2)));
        float _1142 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1140)]);
        int _1144 = _172 + 4;
        uint _1146 = uint(int(uint(_1144) >> uint(2)));
        float _1148 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1146)]);
        int _1150 = _172 + 8;
        uint _1152 = uint(int(uint(_1150) >> uint(2)));
        float _1154 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1152)]);
        int _1156 = _172 + 12;
        uint _1158 = uint(int(uint(_1156) >> uint(2)));
        float _1160 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1158)]);
        uint _1162 = uint(int(uint(_172) >> uint(2)));
        float _1164 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1162)]);
        int _1166 = _172 + 4;
        uint _1168 = uint(int(uint(_1166) >> uint(2)));
        float _1170 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1168)]);
        int _1172 = _172 + 8;
        uint _1174 = uint(int(uint(_1172) >> uint(2)));
        float _1176 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1174)]);
        uint _1178 = uint(int(uint(_172) >> uint(2)));
        float _1180 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1178)]);
        int _1182 = _172 + 4;
        uint _1184 = uint(int(uint(_1182) >> uint(2)));
        float _1186 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1184)]);
        int _1188 = _172 + 8;
        uint _1190 = uint(int(uint(_1188) >> uint(2)));
        float _1192 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1190)]);
        int _1194 = _172 + 12;
        uint _1196 = uint(int(uint(_1194) >> uint(2)));
        float _1198 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1196)]);
        float _1200 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1202 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1204 = _872 * _1148;
        float _1206 = _872 * _1170;
        float _1208 = _872 * _1186;
        float _1210 = fma(_710, _1142, _1204);
        float _1212 = fma(_710, _1164, _1206);
        float _1214 = fma(_710, _1180, _1208);
        float _1216 = fma(_722, _1154, _1210);
        float _1218 = fma(_722, _1176, _1212);
        float _1220 = fma(_722, _1192, _1214);
        float _1222 = _1138 + _1216;
        float _1224 = _1200 + _1218;
        float _1226 = _1202 + _1220;
        _1086 = _1142;
        _1042 = _1210;
        _1056 = _1216;
        _1000 = _1160;
        _1058 = _1164;
        _1048 = _1212;
        _1068 = _1218;
        _1120 = _1224;
        _1122 = as_type<int>(_1214);
        _1124 = as_type<int>(_1198);
        _1002 = _1200;
        _1094 = _1222;
        _1106 = _1226;
    }
    float _1228 = _1086;
    float _1230 = _1042;
    float _1232 = _1056;
    float _1234 = _1000;
    float _1236 = _1058;
    float _1238 = _1048;
    float _1240 = _1068;
    float _1242 = _1120;
    int _1244 = _1122;
    int _1246 = _1124;
    float _1248 = _1002;
    float _1250 = _1094;
    float _1252 = _1106;
    bool _1254 = !_1102;
    float _1256 = _1232;
    float _1258 = _1240;
    float _1260 = _1250;
    float _1262 = _1252;
    float _1264 = _1242;
    float _1266 = _1230;
    float _1268 = _1238;
    float _1270 = _1236;
    float _1272 = _1228;
    float _1274 = _1234;
    int _1276 = _1244;
    int _1278 = _1246;
    float _1280 = _1248;
    if (!_1254)
    {
        uint _1282 = uint(int(uint(_172) >> uint(2)));
        float _1284 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1282)]);
        int _1286 = _172 + 4;
        uint _1288 = uint(int(uint(_1286) >> uint(2)));
        float _1290 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1288)]);
        int _1292 = _172 + 8;
        uint _1294 = uint(int(uint(_1292) >> uint(2)));
        float _1296 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1294)]);
        int _1298 = _172 + 12;
        uint _1300 = uint(int(uint(_1298) >> uint(2)));
        float _1302 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1300)]);
        uint _1304 = uint(int(uint(_172) >> uint(2)));
        float _1306 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1304)]);
        int _1308 = _172 + 4;
        uint _1310 = uint(int(uint(_1308) >> uint(2)));
        float _1312 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1310)]);
        int _1314 = _172 + 8;
        uint _1316 = uint(int(uint(_1314) >> uint(2)));
        float _1318 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1316)]);
        int _1320 = _172 + 12;
        uint _1322 = uint(int(uint(_1320) >> uint(2)));
        float _1324 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1322)]);
        uint _1326 = uint(int(uint(_172) >> uint(2)));
        float _1328 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1326)]);
        int _1330 = _172 + 4;
        uint _1332 = uint(int(uint(_1330) >> uint(2)));
        float _1334 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1332)]);
        int _1336 = _172 + 8;
        uint _1338 = uint(int(uint(_1336) >> uint(2)));
        float _1340 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1338)]);
        int _1342 = _172 + 12;
        uint _1344 = uint(int(uint(_1342) >> uint(2)));
        float _1346 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1344)]);
        float _1348 = _872 * _1290;
        float _1350 = _872 * _1312;
        float _1352 = _872 * _1334;
        float _1354 = fma(_710, _1284, _1348);
        float _1356 = fma(_710, _1306, _1350);
        float _1358 = fma(_710, _1328, _1352);
        float _1360 = fma(_722, _1296, _1354);
        float _1362 = fma(_722, _1318, _1356);
        float _1364 = fma(_722, _1340, _1358);
        float _1366 = _1360 + _1302;
        float _1368 = _1362 + _1324;
        float _1370 = _1364 + _1346;
        _1256 = _1360;
        _1258 = _1362;
        _1260 = _1366;
        _1262 = _1370;
        _1264 = _1368;
        _1266 = _1354;
        _1268 = _1356;
        _1270 = _1306;
        _1272 = _1284;
        _1274 = _1302;
        _1276 = as_type<int>(_1358);
        _1278 = as_type<int>(_1346);
    }
    float _1372 = _1256;
    float _1374 = _1258;
    float _1376 = _1260;
    float _1378 = _1262;
    float _1380 = _1264;
    float _1382 = _1266;
    float _1384 = _1268;
    float _1386 = _1270;
    float _1388 = _1272;
    float _1390 = _1274;
    int _1392 = _1276;
    int _1394 = _1278;
    bool _1396 = !_884;
    float _1398 = _1376;
    float _1400 = _1378;
    float _1402 = _1376;
    float _1404 = _1378;
    float _1406 = _1382;
    float _1408 = _1386;
    float _1410 = _1374;
    float _1412 = _1388;
    float _1414 = _1372;
    float _1416 = _1390;
    int _1418 = _1392;
    int _1420 = _1394;
    float _1422 = _1384;
    float _1424 = _1380;
    if (!_1396)
    {
        uint _1426 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
        float _1428 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1426)]);
        int _1430 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 16;
        uint _1432 = uint(int(uint(_1430) >> uint(2)));
        float _1434 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1432)]);
        int _1436 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 8;
        uint _1438 = uint(int(uint(_1436) >> uint(2)));
        float _1440 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1438)]);
        int _1442 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 24;
        uint _1444 = uint(int(uint(_1442) >> uint(2)));
        float _1446 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1444)]);
        float _1448 = _874 * 0.5;
        float _1450 = 1.0 / _874;
        float _1452 = -_1434;
        float _1454 = fma(_1448, _1452, _1428);
        float _1456 = -_1448;
        float _1458 = _1456 + _1454;
        float _1460 = -_1446;
        float _1462 = fma(_1448, _1460, _1440);
        float _1464 = -_1458;
        float _1466 = _1464 + _1376;
        float _1468 = -_1448;
        float _1470 = _1468 + _1462;
        float _1472 = _1466 * _1450;
        float _1474 = -_1470;
        float _1476 = _1474 + _1378;
        float _1478 = floor(_1472);
        float _1480 = _1476 * _1450;
        float _1482 = floor(_1480);
        float _1484 = -_1478;
        float _1486 = fma(_874, _1484, _1466);
        bool _1488 = _1486 != _1466;
        bool _1490 = isnan(_1486);
        bool _1492 = _1488 || _1490;
        bool _1494 = isnan(_1466);
        bool _1496 = _1492 || _1494;
        float _1498 = -_1482;
        float _1500 = fma(_874, _1498, _1476);
        bool _1502 = _1500 == _1476;
        bool _1504 = !_1496;
        bool _1506 = _1502 && _1504;
        bool _1508 = !_1506;
        int _1510 = as_type<int>(_1476);
        int _1512 = as_type<int>(_1478);
        _1406 = _1480;
        _1280 = _1466;
        _974 = _1508 ? (-1) : 0;
        _1408 = _1458;
        _1410 = _1450;
        _1412 = _1470;
        _1414 = _1500;
        _1416 = _1486;
        _1088 = _1506;
        if (_1506)
        {
            _1510 = as_type<int>(_760);
        }
        int _1514 = _1510;
        int _1516 = _1514;
        if (!_1506)
        {
            float _1518 = _1458 + _1486;
            _1398 = _1518;
        }
        float _1520 = _1398;
        _1402 = _1520;
        if (_1506)
        {
            _978 = as_type<int>(_766);
        }
        int _1522 = _978;
        int _1524 = _1522;
        if (!_1506)
        {
            float _1526 = _1470 + _1500;
            _1400 = _1526;
        }
        float _1528 = _1400;
        _1404 = _1528;
        if (_1506)
        {
            _1512 = as_type<int>(_772);
        }
        int _1530 = _1512;
        _1004 = _1530;
        if (!_1506)
        {
            _1108 = 1;
        }
        int _1532 = _1108;
        _1110 = _1532;
        if (!_1506)
        {
            _1516 = 0;
        }
        int _1534 = _1516;
        _1114 = _1534;
        if (!_1506)
        {
            _1524 = 0;
        }
        int _1536 = _1524;
        _980 = _1536;
        if (!_1506)
        {
            _1004 = 0;
        }
    }
    int _1538 = _1110;
    float _1540 = _1402;
    float _1542 = _1404;
    float _1544 = _1406;
    float _1546 = _1280;
    int _1548 = _974;
    float _1550 = _1408;
    float _1552 = _1410;
    float _1554 = _1412;
    float _1556 = _1414;
    float _1558 = _1416;
    bool _1560 = _1088;
    int _1562 = _1114;
    int _1564 = _980;
    int _1566 = _1004;
    int _1568 = _1538 & 1;
    bool _1570 = _1568 != 0;
    float _1572 = _356 + _696;
    float _1574 = _780 * 0.5;
    float _1576 = _354 + _698;
    float _1578 = -_730;
    float _1580 = _1572 + _1578;
    float _1582 = _358 + _700;
    float _1584 = precise::max(_1574, 0.001000000047497451305389404296875);
    float _1586 = precise::min(_1584, 10000.0);
    float _1588 = as_type<float>(_1538);
    float _1590 = _1546;
    bool _1592 = _1560;
    float _1594 = _1554;
    float _1596 = _1544;
    float _1598 = _1556;
    float _1600 = _1558;
    float _1602 = _1550;
    float _1604 = _1552;
    if (!_1570)
    {
        _1588 = _738;
    }
    float _1606 = _1588;
    float _1608 = _1606;
    if (!_1570)
    {
        _1590 = _744;
    }
    float _1610 = _1590;
    float _1612 = _1610;
    if (!_1570)
    {
        _950 = _750;
    }
    float _1614 = _950;
    float _1616 = _1614;
    if (!_1570)
    {
        _952 = _756;
    }
    float _1618 = _952;
    float _1620 = _1618;
    if (!_1570)
    {
        _954 = _924;
    }
    float _1622 = _954;
    float _1624 = _1622;
    if (!_1570)
    {
        _956 = _930;
    }
    float _1626 = _956;
    float _1628 = _1626;
    if (!_1570)
    {
        _376 = _936;
    }
    float _1630 = _376;
    float _1632 = _1630;
    if (!_1570)
    {
        _1592 = false;
    }
    bool _1634 = _1592;
    bool _1636 = _1634;
    if (!_1570)
    {
        _800 = _942;
    }
    float _1638 = _800;
    float _1640 = _1380;
    float _1642 = _1380;
    float _1644 = _1638;
    if (!_1570)
    {
        _802 = as_type<int>(_710);
    }
    int _1646 = _802;
    int _1648 = _1646;
    int _1650 = _1646;
    if (!_1570)
    {
        _1418 = as_type<int>(_872);
    }
    int _1652 = _1418;
    int _1654 = _1652;
    if (!_1570)
    {
        _1420 = as_type<int>(_722);
    }
    int _1656 = _1420;
    bool _1658 = !_1570;
    int _1660 = _1656;
    int _1662 = _1656;
    float _1664 = 0.0;
    float _1666 = 0.0;
    float _1668 = 0.0;
    if (!_1658)
    {
        float _1670 = fma(_1540, 6.2500002968590706586837768554688e-05, 0.5);
        float _1672 = fma(_1542, 6.2500002968590706586837768554688e-05, 0.5);
        float _1674 = fma(_1540, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
        float _1676 = fma(_1542, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
        float _1678 = fma(_1542, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
        float2 _11239 = float2(_1670, _1672);
        float2 _1682 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_11239, float2(0.0), isnan(_11239)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_11239, float2(0.0), isnan(_11239)), level(0.0)).xy;
        float _1684 = _1682.x;
        float _1686 = _1682.y;
        float _1688 = fma(_1540, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
        float _1690 = fma(_1540, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
        float _1692 = fma(_1542, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
        float2 _11260 = float2(_1674, _1676);
        float _1694 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_11260, float2(0.0), isnan(_11260)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_11260, float2(0.0), isnan(_11260)), level(0.0)).x;
        float2 _11268 = float2(_1674, _1678);
        float _1696 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_11268, float2(0.0), isnan(_11268)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_11268, float2(0.0), isnan(_11268)), level(0.0)).x;
        float2 _11276 = float2(_1688, _1676);
        float _1698 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_11276, float2(0.0), isnan(_11276)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_11276, float2(0.0), isnan(_11276)), level(0.0)).x;
        float2 _11284 = float2(_1690, _1672);
        float2 _1700 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_11284, float2(0.0), isnan(_11284)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_11284, float2(0.0), isnan(_11284)), level(0.0)).xy;
        float _1702 = _1700.x;
        float _1704 = _1700.y;
        float2 _11296 = float2(_1670, _1692);
        float2 _1706 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_11296, float2(0.0), isnan(_11296)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_11296, float2(0.0), isnan(_11296)), level(0.0)).xy;
        float _1708 = _1706.x;
        float _1710 = _1706.y;
        float2 _11308 = float2(_1688, _1678);
        float _1712 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_11308, float2(0.0), isnan(_11308)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_11308, float2(0.0), isnan(_11308)), level(0.0)).x;
        float _1714 = -_1686;
        float _1716 = _1684 + _1714;
        float _1718 = _1716 * 2000.0;
        float _1720 = abs(_1718);
        bool _1722 = _1720 >= 2.0;
        bool _1724 = isnan(_1720);
        bool _1726 = _1722 || _1724;
        bool _1728 = isnan(2.0);
        bool _1730 = _1726 || _1728;
        float _1732 = _1718;
        float _1734 = _1676;
        float _1736 = _1672;
        if (_1730)
        {
            int _1738 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 4;
            uint _1740 = uint(int(uint(_1738) >> uint(2)));
            float _1742 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1740)]);
            _1732 = _1742;
        }
        float _1744 = _1732;
        float _1746 = -_1684;
        float _1748 = _1746 + _1694;
        float _1750 = -_1684;
        float _1752 = _1750 + _1696;
        float _1754 = _1748 * 2000.0;
        float _1756 = _1752 * 2000.0;
        float _1758 = -_1684;
        float _1760 = _1758 + _1702;
        float _1762 = -_1684;
        float _1764 = _1762 + _1698;
        float _1766 = abs(_1754);
        float _1768 = abs(_1756);
        float _1770 = precise::max(_1766, _1768);
        float _1772 = _1684 * 2000.0;
        float _1774 = -_1684;
        float _1776 = _1774 + _1708;
        float _1778 = _1760 * 1000.0;
        float _1780 = _1764 * 2000.0;
        float _1782 = _1744;
        float _1784 = _1772;
        float _1786 = _1752;
        float _1788 = _1780;
        if (_1730)
        {
            float _1790 = _1772 + (-2.0);
            _1734 = _1790;
        }
        float _1792 = _1734;
        float _1794 = _1776 * 1000.0;
        float _1796 = -_1684;
        float _1798 = _1796 + _1712;
        float _1800 = abs(_1780);
        float _1802 = precise::max(_1770, _1800);
        float _1804 = _1798 * 2000.0;
        float _1806 = abs(_1804);
        float _1808 = precise::max(_1802, _1806);
        float _1810 = _1794;
        _1422 = _1804;
        if (_1730)
        {
            float _1812 = _1744 + 10.0;
            _1782 = _1812;
        }
        float _1814 = _1782;
        bool _1816 = _1814 < _1792;
        bool _1818 = !_1730;
        bool _1820 = _1816 || _1818;
        float _1822 = fma(_1778, _1778, 0.0625);
        float _1824 = fma(_1794, _1794, _1822);
        float _1826 = rsqrt(_1824);
        float _1828 = _1826 * 0.25;
        float _1830 = _1778 * _1826;
        float _1832 = _1794 * _1826;
        bool _1834 = _1828 < 0.891006529331207275390625;
        bool _1836 = _1834 || _1820;
        bool _1838 = _1808 >= 2.0;
        bool _1840 = isnan(_1808);
        bool _1842 = _1838 || _1840;
        bool _1844 = isnan(2.0);
        bool _1846 = _1842 || _1844;
        bool _1848 = _1846 || _1836;
        bool _1850 = !_1848;
        float _1852 = _1828;
        float _1854 = _1830;
        float _1856 = _1832;
        float _1888;
        float _1890;
        float _1892;
        float _1894;
        if (!_1850)
        {
            float _1858 = -_1686;
            float _1860 = _1858 + _1704;
            float _1862 = -_1686;
            float _1864 = _1862 + _1710;
            float _1866 = _1686 * 2000.0;
            float _1868 = _1860 * 1000.0;
            float _1870 = _1864 * 1000.0;
            float _1872 = fma(_1868, _1868, 0.0625);
            float _1874 = fma(_1870, _1870, _1872);
            float _1876 = rsqrt(_1874);
            float _1878 = -_1870;
            float _1880 = fma(_1878, _1876, -0.0);
            float _1882 = -_1868;
            float _1884 = fma(_1882, _1876, -0.0);
            float _1886 = _1876 * 0.25;
            _1888 = _1866;
            _1890 = _1884;
            _1892 = _1880;
            _1894 = _1886;
            _1896 = true;
        }
        else
        {
            float _1898 = _1832 * _1832;
            float _1900 = 1.0 / _1828;
            float _1902 = -_1830;
            float _1904 = (-0.0) + _1902;
            float _1906 = fma(_1830, _1830, _1898);
            float _1908 = -_1832;
            float _1910 = (-0.0) + _1908;
            float _1912 = sqrt(_1906);
            bool _1914 = _1912 > 9.9999997473787516355514526367188e-05;
            float _1916 = _1912 * _1900;
            float _1918 = _1898;
            _1890 = _1904;
            _1892 = _1910;
            _1894 = _1828;
            if (_1914)
            {
                float _1920 = abs(_1830);
                float _1922 = abs(_1832);
                float _1924 = precise::max(_1920, _1922);
                _1810 = _1924;
            }
            float _1926 = _1810;
            if (!_1914)
            {
                _1918 = 0.0;
            }
            float _1928 = _1918;
            float _1930 = _1926;
            float _1932 = _1928;
            if (_1914)
            {
                float _1934 = 1.0 / _1926;
                _1930 = _1934;
            }
            float _1936 = _1930;
            if (_1914)
            {
                float _1938 = _1912 * _1936;
                _1932 = _1938;
            }
            float _1940 = _1932;
            float _1942 = _1940 * 0.9649016857147216796875;
            float _1944 = -_1942;
            float _1946 = fma(_1944, _1916, _1772);
            _1888 = _1946;
        }
        _1896 = false;
        float _1948 = _1888;
        float _1950 = _1890;
        float _1952 = _1892;
        float _1954 = _1894;
        float2 _11618 = float2(_1670, _1672);
        float _1956 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_11618, float2(0.0), isnan(_11618)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_11618, float2(0.0), isnan(_11618)), level(0.0)).y;
        float _1958 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[81]);
        bool _1960 = _1380 >= _1948;
        int _1962 = (_1960 ? (-1) : 0) | _1548;
        float _1964 = 0.0 + _1958;
        float _1966 = precise::clamp(_1964, 0.0, 1.0);
        bool _1968 = _920 >= _1966;
        int _1970 = (_1968 ? (-1) : 0) & _1962;
        int _1972 = ~_1970;
        float _1974 = _1948;
        float _1976 = _1948;
        _1424 = _1956;
        float _2038;
        float _2040;
        float _2042;
        float _2044;
        float _2046;
        float _2048;
        float _2050;
        float _2052;
        float _2054;
        bool _2056;
        float _2058;
        float _2060;
        float _2062;
        if (!(_1972 != 0))
        {
            float _1978 = _908 * 6.283185482025146484375;
            float _1980 = _902 * 6.283185482025146484375;
            float _1982 = _914 * 6.283185482025146484375;
            if (_1548 != 0)
            {
                float _1984 = fma(_908, _874, _1948);
                _1640 = _1984;
            }
            float _1986 = _1640;
            float _1988 = _1978 * _1978;
            float _1990 = fma(_1980, _1980, _1988);
            float _1992 = fma(_1982, _1982, _1990);
            float _1994 = sqrt(_1992);
            float _1996 = rsqrt(_1992);
            float _1998 = _1994 * 0.5;
            bool _2000 = _1994 != 0.0;
            bool _2002 = isnan(_1994);
            bool _2004 = _2000 || _2002;
            bool _2006 = isnan(0.0);
            bool _2008 = _2004 || _2006;
            float _2010 = _1998 * 0.15915493667125701904296875;
            float _2012 = _2010 * 6.283185482025146484375;
            float _2014 = sin(_2012);
            float _2016 = _1980 * _1996;
            float _2018 = _1978 * _1996;
            float _2020 = _1982 * _1996;
            float _2022 = _2008 ? _2016 : 0.0;
            float _2024 = _2010 * 6.283185482025146484375;
            float _2026 = cos(_2024);
            float _2028 = _2008 ? _2018 : 0.0;
            float _2030 = _2008 ? _2020 : 0.0;
            float _2032 = _2022 * _2014;
            float _2034 = _2028 * _2014;
            float _2036 = _2030 * _2014;
            _2038 = _2030;
            _2040 = _1992;
            _2042 = _2010;
            _2044 = _2014;
            _2046 = _1986;
            _2048 = _1986;
            _2050 = _2036;
            _2052 = _2032;
            _2054 = _2026;
            _2056 = _2008;
            _2058 = _2034;
            _2060 = _1994;
            _2062 = 0.0;
            _2064 = true;
        }
        else
        {
            float _2066 = _1950 * _1950;
            float _2068 = fma(_1952, _1952, _2066);
            float _2070 = sqrt(_2068);
            float _2072 = precise::max(_2070, -1.0);
            float _2074 = precise::min(_2072, 1.0);
            float _2076 = abs(_2074);
            float _2078 = fma(_2076, -0.5, 0.5);
            int _2080 = as_type<int>(_2078) + (-218103808);
            bool _2082 = uint(_2080) >= 1920991232u;
            bool _2084 = !_2082;
            int _2106;
            if (!_2084)
            {
                int _2086 = 1056964608;
                int _2088 = as_type<int>(_1826);
                int _2090 = as_type<int>(_2078);
                int _2092 = 7552;
                int _2094;
                int _2096;
                int _2098;
                int _2100;
                int _2102;
                int _2104;
                _77(_2086, _2088, _2090, _2092, _2094, _2096, _2098, _2100, _2102, _2104);
                _2106 = _2098;
                _2108 = true;
            }
            else
            {
                float _2110 = rsqrt(_2078);
                float _2112 = _2078 * _2110;
                float _2114 = _2110 * 0.5;
                float _2116 = -_2112;
                float _2118 = 0.0 + _2116;
                float _2120 = fma(_2114, _2118, 0.5);
                float _2122 = fma(_2112, _2120, _2112);
                float _2124 = -_2122;
                float _2126 = 0.0 + _2124;
                float _2128 = fma(_2122, _2126, _2078);
                float _2130 = fma(_2114, _2128, _2122);
                _2106 = as_type<int>(_2130);
            }
            _2108 = false;
            int _2132 = _2106;
            float _2134 = abs(_2074);
            bool _2136 = _2134 > 0.569999992847442626953125;
            float _2138 = _2070 + 9.9999997473787516355514526367188e-06;
            float _2140 = _914 * 6.283185482025146484375;
            float _2142 = abs(_2074);
            float _2144 = _2136 ? as_type<float>(_2132) : _2142;
            float _2146 = -_1948;
            float _2148 = fma(_1956, 2000.0, _2146);
            float _2150 = 1.0 / _2138;
            float _2152 = _2140 * _1954;
            float _2154 = _2144 * _2144;
            float _2156 = _2140 * _1950;
            float _2158 = _2140 * _1952;
            float _2160 = _2152 * _2152;
            float _2162 = fma(_2154, 0.0517513789236545562744140625, 0.01816697604954242706298828125);
            float _2164 = fma(_2156, _2156, _2160);
            float _2166 = fma(_2154, _2162, 0.0467568598687648773193359375);
            float _2168 = fma(_2158, _2158, _2164);
            float _2170 = fma(_2154, _2166, 0.074846573173999786376953125);
            float _2172 = _2150 * _1950;
            float _2174 = sqrt(_2168);
            float _2176 = fma(_2154, _2170, 0.166670143604278564453125);
            float _2178 = _2154 * _2176;
            float _2180 = rsqrt(_2168);
            float _2182 = fma(_2144, _2178, _2144);
            float _2184 = _2182;
            _1852 = _2148;
            if (_2136)
            {
                float _2186 = fma(_2182, -2.0, 1.57079637050628662109375);
                _2184 = _2186;
            }
            float _2188 = _2184;
            bool _2190 = _2074 >= 0.0;
            bool _2192 = isnan(_2074);
            bool _2194 = _2190 || _2192;
            bool _2196 = isnan(0.0);
            bool _2198 = _2194 || _2196;
            float _2200 = -_1952;
            float _2202 = _2150 * _2200;
            float _2204 = _2174 * 0.5;
            bool _2206 = _2174 != 0.0;
            bool _2208 = isnan(_2174);
            bool _2210 = _2206 || _2208;
            bool _2212 = isnan(0.0);
            bool _2214 = _2210 || _2212;
            bool _2216 = !_2198;
            float _2218 = -_2188;
            float _2220 = _2216 ? _2218 : _2188;
            float _2222 = _2204 * 0.15915493667125701904296875;
            float _2224 = abs(_2148);
            bool _2226 = _2224 >= 2.0;
            bool _2228 = isnan(_2224);
            bool _2230 = _2226 || _2228;
            bool _2232 = isnan(2.0);
            bool _2234 = _2230 || _2232;
            float _2236 = _2220 * _2172;
            float _2238 = _2220 * _2202;
            float _2240 = _2222 * 6.283185482025146484375;
            float _2242 = sin(_2240);
            float _2244 = _2156 * _2180;
            float _2246 = _2236 * _2236;
            float _2248 = _2158 * _2180;
            float _2250 = _2152 * _2180;
            bool _2252 = _1954 <= 0.891006529331207275390625;
            bool _2254 = !_2234;
            bool _2256 = _2252 || _2254;
            float _2258 = fma(_2238, _2238, _2246);
            float _2260 = _2214 ? _2244 : 0.0;
            float _2262 = _2222 * 6.283185482025146484375;
            float _2264 = cos(_2262);
            float _2266 = _2214 ? _2248 : 0.0;
            float _2268 = _2214 ? _2250 : 0.0;
            float _2270 = sqrt(_2258);
            float _2272 = _2260 * _2242;
            _1784 = _2264;
            _1786 = _2180;
            _1736 = _2222;
            _1788 = _2174;
            _2056 = _2256;
            if (_2256)
            {
                float _2274 = _1948 + (-1000.0);
                _1974 = _2274;
            }
            float _2276 = _1974;
            float _2278 = rsqrt(_2258);
            float _2280 = _2270 * 0.5;
            bool _2282 = _2270 != 0.0;
            bool _2284 = isnan(_2270);
            bool _2286 = _2282 || _2284;
            bool _2288 = isnan(0.0);
            bool _2290 = _2286 || _2288;
            float _2292 = _2266 * _2242;
            float _2294 = _2268 * _2242;
            float _2296 = _2280 * 0.15915493667125701904296875;
            float _2298 = _2296 * 6.283185482025146484375;
            float _2300 = sin(_2298);
            float _2302 = _2236 * _2278;
            float _2304 = _2238 * _2278;
            float _2306 = _2290 ? _2302 : 0.0;
            float _2308 = _2296 * 6.283185482025146484375;
            float _2310 = cos(_2308);
            float _2312 = _2290 ? _2304 : 0.0;
            float _2314 = _2306 * _2300;
            float _2316 = _2312 * _2300;
            float _2318 = _2314 * _2272;
            float _2320 = _2314 * _2292;
            float _2322 = _2310 * _2272;
            float _2324 = _2310 * _2292;
            float _2326 = -_2318;
            float _2328 = fma(_2316, _2292, _2326);
            float _2330 = fma(_2316, _2272, _2320);
            float _2332 = fma(_2316, _2264, _2322);
            float _2334 = fma(_2314, _2264, _2324);
            float _2336 = fma(_2310, _2294, _2328);
            float _2338 = -_2330;
            float _2340 = fma(_2310, _2264, _2338);
            float _2342 = fma(_2314, _2294, _2332);
            float _2344 = -_2316;
            float _2346 = fma(_2344, _2294, _2334);
            _2038 = _2316;
            _2040 = _2328;
            _2042 = _2334;
            _2044 = _2324;
            _2046 = _2330;
            _1854 = _2322;
            _1856 = _2296;
            _2048 = _2276;
            _2050 = _2346;
            _2052 = _2342;
            _2054 = _2340;
            _1976 = _2276;
            _2058 = _2336;
            _2060 = _2314;
            _2062 = 1.0;
        }
        _2064 = false;
        float _2348 = _2038;
        float _2350 = _2040;
        float _2352 = _2042;
        float _2354 = _2044;
        float _2356 = _2046;
        float _2358 = _1784;
        float _2360 = _1852;
        float _2362 = _1854;
        float _2364 = _1856;
        float _2366 = _1786;
        float _2368 = _1736;
        float _2370 = _1788;
        float _2372 = _2048;
        float _2374 = _2050;
        float _2376 = _2052;
        float _2378 = _2054;
        float _2380 = _1976;
        bool _2382 = _2056;
        float _2384 = _2058;
        float _2386 = _2060;
        float _2388 = _2062;
        bool _2390 = !_786;
        bool _2392 = _2382;
        float _2394 = _2352;
        float _2396 = _2354;
        float _2398 = _2386;
        float _2400 = _2380;
        float _2402 = _2348;
        float _2404 = _2350;
        _1642 = _2356;
        _1126 = _2358;
        _1128 = _2360;
        _1130 = _2362;
        _1594 = _2364;
        _1596 = _2366;
        _1598 = _2368;
        _1600 = _2370;
        _1654 = as_type<int>(_2372);
        _1612 = _2384;
        _1644 = _2388;
        if (!_2390)
        {
            float _2406 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _2408 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _2410 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _2412 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _2414 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[28]);
            float _2416 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[29]);
            float _2418 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[30]);
            float _2420 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[31]);
            float _2422 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _2424 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _2426 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _2428 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _2430 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _2432 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _2434 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _2436 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _2438 = _2412 * _2418;
            float _2440 = _2412 * _2416;
            float _2442 = _2412 * _2414;
            float _2444 = _2428 * _2418;
            float _2446 = _2428 * _2416;
            float _2448 = _2428 * _2414;
            float _2450 = _2428 * _2408;
            float _2452 = _2428 * _2410;
            float _2454 = _2428 * _2406;
            float _2456 = -_2438;
            float _2458 = fma(_2410, _2420, _2456);
            float _2460 = -_2440;
            float _2462 = fma(_2408, _2420, _2460);
            float _2464 = -_2442;
            float _2466 = fma(_2406, _2420, _2464);
            float _2468 = -_2444;
            float _2470 = fma(_2426, _2420, _2468);
            float _2472 = -_2446;
            float _2474 = fma(_2424, _2420, _2472);
            float _2476 = -_2448;
            float _2478 = fma(_2422, _2420, _2476);
            float _2480 = _2410 * _2416;
            float _2482 = _2410 * _2414;
            float _2484 = _2408 * _2414;
            float _2486 = -_2450;
            float _2488 = fma(_2424, _2412, _2486);
            float _2490 = _2426 * _2416;
            float _2492 = -_2452;
            float _2494 = fma(_2426, _2412, _2492);
            float _2496 = -_2454;
            float _2498 = fma(_2422, _2412, _2496);
            float _2500 = _2426 * _2414;
            float _2502 = -_2480;
            float _2504 = fma(_2408, _2418, _2502);
            float _2506 = -_2482;
            float _2508 = fma(_2406, _2418, _2506);
            float _2510 = _2426 * _2408;
            float _2512 = _2426 * _2406;
            float _2514 = -_2484;
            float _2516 = fma(_2406, _2416, _2514);
            float _2518 = -_2490;
            float _2520 = fma(_2424, _2418, _2518);
            float _2522 = _2424 * _2406;
            float _2524 = _2426 * _2466;
            float _2526 = -_2500;
            float _2528 = fma(_2422, _2418, _2526);
            float _2530 = -_2510;
            float _2532 = fma(_2424, _2410, _2530);
            float _2534 = -_2522;
            float _2536 = fma(_2422, _2408, _2534);
            float _2538 = _2426 * _2462;
            float _2540 = -_2524;
            float _2542 = fma(_2422, _2458, _2540);
            float _2544 = _2424 * _2414;
            float _2546 = _2424 * _2466;
            float _2548 = -_2538;
            float _2550 = fma(_2424, _2458, _2548);
            float _2552 = fma(_2428, _2508, _2542);
            float _2554 = -_2544;
            float _2556 = fma(_2422, _2416, _2554);
            float _2558 = -_2546;
            float _2560 = fma(_2422, _2462, _2558);
            float _2562 = _2424 * _2508;
            float _2564 = fma(_2428, _2504, _2550);
            float _2566 = _2432 * _2552;
            float _2568 = -_2512;
            float _2570 = fma(_2422, _2410, _2568);
            float _2572 = _2434 * _2462;
            float _2574 = -_2562;
            float _2576 = fma(_2422, _2504, _2574);
            float _2578 = fma(_2428, _2516, _2560);
            float _2580 = -_2566;
            float _2582 = fma(_2430, _2564, _2580);
            float _2584 = -_2572;
            float _2586 = fma(_2432, _2458, _2584);
            float _2588 = fma(_2426, _2516, _2576);
            float _2590 = _2434 * _2466;
            float _2592 = fma(_2434, _2578, _2582);
            float _2594 = _2432 * _2466;
            float _2596 = _2434 * _2478;
            float _2598 = -_2590;
            float _2600 = fma(_2430, _2458, _2598);
            float _2602 = -_2436;
            float _2604 = fma(_2602, _2588, _2592);
            float _2606 = _2434 * _2474;
            float _2608 = -_2594;
            float _2610 = fma(_2430, _2462, _2608);
            float _2612 = _2432 * _2478;
            float _2614 = 1.0 / _2604;
            float _2616 = -_2606;
            float _2618 = fma(_2432, _2470, _2616);
            float _2620 = fma(_2436, _2504, _2586);
            float _2622 = fma(_2436, _2516, _2610);
            float _2624 = -_2596;
            float _2626 = fma(_2430, _2470, _2624);
            float _2628 = _2434 * _2488;
            float _2630 = _2434 * _2498;
            float _2632 = _2432 * _2498;
            float _2634 = -_2612;
            float _2636 = fma(_2430, _2474, _2634);
            float _2638 = fma(_2436, _2508, _2600);
            float _2640 = -_2628;
            float _2642 = fma(_2432, _2494, _2640);
            float _2644 = -_2630;
            float _2646 = fma(_2430, _2494, _2644);
            float _2648 = -_2632;
            float _2650 = fma(_2430, _2488, _2648);
            float _2652 = fma(_2436, _2520, _2618);
            float _2654 = fma(_2436, _2528, _2626);
            float _2656 = fma(_2436, _2556, _2636);
            float _2658 = _2620 * _2614;
            float _2660 = _2552 * _2614;
            float _2662 = _2622 * _2614;
            float _2664 = _2564 * _2614;
            float _2666 = _2638 * _2614;
            float _2668 = _2578 * _2614;
            float _2670 = _2660 * _1540;
            float _2672 = _2658 * _2372;
            float _2674 = _2662 * _2372;
            float _2676 = _2652 * _2614;
            float _2678 = -_2670;
            float _2680 = fma(_2666, _2372, _2678);
            float _2682 = -_2672;
            float _2684 = fma(_2664, _1540, _2682);
            float _2686 = -_2674;
            float _2688 = fma(_2668, _1540, _2686);
            float _2690 = _2654 * _2614;
            float _2692 = _2656 * _2614;
            float _2694 = fma(_2436, _2532, _2642);
            float _2696 = fma(_2436, _2570, _2646);
            float _2698 = fma(_2436, _2536, _2650);
            float _2700 = fma(_2676, _1542, _2684);
            float _2702 = -_2690;
            float _2704 = fma(_2702, _1542, _2680);
            float _2706 = fma(_2692, _1542, _2688);
            float _2708 = -_2694;
            float _2710 = fma(_2708, _2614, _2700);
            float _2712 = fma(_2696, _2614, _2704);
            float _2714 = -_2698;
            float _2716 = fma(_2714, _2614, _2706);
            _1642 = _2668;
            _1126 = _2706;
            _1128 = _2658;
            _1130 = _2612;
            _1594 = _2676;
            _1596 = _2614;
            _1598 = _2694;
            _1600 = _2428;
            _1602 = _2666;
            _1422 = _2432;
            _1604 = _2692;
            _1424 = _2436;
            _1620 = _2378;
            _1636 = true;
            _1650 = as_type<int>(_2710);
            _1608 = _2376;
            _1616 = _2374;
            _1654 = as_type<int>(_2712);
            _1662 = as_type<int>(_2716);
            _1664 = _2478;
            _1666 = _2532;
            _1668 = _2488;
            _1624 = 0.0;
            _1628 = 0.0;
            _1632 = 0.0;
            _2718 = true;
        }
        else
        {
            bool _2720 = !_1022;
            if (!_2720)
            {
                float _2722 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                uint _2724 = uint(int(uint(_172) >> uint(2)));
                float _2726 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2724)]);
                int _2728 = _172 + 4;
                uint _2730 = uint(int(uint(_2728) >> uint(2)));
                float _2732 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2730)]);
                int _2734 = _172 + 8;
                uint _2736 = uint(int(uint(_2734) >> uint(2)));
                float _2738 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2736)]);
                uint _2740 = uint(int(uint(_172) >> uint(2)));
                float _2742 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2740)]);
                int _2744 = _172 + 4;
                uint _2746 = uint(int(uint(_2744) >> uint(2)));
                float _2748 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2746)]);
                int _2750 = _172 + 8;
                uint _2752 = uint(int(uint(_2750) >> uint(2)));
                float _2754 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2752)]);
                uint _2756 = uint(int(uint(_172) >> uint(2)));
                float _2758 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2756)]);
                int _2760 = _172 + 4;
                uint _2762 = uint(int(uint(_2760) >> uint(2)));
                float _2764 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2762)]);
                int _2766 = _172 + 8;
                uint _2768 = uint(int(uint(_2766) >> uint(2)));
                float _2770 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2768)]);
                float _2772 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _2774 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _2776 = _2738 * _2742;
                float _2778 = _2738 * _2748;
                float _2780 = -_2776;
                float _2782 = fma(_2726, _2754, _2780);
                float _2784 = _2732 * _2742;
                float _2786 = -_2778;
                float _2788 = fma(_2732, _2754, _2786);
                float _2790 = _2764 * _2782;
                float _2792 = -_2784;
                float _2794 = fma(_2726, _2748, _2792);
                float _2796 = -_2790;
                float _2798 = fma(_2758, _2788, _2796);
                float _2800 = fma(_2770, _2794, _2798);
                float _2802 = 1.0 / _2800;
                float _2804 = _2722 * _2754;
                float _2806 = _2722 * _2748;
                float _2808 = _2722 * _2742;
                float _2810 = _2764 * _2754;
                float _2812 = _2770 * _2742;
                float _2814 = -_2806;
                float _2816 = fma(_2732, _2772, _2814);
                float _2818 = _2758 * _2748;
                float _2820 = -_2810;
                float _2822 = fma(_2770, _2748, _2820);
                float _2824 = -_2804;
                float _2826 = fma(_2738, _2772, _2824);
                float _2828 = -_2808;
                float _2830 = fma(_2726, _2772, _2828);
                float _2832 = _2770 * _2732;
                float _2834 = _2758 * _2738;
                float _2836 = -_2812;
                float _2838 = fma(_2758, _2754, _2836);
                float _2840 = _2764 * _2726;
                float _2842 = -_2818;
                float _2844 = fma(_2764, _2742, _2842);
                float _2846 = -_2832;
                float _2848 = fma(_2764, _2738, _2846);
                float _2850 = -_2726;
                float _2852 = fma(_2850, _2754, _2776);
                float _2854 = -_2834;
                float _2856 = fma(_2770, _2726, _2854);
                float _2858 = _2770 * _2816;
                float _2860 = _2822 * _2802;
                float _2862 = _2838 * _2802;
                float _2864 = -_2840;
                float _2866 = fma(_2758, _2732, _2864);
                float _2868 = _2844 * _2802;
                float _2870 = _2770 * _2830;
                float _2872 = _2764 * _2830;
                float _2874 = -_2858;
                float _2876 = fma(_2764, _2826, _2874);
                float _2878 = _2860 * _2372;
                float _2880 = _2862 * _2372;
                float _2882 = _2868 * _2372;
                float _2884 = _2852 * _2802;
                float _2886 = _2788 * _2802;
                float _2888 = _2794 * _2802;
                float _2890 = -_2870;
                float _2892 = fma(_2758, _2826, _2890);
                float _2894 = fma(_2884, _1540, _2880);
                float _2896 = fma(_2886, _1540, _2878);
                float _2898 = fma(_2888, _1540, _2882);
                float _2900 = _2856 * _2802;
                float _2902 = _2848 * _2802;
                float _2904 = _2866 * _2802;
                float _2906 = -_2872;
                float _2908 = fma(_2758, _2816, _2906);
                float _2910 = fma(_2900, _1542, _2894);
                float _2912 = fma(_2902, _1542, _2896);
                float _2914 = fma(_2774, _2782, _2892);
                float _2916 = fma(_2774, _2788, _2876);
                float _2918 = fma(_2904, _1542, _2898);
                float _2920 = fma(_2774, _2794, _2908);
                float _2922 = fma(_2914, _2802, _2910);
                float _2924 = -_2916;
                float _2926 = fma(_2924, _2802, _2912);
                float _2928 = -_2920;
                float _2930 = fma(_2928, _2802, _2918);
                _1642 = _2904;
                _1126 = _2848;
                _1128 = _2754;
                _1130 = _2852;
                _1594 = _2920;
                _1596 = _2912;
                _1598 = _2770;
                _1600 = _2894;
                _1602 = _2782;
                _1422 = _2822;
                _1604 = _2802;
                _1424 = _2856;
                _1620 = _2378;
                _1636 = true;
                _1650 = as_type<int>(_2926);
                _1608 = _2376;
                _1616 = _2374;
                _1654 = as_type<int>(_2922);
                _1662 = as_type<int>(_2930);
                _1664 = 0.0;
                _1666 = 0.0;
                _1668 = 0.0;
                _1624 = 0.0;
                _1628 = 0.0;
                _1632 = 0.0;
                _2718 = true;
            }
            else
            {
                if (!_1102)
                {
                    _2392 = true;
                }
                bool _2932 = _2392;
                _1636 = _2932;
                if (!_1102)
                {
                    _2394 = 0.0;
                    _2396 = 0.0;
                }
                float _2934 = _2394;
                float _2936 = _2396;
                _1624 = _2934;
                _1628 = _2936;
                if (!_1102)
                {
                    _2398 = 0.0;
                }
                float _2938 = _2398;
                _1632 = _2938;
                if (!_1102)
                {
                    _2400 = _2376;
                }
                float _2940 = _2400;
                _1608 = _2940;
                if (!_1102)
                {
                    _2402 = _2374;
                }
                float _2942 = _2402;
                _1616 = _2942;
                if (!_1102)
                {
                    _2404 = _2378;
                }
                float _2944 = _2404;
                _1620 = _2944;
                if (!_1102)
                {
                    _1648 = as_type<int>(_1540);
                }
                int _2946 = _1648;
                _1650 = _2946;
                if (!_1102)
                {
                    _1660 = as_type<int>(_1542);
                }
                int _2948 = _1660;
                bool _2950 = !_1102;
                _1662 = _2948;
                _1664 = 0.0;
                _1666 = 0.0;
                _1668 = 0.0;
                if (!_2950)
                {
                    uint _2952 = uint(int(uint(_172) >> uint(2)));
                    float _2954 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2952)]);
                    int _2956 = _172 + 4;
                    uint _2958 = uint(int(uint(_2956) >> uint(2)));
                    float _2960 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2958)]);
                    int _2962 = _172 + 8;
                    uint _2964 = uint(int(uint(_2962) >> uint(2)));
                    float _2966 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2964)]);
                    int _2968 = _172 + 12;
                    uint _2970 = uint(int(uint(_2968) >> uint(2)));
                    float _2972 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2970)]);
                    uint _2974 = uint(int(uint(_172) >> uint(2)));
                    float _2976 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2974)]);
                    int _2978 = _172 + 4;
                    uint _2980 = uint(int(uint(_2978) >> uint(2)));
                    float _2982 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2980)]);
                    int _2984 = _172 + 8;
                    uint _2986 = uint(int(uint(_2984) >> uint(2)));
                    float _2988 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2986)]);
                    int _2990 = _172 + 12;
                    uint _2992 = uint(int(uint(_2990) >> uint(2)));
                    float _2994 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2992)]);
                    uint _2996 = uint(int(uint(_172) >> uint(2)));
                    float _2998 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2996)]);
                    int _3000 = _172 + 4;
                    uint _3002 = uint(int(uint(_3000) >> uint(2)));
                    float _3004 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3002)]);
                    int _3006 = _172 + 8;
                    uint _3008 = uint(int(uint(_3006) >> uint(2)));
                    float _3010 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3008)]);
                    int _3012 = _172 + 12;
                    uint _3014 = uint(int(uint(_3012) >> uint(2)));
                    float _3016 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3014)]);
                    float _3018 = _2966 * _2976;
                    float _3020 = _2966 * _2982;
                    float _3022 = _2960 * _2976;
                    float _3024 = _2988 * _2972;
                    float _3026 = -_3018;
                    float _3028 = fma(_2954, _2988, _3026);
                    float _3030 = -_3020;
                    float _3032 = fma(_2960, _2988, _3030);
                    float _3034 = -_3022;
                    float _3036 = fma(_2954, _2982, _3034);
                    float _3038 = _2982 * _2972;
                    float _3040 = _3004 * _3028;
                    float _3042 = _2976 * _2972;
                    float _3044 = _3004 * _2988;
                    float _3046 = -_3024;
                    float _3048 = fma(_2966, _2994, _3046);
                    float _3050 = -_3040;
                    float _3052 = fma(_2998, _3032, _3050);
                    float _3054 = -_3038;
                    float _3056 = fma(_2960, _2994, _3054);
                    float _3058 = -_3042;
                    float _3060 = fma(_2954, _2994, _3058);
                    float _3062 = -_3044;
                    float _3064 = fma(_3010, _2982, _3062);
                    float _3066 = fma(_3010, _3036, _3052);
                    float _3068 = _2998 * _2982;
                    float _3070 = _3010 * _2976;
                    float _3072 = _3010 * _2960;
                    float _3074 = _2998 * _2966;
                    float _3076 = -_2954;
                    float _3078 = fma(_3076, _2988, _3018);
                    float _3080 = 1.0 / _3066;
                    float _3082 = -_3070;
                    float _3084 = fma(_2998, _2988, _3082);
                    float _3086 = -_3068;
                    float _3088 = fma(_3004, _2976, _3086);
                    float _3090 = -_3072;
                    float _3092 = fma(_3004, _2966, _3090);
                    float _3094 = -_3074;
                    float _3096 = fma(_3010, _2954, _3094);
                    float _3098 = _3004 * _2954;
                    float _3100 = _3004 * _3060;
                    float _3102 = _3010 * _3056;
                    float _3104 = _3010 * _3060;
                    float _3106 = -_3098;
                    float _3108 = fma(_2998, _2960, _3106);
                    float _3110 = -_3100;
                    float _3112 = fma(_2998, _3056, _3110);
                    float _3114 = -_3102;
                    float _3116 = fma(_3004, _3048, _3114);
                    float _3118 = -_3104;
                    float _3120 = fma(_2998, _3048, _3118);
                    float _3122 = fma(_3036, _3016, _3112);
                    float _3124 = fma(_3032, _3016, _3116);
                    float _3126 = _3064 * _3080;
                    float _3128 = _3084 * _3080;
                    float _3130 = _3088 * _3080;
                    float _3132 = _3078 * _3080;
                    float _3134 = _3126 * _2372;
                    float _3136 = _3128 * _2372;
                    float _3138 = _3032 * _3080;
                    float _3140 = _3130 * _2372;
                    float _3142 = _3036 * _3080;
                    float _3144 = fma(_3132, _1540, _3136);
                    float _3146 = fma(_3138, _1540, _3134);
                    float _3148 = _3096 * _3080;
                    float _3150 = _3092 * _3080;
                    float _3152 = fma(_3142, _1540, _3140);
                    float _3154 = _3108 * _3080;
                    float _3156 = fma(_3148, _1542, _3144);
                    float _3158 = fma(_3150, _1542, _3146);
                    float _3160 = fma(_3028, _3016, _3120);
                    float _3162 = fma(_3154, _1542, _3152);
                    float _3164 = -_3124;
                    float _3166 = fma(_3164, _3080, _3158);
                    float _3168 = fma(_3160, _3080, _3156);
                    float _3170 = -_3122;
                    float _3172 = fma(_3170, _3080, _3162);
                    _1642 = _3150;
                    _1126 = _3098;
                    _1128 = _3128;
                    _1130 = _3070;
                    _1594 = _2998;
                    _1596 = _3004;
                    _1598 = _3160;
                    _1600 = _3016;
                    _1602 = _3132;
                    _1422 = _3048;
                    _1604 = _3148;
                    _1424 = _3060;
                    _1620 = _2378;
                    _1636 = true;
                    _1650 = as_type<int>(_3166);
                    _1608 = _2376;
                    _1616 = _2374;
                    _1654 = as_type<int>(_3168);
                    _1662 = as_type<int>(_3172);
                    _1664 = 0.0;
                    _1666 = 0.0;
                    _1668 = 0.0;
                    _1624 = 0.0;
                    _1628 = 0.0;
                    _1632 = 0.0;
                }
            }
        }
    }
    _2718 = false;
    float _3174 = _1642;
    float _3176 = _1126;
    float _3178 = _1128;
    float _3180 = _1130;
    float _3182 = _1594;
    float _3184 = _1596;
    float _3186 = _1598;
    float _3188 = _1600;
    float _3190 = _1602;
    float _3192 = _1422;
    float _3194 = _1604;
    float _3196 = _1424;
    float _3198 = _1620;
    bool _3200 = _1636;
    int _3202 = _1650;
    float _3204 = _1608;
    float _3206 = _1616;
    int _3208 = _1654;
    float _3210 = _1612;
    int _3212 = _1662;
    float _3214 = _1664;
    float _3216 = _1666;
    float _3218 = _1668;
    float _3220 = _1624;
    float _3222 = _1628;
    float _3224 = _1632;
    float _3226 = _1644;
    float _3228 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _3230 = _3174;
    float _3232 = _3176;
    float _3234 = _3178;
    float _3236 = _3180;
    float _3238 = _3216;
    float _3240 = _3218;
    float _3242 = _3214;
    float _3244 = as_type<float>(_3212);
    float _3246 = _3222;
    float _3248 = _3220;
    if (_786)
    {
        float _3250 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _3252 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _3254 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _3256 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _3230 = _3250;
        _3232 = _3252;
        _3234 = _3254;
        _3236 = _3256;
    }
    float _3258 = _3230;
    float _3260 = _3232;
    float _3262 = _3234;
    float _3264 = _3236;
    float _3266 = _3182;
    float _3268 = _3184;
    float _3270 = _3186;
    float _3272 = _3188;
    if (_786)
    {
        float _3274 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _3276 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _3278 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _3280 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _3266 = _3274;
        _3268 = _3276;
        _3270 = _3278;
        _3272 = _3280;
    }
    float _3282 = _3266;
    float _3284 = _3268;
    float _3286 = _3270;
    float _3288 = _3272;
    float _3290 = _3190;
    float _3292 = _3192;
    float _3294 = _3194;
    float _3296 = _3196;
    if (_786)
    {
        float _3298 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _3300 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _3302 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _3304 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _3290 = _3298;
        _3292 = _3300;
        _3294 = _3302;
        _3296 = _3304;
    }
    float _3306 = _3290;
    float _3308 = _3292;
    float _3310 = _3294;
    float _3312 = _3296;
    float _3314 = _3198 * 2.0;
    float _3316 = _3200 ? as_type<float>(_3202) : _710;
    float _3318 = _3204 * _3204;
    float _3320 = _3318 * 2.0;
    float _3322 = _3200 ? as_type<float>(_1562) : _760;
    float _3324 = _3204 * 2.0;
    float _3326 = _3200 ? as_type<float>(_1562) : _348;
    float _3328 = _3314 * _3206;
    float _3330 = _3200 ? as_type<float>(_3208) : _872;
    float _3332 = _3200 ? as_type<float>(_3208) : _1580;
    float _3334 = _3200 ? as_type<float>(_1564) : _766;
    float _3336 = _3210 * 2.0;
    float _3338 = _3200 ? as_type<float>(_3202) : _1576;
    float _3340 = fma(_3324, _3210, _3328);
    float _3342 = _3200 ? as_type<float>(_1564) : _350;
    float _3344 = -_3328;
    float _3346 = fma(_3324, _3210, _3344);
    float _3348 = _3200 ? as_type<float>(_3212) : _722;
    float _3350 = _3206 * 2.0;
    float _3352 = _3200 ? as_type<float>(_1566) : _772;
    float _3354 = _3314 * _3210;
    float _3356 = _3200 ? as_type<float>(_1566) : _352;
    float _3358 = _3314 * _3204;
    float _3360 = -_3354;
    float _3362 = fma(_3350, _3204, _3360);
    float _3364 = fma(_3350, _3204, _3354);
    float _3366 = fma(_3336, _3206, _3358);
    float _3368 = -_3358;
    float _3370 = fma(_3336, _3206, _3368);
    float _3372 = _3210 * _3210;
    float _3374 = _3206 * _3206;
    float _3376 = _3200 ? as_type<float>(_3212) : _1582;
    float _3378 = fma(_3372, -2.0, 1.0);
    float _3380 = fma(_3374, -2.0, 1.0);
    float _3382 = fma(_3374, -2.0, _3378);
    float _3384 = -_3320;
    float _3386 = _3384 + _3380;
    float _3388 = fma(_3334, _3228, _3330);
    float _3390 = fma(_3352, _3228, _3348);
    float _3392 = fma(_3322, _3228, _3316);
    float _3394 = _3354;
    float _3396 = _3352;
    float _3398 = _3258;
    float _3400 = _3316;
    float _3402 = _3372;
    float _3404 = _3374;
    float _3406 = _3322;
    float _3408 = _3330;
    float _3410 = _3260;
    float _3412 = _3262;
    float _3414 = _3264;
    float _3416 = _3356;
    float _3418 = _3332;
    if (_786)
    {
        float _3420 = _3388 * _3260;
        _3394 = _3420;
    }
    float _3422 = _3394;
    float _3424 = _3308;
    float _3426 = _3286;
    float _3428 = _3310;
    float _3430 = _3284;
    float _3432 = _3288;
    if (_786)
    {
        float _3434 = _3388 * _3284;
        _3396 = _3434;
    }
    float _3436 = _3396;
    float _3438 = _3436;
    if (_786)
    {
        float _3440 = fma(_3392, _3258, _3422);
        _3398 = _3440;
    }
    float _3442 = _3398;
    float _3444 = -_3320;
    float _3446 = _3444 + 1.0;
    float _3448 = _3442;
    float _3450 = _3446;
    if (_786)
    {
        float _3452 = _3388 * _3308;
        _3424 = _3452;
    }
    float _3454 = _3424;
    float _3456 = _3454;
    if (_786)
    {
        float _3458 = fma(_3392, _3282, _3436);
        _3400 = _3458;
    }
    float _3460 = _3400;
    float _3462 = _3460;
    if (_786)
    {
        float _3464 = fma(_3390, _3262, _3442);
        _3448 = _3464;
    }
    float _3466 = _3448;
    float _3468 = fma(_3372, -2.0, _3446);
    float _3470 = _3466;
    if (_786)
    {
        float _3472 = fma(_3392, _3306, _3454);
        _3456 = _3472;
    }
    float _3474 = _3456;
    float _3476 = _3474;
    if (_786)
    {
        float _3478 = fma(_3390, _3286, _3460);
        _3426 = _3478;
    }
    float _3480 = _3426;
    if (_786)
    {
        float _3482 = _3466 + _3264;
        _3238 = _3482;
    }
    float _3484 = _3238;
    float _3486 = _3484;
    float _3488 = _3484;
    if (_786)
    {
        float _3490 = fma(_3390, _3310, _3474);
        _3428 = _3490;
    }
    float _3492 = _3428;
    if (_786)
    {
        float _3494 = _3480 + _3288;
        _3240 = _3494;
    }
    float _3496 = _3240;
    float _3498 = _3496;
    float _3500 = _3496;
    if (_786)
    {
        float _3502 = _3492 + _3312;
        _3242 = _3502;
    }
    float _3504 = _3242;
    float _3506 = _3504;
    float _3508 = _3504;
    if (!_786)
    {
        bool _3510 = !_1022;
        if (!_3510)
        {
            float _3512 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            uint _3514 = uint(int(uint(_172) >> uint(2)));
            float _3516 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3514)]);
            int _3518 = _172 + 4;
            uint _3520 = uint(int(uint(_3518) >> uint(2)));
            float _3522 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3520)]);
            int _3524 = _172 + 8;
            uint _3526 = uint(int(uint(_3524) >> uint(2)));
            float _3528 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3526)]);
            int _3530 = _172 + 12;
            uint _3532 = uint(int(uint(_3530) >> uint(2)));
            float _3534 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3532)]);
            uint _3536 = uint(int(uint(_172) >> uint(2)));
            float _3538 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3536)]);
            int _3540 = _172 + 4;
            uint _3542 = uint(int(uint(_3540) >> uint(2)));
            float _3544 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3542)]);
            int _3546 = _172 + 8;
            uint _3548 = uint(int(uint(_3546) >> uint(2)));
            float _3550 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3548)]);
            int _3552 = _172 + 12;
            uint _3554 = uint(int(uint(_3552) >> uint(2)));
            float _3556 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3554)]);
            uint _3558 = uint(int(uint(_172) >> uint(2)));
            float _3560 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3558)]);
            int _3562 = _172 + 4;
            uint _3564 = uint(int(uint(_3562) >> uint(2)));
            float _3566 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3564)]);
            int _3568 = _172 + 8;
            uint _3570 = uint(int(uint(_3568) >> uint(2)));
            float _3572 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3570)]);
            int _3574 = _172 + 12;
            uint _3576 = uint(int(uint(_3574) >> uint(2)));
            float _3578 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3576)]);
            float _3580 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _3582 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _3584 = _3522 * _3388;
            float _3586 = _3544 * _3388;
            float _3588 = _3566 * _3388;
            float _3590 = fma(_3516, _3392, _3584);
            float _3592 = fma(_3538, _3392, _3586);
            float _3594 = fma(_3560, _3392, _3588);
            float _3596 = fma(_3528, _3390, _3590);
            float _3598 = fma(_3550, _3390, _3592);
            float _3600 = fma(_3572, _3390, _3594);
            float _3602 = _3512 + _3596;
            float _3604 = _3580 + _3598;
            float _3606 = _3582 + _3600;
            _3450 = _3516;
            _3402 = _3596;
            _3438 = _3528;
            _3404 = _3534;
            _3406 = _3538;
            _3462 = _3598;
            _958 = _3550;
            _3408 = _3556;
            _3470 = _3560;
            _3410 = _3600;
            _3412 = _3572;
            _3414 = _3578;
            _3488 = _3602;
            _3508 = _3606;
            _3500 = _3604;
            _3608 = true;
        }
        else
        {
            if (!_1102)
            {
                _3486 = _3392;
            }
            float _3610 = _3486;
            _3488 = _3610;
            if (!_1102)
            {
                _3498 = _3388;
            }
            float _3612 = _3498;
            _3500 = _3612;
            if (!_1102)
            {
                _3506 = _3390;
            }
            float _3614 = _3506;
            bool _3616 = !_1102;
            _3508 = _3614;
            if (!_3616)
            {
                uint _3618 = uint(int(uint(_172) >> uint(2)));
                float _3620 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3618)]);
                int _3622 = _172 + 4;
                uint _3624 = uint(int(uint(_3622) >> uint(2)));
                float _3626 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3624)]);
                int _3628 = _172 + 8;
                uint _3630 = uint(int(uint(_3628) >> uint(2)));
                float _3632 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3630)]);
                int _3634 = _172 + 12;
                uint _3636 = uint(int(uint(_3634) >> uint(2)));
                float _3638 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3636)]);
                uint _3640 = uint(int(uint(_172) >> uint(2)));
                float _3642 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3640)]);
                int _3644 = _172 + 4;
                uint _3646 = uint(int(uint(_3644) >> uint(2)));
                float _3648 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3646)]);
                int _3650 = _172 + 8;
                uint _3652 = uint(int(uint(_3650) >> uint(2)));
                float _3654 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3652)]);
                int _3656 = _172 + 12;
                uint _3658 = uint(int(uint(_3656) >> uint(2)));
                float _3660 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3658)]);
                uint _3662 = uint(int(uint(_172) >> uint(2)));
                float _3664 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3662)]);
                int _3666 = _172 + 4;
                uint _3668 = uint(int(uint(_3666) >> uint(2)));
                float _3670 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3668)]);
                int _3672 = _172 + 8;
                uint _3674 = uint(int(uint(_3672) >> uint(2)));
                float _3676 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3674)]);
                int _3678 = _172 + 12;
                uint _3680 = uint(int(uint(_3678) >> uint(2)));
                float _3682 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3680)]);
                float _3684 = _3626 * _3388;
                float _3686 = _3648 * _3388;
                float _3688 = _3670 * _3388;
                float _3690 = fma(_3620, _3392, _3684);
                float _3692 = fma(_3642, _3392, _3686);
                float _3694 = fma(_3664, _3392, _3688);
                float _3696 = fma(_3632, _3390, _3690);
                float _3698 = fma(_3654, _3390, _3692);
                float _3700 = fma(_3676, _3390, _3694);
                float _3702 = _3696 + _3638;
                float _3704 = _3698 + _3660;
                float _3706 = _3700 + _3682;
                _3450 = _3620;
                _3402 = _3690;
                _3438 = _3696;
                _3404 = _3638;
                _3406 = _3642;
                _3462 = _3692;
                _958 = _3698;
                _3408 = _3660;
                _3470 = _3664;
                _3410 = _3694;
                _3412 = _3700;
                _3414 = _3682;
                _3488 = _3702;
                _3508 = _3706;
                _3500 = _3704;
            }
        }
    }
    _3608 = false;
    float _3708 = _3450;
    float _3710 = _3402;
    float _3712 = _3438;
    float _3714 = _3404;
    float _3716 = _3406;
    float _3718 = _3462;
    float _3720 = _958;
    float _3722 = _3408;
    float _3724 = _3470;
    float _3726 = _3410;
    float _3728 = _3412;
    float _3730 = _3414;
    float _3732 = _3488;
    float _3734 = _3508;
    float _3736 = _3500;
    float _3738 = _3708;
    float _3740 = _3710;
    float _3742 = _3712;
    float _3744 = _3714;
    if (_786)
    {
        float _3746 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _3748 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _3750 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _3752 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _3738 = _3746;
        _3740 = _3748;
        _3742 = _3750;
        _3744 = _3752;
    }
    float _3754 = _3738;
    float _3756 = _3740;
    float _3758 = _3742;
    float _3760 = _3744;
    float _3762 = _3716;
    float _3764 = _3718;
    float _3766 = _3720;
    float _3768 = _3722;
    if (_786)
    {
        float _3770 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _3772 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _3774 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _3776 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _3762 = _3770;
        _3764 = _3772;
        _3766 = _3774;
        _3768 = _3776;
    }
    float _3778 = _3762;
    float _3780 = _3764;
    float _3782 = _3766;
    float _3784 = _3768;
    float _3786 = _3724;
    float _3788 = _3726;
    float _3790 = _3728;
    float _3792 = _3730;
    if (_786)
    {
        float _3794 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _3796 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _3798 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _3800 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _3786 = _3794;
        _3788 = _3796;
        _3790 = _3798;
        _3792 = _3800;
    }
    float _3802 = _3786;
    float _3804 = _3788;
    float _3806 = _3790;
    float _3808 = _3792;
    float _3810 = _3342 * 59.999996185302734375;
    float _3812 = _3326 * 59.999996185302734375;
    float _3814 = _3356 * 59.999996185302734375;
    float _3816 = _3760;
    float _3818 = _3756;
    float _3820 = _3758;
    float _3822 = _3756;
    float _3824 = _3758;
    if (_786)
    {
        float _3826 = _3810 * _3756;
        _3816 = _3826;
    }
    float _3828 = _3816;
    float _3830 = _3784;
    float _3832 = _3828;
    float _3834 = _3780;
    float _3836 = _3782;
    float _3838 = _3778;
    float _3840 = _3780;
    float _3842 = _3782;
    if (_786)
    {
        float _3844 = _3810 * _3780;
        _3830 = _3844;
    }
    float _3846 = _3830;
    float _3848 = _3846;
    if (_786)
    {
        float _3850 = fma(_3812, _3754, _3828);
        _3832 = _3850;
    }
    float _3852 = _3832;
    float _3854 = _3808;
    float _3856 = _3852;
    float _3858 = _3804;
    float _3860 = _3806;
    if (_786)
    {
        float _3862 = _3810 * _3804;
        _3854 = _3862;
    }
    float _3864 = _3854;
    float _3866 = _3864;
    if (_786)
    {
        float _3868 = fma(_3812, _3778, _3846);
        _3848 = _3868;
    }
    float _3870 = _3848;
    float _3872 = _3870;
    if (_786)
    {
        float _3874 = fma(_3814, _3758, _3852);
        _3856 = _3874;
    }
    float _3876 = _3856;
    float _3878 = _3876;
    float _3880 = _3876;
    if (_786)
    {
        float _3882 = fma(_3812, _3802, _3864);
        _3866 = _3882;
    }
    float _3884 = _3866;
    float _3886 = _3884;
    if (_786)
    {
        float _3888 = fma(_3814, _3782, _3870);
        _3872 = _3888;
    }
    float _3890 = _3872;
    float _3892 = _3890;
    float _3894 = _3890;
    if (_786)
    {
        float _3896 = fma(_3814, _3806, _3884);
        _3886 = _3896;
    }
    float _3898 = _3886;
    float _3900 = _3898;
    float _3902 = _3898;
    if (!_786)
    {
        bool _3904 = !_1022;
        if (!_3904)
        {
            uint _3906 = uint(int(uint(_172) >> uint(2)));
            float _3908 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3906)]);
            int _3910 = _172 + 4;
            uint _3912 = uint(int(uint(_3910) >> uint(2)));
            float _3914 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3912)]);
            int _3916 = _172 + 8;
            uint _3918 = uint(int(uint(_3916) >> uint(2)));
            float _3920 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3918)]);
            int _3922 = _172 + 12;
            uint _3924 = uint(int(uint(_3922) >> uint(2)));
            float _3926 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3924)]);
            uint _3928 = uint(int(uint(_172) >> uint(2)));
            float _3930 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3928)]);
            int _3932 = _172 + 4;
            uint _3934 = uint(int(uint(_3932) >> uint(2)));
            float _3936 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3934)]);
            int _3938 = _172 + 8;
            uint _3940 = uint(int(uint(_3938) >> uint(2)));
            float _3942 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3940)]);
            uint _3944 = uint(int(uint(_172) >> uint(2)));
            float _3946 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3944)]);
            int _3948 = _172 + 4;
            uint _3950 = uint(int(uint(_3948) >> uint(2)));
            float _3952 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3950)]);
            int _3954 = _172 + 8;
            uint _3956 = uint(int(uint(_3954) >> uint(2)));
            float _3958 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3956)]);
            int _3960 = _172 + 12;
            uint _3962 = uint(int(uint(_3960) >> uint(2)));
            float _3964 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3962)]);
            float _3966 = _3914 * _3810;
            float _3968 = _3936 * _3810;
            float _3970 = _3952 * _3810;
            float _3972 = fma(_3908, _3812, _3966);
            float _3974 = fma(_3930, _3812, _3968);
            float _3976 = fma(_3946, _3812, _3970);
            float _3978 = fma(_3920, _3814, _3972);
            float _3980 = fma(_3942, _3814, _3974);
            float _3982 = fma(_3958, _3814, _3976);
            _3430 = _3972;
            _3432 = _3926;
            _3476 = _3974;
            _3416 = _3958;
            _3244 = _3964;
            _3894 = _3980;
            _3880 = _3978;
            _3902 = _3982;
            _3984 = true;
        }
        else
        {
            if (!_1102)
            {
                _3878 = _3812;
            }
            float _3986 = _3878;
            _3880 = _3986;
            if (!_1102)
            {
                _3892 = _3810;
            }
            float _3988 = _3892;
            _3894 = _3988;
            if (!_1102)
            {
                _3900 = _3814;
            }
            float _3990 = _3900;
            bool _3992 = !_1102;
            _3902 = _3990;
            if (!_3992)
            {
                uint _3994 = uint(int(uint(_172) >> uint(2)));
                float _3996 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3994)]);
                int _3998 = _172 + 4;
                uint _4000 = uint(int(uint(_3998) >> uint(2)));
                float _4002 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4000)]);
                int _4004 = _172 + 8;
                uint _4006 = uint(int(uint(_4004) >> uint(2)));
                float _4008 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4006)]);
                int _4010 = _172 + 12;
                uint _4012 = uint(int(uint(_4010) >> uint(2)));
                float _4014 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4012)]);
                uint _4016 = uint(int(uint(_172) >> uint(2)));
                float _4018 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4016)]);
                int _4020 = _172 + 4;
                uint _4022 = uint(int(uint(_4020) >> uint(2)));
                float _4024 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4022)]);
                int _4026 = _172 + 8;
                uint _4028 = uint(int(uint(_4026) >> uint(2)));
                float _4030 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4028)]);
                uint _4032 = uint(int(uint(_172) >> uint(2)));
                float _4034 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4032)]);
                int _4036 = _172 + 4;
                uint _4038 = uint(int(uint(_4036) >> uint(2)));
                float _4040 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4038)]);
                int _4042 = _172 + 8;
                uint _4044 = uint(int(uint(_4042) >> uint(2)));
                float _4046 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4044)]);
                int _4048 = _172 + 12;
                uint _4050 = uint(int(uint(_4048) >> uint(2)));
                float _4052 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4050)]);
                float _4054 = _4002 * _3810;
                float _4056 = _4024 * _3810;
                float _4058 = _4040 * _3810;
                float _4060 = fma(_3996, _3812, _4054);
                float _4062 = fma(_4018, _3812, _4056);
                float _4064 = fma(_4034, _3812, _4058);
                float _4066 = fma(_4008, _3814, _4060);
                float _4068 = fma(_4030, _3814, _4062);
                float _4070 = fma(_4046, _3814, _4064);
                _3430 = _4060;
                _3432 = _4014;
                _3476 = _4062;
                _3416 = _4046;
                _3244 = _4052;
                _3894 = _4068;
                _3880 = _4066;
                _3902 = _4070;
            }
        }
    }
    _3984 = false;
    float _4072 = _3430;
    float _4074 = _3432;
    float _4076 = _3476;
    float _4078 = _3416;
    float _4080 = _3244;
    float _4082 = _3894;
    float _4084 = _3880;
    float _4086 = _3902;
    float _4088 = -_3388;
    float _4090 = _4088 + _3332;
    float _4092 = -_3392;
    float _4094 = _4092 + _3338;
    float _4096 = -_3390;
    float _4098 = _4096 + _3376;
    float _4100 = _4072;
    float _4102 = _4074;
    float _4104 = _4076;
    float _4106 = _4080;
    float _4108 = _4078;
    float _4110 = _4084;
    float _4112 = _4082;
    float _4114 = _4086;
    if (_786)
    {
        float _4116 = _4090 * _3756;
        _4100 = _4116;
    }
    float _4118 = _4100;
    float _4120 = _4118;
    if (_786)
    {
        float _4122 = _4090 * _3780;
        _4102 = _4122;
    }
    float _4124 = _4102;
    float _4126 = _4124;
    if (_786)
    {
        float _4128 = _4090 * _3804;
        _4104 = _4128;
    }
    float _4130 = _4104;
    float _4132 = _4130;
    if (_786)
    {
        float _4134 = fma(_4094, _3754, _4118);
        _4120 = _4134;
    }
    float _4136 = _4120;
    if (_786)
    {
        float _4138 = fma(_4094, _3778, _4124);
        _4126 = _4138;
    }
    float _4140 = _4126;
    if (_786)
    {
        float _4142 = fma(_4094, _3802, _4130);
        _4132 = _4142;
    }
    float _4144 = _4132;
    if (_786)
    {
        float _4146 = fma(_4098, _3758, _4136);
        _4106 = _4146;
    }
    float _4148 = _4106;
    float _4150 = _4148;
    float _4152 = _4148;
    if (_786)
    {
        float _4154 = fma(_4098, _3782, _4140);
        _3418 = _4154;
    }
    float _4156 = _3418;
    float _4158 = _4156;
    float _4160 = _4156;
    if (_786)
    {
        float _4162 = fma(_4098, _3806, _4144);
        _4108 = _4162;
    }
    float _4164 = _4108;
    float _4166 = _4164;
    float _4168 = _4164;
    if (!_786)
    {
        bool _4170 = !_1022;
        if (!_4170)
        {
            uint _4172 = uint(int(uint(_172) >> uint(2)));
            float _4174 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4172)]);
            int _4176 = _172 + 4;
            uint _4178 = uint(int(uint(_4176) >> uint(2)));
            float _4180 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4178)]);
            int _4182 = _172 + 8;
            uint _4184 = uint(int(uint(_4182) >> uint(2)));
            float _4186 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4184)]);
            uint _4188 = uint(int(uint(_172) >> uint(2)));
            float _4190 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4188)]);
            int _4192 = _172 + 4;
            uint _4194 = uint(int(uint(_4192) >> uint(2)));
            float _4196 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4194)]);
            int _4198 = _172 + 8;
            uint _4200 = uint(int(uint(_4198) >> uint(2)));
            float _4202 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4200)]);
            uint _4204 = uint(int(uint(_172) >> uint(2)));
            float _4206 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4204)]);
            int _4208 = _172 + 4;
            uint _4210 = uint(int(uint(_4208) >> uint(2)));
            float _4212 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4210)]);
            int _4214 = _172 + 8;
            uint _4216 = uint(int(uint(_4214) >> uint(2)));
            float _4218 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4216)]);
            float _4220 = _4180 * _4090;
            float _4222 = _4196 * _4090;
            float _4224 = _4212 * _4090;
            float _4226 = fma(_4174, _4094, _4220);
            float _4228 = fma(_4190, _4094, _4222);
            float _4230 = fma(_4206, _4094, _4224);
            float _4232 = fma(_4186, _4098, _4226);
            float _4234 = fma(_4202, _4098, _4228);
            float _4236 = fma(_4218, _4098, _4230);
            _4152 = _4232;
            _4160 = _4234;
            _4168 = _4236;
            _4238 = true;
        }
        else
        {
            if (!_1102)
            {
                _4150 = _4094;
            }
            float _4240 = _4150;
            _4152 = _4240;
            if (!_1102)
            {
                _4158 = _4090;
            }
            float _4242 = _4158;
            _4160 = _4242;
            if (!_1102)
            {
                _4166 = _4098;
            }
            float _4244 = _4166;
            bool _4246 = !_1102;
            _4168 = _4244;
            if (!_4246)
            {
                uint _4248 = uint(int(uint(_172) >> uint(2)));
                float _4250 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4248)]);
                int _4252 = _172 + 4;
                uint _4254 = uint(int(uint(_4252) >> uint(2)));
                float _4256 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4254)]);
                int _4258 = _172 + 8;
                uint _4260 = uint(int(uint(_4258) >> uint(2)));
                float _4262 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4260)]);
                uint _4264 = uint(int(uint(_172) >> uint(2)));
                float _4266 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4264)]);
                int _4268 = _172 + 4;
                uint _4270 = uint(int(uint(_4268) >> uint(2)));
                float _4272 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4270)]);
                int _4274 = _172 + 8;
                uint _4276 = uint(int(uint(_4274) >> uint(2)));
                float _4278 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4276)]);
                uint _4280 = uint(int(uint(_172) >> uint(2)));
                float _4282 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4280)]);
                int _4284 = _172 + 4;
                uint _4286 = uint(int(uint(_4284) >> uint(2)));
                float _4288 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4286)]);
                int _4290 = _172 + 8;
                uint _4292 = uint(int(uint(_4290) >> uint(2)));
                float _4294 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4292)]);
                float _4296 = _4256 * _4090;
                float _4298 = _4272 * _4090;
                float _4300 = _4288 * _4090;
                float _4302 = fma(_4250, _4094, _4296);
                float _4304 = fma(_4266, _4094, _4298);
                float _4306 = fma(_4282, _4094, _4300);
                float _4308 = fma(_4262, _4098, _4302);
                float _4310 = fma(_4278, _4098, _4304);
                float _4312 = fma(_4294, _4098, _4306);
                _4152 = _4308;
                _4160 = _4310;
                _4168 = _4312;
            }
        }
    }
    _4238 = false;
    float _4314 = _4152;
    float _4316 = _4160;
    float _4318 = _4168;
    int _4320 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 24;
    uint _4322 = uint(int(uint(_4320) >> uint(2)));
    float _4324 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_4322)]);
    int _4326 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 16;
    uint _4328 = uint(int(uint(_4326) >> uint(2)));
    float _4330 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_4328)]);
    uint _4332 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
    float _4334 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_4332)]);
    int _4336 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 8;
    uint _4338 = uint(int(uint(_4336) >> uint(2)));
    float _4340 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_4338)]);
    float _4342 = fma(_3732, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
    float _4344 = fma(_3734, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
    float _4346 = fma(_3732, 6.2500002968590706586837768554688e-05, 0.5);
    float _4348 = fma(_3734, 6.2500002968590706586837768554688e-05, 0.5);
    float _4350 = fma(_3734, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
    float _4352 = fma(_3732, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
    float _4354 = fma(_3732, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
    float _4356 = fma(_3734, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
    float _4358 = _4324 * _4324;
    float _4360 = fma(_4330, _4330, _4358);
    float _4362 = rsqrt(_4360);
    float _4364 = _4362 * (-20.0);
    float _4366 = fma(_4330, _4364, _4334);
    float _4368 = fma(_4324, _4364, _4340);
    float _4370 = _4366 * 0.5;
    float _4372 = _4368 * 0.5;
    float _4374 = floor(_4372);
    float _4376 = floor(_4370);
    float _4378 = fma(_4374, 2.0, -32.0);
    float _4380 = -_4378;
    float _4382 = _4380 + _3734;
    float _4384 = fma(_4376, 2.0, -32.0);
    float _4386 = _4382 * 0.015625;
    float _4388 = -_4384;
    float _4390 = _4388 + _3732;
    float _4392 = _4390 * 0.015625;
    float2 _15344 = float2(_4392, _4386);
    float2 _4394 = dm_bs(spvDescriptorSet0.cp_t_tcb_26.sample(spvDescriptorSet0.cp_t_tcb_26Smplr, select(_15344, float2(0.0), isnan(_15344)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_26, spvDescriptorSet0.cp_t_tcb_26Smplr_w, select(_15344, float2(0.0), isnan(_15344)), level(0.0)).xy;
    float _4396 = _4394.x;
    float _4398 = _4394.y;
    float2 _15356 = float2(_4342, _4344);
    float _4400 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_15356, float2(0.0), isnan(_15356)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_15356, float2(0.0), isnan(_15356)), level(0.0)).x;
    float2 _15364 = float2(_4346, _4348);
    float2 _4402 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_15364, float2(0.0), isnan(_15364)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_15364, float2(0.0), isnan(_15364)), level(0.0)).xy;
    float _4404 = _4402.x;
    float _4406 = _4402.y;
    float2 _15376 = float2(_4342, _4350);
    float _4408 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_15376, float2(0.0), isnan(_15376)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_15376, float2(0.0), isnan(_15376)), level(0.0)).x;
    float2 _15384 = float2(_4352, _4344);
    float _4410 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_15384, float2(0.0), isnan(_15384)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_15384, float2(0.0), isnan(_15384)), level(0.0)).x;
    float2 _15392 = float2(_4352, _4350);
    float _4412 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_15392, float2(0.0), isnan(_15392)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_15392, float2(0.0), isnan(_15392)), level(0.0)).x;
    float2 _15400 = float2(_4354, _4348);
    float _4414 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_15400, float2(0.0), isnan(_15400)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_15400, float2(0.0), isnan(_15400)), level(0.0)).x;
    float2 _15408 = float2(_4346, _4356);
    float _4416 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_15408, float2(0.0), isnan(_15408)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_15408, float2(0.0), isnan(_15408)), level(0.0)).x;
    float2 _15416 = float2(_4346, _4348);
    float _4418 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_15416, float2(0.0), isnan(_15416)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_15416, float2(0.0), isnan(_15416)), level(0.0)).y;
    float2 _15424 = float2(_4354, _4348);
    float2 _4420 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_15424, float2(0.0), isnan(_15424)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_15424, float2(0.0), isnan(_15424)), level(0.0)).xy;
    float _4422 = _4420.x;
    float _4424 = _4420.y;
    float2 _15436 = float2(_4346, _4356);
    float2 _4426 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_15436, float2(0.0), isnan(_15436)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_15436, float2(0.0), isnan(_15436)), level(0.0)).xy;
    float _4428 = _4426.x;
    float _4430 = _4426.y;
    float _4432 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[73]);
    float _4434 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[72]);
    float _4436 = _920 * 19.23889923095703125;
    float _4438 = _914 * 19.23889923095703125;
    float _4440 = _4436 * 0.15915493667125701904296875;
    float _4442 = _4438 * 0.15915493667125701904296875;
    float _4444 = _4440 * 6.283185482025146484375;
    float _4446 = sin(_4444);
    float _4448 = fma(_190, 3.1415927410125732421875, -1.57079637050628662109375);
    float _4450 = _4448 * 0.15915493667125701904296875;
    float _4452 = _4442 * 6.283185482025146484375;
    float _4454 = sin(_4452);
    float _4456 = _4450 * 6.283185482025146484375;
    float _4458 = cos(_4456);
    float _4460 = _4446 * 34873.41015625;
    float _4462 = _4450 * 6.283185482025146484375;
    float _4464 = sin(_4462);
    float _4466 = _4454 * 34873.41015625;
    float _4468 = 1.0 / _3228;
    float _4470 = floor(_4460);
    float _4472 = floor(_4466);
    float _4474 = -_4470;
    float _4476 = _4474 + _4460;
    float _4478 = -_4472;
    float _4480 = _4466 + _4478;
    float _4482 = _4398 * 14.99999904632568359375;
    float _4484 = _4396 * 14.99999904632568359375;
    float _4486 = -_4404;
    float _4488 = _4486 + _4400;
    float _4490 = -_4404;
    float _4492 = _4490 + _4408;
    float _4494 = _4482 * _4458;
    float _4496 = _4482 * _4464;
    float _4498 = _4482 * _4482;
    float _4500 = _4488 * 2000.0;
    float _4502 = fma(_4484, _4464, _4494);
    float _4504 = _4468 * 59.999996185302734375;
    float _4506 = -_4496;
    float _4508 = fma(_4484, _4458, _4506);
    float _4510 = fma(_4484, _4484, _4498);
    float _4512 = _4314 * _4504;
    float _4514 = _4316 * _4504;
    float _4516 = _4318 * _4504;
    float _4518 = _4492 * 2000.0;
    float _4520 = _4404 * 2000.0;
    float _4522 = -_4404;
    float _4524 = _4522 + _4410;
    float _4526 = fma(_4476, 0.800000011920928955078125, 0.20000000298023223876953125);
    float _4528 = -_4406;
    float _4530 = _4404 + _4528;
    float _4532 = _4520 + (-2.0);
    float _4534 = -_4404;
    float _4536 = _4534 + _4412;
    float _4538 = _4524 * 2000.0;
    float _4540 = abs(_4500);
    float _4542 = abs(_4518);
    float _4544 = precise::max(_4540, _4542);
    float _4546 = -_4404;
    float _4548 = _4546 + _4414;
    float _4550 = -_4432;
    float _4552 = _4550 + 1.0;
    float _4554 = _4530 * 2000.0;
    float _4556 = _4536 * 2000.0;
    bool _4558 = _3736 >= _4532;
    bool _4560 = isnan(_3736);
    bool _4562 = _4558 || _4560;
    bool _4564 = isnan(_4532);
    bool _4566 = _4562 || _4564;
    float _4568 = -_4404;
    float _4570 = _4568 + _4416;
    float _4572 = abs(_4538);
    float _4574 = precise::max(_4544, _4572);
    float _4576 = _4548 * 1000.0;
    float _4578 = fma(_196, _4432, _4552);
    float _4580 = abs(_4554);
    bool _4582 = _4580 < 2.0;
    bool _4584 = !_4566;
    bool _4586 = _4582 || _4584;
    float _4588 = fma(_4480, _4480, 0.0400000028312206268310546875);
    float _4590 = abs(_4556);
    float _4592 = precise::max(_4574, _4590);
    float _4594 = _4570 * 1000.0;
    float _4596 = fma(_4576, _4576, 0.0625);
    float _4598 = fma(_4526, _4526, _4588);
    float _4600 = sqrt(_4510);
    float _4602 = fma(_4594, _4594, _4596);
    float _4604 = rsqrt(_4602);
    float _4606 = sqrt(_4598);
    float _4608 = _4604 * 0.25;
    float _4610 = sqrt(_4600);
    bool _4612 = _4608 < 0.891006529331207275390625;
    bool _4614 = _4612 || _4586;
    float _4616 = _4606 + 9.9999997473787516355514526367188e-06;
    bool _4618 = _4592 >= 2.0;
    bool _4620 = isnan(_4592);
    bool _4622 = _4618 || _4620;
    bool _4624 = isnan(2.0);
    bool _4626 = _4622 || _4624;
    bool _4628 = _4626 || _4614;
    float _4630 = _4406 * 2000.0;
    float _4632 = 1.0 / _4616;
    float _4634 = _4630;
    float _4636 = _4512;
    float _4638 = _4430;
    if (!_4628)
    {
        float _4640 = _4594 * _4604;
        float _4642 = _4576 * _4604;
        float _4644 = 1.0 / _4608;
        float _4646 = _4640 * _4640;
        float _4648 = fma(_4642, _4642, _4646);
        float _4650 = sqrt(_4648);
        bool _4652 = _4650 > 9.9999997473787516355514526367188e-05;
        float _4654 = _4650 * _4644;
        float _4656 = _4642;
        float _4658 = _4646;
        if (_4652)
        {
            float _4660 = abs(_4642);
            float _4662 = abs(_4640);
            float _4664 = precise::max(_4660, _4662);
            _4656 = _4664;
        }
        float _4666 = _4656;
        if (!_4652)
        {
            _4658 = 0.0;
        }
        float _4668 = _4658;
        float _4670 = _4666;
        float _4672 = _4668;
        if (_4652)
        {
            float _4674 = 1.0 / _4666;
            _4670 = _4674;
        }
        float _4676 = _4670;
        if (_4652)
        {
            float _4678 = _4650 * _4676;
            _4672 = _4678;
        }
        float _4680 = _4672;
        float _4682 = _4680 * 0.9649016857147216796875;
        float _4684 = -_4682;
        float _4686 = fma(_4684, _4654, _4520);
        _4634 = _4686;
    }
    float _4688 = _4634;
    float _4690 = -_4688;
    float _4692 = _3736 + _4690;
    float _4694 = _4632 * _4480;
    bool _4696 = _4610 >= 0.5;
    float _4698 = _4632 * 0.20000000298023223876953125;
    float _4700 = abs(_4692);
    float _4702 = _4700 * 0.20000000298023223876953125;
    float _4704 = precise::clamp(_4702, 0.0, 1.0);
    bool _4706 = _4610 >= 1.0;
    float _4708 = _3346 * _4694;
    float _4710 = -_4632;
    float _4712 = _4526 * _4710;
    float _4714 = -_4704;
    float _4716 = _4714 + 1.0;
    float _4718 = _3386 * _4694;
    float _4720 = _3366 * _4694;
    float _4722 = fma(_3382, _4698, _4708);
    float _4724 = _4716 * _4716;
    float _4726 = fma(_3340, _4698, _4718);
    float _4728 = fma(_3362, _4698, _4720);
    float _4730 = _4434 * 500.0;
    float _4732 = _4724 * _4724;
    float _4734 = _4434 * 300.0;
    float _4736 = fma(_3370, _4712, _4726);
    float _4738 = _3468 * 0.100000001490116119384765625;
    float _4740 = _4578 * _4732;
    float _4742 = fma(_3364, _4712, _4722);
    float _4744 = -_4404;
    float _4746 = _4744 + _4422;
    float _4748 = -_4404;
    float _4750 = _4748 + _4428;
    float _4752 = _4722;
    float _4754 = _4712;
    float _4756 = _4730;
    float _4758 = _4726;
    if (_4696)
    {
        float _4760 = _4734 * _4740;
        _4752 = _4760;
    }
    float _4762 = _4752;
    float _4764 = fma(_3468, _4712, _4728);
    if (_4706)
    {
        float _4766 = _4730 * _4740;
        _4754 = _4766;
    }
    float _4768 = _4754;
    float _4770 = _4768;
    if (_4696)
    {
        float _4772 = _4508 * _4762;
        _4756 = _4772;
    }
    float _4774 = _4756;
    float _4776 = _4516;
    if (_4696)
    {
        float _4778 = _4502 * _4762;
        _4758 = _4778;
    }
    float _4780 = _4758;
    float _4782 = _3370 * 0.100000001490116119384765625;
    if (_4696)
    {
        float _4784 = fma(_3228, _4774, _4512);
        _4636 = _4784;
    }
    float _4786 = _4636;
    float _4788 = _3364 * 0.100000001490116119384765625;
    float _4790 = _4514;
    if (_4706)
    {
        float _4792 = _4610 * _4768;
        _4770 = _4792;
    }
    float _4794 = _4770;
    float _4796 = fma(_3362, 0.20000000298023223876953125, _4738);
    if (_4696)
    {
        float _4798 = fma(_3228, _4780, _4516);
        _4776 = _4798;
    }
    float _4800 = _4776;
    float _4802 = fma(_3382, 0.20000000298023223876953125, _4788);
    float _4804 = fma(_3340, 0.20000000298023223876953125, _4782);
    float _4806 = _4800;
    if (_4706)
    {
        float _4808 = fma(_3228, _4794, _4514);
        _4790 = _4808;
    }
    float _4810 = _4790;
    float _4812 = _4796 * _3220;
    float _4814 = _4802 * _3222;
    float _4816 = _4804 * _3224;
    float _4818 = _3362 * (-0.20000000298023223876953125);
    float _4820 = -_4812;
    float _4822 = fma(_4802, _3224, _4820);
    float _4824 = -_4810;
    float _4826 = _4082 + _4824;
    float _4828 = _3340 * (-0.20000000298023223876953125);
    float _4830 = -_4816;
    float _4832 = fma(_4796, _3222, _4830);
    float _4834 = -_4814;
    float _4836 = fma(_4804, _3220, _4834);
    float _4838 = -_4786;
    float _4840 = _4084 + _4838;
    float _4842 = _3382 * (-0.20000000298023223876953125);
    float _4844 = _4818 * _3220;
    float _4846 = _4826 + _4822;
    float _4848 = _4828 * _3224;
    float _4850 = _4840 + _4832;
    float _4852 = -_4844;
    float _4854 = fma(_4842, _3224, _4852);
    float _4856 = -_4800;
    float _4858 = _4086 + _4856;
    float _4860 = _4846 * _4846;
    float _4862 = -_4848;
    float _4864 = fma(_4818, _3222, _4862);
    float _4866 = _4842 * _3222;
    float _4868 = _4826 + _4854;
    float _4870 = _4858 + _4836;
    float _4872 = fma(_4850, _4850, _4860);
    float _4874 = _4840 + _4864;
    float _4876 = -_4866;
    float _4878 = fma(_4828, _3220, _4876);
    float _4880 = _4868 * _4868;
    float _4882 = fma(_4870, _4870, _4872);
    float _4884 = _4858 + _4878;
    float _4886 = fma(_4874, _4874, _4880);
    float _4888 = rsqrt(_4882);
    float _4890 = -_4406;
    float _4892 = _4404 + _4890;
    float _4894 = _4746 * 1000.0;
    float _4896 = fma(_4884, _4884, _4886);
    float _4898 = _4520 + (-2.0);
    float _4900 = _4892 * 2000.0;
    float _4902 = sqrt(_4882);
    bool _4904 = _3736 >= _4898;
    bool _4906 = isnan(_3736);
    bool _4908 = _4904 || _4906;
    bool _4910 = isnan(_4898);
    bool _4912 = _4908 || _4910;
    float _4914 = _3364 * 0.980571091175079345703125;
    float _4916 = abs(_4900);
    bool _4918 = _4916 < 2.0;
    bool _4920 = !_4912;
    bool _4922 = _4918 || _4920;
    float _4924 = _3370 * 0.980571091175079345703125;
    float _4926 = fma(_3346, 0.19611422717571258544921875, _4914);
    float _4928 = rsqrt(_4896);
    float _4930 = _4846 * _4888;
    float _4932 = _4850 * _4888;
    float _4934 = _4870 * _4888;
    float _4936 = sqrt(_4896);
    bool _4938 = _4902 != 0.0;
    bool _4940 = isnan(_4902);
    bool _4942 = _4938 || _4940;
    bool _4944 = isnan(0.0);
    bool _4946 = _4942 || _4944;
    float _4948 = fma(_3386, 0.19611422717571258544921875, _4924);
    float _4950 = _4946 ? _4930 : 0.0;
    float _4952 = _4946 ? _4932 : 0.0;
    float _4954 = _4868 * _4928;
    float _4956 = _4874 * _4928;
    float _4958 = _4950 * _4948;
    float _4960 = _4884 * _4928;
    float _4962 = _3468 * 0.980571091175079345703125;
    float _4964 = _4946 ? _4934 : 0.0;
    float _4966 = fma(_4952, _4926, _4958);
    float _4968 = _4750 * 1000.0;
    bool _4970 = _4936 != 0.0;
    bool _4972 = isnan(_4936);
    bool _4974 = _4970 || _4972;
    bool _4976 = isnan(0.0);
    bool _4978 = _4974 || _4976;
    float _4980 = fma(_4894, _4894, 0.0625);
    float _4982 = fma(_3366, 0.19611422717571258544921875, _4962);
    float _4984 = _4978 ? _4954 : 0.0;
    float _4986 = fma(_4968, _4968, _4980);
    float _4988 = _4978 ? _4956 : 0.0;
    float _4990 = fma(_4964, _4982, _4966);
    float _4992 = _4978 ? _4960 : 0.0;
    float _4994 = _4984 * _4736;
    float _4996 = _4882 * _4990;
    float _4998 = fma(_4988, _4742, _4994);
    float _5000 = rsqrt(_4986);
    float _5002 = _4982 * _4996;
    float _5004 = fma(_4992, _4764, _4998);
    float _5006 = _4948 * _4996;
    float _5008 = _4926 * _4996;
    float _5010 = _4896 * _5004;
    float _5012 = -_5006;
    float _5014 = _4796 * _5012;
    float _5016 = _4736 * _5010;
    float _5018 = _4742 * _5010;
    float _5020 = -_5002;
    float _5022 = _4802 * _5020;
    float _5024 = _4764 * _5010;
    float _5026 = -_5016;
    float _5028 = _4818 * _5026;
    float _5030 = -_5002;
    float _5032 = -_5014;
    float _5034 = fma(_4804, _5030, _5032);
    float _5036 = _5000 * 0.25;
    float _5038 = -_5008;
    float _5040 = -_5022;
    float _5042 = fma(_4796, _5038, _5040);
    float _5044 = -_5002;
    float _5046 = -_5024;
    float _5048 = _5044 + _5046;
    float _5050 = -_5024;
    float _5052 = -_5028;
    float _5054 = fma(_4828, _5050, _5052);
    float _5056 = -_5024;
    float _5058 = _4842 * _5056;
    bool _5060 = _5036 < 0.891006529331207275390625;
    bool _5062 = _5060 || _4922;
    float _5064 = -_5008;
    float _5066 = _4804 * _5064;
    float _5068 = -_5018;
    float _5070 = _4828 * _5068;
    float _5072 = -_5018;
    float _5074 = -_5058;
    float _5076 = fma(_4818, _5072, _5074);
    bool _5078 = _4592 >= 2.0;
    bool _5080 = isnan(_4592);
    bool _5082 = _5078 || _5080;
    bool _5084 = isnan(2.0);
    bool _5086 = _5082 || _5084;
    bool _5088 = _5086 || _5062;
    float _5090 = -_5006;
    float _5092 = -_5066;
    float _5094 = fma(_4802, _5090, _5092);
    float _5096 = -_5016;
    float _5098 = -_5070;
    float _5100 = fma(_4842, _5096, _5098);
    float _5102 = _5034 + _5054;
    float _5104 = _4894 * _5000;
    float _5106 = -_5008;
    float _5108 = -_5018;
    float _5110 = _5106 + _5108;
    float _5112 = -_5006;
    float _5114 = -_5016;
    float _5116 = _5112 + _5114;
    float _5118 = _5042 + _5076;
    float _5120 = _5094 + _5100;
    float _5122 = _4968 * _5000;
    float _5124 = _1586 * 0.5;
    float _5126 = _1586 * 0.300000011920928955078125;
    bool _5128 = !_5088;
    float _5130 = _5036;
    float _5132 = _4810;
    float _5134 = _5110;
    float _5136 = _5048;
    float _5168;
    float _5170;
    float _5172;
    if (!_5128)
    {
        float _5138 = -_4406;
        float _5140 = _5138 + _4424;
        float _5142 = -_4406;
        float _5144 = _5142 + _4430;
        float _5146 = _5140 * 1000.0;
        float _5148 = _5144 * 1000.0;
        float _5150 = fma(_5146, _5146, 0.0625);
        float _5152 = fma(_5148, _5148, _5150);
        float _5154 = _4406 * 2000.0;
        float _5156 = rsqrt(_5152);
        float _5158 = -_5146;
        float _5160 = fma(_5158, _5156, -0.0);
        float _5162 = -_5148;
        float _5164 = fma(_5162, _5156, -0.0);
        float _5166 = _5156 * 0.25;
        _5168 = _5154;
        _5130 = _5166;
        _5170 = _5160;
        _5172 = _5164;
        _5174 = true;
    }
    else
    {
        float _5176 = _5122 * _5122;
        float _5178 = 1.0 / _5036;
        float _5180 = -_5122;
        float _5182 = (-0.0) + _5180;
        float _5184 = fma(_5104, _5104, _5176);
        float _5186 = sqrt(_5184);
        bool _5188 = _5186 > 9.9999997473787516355514526367188e-05;
        float _5190 = _5186 * _5178;
        float _5192 = _5176;
        _5172 = _5182;
        if (_5188)
        {
            float _5194 = abs(_5104);
            float _5196 = abs(_5122);
            float _5198 = precise::max(_5194, _5196);
            _4638 = _5198;
        }
        float _5200 = _4638;
        float _5202 = -_5104;
        float _5204 = (-0.0) + _5202;
        _5170 = _5204;
        if (!_5188)
        {
            _5192 = 0.0;
        }
        float _5206 = _5192;
        float _5208 = _5200;
        float _5210 = _5206;
        if (_5188)
        {
            float _5212 = 1.0 / _5200;
            _5208 = _5212;
        }
        float _5214 = _5208;
        if (_5188)
        {
            float _5216 = _5186 * _5214;
            _5210 = _5216;
        }
        float _5218 = _5210;
        float _5220 = _5218 * 0.9649016857147216796875;
        float _5222 = -_5220;
        float _5224 = fma(_5222, _5190, _4520);
        _5168 = _5224;
    }
    _5174 = false;
    float _5226 = _5168;
    float _5228 = _5130;
    float _5230 = _5170;
    float _5232 = _5172;
    float _5234 = -_3736;
    float _5236 = _5234 + _5226;
    bool _5238 = _5226 >= _3736;
    bool _5240 = isnan(_5226);
    bool _5242 = _5238 || _5240;
    bool _5244 = isnan(_3736);
    bool _5246 = _5242 || _5244;
    float _5248 = -_5226;
    float _5250 = fma(_4418, 2000.0, _5248);
    bool _5252 = _5226 > _3736;
    float _5254 = _5236 * _5236;
    float _5256 = precise::max(_782, 0.001000000047497451305389404296875);
    bool _5258 = !_5252;
    float _5260 = _5258 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _5262 = sqrt(_5254);
    bool _5264 = _3226 >= 0.5;
    int _5266 = ~as_type<int>(_5260);
    int _5268 = _5266 + 1;
    int _5270 = _5268 + 1;
    float _5272 = abs(_5250);
    bool _5274 = _5272 >= 2.0;
    bool _5276 = isnan(_5272);
    bool _5278 = _5274 || _5276;
    bool _5280 = isnan(2.0);
    bool _5282 = _5278 || _5280;
    int _5284 = _5270;
    float _5286 = _5226;
    float _5288 = _5260;
    float _5290 = _5254;
    if (_5246)
    {
        int _5292 = ~as_type<int>(_5260);
        int _5294 = _5292 + 1;
        _5284 = _5294;
    }
    int _5296 = _5284;
    bool _5298 = _5228 >= 0.891006529331207275390625;
    bool _5300 = _5298 && _5282;
    float _5302 = float(_5296);
    float _5304 = precise::min(_5256, 10000.0);
    float _5306 = _5262 * _5302;
    bool _5308 = !_5264;
    float _5310 = _5306;
    float _5312 = _5302;
    float _5406;
    float _5408;
    float _5410;
    float _5644;
    float _5646;
    float _5648;
    float _5650;
    float _5652;
    float _5654;
    float _5656;
    bool _5658;
    float _5694;
    float _5696;
    if (!_5308)
    {
        bool _5314 = _3380 > _3320;
        bool _5316 = _3380 >= _3320;
        bool _5318 = isnan(_3380);
        bool _5320 = _5316 || _5318;
        bool _5322 = isnan(_3320);
        bool _5324 = _5320 || _5322;
        int _5326 = _5324 ? 0 : 1;
        int _5328 = ~_5326;
        int _5330 = _5328 + 1;
        int _5332 = _5330 + 1;
        int _5334 = _5332;
        int _5336 = _5324 ? (-1) : 0;
        if (!_5314)
        {
            int _5338 = ~_5326;
            int _5340 = _5338 + 1;
            _5334 = _5340;
        }
        int _5342 = _5334;
        bool _5344 = _3226 != 1.0;
        bool _5346 = isnan(_3226);
        bool _5348 = _5344 || _5346;
        bool _5350 = isnan(1.0);
        bool _5352 = _5348 || _5350;
        float _5354 = float(_5342);
        float _5356 = _3386 * _5354;
        float _5358 = _3346 * _5354;
        float _5360 = _3366 * _5354;
        float _5362 = _4082 * _5228;
        float _5364 = _5356 * _5228;
        float _5366 = fma(_4084, _5230, _5362);
        float _5368 = fma(_5358, _5230, _5364);
        float _5370 = fma(_4086, _5232, _5366);
        float _5372 = fma(_5360, _5232, _5368);
        float _5374 = abs(_5372);
        float _5376 = -_5374;
        float _5378 = _5376 + 1.0;
        bool _5380 = _5370 <= 0.0;
        float _5382 = float(_5380);
        float _5384 = abs(_5378);
        float _5386 = log2(_5384);
        float _5388 = _5370 * _5382;
        float _5390 = -_5388;
        float _5392 = fma(_5230, _5390, _4084);
        float _5394 = -_5388;
        float _5396 = fma(_5228, _5394, _4082);
        float _5398 = -_5388;
        float _5400 = fma(_5232, _5398, _4086);
        float _5402 = _5386 * 0.20000000298023223876953125;
        float _5404 = exp2(_5402);
        _5406 = _5392;
        _5408 = _5396;
        _5410 = _5400;
        float _5430;
        int _5458;
        float _5520;
        float _5522;
        int _5524;
        if (!_5352)
        {
            float _5412 = _5396 * _5396;
            float _5414 = _3220 * 0.89999997615814208984375;
            float _5416 = _3222 * 0.89999997615814208984375;
            float _5418 = _3224 * 0.89999997615814208984375;
            float _5420 = fma(_5392, _5392, _5412);
            float _5422 = fma(_5400, _5400, _5420);
            float _5424 = sqrt(_5422);
            bool _5426 = _5424 > 0.5;
            bool _5428 = !_5426;
            _5430 = _5414;
            if (!_5428)
            {
                bool _5432 = _5372 > 0.0;
                bool _5434 = _5372 >= 0.0;
                bool _5436 = isnan(_5372);
                bool _5438 = _5434 || _5436;
                bool _5440 = isnan(0.0);
                bool _5442 = _5438 || _5440;
                float _5444 = precise::max(_896, 0.100000001490116119384765625);
                int _5446 = _5442 ? 0 : 1;
                float _5448 = precise::max(_888, 0.100000001490116119384765625);
                int _5450 = ~_5446;
                int _5452 = _5450 + 1;
                int _5454 = _5452 + 1;
                int _5456 = _5454;
                _5336 = _5442 ? (-1) : 0;
                _5458 = _5432 ? (-1) : 0;
                if (!_5432)
                {
                    int _5460 = ~_5446;
                    int _5462 = _5460 + 1;
                    _5456 = _5462;
                }
                int _5464 = _5456;
                float _5466 = _5444 + _5448;
                float _5468 = float(_5464);
                float _5470 = 1.0 / _5466;
                float _5472 = _5358 * _5468;
                float _5474 = _5360 * _5468;
                float _5476 = _5356 * _5468;
                float _5478 = _5400 * _5472;
                float _5480 = _5396 * _5474;
                float _5482 = -_5478;
                float _5484 = fma(_5392, _5474, _5482);
                float _5486 = _5392 * _5476;
                float _5488 = -_5480;
                float _5490 = fma(_5400, _5476, _5488);
                float _5492 = _5484 * _5484;
                float _5494 = -_5486;
                float _5496 = fma(_5396, _5472, _5494);
                float _5498 = _5470 * 0.4000000059604644775390625;
                float _5500 = fma(_5490, _5490, _5492);
                float _5502 = _5424 * _5498;
                float _5504 = fma(_5496, _5496, _5500);
                float _5506 = sqrt(_5504);
                float _5508 = _5506 + 9.9999997473787516355514526367188e-06;
                float _5510 = 1.0 / _5508;
                float _5512 = _5502 * _5510;
                float _5514 = fma(_5490, _5512, _5414);
                float _5516 = fma(_5484, _5512, _5416);
                float _5518 = fma(_5496, _5512, _5418);
                _5520 = _5516;
                _5522 = _5518;
                _5430 = _5514;
                _5524 = 1065353216;
                _5526 = true;
            }
            else
            {
                bool _5528 = _5404 > 0.5;
                bool _5530 = _5306 > (-0.800000011920928955078125);
                bool _5532 = _5530 && _5528;
                bool _5534 = !_5532;
                int _5536 = _5534 ? 1065353216 : 1056964608;
                _5520 = _5416;
                _5522 = _5418;
                _5458 = _5532 ? (-1) : 0;
                _5524 = _5536;
                _5526 = true;
            }
        }
        else
        {
            bool _5538 = _5372 > 0.0;
            bool _5540 = _5372 >= 0.0;
            bool _5542 = isnan(_5372);
            bool _5544 = _5540 || _5542;
            bool _5546 = isnan(0.0);
            bool _5548 = _5544 || _5546;
            int _5550 = _5548 ? 0 : 1;
            int _5552 = ~_5550;
            int _5554 = _5552 + 1;
            int _5556 = _5554 + 1;
            int _5558 = _5556;
            _5336 = _5548 ? (-1) : 0;
            if (!_5538)
            {
                int _5560 = ~_5550;
                int _5562 = _5560 + 1;
                _5558 = _5562;
            }
            int _5564 = _5558;
            bool _5566 = _5404 >= 0.300000011920928955078125;
            bool _5568 = isnan(_5404);
            bool _5570 = _5566 || _5568;
            bool _5572 = isnan(0.300000011920928955078125);
            bool _5574 = _5570 || _5572;
            float _5576 = float(_5564);
            int _5578 = _5574 ? as_type<int>(_3226) : 1065353216;
            float _5580 = _5360 * _5576;
            float _5582 = _5358 * _5576;
            float _5584 = _5356 * _5576;
            float _5586 = _5580 * _5228;
            float _5588 = _5582 * _5232;
            float _5590 = _5584 * _5230;
            float _5592 = -_5586;
            float _5594 = fma(_5584, _5232, _5592);
            float _5596 = _5404 * 10.0;
            float _5598 = -_5588;
            float _5600 = fma(_5580, _5230, _5598);
            float _5602 = -_5590;
            float _5604 = fma(_5582, _5228, _5602);
            float _5606 = _5596 * _5594;
            float _5608 = _5596 * _5600;
            float _5610 = _5596 * _5604;
            _5520 = _5608;
            _5522 = _5610;
            _5430 = _5606;
            _5458 = _5574 ? (-1) : 0;
            _5524 = _5578;
        }
        _5526 = false;
        float _5612 = _5520;
        float _5614 = _5522;
        int _5616 = _5336;
        float _5618 = _5430;
        int _5620 = _5458;
        int _5622 = _5524;
        bool _5624 = _5236 >= (-0.20000000298023223876953125);
        bool _5626 = isnan(_5236);
        bool _5628 = _5624 || _5626;
        bool _5630 = isnan(-0.20000000298023223876953125);
        bool _5632 = _5628 || _5630;
        float _5634 = _4810 * 0.20000000298023223876953125;
        float _5636 = _4800 * 0.20000000298023223876953125;
        float _5638 = _4786 * 0.20000000298023223876953125;
        int _5640 = _5616;
        int _5642 = _5620;
        _5644 = _5634;
        _5134 = _5638;
        _5136 = _5636;
        _5646 = 0.0;
        _5648 = 0.0;
        _5650 = 0.0;
        _5652 = 0.0;
        _5654 = _5612;
        _5656 = _5614;
        _5658 = _5632;
        if (_5632)
        {
            bool _5660 = _5306 > 2.0;
            _5640 = _5660 ? (-1) : 0;
        }
        int _5662 = _5640;
        if (!_5632)
        {
            _5642 = -1;
        }
        int _5664 = _5642;
        int _5666 = _5664;
        if (_5632)
        {
            bool _5668 = _5236 >= (-0.20000000298023223876953125);
            int _5670 = (_5668 ? (-1) : 0) & _5662;
            _5666 = _5670;
        }
        int _5672 = _5666;
        int _5674 = ~_5672;
        bool _5676 = !_5300;
        int _5678 = _5674 & (_5676 ? (-1) : 0);
        bool _5680 = !_5300;
        int _5682 = _5672 & (_5680 ? (-1) : 0);
        int _5684 = _5678 | _5682;
        int _5686 = _5672 & (_5300 ? (-1) : 0);
        int _5688 = _5684 | _5686;
        int _5690 = ~_5688;
        float _5692 = (_5690 != 0) ? as_type<float>(_5622) : 0.0;
        _5694 = _5692;
        _5696 = _5618;
        _5698 = true;
    }
    else
    {
        bool _5700 = _5306 < 0.0;
        bool _5702 = _5700 && _5300;
        bool _5704 = _5306 > (-0.800000011920928955078125);
        bool _5706 = _5704 && _5702;
        if (_5706)
        {
            float _5708 = _4082 * _5228;
            _1132 = _5708;
        }
        float _5710 = _1132;
        float _5712 = _5710;
        if (!_5706)
        {
            _5286 = 0.0;
        }
        float _5714 = _5286;
        float _5716 = _5714;
        if (!_5706)
        {
            _5288 = _5116;
        }
        float _5718 = _5288;
        float _5720 = _5718;
        if (_5706)
        {
            float _5722 = fma(_4084, _5230, _5710);
            _5310 = _5722;
        }
        float _5724 = _5310;
        float _5726 = _5724;
        if (!_5706)
        {
            _1134 = _5102;
        }
        float _5728 = _1134;
        float _5730 = _5728;
        if (!_5706)
        {
            _5312 = _5118;
        }
        float _5732 = _5312;
        float _5734 = _5732;
        if (_5706)
        {
            float _5736 = fma(_4086, _5232, _5724);
            _5726 = _5736;
        }
        float _5738 = _5726;
        float _5740 = _5738;
        if (!_5706)
        {
            _5712 = _5120;
        }
        float _5742 = _5712;
        float _5744 = _5742;
        if (!_5706)
        {
            _4806 = _3222;
        }
        float _5746 = _4806;
        float _5748 = _5746;
        if (_5706)
        {
            float _5750 = -_5230;
            float _5752 = fma(_5750, _5738, _4084);
            _4110 = _5752;
        }
        float _5754 = _4110;
        _5406 = _5754;
        if (_5706)
        {
            float _5756 = -_5228;
            float _5758 = fma(_5756, _5738, _4082);
            _4112 = _5758;
        }
        float _5760 = _4112;
        _5408 = _5760;
        if (_5706)
        {
            float _5762 = -_5232;
            float _5764 = fma(_5762, _5738, _4086);
            _4114 = _5764;
        }
        float _5766 = _4114;
        _5410 = _5766;
        if (!_5706)
        {
            _5740 = _3220;
        }
        float _5768 = _5740;
        float _5770 = _5768;
        if (!_5706)
        {
            _5132 = _3224;
        }
        float _5772 = _5132;
        float _5774 = _5772;
        if (!_5706)
        {
            _5290 = _3226;
        }
        float _5776 = _5290;
        _5694 = _5776;
        if (_5706)
        {
            _5716 = _5236;
        }
        float _5778 = _5716;
        _5652 = _5778;
        if (_5706)
        {
            _5720 = _5116;
        }
        float _5780 = _5720;
        _5644 = _5780;
        if (_5706)
        {
            _5730 = _5102;
        }
        float _5782 = _5730;
        _5646 = _5782;
        if (_5706)
        {
            _5734 = _5118;
        }
        float _5784 = _5734;
        _5648 = _5784;
        if (_5706)
        {
            _5744 = _5120;
        }
        float _5786 = _5744;
        _5650 = _5786;
        if (_5706)
        {
            _5770 = _3220;
        }
        float _5788 = _5770;
        _5696 = _5788;
        if (_5706)
        {
            _5748 = _3222;
        }
        float _5790 = _5748;
        _5654 = _5790;
        if (_5706)
        {
            _5774 = _3224;
        }
        float _5792 = _5774;
        _5656 = _5792;
        _5658 = false;
        if (_5706)
        {
            _5694 = 0.5;
            _5658 = false;
        }
    }
    _5698 = false;
    float _5794 = _5694;
    float _5796 = _5644;
    float _5798 = _5134;
    float _5800 = _5136;
    float _5802 = _5406;
    float _5804 = _5408;
    float _5806 = _5646;
    float _5808 = _5648;
    float _5810 = _5650;
    float _5812 = _5410;
    float _5814 = _5652;
    float _5816 = _5654;
    float _5818 = _5696;
    float _5820 = _5656;
    bool _5822 = _5658;
    float _5824 = 1.0 / _5304;
    float _5826 = _1586 * _1586;
    bool _5828 = _5794 >= 0.5;
    float _5830 = _5824 * _5796;
    float _5832 = _5824 * _5798;
    float _5834 = _5824 * _5800;
    float _5836 = fma(_5124, _5124, _5826);
    float _5838 = _5830 * _5830;
    float _5840 = fma(_5126, _5126, _5826);
    float _5842 = _5836 * 0.083333335816860198974609375;
    float _5844 = fma(_5832, _5832, _5838);
    float _5846 = _5840 * 0.083333335816860198974609375;
    float _5848 = fma(_5834, _5834, _5844);
    float _5850 = _5126 * _5126;
    float _5852 = _3386 * _5842;
    float _5854 = _3382 * _5846;
    float _5856 = sqrt(_5848);
    float _5858 = fma(_5124, _5124, _5850);
    float _5860 = _3346 * _5842;
    float _5862 = _3366 * _5842;
    float _5864 = _3346 * _5852;
    float _5866 = _3366 * _5852;
    float _5868 = _3346 * _5860;
    float _5870 = _3346 * _5862;
    float _5872 = _3366 * _5860;
    float _5874 = _3366 * _5862;
    float _5876 = _3386 * _5862;
    float _5878 = _3386 * _5860;
    float _5880 = fma(_3362, _5854, _5872);
    float _5882 = _3386 * _5852;
    float _5884 = _5858 * 0.083333335816860198974609375;
    float _5886 = fma(_3382, _5854, _5868);
    bool _5888 = _5856 > 80.0;
    float _5890 = _3340 * _5846;
    float _5892 = _3362 * _5846;
    float _5894 = fma(_3340, _5854, _5878);
    float _5896 = _3364 * _5884;
    float _5898 = fma(_3382, _5890, _5864);
    float _5900 = fma(_3362, _5890, _5866);
    float _5902 = fma(_3362, _5892, _5874);
    float _5904 = fma(_3340, _5890, _5882);
    float _5906 = _3370 * _5884;
    float _5908 = fma(_3340, _5892, _5876);
    float _5910 = _3468 * _5884;
    float _5912 = fma(_3364, _5896, _5886);
    float _5914 = _5872;
    float _5916 = _5910;
    float _5918 = _5906;
    float _5920 = _5892;
    float _5922 = _5896;
    float _5924 = _5806;
    float _5926 = _5912;
    float _5928 = _5812;
    float _5930 = _5814;
    if (_5888)
    {
        float _5932 = rsqrt(_5848);
        _5914 = _5932;
    }
    float _5934 = _5914;
    float _5936 = fma(_3370, _5896, _5894);
    float _5938 = fma(_3468, _5896, _5880);
    float _5940 = fma(_3370, _5910, _5908);
    float _5942 = fma(_3468, _5910, _5902);
    float _5944 = fma(_3382, _5892, _5870);
    float _5946 = fma(_3468, _5906, _5900);
    float _5948 = _5940 * _5938;
    float _5950 = fma(_3370, _5906, _5904);
    float _5952 = fma(_3364, _5906, _5898);
    float _5954 = _5940 * _5946;
    float _5956 = fma(_3364, _5910, _5944);
    float _5958 = _5936;
    float _5960 = _5952;
    float _5962 = _5938;
    if (!_5888)
    {
        _5916 = _5832;
    }
    float _5964 = _5916;
    float _5966 = _5940 * _3222;
    float _5968 = _5964;
    if (!_5888)
    {
        _5918 = _5830;
    }
    float _5970 = _5918;
    float _5972 = -_5954;
    float _5974 = fma(_5950, _5942, _5972);
    float _5976 = _5970;
    if (_5888)
    {
        float _5978 = _5934 * 80.0;
        _5920 = _5978;
    }
    float _5980 = _5920;
    float _5982 = _5936 * _5942;
    if (!_5888)
    {
        _5922 = _5834;
    }
    float _5984 = _5922;
    float _5986 = _5936 * _3222;
    float _5988 = _5984;
    if (_5888)
    {
        float _5990 = _5832 * _5980;
        _5968 = _5990;
    }
    float _5992 = _5968;
    float _5994 = -_5948;
    float _5996 = _5982 + _5994;
    if (_5888)
    {
        float _5998 = _5830 * _5980;
        _5976 = _5998;
    }
    float _6000 = _5976;
    if (_5888)
    {
        float _6002 = _5834 * _5980;
        _5988 = _6002;
    }
    float _6004 = _5988;
    float _6006 = _5950 * _5938;
    float _6008 = _5952 * _5996;
    float _6010 = _5950 * _3222;
    float _6012 = fma(_5956, _3220, _5966);
    float _6014 = -_6006;
    float _6016 = fma(_5936, _5946, _6014);
    float _6018 = -_6008;
    float _6020 = fma(_5912, _5974, _6018);
    float _6022 = fma(_5912, _3220, _5986);
    float _6024 = fma(_5952, _3220, _6010);
    float _6026 = fma(_5942, _3224, _6012);
    float _6028 = fma(_5956, _6016, _6020);
    float _6030 = fma(_5938, _3224, _6022);
    float _6032 = _3228 * 0.01666666753590106964111328125;
    float _6034 = fma(_5946, _3224, _6024);
    float _6036 = _6026 * _3222;
    bool _6038 = _6028 != 0.0;
    bool _6040 = isnan(_6028);
    bool _6042 = _6038 || _6040;
    bool _6044 = isnan(0.0);
    bool _6046 = _6042 || _6044;
    float _6048 = _6030 * _3224;
    float _6050 = fma(_6032, _5992, _5802);
    float _6052 = _6034 * _3220;
    float _6054 = -_6036;
    float _6056 = fma(_6034, _3224, _6054);
    float _6058 = -_6048;
    float _6060 = fma(_6026, _3220, _6058);
    float _6062 = fma(_6032, _6000, _5804);
    float _6064 = -_6052;
    float _6066 = fma(_6030, _3222, _6064);
    float _6068 = _6056 + _5806;
    float _6070 = _6060 + _5808;
    float _6072 = _6052;
    float _6074 = _6026;
    float _6076 = _6062;
    float _6078 = _6050;
    float _6080 = _6062;
    if (!_6046)
    {
        _6072 = _5946;
    }
    float _6082 = _6072;
    float _6084 = _6082;
    if (!_6046)
    {
        _6074 = _5942;
    }
    float _6086 = _6074;
    float _6088 = _6086;
    if (!_6046)
    {
        _3246 = _5950;
    }
    float _6090 = _3246;
    float _6092 = _6090;
    if (!_6046)
    {
        _3248 = _5940;
    }
    float _6094 = _3248;
    float _6096 = _6094;
    if (!_6046)
    {
        _5924 = _5956;
    }
    float _6098 = _5924;
    bool _6100 = !_6046;
    float _6102 = _6098;
    if (!_6100)
    {
        float _6104 = 1.0 / _6028;
        float _6106 = _5912 * _5940;
        float _6108 = _5952 * _5942;
        float _6110 = _5956 * _5950;
        float _6112 = _5912 * _5946;
        float _6114 = -_6106;
        float _6116 = fma(_5956, _5936, _6114);
        float _6118 = _5956 * _5938;
        float _6120 = _5952 * _5936;
        float _6122 = -_6108;
        float _6124 = fma(_5956, _5946, _6122);
        float _6126 = -_6110;
        float _6128 = fma(_5952, _5940, _6126);
        float _6130 = -_5982;
        float _6132 = _6130 + _5948;
        float _6134 = -_6112;
        float _6136 = fma(_5952, _5938, _6134);
        float _6138 = -_6118;
        float _6140 = fma(_5912, _5942, _6138);
        float _6142 = -_6120;
        float _6144 = fma(_5912, _5950, _6142);
        float _6146 = _6124 * _6104;
        float _6148 = _6128 * _6104;
        float _6150 = _6132 * _6104;
        float _6152 = _6116 * _6104;
        float _6154 = _5974 * _6104;
        float _6156 = _6016 * _6104;
        float _6158 = _6140 * _6104;
        float _6160 = _6136 * _6104;
        float _6162 = _6144 * _6104;
        _5958 = _6150;
        _6092 = _6158;
        _6096 = _6152;
        _5926 = _6154;
        _5960 = _6146;
        _6102 = _6148;
        _5962 = _6156;
        _6084 = _6160;
        _6088 = _6162;
    }
    float _6164 = _5958;
    float _6166 = _6092;
    float _6168 = _6096;
    float _6170 = _5926;
    float _6172 = _5960;
    float _6174 = _6102;
    float _6176 = _5962;
    float _6178 = _6084;
    float _6180 = _6088;
    float _6182 = _6070 * _6164;
    float _6184 = _6070 * _6166;
    float _6186 = _6070 * _6168;
    float _6188 = _6066 + _5810;
    float _6190 = fma(_6068, _6170, _6182);
    float _6192 = fma(_6068, _6172, _6184);
    float _6194 = fma(_6032, _6004, _5812);
    float _6196 = fma(_6068, _6174, _6186);
    float _6198 = fma(_6188, _6176, _6190);
    float _6200 = fma(_6188, _6178, _6192);
    float _6202 = fma(_6188, _6180, _6196);
    float _6204 = _6192;
    float _6206 = _6194;
    float _6208 = _6194;
    float _6210 = _6174;
    float _6212 = _6178;
    float _6214 = _6190;
    float _6216 = _6200;
    float _6218 = _6198;
    float _6220 = _6202;
    if (!_5828)
    {
        _6204 = _6050;
    }
    float _6222 = _6204;
    float _6224 = _6222;
    if (!_5828)
    {
        _5928 = _6194;
    }
    float _6226 = _5928;
    bool _6228 = !_5828;
    float _6230 = _6226;
    float _6232 = _6226;
    if (!_6228)
    {
        float _6234 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
        float _6236 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
        float _6238 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
        float _6240 = _6062 * _6062;
        float _6242 = fma(_6050, _6050, _6240);
        float _6244 = fma(_6194, _6194, _6242);
        float _6246 = sqrt(_6244);
        float _6248 = _6246 + 9.9999997473787516355514526367188e-06;
        float _6250 = 1.0 / _6248;
        float _6252 = _6050 * _6250;
        float _6254 = _6062 * _6250;
        float _6256 = _6234;
        _6210 = _6252;
        if (_786)
        {
            float _6258 = _6236 * _3756;
            _3818 = _6258;
        }
        float _6260 = _3818;
        float _6262 = _6260;
        if (_786)
        {
            float _6264 = _6236 * _3780;
            _3834 = _6264;
        }
        float _6266 = _3834;
        float _6268 = _6266;
        if (_786)
        {
            float _6270 = _6236 * _3804;
            _3858 = _6270;
        }
        float _6272 = _3858;
        float _6274 = _6194 * _6250;
        float _6276 = _6272;
        if (_786)
        {
            float _6278 = fma(_6234, _3754, _6260);
            _6262 = _6278;
        }
        float _6280 = _6262;
        if (_786)
        {
            float _6282 = fma(_6234, _3778, _6266);
            _6268 = _6282;
        }
        float _6284 = _6268;
        if (_786)
        {
            float _6286 = fma(_6234, _3802, _6272);
            _6276 = _6286;
        }
        float _6288 = _6276;
        if (_786)
        {
            float _6290 = fma(_6238, _3758, _6280);
            _3820 = _6290;
        }
        float _6292 = _3820;
        float _6294 = _6292;
        float _6296 = _6292;
        if (_786)
        {
            float _6298 = fma(_6238, _3782, _6284);
            _3836 = _6298;
        }
        float _6300 = _3836;
        float _6302 = _6300;
        float _6304 = _6300;
        if (_786)
        {
            float _6306 = fma(_6238, _3806, _6288);
            _3860 = _6306;
        }
        float _6308 = _3860;
        float _6310 = _6308;
        float _6312 = _6308;
        if (!_786)
        {
            bool _6314 = !_1022;
            if (!_6314)
            {
                uint _6316 = uint(int(uint(_172) >> uint(2)));
                float _6318 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_6316)]);
                int _6320 = _172 + 4;
                uint _6322 = uint(int(uint(_6320) >> uint(2)));
                float _6324 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_6322)]);
                int _6326 = _172 + 8;
                uint _6328 = uint(int(uint(_6326) >> uint(2)));
                float _6330 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_6328)]);
                uint _6332 = uint(int(uint(_172) >> uint(2)));
                float _6334 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_6332)]);
                int _6336 = _172 + 4;
                uint _6338 = uint(int(uint(_6336) >> uint(2)));
                float _6340 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_6338)]);
                int _6342 = _172 + 8;
                uint _6344 = uint(int(uint(_6342) >> uint(2)));
                float _6346 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_6344)]);
                uint _6348 = uint(int(uint(_172) >> uint(2)));
                float _6350 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6348)]);
                int _6352 = _172 + 4;
                uint _6354 = uint(int(uint(_6352) >> uint(2)));
                float _6356 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6354)]);
                int _6358 = _172 + 8;
                uint _6360 = uint(int(uint(_6358) >> uint(2)));
                float _6362 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6360)]);
                int _6364 = _172 + 12;
                uint _6366 = uint(int(uint(_6364) >> uint(2)));
                float _6368 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6366)]);
                float _6370 = _6324 * _6236;
                float _6372 = _6340 * _6236;
                float _6374 = _6356 * _6236;
                float _6376 = fma(_6318, _6234, _6370);
                float _6378 = fma(_6334, _6234, _6372);
                float _6380 = fma(_6350, _6234, _6374);
                float _6382 = fma(_6330, _6238, _6376);
                float _6384 = fma(_6346, _6238, _6378);
                float _6386 = fma(_6362, _6238, _6380);
                _6304 = _6384;
                _6296 = _6382;
                _6312 = _6386;
                _6230 = _6368;
                _6388 = true;
            }
            else
            {
                if (!_1102)
                {
                    _6294 = _6234;
                }
                float _6390 = _6294;
                _6296 = _6390;
                if (!_1102)
                {
                    _6302 = _6236;
                }
                float _6392 = _6302;
                _6304 = _6392;
                if (!_1102)
                {
                    _6310 = _6238;
                }
                float _6394 = _6310;
                bool _6396 = !_1102;
                _6312 = _6394;
                if (!_6396)
                {
                    uint _6398 = uint(int(uint(_172) >> uint(2)));
                    float _6400 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_6398)]);
                    int _6402 = _172 + 4;
                    uint _6404 = uint(int(uint(_6402) >> uint(2)));
                    float _6406 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_6404)]);
                    int _6408 = _172 + 8;
                    uint _6410 = uint(int(uint(_6408) >> uint(2)));
                    float _6412 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_6410)]);
                    uint _6414 = uint(int(uint(_172) >> uint(2)));
                    float _6416 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_6414)]);
                    int _6418 = _172 + 4;
                    uint _6420 = uint(int(uint(_6418) >> uint(2)));
                    float _6422 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_6420)]);
                    int _6424 = _172 + 8;
                    uint _6426 = uint(int(uint(_6424) >> uint(2)));
                    float _6428 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_6426)]);
                    uint _6430 = uint(int(uint(_172) >> uint(2)));
                    float _6432 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6430)]);
                    int _6434 = _172 + 4;
                    uint _6436 = uint(int(uint(_6434) >> uint(2)));
                    float _6438 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6436)]);
                    int _6440 = _172 + 8;
                    uint _6442 = uint(int(uint(_6440) >> uint(2)));
                    float _6444 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6442)]);
                    int _6446 = _172 + 12;
                    uint _6448 = uint(int(uint(_6446) >> uint(2)));
                    float _6450 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6448)]);
                    float _6452 = _6406 * _6236;
                    float _6454 = _6422 * _6236;
                    float _6456 = _6438 * _6236;
                    float _6458 = fma(_6400, _6234, _6452);
                    float _6460 = fma(_6416, _6234, _6454);
                    float _6462 = fma(_6432, _6234, _6456);
                    float _6464 = fma(_6412, _6238, _6458);
                    float _6466 = fma(_6428, _6238, _6460);
                    float _6468 = fma(_6444, _6238, _6462);
                    _6304 = _6466;
                    _6296 = _6464;
                    _6312 = _6468;
                    _6230 = _6450;
                }
            }
        }
        _6388 = false;
        float _6470 = _6304;
        float _6472 = _6296;
        float _6474 = _6312;
        float _6476 = _6230;
        float _6478 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
        float _6480 = _6478 * 59.999996185302734375;
        float _6482 = _6470 * _6480;
        float _6484 = _6472 * _6480;
        float _6486 = _3228 * _6482;
        float _6488 = _6474 * _6480;
        float _6490 = _3228 * _6484;
        float _6492 = _6486 * _5228;
        float _6494 = _3228 * _6488;
        float _6496 = fma(_6490, _5230, _6492);
        float _6498 = fma(_6494, _5232, _6496);
        float _6500 = -_5228;
        float _6502 = fma(_6498, _6500, _6486);
        float _6504 = -_5230;
        float _6506 = fma(_6498, _6504, _6490);
        float _6508 = -_5232;
        float _6510 = fma(_6498, _6508, _6494);
        float _6512 = _6502 * _6502;
        float _6514 = fma(_6506, _6506, _6512);
        float _6516 = fma(_6510, _6510, _6514);
        float _6518 = sqrt(_6516);
        float _6520 = _6518 + 9.9999997473787516355514526367188e-06;
        float _6522 = 1.0 / _6520;
        float _6524 = _6502 * _6522;
        float _6526 = _6506 * _6522;
        float _6528 = _6510 * _6522;
        float _6530 = _6062 * _6524;
        float _6532 = fma(_6050, _6526, _6530);
        float _6534 = fma(_6194, _6528, _6532);
        float _6536 = _6534 * 0.5;
        bool _6538 = _6534 >= 0.0;
        float _6540 = float(_6538);
        float _6542 = precise::min(_6518, _6536);
        float _6544 = _6542 * _6540;
        float _6546 = -_6544;
        float _6548 = fma(_6524, _6546, _6062);
        float _6550 = -_6544;
        float _6552 = fma(_6526, _6550, _6050);
        float _6554 = -_6544;
        float _6556 = fma(_6528, _6554, _6194);
        float _6558 = _6548 * _6548;
        float _6560 = fma(_6552, _6552, _6558);
        float _6562 = fma(_6556, _6556, _6560);
        float _6564 = sqrt(_6562);
        bool _6566 = _6564 > 0.5;
        bool _6568 = isnan(_6564);
        bool _6570 = _6566 || _6568;
        bool _6572 = isnan(0.5);
        bool _6574 = _6570 || _6572;
        float _6576 = _6544;
        float _6578 = _6476;
        _6078 = _6564;
        _3822 = _6552;
        _3824 = _6522;
        _6212 = _6518;
        _3838 = _6548;
        _3840 = _6556;
        _3842 = _6470;
        _6214 = _6540;
        if (!_6574)
        {
            float _6580 = _898 * 20.0;
            _6076 = _6580;
        }
        float _6582 = _6076;
        float _6584 = _6582;
        if (_6574)
        {
            float _6586 = _898 * 10.0;
            _1136 = _6586;
        }
        float _6588 = _1136;
        float _6590 = _6588;
        if (!_6574)
        {
            float _6592 = _3228 * _6582;
            _6584 = _6592;
        }
        float _6594 = _6584;
        float _6596 = _6594;
        if (_6574)
        {
            float _6598 = _3228 * _6588;
            _6590 = _6598;
        }
        float _6600 = _6590;
        float _6602 = _6600;
        if (!_6574)
        {
            float _6604 = _6594 * 0.01666666753590106964111328125;
            _6596 = _6604;
        }
        float _6606 = _6596;
        float _6608 = _6606;
        if (_6574)
        {
            float _6610 = _6600 * 0.01666666753590106964111328125;
            _6602 = _6610;
        }
        float _6612 = _6602;
        if (!_6574)
        {
            float _6614 = precise::min(_6564, _6606);
            _6206 = _6614;
        }
        float _6616 = _6206;
        _6208 = _6616;
        if (_6574)
        {
            float _6618 = precise::min(_6564, _6612);
            _6576 = _6618;
        }
        float _6620 = _6576;
        if (!_6574)
        {
            float _6622 = -_6252;
            float _6624 = fma(_6622, _6616, _6552);
            _6256 = _6624;
        }
        float _6626 = _6256;
        float _6628 = _6626;
        if (!_6574)
        {
            float _6630 = -_6254;
            float _6632 = fma(_6630, _6616, _6548);
            _6608 = _6632;
        }
        float _6634 = _6608;
        float _6636 = _6634;
        if (!_6574)
        {
            float _6638 = -_6274;
            float _6640 = fma(_6638, _6616, _6556);
            _6578 = _6640;
        }
        float _6642 = _6578;
        _6232 = _6642;
        if (_6574)
        {
            float _6644 = -_6252;
            float _6646 = fma(_6644, _6620, _6552);
            _6628 = _6646;
        }
        float _6648 = _6628;
        _6224 = _6648;
        if (_6574)
        {
            float _6650 = -_6254;
            float _6652 = fma(_6650, _6620, _6548);
            _6636 = _6652;
        }
        float _6654 = _6636;
        _6080 = _6654;
        if (_6574)
        {
            float _6656 = -_6274;
            float _6658 = fma(_6656, _6620, _6556);
            _6232 = _6658;
        }
    }
    float _6660 = _6208;
    float _6662 = _6210;
    float _6664 = _6078;
    float _6666 = _3822;
    float _6668 = _3824;
    float _6670 = _6212;
    float _6672 = _3838;
    float _6674 = _3840;
    float _6676 = _3842;
    float _6678 = _6214;
    float _6680 = _6080;
    float _6682 = _6224;
    float _6684 = _6232;
    bool _6686 = !_786;
    float _6688 = _6664;
    float _6690 = _6660;
    float _6692 = _6662;
    float _6694 = _6666;
    float _6696 = _6668;
    float _6698 = _6670;
    float _6700 = _6672;
    float _6702 = _6674;
    float _6704 = _6676;
    float _6706 = _6678;
    float _6784;
    float _6786;
    if (!_6686)
    {
        float _6708 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _6710 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _6712 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _6714 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _6716 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _6718 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _6720 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _6722 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _6724 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _6726 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _6728 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        float _6730 = _6712 * _6714;
        float _6732 = _6712 * _6716;
        float _6734 = -_6730;
        float _6736 = fma(_6708, _6718, _6734);
        float _6738 = -_6732;
        float _6740 = fma(_6710, _6718, _6738);
        float _6742 = _6710 * _6714;
        float _6744 = _6726 * _6714;
        float _6746 = _6724 * _6736;
        float _6748 = -_6742;
        float _6750 = fma(_6708, _6716, _6748);
        float _6752 = _6722 * _6716;
        float _6754 = -_6746;
        float _6756 = fma(_6722, _6740, _6754);
        float _6758 = -_6744;
        float _6760 = fma(_6722, _6718, _6758);
        float _6762 = -_6752;
        float _6764 = fma(_6724, _6714, _6762);
        float _6766 = fma(_6726, _6750, _6756);
        float _6768 = _6724 * _6718;
        float _6770 = -_6768;
        float _6772 = fma(_6726, _6716, _6770);
        float _6774 = 1.0 / _6766;
        float _6776 = _6774 * _5814;
        float _6778 = _6772 * _6776;
        float _6780 = _6760 * _6776;
        float _6782 = _6764 * _6776;
        _6784 = _6778;
        _6786 = _6782;
        _6692 = _6774;
        _6694 = _6716;
        _6696 = _6718;
        _6698 = _6720;
        _6700 = _6722;
        _6702 = _6724;
        _6704 = _6776;
        _6706 = _6728;
        _5930 = _6780;
        _6788 = true;
    }
    else
    {
        bool _6790 = _1020 != 0;
        bool _6792 = _1100 != 0;
        bool _6794 = _6792 || _6790;
        if (!_6794)
        {
            _6688 = 0.0;
        }
        float _6796 = _6688;
        _6784 = _6796;
        if (!_6794)
        {
            _6690 = 0.0;
        }
        float _6798 = _6690;
        bool _6800 = !_6794;
        _6786 = _6798;
        if (!_6800)
        {
            uint _6802 = uint(int(uint(_172) >> uint(2)));
            float _6804 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_6802)]);
            int _6806 = _172 + 4;
            uint _6808 = uint(int(uint(_6806) >> uint(2)));
            float _6810 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_6808)]);
            int _6812 = _172 + 8;
            uint _6814 = uint(int(uint(_6812) >> uint(2)));
            float _6816 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_6814)]);
            uint _6818 = uint(int(uint(_172) >> uint(2)));
            float _6820 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6818)]);
            int _6822 = _172 + 4;
            uint _6824 = uint(int(uint(_6822) >> uint(2)));
            float _6826 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6824)]);
            int _6828 = _172 + 8;
            uint _6830 = uint(int(uint(_6828) >> uint(2)));
            float _6832 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6830)]);
            int _6834 = _172 + 12;
            uint _6836 = uint(int(uint(_6834) >> uint(2)));
            float _6838 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6836)]);
            uint _6840 = uint(int(uint(_172) >> uint(2)));
            float _6842 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_6840)]);
            int _6844 = _172 + 4;
            uint _6846 = uint(int(uint(_6844) >> uint(2)));
            float _6848 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_6846)]);
            int _6850 = _172 + 8;
            uint _6852 = uint(int(uint(_6850) >> uint(2)));
            float _6854 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_6852)]);
            int _6856 = _172 + 12;
            uint _6858 = uint(int(uint(_6856) >> uint(2)));
            float _6860 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_6858)]);
            float _6862 = _6816 * _6820;
            float _6864 = _6816 * _6826;
            float _6866 = _6810 * _6820;
            float _6868 = -_6862;
            float _6870 = fma(_6804, _6832, _6868);
            float _6872 = -_6864;
            float _6874 = fma(_6810, _6832, _6872);
            float _6876 = -_6866;
            float _6878 = fma(_6804, _6826, _6876);
            float _6880 = _6842 * _6826;
            float _6882 = _6848 * _6870;
            float _6884 = -_6882;
            float _6886 = fma(_6842, _6874, _6884);
            float _6888 = _6848 * _6832;
            float _6890 = -_6880;
            float _6892 = fma(_6848, _6820, _6890);
            float _6894 = fma(_6854, _6878, _6886);
            float _6896 = _6854 * _6820;
            float _6898 = -_6888;
            float _6900 = fma(_6854, _6826, _6898);
            float _6902 = -_6896;
            float _6904 = fma(_6842, _6832, _6902);
            float _6906 = 1.0 / _6894;
            float _6908 = _6906 * _5814;
            float _6910 = _6900 * _6908;
            float _6912 = _6904 * _6908;
            float _6914 = _6892 * _6908;
            _6784 = _6910;
            _6786 = _6914;
            _6692 = _6906;
            _6694 = _6826;
            _6696 = _6832;
            _6698 = _6838;
            _6700 = _6842;
            _6702 = _6892;
            _6704 = _6854;
            _6706 = _6860;
            _5930 = _6912;
        }
    }
    _6788 = false;
    float _6916 = _6784;
    float _6918 = _6786;
    float _6920 = _6692;
    float _6922 = _6694;
    float _6924 = _6696;
    float _6926 = _6698;
    float _6928 = _6700;
    float _6930 = _6702;
    float _6932 = _6704;
    float _6934 = _6706;
    float _6936 = _5930;
    float _6938 = _6680 * 0.01666666753590106964111328125;
    float _6940 = _3392 + _6916;
    float _6942 = _3390 + _6918;
    float _6944 = _6682 * 0.01666666753590106964111328125;
    float _6946 = _6684 * 0.01666666753590106964111328125;
    bool _6948 = !_786;
    float _6950 = _6920;
    float _6952 = _6918;
    float _6954 = _6916;
    float _6956 = _6922;
    float _6958 = _6924;
    float _6960 = _6926;
    float _6962 = _6928;
    float _6964 = _6930;
    float _6966 = _6932;
    float _6968 = _6934;
    float _7090;
    float _7092;
    float _7094;
    if (!_6948)
    {
        float _6970 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _6972 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _6974 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _6976 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _6978 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _6980 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _6982 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _6984 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _6986 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _6988 = _6974 * _6976;
        float _6990 = _6974 * _6978;
        float _6992 = _6972 * _6976;
        float _6994 = -_6988;
        float _6996 = fma(_6970, _6980, _6994);
        float _6998 = -_6990;
        float _7000 = fma(_6972, _6980, _6998);
        float _7002 = _6984 * _6980;
        float _7004 = _6986 * _6972;
        float _7006 = _6984 * _6996;
        float _7008 = -_6992;
        float _7010 = fma(_6970, _6978, _7008);
        float _7012 = _6986 * _6976;
        float _7014 = _6982 * _6978;
        float _7016 = -_7006;
        float _7018 = fma(_6982, _7000, _7016);
        float _7020 = -_7002;
        float _7022 = fma(_6986, _6978, _7020);
        float _7024 = -_7004;
        float _7026 = fma(_6984, _6974, _7024);
        float _7028 = -_7012;
        float _7030 = fma(_6982, _6980, _7028);
        float _7032 = fma(_6986, _7010, _7018);
        float _7034 = _6984 * _6970;
        float _7036 = -_7014;
        float _7038 = fma(_6984, _6976, _7036);
        float _7040 = 1.0 / _7032;
        float _7042 = -_7034;
        float _7044 = fma(_6982, _6972, _7042);
        float _7046 = _6982 * _6974;
        float _7048 = -_7046;
        float _7050 = fma(_6986, _6970, _7048);
        float _7052 = -_6970;
        float _7054 = fma(_7052, _6980, _6988);
        float _7056 = _7022 * _7040;
        float _7058 = _7030 * _7040;
        float _7060 = _7038 * _7040;
        float _7062 = _7054 * _7040;
        float _7064 = _6938 * _7056;
        float _7066 = _6938 * _7058;
        float _7068 = _6938 * _7060;
        float _7070 = _6944 * _7040;
        float _7072 = _7050 * _7040;
        float _7074 = fma(_6944, _7062, _7066);
        float _7076 = _7026 * _7040;
        float _7078 = _7044 * _7040;
        float _7080 = fma(_7000, _7070, _7064);
        float _7082 = fma(_7010, _7070, _7068);
        float _7084 = fma(_6946, _7072, _7074);
        float _7086 = fma(_6946, _7076, _7080);
        float _7088 = fma(_6946, _7078, _7082);
        _6956 = _7082;
        _6958 = _7080;
        _6960 = _7060;
        _6962 = _7066;
        _6964 = _7038;
        _6966 = _7070;
        _6968 = _7012;
        _7090 = _7086;
        _7092 = _7084;
        _7094 = _7088;
        _7096 = true;
    }
    else
    {
        bool _7098 = _1020 != 0;
        bool _7100 = _1100 != 0;
        bool _7102 = _7100 || _7098;
        if (!_7102)
        {
            _6950 = _6944;
        }
        float _7104 = _6950;
        _7090 = _7104;
        if (!_7102)
        {
            _6952 = _6938;
        }
        float _7106 = _6952;
        _7092 = _7106;
        if (!_7102)
        {
            _6954 = _6946;
        }
        float _7108 = _6954;
        bool _7110 = !_7102;
        _7094 = _7108;
        if (!_7110)
        {
            uint _7112 = uint(int(uint(_172) >> uint(2)));
            float _7114 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7112)]);
            int _7116 = _172 + 4;
            uint _7118 = uint(int(uint(_7116) >> uint(2)));
            float _7120 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7118)]);
            int _7122 = _172 + 8;
            uint _7124 = uint(int(uint(_7122) >> uint(2)));
            float _7126 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7124)]);
            uint _7128 = uint(int(uint(_172) >> uint(2)));
            float _7130 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7128)]);
            int _7132 = _172 + 4;
            uint _7134 = uint(int(uint(_7132) >> uint(2)));
            float _7136 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7134)]);
            int _7138 = _172 + 8;
            uint _7140 = uint(int(uint(_7138) >> uint(2)));
            float _7142 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7140)]);
            uint _7144 = uint(int(uint(_172) >> uint(2)));
            float _7146 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7144)]);
            int _7148 = _172 + 4;
            uint _7150 = uint(int(uint(_7148) >> uint(2)));
            float _7152 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7150)]);
            int _7154 = _172 + 8;
            uint _7156 = uint(int(uint(_7154) >> uint(2)));
            float _7158 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7156)]);
            float _7160 = _7126 * _7130;
            float _7162 = _7126 * _7136;
            float _7164 = _7120 * _7130;
            float _7166 = -_7160;
            float _7168 = fma(_7114, _7142, _7166);
            float _7170 = -_7162;
            float _7172 = fma(_7120, _7142, _7170);
            float _7174 = _7152 * _7114;
            float _7176 = _7158 * _7120;
            float _7178 = _7152 * _7168;
            float _7180 = -_7164;
            float _7182 = fma(_7114, _7136, _7180);
            float _7184 = -_7174;
            float _7186 = fma(_7146, _7120, _7184);
            float _7188 = _7152 * _7142;
            float _7190 = -_7178;
            float _7192 = fma(_7146, _7172, _7190);
            float _7194 = _7158 * _7130;
            float _7196 = _7146 * _7136;
            float _7198 = -_7188;
            float _7200 = fma(_7158, _7136, _7198);
            float _7202 = fma(_7158, _7182, _7192);
            float _7204 = -_7176;
            float _7206 = fma(_7152, _7126, _7204);
            float _7208 = -_7194;
            float _7210 = fma(_7146, _7142, _7208);
            float _7212 = -_7196;
            float _7214 = fma(_7152, _7130, _7212);
            float _7216 = 1.0 / _7202;
            float _7218 = _7146 * _7126;
            float _7220 = -_7114;
            float _7222 = fma(_7220, _7142, _7160);
            float _7224 = -_7218;
            float _7226 = fma(_7158, _7114, _7224);
            float _7228 = _7200 * _7216;
            float _7230 = _7210 * _7216;
            float _7232 = _7214 * _7216;
            float _7234 = _6944 * _7216;
            float _7236 = _7228 * _6938;
            float _7238 = _7230 * _6938;
            float _7240 = _7222 * _7216;
            float _7242 = _7232 * _6938;
            float _7244 = _7206 * _7216;
            float _7246 = fma(_7172, _7234, _7236);
            float _7248 = _7226 * _7216;
            float _7250 = fma(_7240, _6944, _7238);
            float _7252 = _7186 * _7216;
            float _7254 = fma(_7182, _7234, _7242);
            float _7256 = fma(_7244, _6946, _7246);
            float _7258 = fma(_7248, _6946, _7250);
            float _7260 = fma(_7252, _6946, _7254);
            _6956 = _7136;
            _6958 = _7142;
            _6960 = _7202;
            _6962 = _7146;
            _6964 = _7232;
            _6966 = _7158;
            _6968 = _7244;
            _7090 = _7256;
            _7092 = _7258;
            _7094 = _7260;
        }
    }
    _7096 = false;
    float _7262 = _6956;
    float _7264 = _6958;
    float _7266 = _6960;
    float _7268 = _6962;
    float _7270 = _6964;
    float _7272 = _6966;
    float _7274 = _6968;
    float _7276 = _7090;
    float _7278 = _7092;
    float _7280 = _7094;
    float _7282 = _6200 * _6200;
    float _7284 = _3228 * (-0.0291463173925876617431640625);
    float _7286 = fma(_6198, _6198, _7282);
    float _7288 = exp2(_7284);
    float _7290 = fma(_6202, _6202, _7286);
    float _7292 = sqrt(_7290);
    float _7294 = _7292 * 0.01666666753590106964111328125;
    bool _7296 = _7294 > 1.57079637050628662109375;
    float _7298 = _7294;
    if (_7296)
    {
        float _7300 = rsqrt(_7290);
        _7298 = _7300;
    }
    float _7302 = _7298;
    float _7304 = _7302;
    if (_7296)
    {
        float _7306 = _7302 * 94.24777984619140625;
        _7304 = _7306;
    }
    float _7308 = _7304;
    if (_7296)
    {
        float _7310 = _6200 * _7308;
        _6216 = _7310;
    }
    float _7312 = _6216;
    if (_7296)
    {
        float _7314 = _6198 * _7308;
        _6218 = _7314;
    }
    float _7316 = _6218;
    if (_7296)
    {
        float _7318 = _6202 * _7308;
        _6220 = _7318;
    }
    float _7320 = _6220;
    float _7322 = fma(_6032, _7312, _5816);
    float _7324 = fma(_6032, _7316, _5818);
    float _7326 = fma(_6032, _7320, _5820);
    float _7328 = _7322 * _7288;
    float _7330 = _7324 * _7288;
    float _7332 = _7326 * _7288;
    float _7334 = _7328 * _7328;
    float _7336 = fma(_7330, _7330, _7334);
    float _7338 = fma(_7332, _7332, _7336);
    float _7340 = sqrt(_7338);
    bool _7342 = _7340 > 31.4159259796142578125;
    float _7344 = _7340;
    float _7346 = _7328;
    float _7348 = _7330;
    float _7350 = _7332;
    if (_7342)
    {
        float _7352 = rsqrt(_7338);
        _7344 = _7352;
    }
    float _7354 = _7344;
    float _7356 = _7354;
    if (_7342)
    {
        float _7358 = _7354 * 31.4159259796142578125;
        _7356 = _7358;
    }
    float _7360 = _7356;
    if (_7342)
    {
        float _7362 = _7328 * _7360;
        _7346 = _7362;
    }
    float _7364 = _7346;
    if (_7342)
    {
        float _7366 = _7330 * _7360;
        _7348 = _7366;
    }
    float _7368 = _7348;
    if (_7342)
    {
        float _7370 = _7332 * _7360;
        _7350 = _7370;
    }
    float _7372 = _7350;
    float _7374 = _6032 * _7364;
    float _7376 = _6032 * _7368;
    float _7378 = _6032 * _7372;
    float _7380 = _7374 * _7374;
    float _7382 = fma(_7376, _7376, _7380);
    float _7384 = fma(_7378, _7378, _7382);
    float _7386 = sqrt(_7384);
    float _7388 = rsqrt(_7384);
    float _7390 = _7386 * 0.5;
    bool _7392 = _7386 != 0.0;
    bool _7394 = isnan(_7386);
    bool _7396 = _7392 || _7394;
    bool _7398 = isnan(0.0);
    bool _7400 = _7396 || _7398;
    float _7402 = _7390 * 0.15915493667125701904296875;
    float _7404 = _7402 * 6.283185482025146484375;
    float _7406 = sin(_7404);
    float _7408 = _7378 * _7388;
    float _7410 = _7374 * _7388;
    float _7412 = _7376 * _7388;
    float _7414 = _7400 ? _7408 : 0.0;
    float _7416 = _7402 * 6.283185482025146484375;
    float _7418 = cos(_7416);
    float _7420 = _7400 ? _7410 : 0.0;
    float _7422 = _7400 ? _7412 : 0.0;
    float _7424 = _7414 * _7406;
    float _7426 = _7420 * _7406;
    float _7428 = _7422 * _7406;
    float _7430 = _7424 * _3210;
    float _7432 = _7426 * _3198;
    float _7434 = _7426 * _3204;
    float _7436 = _7426 * _3210;
    float _7438 = -_7430;
    float _7440 = fma(_7426, _3206, _7438);
    float _7442 = fma(_7418, _3210, _7432);
    float _7444 = -_7434;
    float _7446 = fma(_7428, _3210, _7444);
    float _7448 = _7428 * _3198;
    float _7450 = _7428 * _3206;
    float _7452 = _7424 * _3198;
    float _7454 = fma(_7428, _3204, _7436);
    float _7456 = fma(_7418, _3204, _7448);
    float _7458 = -_7450;
    float _7460 = fma(_7424, _3204, _7458);
    float _7462 = fma(_7418, _3206, _7452);
    float _7464 = fma(_7424, _3206, _7454);
    float _7466 = _7456 + _7440;
    float _7468 = _7442 + _7460;
    float _7470 = _7462 + _7446;
    float _7472 = -_7464;
    float _7474 = fma(_7418, _3198, _7472);
    uint _7476 = uint(int(uint(_732) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_7476)] = as_type<uint>(_7466);
    int _7478 = _732 + 4;
    uint _7480 = uint(int(uint(_7478) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_7480)] = as_type<uint>(_7468);
    int _7482 = _732 + 8;
    uint _7484 = uint(int(uint(_7482) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_7484)] = as_type<uint>(_7470);
    int _7486 = _732 + 12;
    uint _7488 = uint(int(uint(_7486) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_7488)] = as_type<uint>(_7474);
    uint _7490 = uint(int(uint(_890) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_7490)] = as_type<uint>(_7368);
    int _7492 = _890 + 4;
    uint _7494 = uint(int(uint(_7492) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_7494)] = as_type<uint>(_7364);
    int _7496 = _890 + 8;
    uint _7498 = uint(int(uint(_7496) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_7498)] = as_type<uint>(_7372);
    int _7500 = _890 + 12;
    uint _7502 = uint(int(uint(_7500) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_7502)] = as_type<uint>(_5794);
    float _7504 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    float _7506 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[71]);
    int _7508 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 48;
    uint _7510 = uint(int(uint(_7508) >> uint(2)));
    float _7512 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_7510)]);
    int _7514 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 52;
    uint _7516 = uint(int(uint(_7514) >> uint(2)));
    float _7518 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_7516)]);
    int _7520 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 56;
    uint _7522 = uint(int(uint(_7520) >> uint(2)));
    float _7524 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_7522)]);
    int _7526 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 36;
    uint _7528 = uint(int(uint(_7526) >> uint(2)));
    float _7530 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_7528)]);
    int _7532 = as_type<int>(_7504) & 512;
    bool _7534 = _7532 != 0;
    int _7536 = as_type<int>(_7504) & 1024;
    bool _7538 = _7536 != 0;
    float _7540 = _7464;
    float _7542 = _7262;
    float _7544 = _7264;
    float _7546 = _7266;
    bool _7548 = _7538;
    bool _7550 = _5822;
    if (_7534)
    {
        float _7552 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _7554 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _7556 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _7558 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _7540 = _7552;
        _7542 = _7554;
        _7544 = _7556;
        _7546 = _7558;
    }
    float _7560 = _7540;
    float _7562 = _7542;
    float _7564 = _7544;
    float _7566 = _7546;
    float _7568 = _3206;
    float _7570 = _3198;
    float _7572 = _7442;
    float _7574 = _7440;
    if (_7534)
    {
        float _7576 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _7578 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _7580 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _7582 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _7568 = _7576;
        _7570 = _7578;
        _7572 = _7580;
        _7574 = _7582;
    }
    float _7584 = _7568;
    float _7586 = _7570;
    float _7588 = _7572;
    float _7590 = _7574;
    float _7592 = _7268;
    float _7594 = _7270;
    float _7596 = _7272;
    float _7598 = _7274;
    if (_7534)
    {
        float _7600 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _7602 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _7604 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _7606 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _7592 = _7600;
        _7594 = _7602;
        _7596 = _7604;
        _7598 = _7606;
    }
    float _7608 = _7592;
    float _7610 = _7594;
    float _7612 = _7596;
    float _7614 = _7598;
    float _7616 = _3388 + _7506;
    float _7618 = _7616 + _6936;
    int _7620 = as_type<int>(_7504) & 2048;
    bool _7622 = _7620 != 0;
    float _7624 = _7564;
    if (_7534)
    {
        float _7626 = _7618 * _7562;
        _804 = _7626;
    }
    float _7628 = _804;
    float _7630 = _7586;
    float _7632 = _7628;
    float _7634 = _7584;
    float _7636 = _7608;
    float _7638 = _7588;
    float _7640 = _7590;
    if (_7534)
    {
        float _7642 = _7618 * _7586;
        _7630 = _7642;
    }
    float _7644 = _7630;
    float _7646 = _7644;
    if (_7534)
    {
        float _7648 = fma(_6940, _7560, _7628);
        _7632 = _7648;
    }
    float _7650 = _7632;
    float _7652 = _7650;
    if (_7534)
    {
        float _7654 = fma(_6940, _7584, _7644);
        _7646 = _7654;
    }
    float _7656 = _7646;
    float _7658 = _7656;
    if (_7534)
    {
        float _7660 = _7618 * _7610;
        _7634 = _7660;
    }
    float _7662 = _7634;
    float _7664 = _7662;
    if (_7534)
    {
        float _7666 = fma(_6942, _7564, _7650);
        _7624 = _7666;
    }
    float _7668 = _7624;
    if (!_7534)
    {
        _7652 = 0.0;
    }
    float _7670 = _7652;
    float _7672 = _7670;
    if (_7534)
    {
        float _7674 = fma(_6940, _7608, _7662);
        _7636 = _7674;
    }
    float _7676 = _7636;
    float _7678 = _7676;
    if (_7534)
    {
        float _7680 = fma(_6942, _7588, _7656);
        _7638 = _7680;
    }
    float _7682 = _7638;
    if (_7534)
    {
        float _7684 = _7566 + _7668;
        _7672 = _7684;
    }
    float _7686 = _7672;
    float _7688 = _7686;
    if (!_7534)
    {
        _7664 = 0.0;
        _7658 = 0.0;
    }
    float _7690 = _7664;
    float _7692 = _7658;
    float _7694 = _7690;
    float _7696 = _7692;
    if (_7534)
    {
        float _7698 = fma(_6942, _7612, _7676);
        _7678 = _7698;
    }
    float _7700 = _7678;
    if (_7534)
    {
        float _7702 = _7590 + _7682;
        _7694 = _7702;
    }
    float _7704 = _7694;
    float _7706 = _7704;
    if (!_7538)
    {
        _7640 = _7686;
    }
    float _7708 = _7640;
    float _7710 = _7708;
    if (_7534)
    {
        float _7712 = _7614 + _7700;
        _7696 = _7712;
    }
    float _7714 = _7696;
    bool _7716 = !_7538;
    float _7718 = _7714;
    if (!_7716)
    {
        float _7720 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _7722 = uint(int(uint(_172) >> uint(2)));
        float _7724 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7722)]);
        int _7726 = _172 + 4;
        uint _7728 = uint(int(uint(_7726) >> uint(2)));
        float _7730 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7728)]);
        int _7732 = _172 + 8;
        uint _7734 = uint(int(uint(_7732) >> uint(2)));
        float _7736 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7734)]);
        uint _7738 = uint(int(uint(_172) >> uint(2)));
        float _7740 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7738)]);
        int _7742 = _172 + 4;
        uint _7744 = uint(int(uint(_7742) >> uint(2)));
        float _7746 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7744)]);
        int _7748 = _172 + 8;
        uint _7750 = uint(int(uint(_7748) >> uint(2)));
        float _7752 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7750)]);
        uint _7754 = uint(int(uint(_172) >> uint(2)));
        float _7756 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7754)]);
        int _7758 = _172 + 4;
        uint _7760 = uint(int(uint(_7758) >> uint(2)));
        float _7762 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7760)]);
        int _7764 = _172 + 8;
        uint _7766 = uint(int(uint(_7764) >> uint(2)));
        float _7768 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7766)]);
        float _7770 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _7772 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _7774 = _7618 * _7730;
        float _7776 = _7618 * _7746;
        float _7778 = _7618 * _7762;
        float _7780 = fma(_6940, _7724, _7774);
        float _7782 = fma(_6940, _7740, _7776);
        float _7784 = fma(_6940, _7756, _7778);
        float _7786 = fma(_6942, _7736, _7780);
        float _7788 = fma(_6942, _7752, _7782);
        float _7790 = fma(_6942, _7768, _7784);
        float _7792 = _7720 + _7786;
        float _7794 = _7770 + _7788;
        float _7796 = _7772 + _7790;
        _7706 = _7794;
        _7718 = _7796;
        _7710 = _7792;
        _960 = _7770;
        _7688 = _7720;
    }
    float _7798 = _7706;
    float _7800 = _7718;
    float _7802 = _7710;
    float _7804 = _960;
    float _7806 = _7688;
    bool _7808 = !_7622;
    float _7810 = _7798;
    float _7812 = _7802;
    float _7814 = _7800;
    float _7816 = _7806;
    float _7818 = _7804;
    if (!_7808)
    {
        uint _7820 = uint(int(uint(_172) >> uint(2)));
        float _7822 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7820)]);
        int _7824 = _172 + 4;
        uint _7826 = uint(int(uint(_7824) >> uint(2)));
        float _7828 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7826)]);
        int _7830 = _172 + 8;
        uint _7832 = uint(int(uint(_7830) >> uint(2)));
        float _7834 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7832)]);
        int _7836 = _172 + 12;
        uint _7838 = uint(int(uint(_7836) >> uint(2)));
        float _7840 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7838)]);
        uint _7842 = uint(int(uint(_172) >> uint(2)));
        float _7844 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7842)]);
        int _7846 = _172 + 4;
        uint _7848 = uint(int(uint(_7846) >> uint(2)));
        float _7850 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7848)]);
        int _7852 = _172 + 8;
        uint _7854 = uint(int(uint(_7852) >> uint(2)));
        float _7856 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7854)]);
        int _7858 = _172 + 12;
        uint _7860 = uint(int(uint(_7858) >> uint(2)));
        float _7862 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7860)]);
        uint _7864 = uint(int(uint(_172) >> uint(2)));
        float _7866 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7864)]);
        int _7868 = _172 + 4;
        uint _7870 = uint(int(uint(_7868) >> uint(2)));
        float _7872 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7870)]);
        int _7874 = _172 + 8;
        uint _7876 = uint(int(uint(_7874) >> uint(2)));
        float _7878 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7876)]);
        int _7880 = _172 + 12;
        uint _7882 = uint(int(uint(_7880) >> uint(2)));
        float _7884 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7882)]);
        float _7886 = _7618 * _7828;
        float _7888 = _7618 * _7850;
        float _7890 = _7618 * _7872;
        float _7892 = fma(_6940, _7822, _7886);
        float _7894 = fma(_6940, _7844, _7888);
        float _7896 = fma(_6940, _7866, _7890);
        float _7898 = fma(_6942, _7834, _7892);
        float _7900 = fma(_6942, _7856, _7894);
        float _7902 = fma(_6942, _7878, _7896);
        float _7904 = _7898 + _7840;
        float _7906 = _7900 + _7862;
        float _7908 = _7902 + _7884;
        _7810 = _7906;
        _7812 = _7904;
        _7814 = _7908;
        _7816 = _7898;
    }
    float _7910 = _7810;
    float _7912 = _7812;
    float _7914 = _7814;
    float _7916 = _7816;
    float _7918 = -_7910;
    float _7920 = _7518 + _7918;
    float _7922 = -_7912;
    float _7924 = _7512 + _7922;
    float _7926 = -_7914;
    float _7928 = _7524 + _7926;
    bool _7930 = _298 > 0.001000000047497451305389404296875;
    bool _7932 = isnan(_298);
    bool _7934 = _7930 || _7932;
    bool _7936 = isnan(0.001000000047497451305389404296875);
    bool _7938 = _7934 || _7936;
    float _7940 = _7920 * _7920;
    float _7942 = fma(_7924, _7924, _7940);
    float _7944 = fma(_7928, _7928, _7942);
    float _7946 = sqrt(_7944);
    float _7948 = _7916;
    float _7950 = _7924;
    int _7952 = as_type<int>(_7910);
    int _7954 = as_type<int>(_7912);
    if (!_7938)
    {
        _7818 = 0.0;
        _7948 = 0.0;
    }
    float _7956 = _7818;
    float _7958 = _7948;
    float _7960 = _7956;
    float _7962 = _7958;
    if (!_7938)
    {
        _308 = 0.0;
    }
    float _7964 = _308;
    int _7966 = as_type<int>(_7946);
    float _7968 = _7964;
    if (!_7938)
    {
        bool _7970 = _7946 > _7530;
        float _7972 = float(_7970);
        _7950 = _7972;
    }
    float _7974 = _7950;
    bool _7976 = !_7938;
    float _7978 = _7974;
    if (!_7976)
    {
        int _7980 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 64;
        uint _7982 = uint(int(uint(_7980) >> uint(2)));
        float _7984 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_7982)]);
        int _7986 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 68;
        uint _7988 = uint(int(uint(_7986) >> uint(2)));
        float _7990 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_7988)]);
        int _7992 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 72;
        uint _7994 = uint(int(uint(_7992) >> uint(2)));
        float _7996 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_7994)]);
        int _7998 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 76;
        uint _8000 = uint(int(uint(_7998) >> uint(2)));
        float _8002 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_8000)]);
        int _8004 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 80;
        uint _8006 = uint(int(uint(_8004) >> uint(2)));
        float _8008 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_8006)]);
        int _8010 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 84;
        uint _8012 = uint(int(uint(_8010) >> uint(2)));
        float _8014 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_8012)]);
        int _8016 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 88;
        uint _8018 = uint(int(uint(_8016) >> uint(2)));
        float _8020 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_8018)]);
        int _8022 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 96;
        uint _8024 = uint(int(uint(_8022) >> uint(2)));
        float _8026 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_8024)]);
        int _8028 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 100;
        uint _8030 = uint(int(uint(_8028) >> uint(2)));
        float _8032 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_8030)]);
        int _8034 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 104;
        uint _8036 = uint(int(uint(_8034) >> uint(2)));
        float _8038 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_8036)]);
        uint _8040 = uint(int(uint(_176) >> uint(2)));
        float _8042 = as_type<float>((*spvDescriptorSet0.cp_s15)._m0[int(_8040)]);
        bool _8044 = _7946 > _7530;
        float _8046 = _7956;
        if (!_8044)
        {
            int _8048 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 32;
            uint _8050 = uint(int(uint(_8048) >> uint(2)));
            float _8052 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_8050)]);
            _8046 = _8052;
        }
        float _8054 = _8046;
        float _8056 = -_7910;
        float _8058 = _7990 + _8056;
        float _8060 = -_7912;
        float _8062 = _7984 + _8060;
        float _8064 = -_7914;
        float _8066 = _7996 + _8064;
        float _8068 = -_7910;
        float _8070 = _8014 + _8068;
        float _8072 = _8058 * _8058;
        float _8074 = -_7912;
        float _8076 = _8008 + _8074;
        float _8078 = -_7914;
        float _8080 = _8020 + _8078;
        float _8082 = -_7910;
        float _8084 = _8032 + _8082;
        float _8086 = _8070 * _8070;
        float _8088 = -_7912;
        float _8090 = _8026 + _8088;
        float _8092 = fma(_8062, _8062, _8072);
        float _8094 = _8084 * _8084;
        float _8096 = fma(_8076, _8076, _8086);
        float _8098 = -_7914;
        float _8100 = _8038 + _8098;
        float _8102 = fma(_8066, _8066, _8092);
        float _8104 = fma(_8090, _8090, _8094);
        float _8106 = fma(_8080, _8080, _8096);
        float _8108 = sqrt(_8102);
        float _8110 = fma(_8100, _8100, _8104);
        int _8112 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 40;
        uint _8114 = uint(int(uint(_8112) >> uint(2)));
        float _8116 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_8114)]);
        float _8118 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
        float _8120 = sqrt(_8106);
        float _8122 = sqrt(_8110);
        bool _8124 = _8108 > _7530;
        bool _8126 = _8120 > _7530;
        float _8128 = _8102;
        int _8130 = as_type<int>(_8042);
        if (!_8124)
        {
            int _8132 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 32;
            uint _8134 = uint(int(uint(_8132) >> uint(2)));
            float _8136 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_8134)]);
            _8128 = _8136;
        }
        float _8138 = _8128;
        bool _8140 = _8122 > _7530;
        float _8142 = _8002;
        if (!_8126)
        {
            int _8144 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 32;
            uint _8146 = uint(int(uint(_8144) >> uint(2)));
            float _8148 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_8146)]);
            _8142 = _8148;
        }
        float _8150 = _8142;
        float _8152 = _7616;
        if (!_8140)
        {
            int _8154 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 32;
            uint _8156 = uint(int(uint(_8154) >> uint(2)));
            float _8158 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_8156)]);
            _8152 = _8158;
        }
        float _8160 = _8152;
        int _8162 = as_type<int>(_8042) << 24;
        int _8164 = _8162 >> 24;
        float _8166 = float(_8164);
        float _8168 = _8166 * 0.0078740157186985015869140625;
        float _8170 = precise::min(_8168, 1.0);
        float _8172 = precise::max(_8170, -1.0);
        int _8174 = as_type<int>(_8042) << 16;
        bool _8176 = _8172 > 0.0;
        bool _8178 = _8176 || _8044;
        int _8180 = as_type<int>(_8042) << 8;
        int _8182 = _8174 >> 24;
        if (!_8044)
        {
            bool _8184 = _8172 >= 0.0;
            bool _8186 = isnan(_8172);
            bool _8188 = _8184 || _8186;
            bool _8190 = isnan(0.0);
            bool _8192 = _8188 || _8190;
            _7548 = _8192;
        }
        bool _8194 = _7548;
        int _8196 = _8180 >> 24;
        float _8198 = float(_8182);
        int _8200 = as_type<int>(_8042) >> 24;
        bool _8202 = _8194;
        if (!_8044)
        {
            int _8204 = _8194 ? 0 : 1;
            _7952 = _8204;
        }
        int _8206 = _7952;
        float _8208 = _8198 * 0.0078740157186985015869140625;
        float _8210 = float(_8196);
        float _8212 = float(_8200);
        float _8214 = _8210;
        if (!_8044)
        {
            int _8216 = ~_8206;
            int _8218 = _8216 + 1;
            int _8220 = _8218 + 1;
            _8130 = _8220;
        }
        int _8222 = _8130;
        int _8224 = _8222;
        if (!_8044)
        {
            bool _8226 = _7946 >= _8054;
            bool _8228 = isnan(_7946);
            bool _8230 = _8226 || _8228;
            bool _8232 = isnan(_8054);
            bool _8234 = _8230 || _8232;
            _8202 = _8234;
        }
        bool _8236 = _8202;
        float _8238 = _8210 * 0.0078740157186985015869140625;
        bool _8240 = _8236;
        if (!_8178)
        {
            int _8242 = ~_8206;
            int _8244 = _8242 + 1;
            _8224 = _8244;
        }
        int _8246 = _8224;
        float _8248 = _8212 * 0.0078740157186985015869140625;
        float _8250 = precise::min(_8208, 1.0);
        int _8252 = _8246;
        int _8254 = as_type<int>(_8250);
        if (!_8044)
        {
            float _8256 = float(_8246);
            _8252 = as_type<int>(_8256);
        }
        int _8258 = _8252;
        float _8260 = precise::min(_8238, 1.0);
        float _8262 = precise::max(_8250, -1.0);
        float _8264 = precise::min(_8248, 1.0);
        int _8266 = as_type<int>(_8260);
        int _8268 = _8258;
        int _8270 = as_type<int>(_8264);
        if (_8044)
        {
            _8214 = 1.0;
        }
        float _8272 = _8214;
        float _8274 = _8272;
        if (!_8044)
        {
            float _8276 = _8236 ? as_type<float>(_8258) : (-1.0);
            _8274 = _8276;
        }
        float _8278 = _8274;
        float _8280 = precise::max(_8260, -1.0);
        if (!_8124)
        {
            bool _8282 = _8262 >= 0.0;
            bool _8284 = isnan(_8262);
            bool _8286 = _8282 || _8284;
            bool _8288 = isnan(0.0);
            bool _8290 = _8286 || _8288;
            _8240 = _8290;
        }
        bool _8292 = _8240;
        float _8294 = precise::max(_8264, -1.0);
        bool _8296 = _8262 > 0.0;
        bool _8298 = _8296 || _8124;
        bool _8300 = _8298;
        if (!_8126)
        {
            bool _8302 = _8280 >= 0.0;
            bool _8304 = isnan(_8280);
            bool _8306 = _8302 || _8304;
            bool _8308 = isnan(0.0);
            bool _8310 = _8306 || _8308;
            _7550 = _8310;
        }
        bool _8312 = _7550;
        bool _8314 = _8280 > 0.0;
        bool _8316 = _8314 || _8126;
        bool _8318 = _8312;
        bool _8320 = _8316;
        if (!_8124)
        {
            int _8322 = _8292 ? 0 : 1;
            _8254 = _8322;
        }
        int _8324 = _8254;
        bool _8326 = _8294 > 0.0;
        bool _8328 = _8326 || _8140;
        float _8330 = as_type<float>(_8324);
        bool _8332 = _8328;
        if (!_8126)
        {
            int _8334 = _8312 ? 0 : 1;
            _8266 = _8334;
        }
        int _8336 = _8266;
        float _8338 = as_type<float>(_8336);
        if (!_8140)
        {
            bool _8340 = _8294 >= 0.0;
            bool _8342 = isnan(_8294);
            bool _8344 = _8340 || _8342;
            bool _8346 = isnan(0.0);
            bool _8348 = _8344 || _8346;
            _8318 = _8348;
        }
        bool _8350 = _8318;
        if (!_8140)
        {
            int _8352 = _8350 ? 0 : 1;
            _8268 = _8352;
        }
        int _8354 = _8268;
        float _8356 = as_type<float>(_8354);
        if (!_8124)
        {
            int _8358 = ~_8324;
            int _8360 = _8358 + 1;
            int _8362 = _8360 + 1;
            _8270 = _8362;
        }
        int _8364 = _8270;
        int _8366 = _8364;
        if (!_8126)
        {
            int _8368 = ~_8336;
            int _8370 = _8368 + 1;
            int _8372 = _8370 + 1;
            _7966 = _8372;
        }
        int _8374 = _7966;
        int _8376 = _8374;
        if (!_8298)
        {
            int _8378 = ~_8324;
            int _8380 = _8378 + 1;
            _8366 = _8380;
        }
        int _8382 = _8366;
        int _8384 = _8382;
        if (!_8140)
        {
            int _8386 = ~_8354;
            int _8388 = _8386 + 1;
            int _8390 = _8388 + 1;
            _7954 = _8390;
        }
        int _8392 = _7954;
        int _8394 = _8392;
        if (!_8316)
        {
            int _8396 = ~_8336;
            int _8398 = _8396 + 1;
            _8376 = _8398;
        }
        int _8400 = _8376;
        int _8402 = _8400;
        if (!_8328)
        {
            int _8404 = ~_8354;
            int _8406 = _8404 + 1;
            _8394 = _8406;
        }
        int _8408 = _8394;
        int _8410 = _8408;
        if (!_8124)
        {
            float _8412 = float(_8382);
            _8384 = as_type<int>(_8412);
        }
        int _8414 = _8384;
        if (!_8126)
        {
            float _8416 = float(_8400);
            _8402 = as_type<int>(_8416);
        }
        int _8418 = _8402;
        if (!_8140)
        {
            float _8420 = float(_8408);
            _8410 = as_type<int>(_8420);
        }
        int _8422 = _8410;
        if (_8124)
        {
            _8338 = 1.0;
        }
        float _8424 = _8338;
        float _8426 = _8424;
        if (_8126)
        {
            _8330 = 1.0;
        }
        float _8428 = _8330;
        float _8430 = _8428;
        if (_8140)
        {
            _8356 = 1.0;
        }
        float _8432 = _8356;
        float _8434 = 1.0 / _8116;
        float _8436 = _8118 * _8434;
        float _8438 = _8432;
        if (!_8124)
        {
            bool _8440 = _8108 >= _8138;
            bool _8442 = isnan(_8108);
            bool _8444 = _8440 || _8442;
            bool _8446 = isnan(_8138);
            bool _8448 = _8444 || _8446;
            _8300 = _8448;
        }
        bool _8450 = _8300;
        if (!_8126)
        {
            bool _8452 = _8120 >= _8150;
            bool _8454 = isnan(_8120);
            bool _8456 = _8452 || _8454;
            bool _8458 = isnan(_8150);
            bool _8460 = _8456 || _8458;
            _8320 = _8460;
        }
        bool _8462 = _8320;
        if (!_8124)
        {
            float _8464 = _8450 ? as_type<float>(_8414) : (-1.0);
            _8426 = _8464;
        }
        float _8466 = _8426;
        if (!_8126)
        {
            float _8468 = _8462 ? as_type<float>(_8418) : (-1.0);
            _8430 = _8468;
        }
        float _8470 = _8430;
        if (!_8140)
        {
            bool _8472 = _8122 >= _8160;
            bool _8474 = isnan(_8122);
            bool _8476 = _8472 || _8474;
            bool _8478 = isnan(_8160);
            bool _8480 = _8476 || _8478;
            _8332 = _8480;
        }
        bool _8482 = _8332;
        if (!_8140)
        {
            float _8484 = _8482 ? as_type<float>(_8422) : (-1.0);
            _8438 = _8484;
        }
        float _8486 = _8438;
        float _8488 = abs(_8172);
        float _8490 = fma(_8436, _8278, _8488);
        float _8492 = precise::clamp(_8490, 0.0, 1.0);
        float _8494 = abs(_8262);
        float _8496 = fma(_8436, _8466, _8494);
        float _8498 = precise::clamp(_8496, 0.0, 1.0);
        float _8500 = abs(_8280);
        float _8502 = fma(_8436, _8470, _8500);
        float _8504 = precise::clamp(_8502, 0.0, 1.0);
        float _8506 = abs(_8294);
        float _8508 = fma(_8436, _8486, _8506);
        float _8510 = precise::clamp(_8508, 0.0, 1.0);
        float _8512 = _8492 * _8278;
        float _8514 = _8498 * _8466;
        float _8516 = _8504 * _8470;
        float _8518 = _8510 * _8486;
        _7978 = _8512;
        _7960 = _8514;
        _7962 = _8516;
        _7968 = _8518;
    }
    float _8520 = _7978;
    float _8522 = _7960;
    float _8524 = _7962;
    float _8526 = _7968;
    float _8528 = precise::min(_8520, 1.0);
    float _8530 = precise::min(_8522, 1.0);
    float _8532 = -_230;
    float _8534 = _8532 + _6940;
    float _8536 = precise::max(_8528, -1.0);
    float _8538 = precise::max(_8530, -1.0);
    float _8540 = -_236;
    float _8542 = _8540 + _7618;
    float _8544 = precise::min(_8524, 1.0);
    float _8546 = _8536 * 127.0;
    float _8548 = precise::min(_8526, 1.0);
    float _8550 = _8538 * 127.0;
    float _8552 = precise::max(_8544, -1.0);
    float _8554 = -_242;
    float _8556 = _8554 + _6942;
    float _8558 = precise::max(_8548, -1.0);
    float _8560 = rint(_8546);
    int _8562 = int(_8560);
    float _8564 = _8552 * 127.0;
    float _8566 = _8558 * 127.0;
    float _8568 = rint(_8550);
    int _8570 = int(_8568);
    float _8572 = rint(_8564);
    int _8574 = int(_8572);
    uint _8576 = extract_bits(uint(_8562), 0u, 8u);
    int _8578 = int(_8576) & 255;
    float _8580 = rint(_8566);
    int _8582 = int(_8580);
    uint _8584 = extract_bits(uint(_8578), 0u, 8u);
    int _8586 = int(_8584) & 255;
    uint _8588 = extract_bits(uint(_8570), 0u, 8u);
    int _8590 = int(_8588) & 255;
    int _8592 = _8590 << 8;
    int _8594 = _8586 | _8592;
    uint _8596 = extract_bits(uint(_8578), 16u, 8u);
    int _8598 = int(_8596) & 255;
    int _8600 = _8598 << 16;
    int _8602 = _8594 | _8600;
    uint _8604 = extract_bits(uint(_8578), 24u, 8u);
    int _8606 = int(_8604) & 255;
    int _8608 = _8606 << 24;
    int _8610 = _8602 | _8608;
    int _8612 = _172 + 4;
    uint _8614 = extract_bits(uint(_8610), 0u, 8u);
    int _8616 = int(_8614) & 255;
    uint _8618 = extract_bits(uint(_8610), 8u, 8u);
    int _8620 = int(_8618) & 255;
    int _8622 = _8620 << 8;
    int _8624 = _8616 | _8622;
    uint _8626 = extract_bits(uint(_8574), 0u, 8u);
    int _8628 = int(_8626) & 255;
    int _8630 = _8628 << 16;
    int _8632 = _8624 | _8630;
    uint _8634 = extract_bits(uint(_8610), 24u, 8u);
    int _8636 = int(_8634) & 255;
    int _8638 = _8636 << 24;
    int _8640 = _8632 | _8638;
    uint _8642 = extract_bits(uint(_8640), 0u, 8u);
    int _8644 = int(_8642) & 255;
    uint _8646 = extract_bits(uint(_8640), 8u, 8u);
    int _8648 = int(_8646) & 255;
    int _8650 = _8648 << 8;
    int _8652 = _8644 | _8650;
    uint _8654 = extract_bits(uint(_8640), 16u, 8u);
    int _8656 = int(_8654) & 255;
    int _8658 = _8656 << 16;
    int _8660 = _8652 | _8658;
    uint _8662 = extract_bits(uint(_8582), 0u, 8u);
    int _8664 = int(_8662) & 255;
    int _8666 = _8664 << 24;
    int _8668 = _8660 | _8666;
    int _8670 = _172 + 8;
    uint _8672 = uint(int(uint(_176) >> uint(2)));
    (*spvDescriptorSet0.cp_s15)._m0[int(_8672)] = uint(_8668);
    uint _8674 = uint(int(uint(_176) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_8674)] = as_type<uint>(_268);
    uint _8676 = uint(int(uint(_172) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_8676)] = as_type<uint>(_6940);
    uint _8678 = uint(int(uint(_8612) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_8678)] = as_type<uint>(_7618);
    uint _8680 = uint(int(uint(_8670) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_8680)] = as_type<uint>(_6942);
    uint _8682 = uint(int(uint(_172) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_8682)] = as_type<uint>(_7276);
    uint _8684 = uint(int(uint(_8612) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_8684)] = as_type<uint>(_7278);
    uint _8686 = uint(int(uint(_8670) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_8686)] = as_type<uint>(_7280);
    uint _8688 = uint(int(uint(_172) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_8688)] = as_type<uint>(_8534);
    uint _8690 = uint(int(uint(_8612) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_8690)] = as_type<uint>(_8542);
    uint _8692 = uint(int(uint(_8670) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_8692)] = as_type<uint>(_8556);
    float _8694 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _8696 = _8542 * _8542;
    float _8698 = _7278 * _7278;
    float _8700 = fma(_8534, _8534, _8696);
    float _8702 = fma(_7276, _7276, _8698);
    float _8704 = fma(_8556, _8556, _8700);
    float _8706 = fma(_7280, _7280, _8702);
    float _8708 = sqrt(_8704);
    float _8710 = sqrt(_8706);
    bool _8712 = _8708 >= 9.9999999747524270787835121154785e-07;
    bool _8714 = isnan(_8708);
    bool _8716 = _8712 || _8714;
    bool _8718 = isnan(9.9999999747524270787835121154785e-07);
    bool _8720 = _8716 || _8718;
    float _8722 = _8710;
    if (!_8720)
    {
        bool _8724 = _178 != _182;
        bool _8726 = isnan(_178);
        bool _8728 = _8724 || _8726;
        bool _8730 = isnan(_182);
        bool _8732 = _8728 || _8730;
        _8734 = _8732;
        if (!_8734)
        {
            float _8736 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
            bool _8738 = _8736 > 0.0;
            bool _8740 = !_8738;
            if (!_8740)
            {
                float _8742 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
                float _8744 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
                float _8746 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
                float _8748 = _8744 * _8744;
                float _8750 = fma(_8742, _8742, _8748);
                float _8752 = fma(_8746, _8746, _8750);
                float _8754 = rsqrt(_8752);
                float _8756 = _8754 * 9.9999999747524270787835121154785e-07;
                float _8758 = _8742 * _8756;
                float _8760 = _8744 * _8756;
                float _8762 = _8746 * _8756;
                _390 = as_type<int>(_8758);
                _392 = as_type<int>(_8760);
                _394 = as_type<int>(_8762);
                _8734 = true;
            }
            else
            {
                bool _8764 = _8710 >= 9.9999999747524270787835121154785e-07;
                bool _8766 = isnan(_8710);
                bool _8768 = _8764 || _8766;
                bool _8770 = isnan(9.9999999747524270787835121154785e-07);
                bool _8772 = _8768 || _8770;
                if (!_8772)
                {
                    float _8774 = _7618 * _7618;
                    float _8776 = fma(_6940, _6940, _8774);
                    float _8778 = fma(_6942, _6942, _8776);
                    float _8780 = sqrt(_8778);
                    bool _8782 = _8780 >= 9.9999999747524270787835121154785e-07;
                    bool _8784 = isnan(_8780);
                    bool _8786 = _8782 || _8784;
                    bool _8788 = isnan(9.9999999747524270787835121154785e-07);
                    bool _8790 = _8786 || _8788;
                    float _8792 = _8780;
                    if (_8790)
                    {
                        float _8794 = rsqrt(_8778);
                        _8792 = _8794;
                    }
                    float _8796 = _8792;
                    if (!_8790)
                    {
                        _378 = 0;
                    }
                    int _8798 = _378;
                    int _8800 = _8798;
                    if (!_8790)
                    {
                        _380 = 897988541;
                    }
                    int _8802 = _380;
                    int _8804 = _8802;
                    if (!_8790)
                    {
                        _382 = 0;
                    }
                    int _8806 = _382;
                    int _8808 = _8806;
                    if (_8790)
                    {
                        float _8810 = _8796 * 9.9999999747524270787835121154785e-07;
                        _8722 = _8810;
                    }
                    float _8812 = _8722;
                    if (_8790)
                    {
                        float _8814 = _6940 * _8812;
                        _8800 = as_type<int>(_8814);
                    }
                    int _8816 = _8800;
                    _390 = _8816;
                    if (_8790)
                    {
                        float _8818 = _7618 * _8812;
                        _8804 = as_type<int>(_8818);
                    }
                    int _8820 = _8804;
                    _392 = _8820;
                    if (_8790)
                    {
                        float _8822 = _6942 * _8812;
                        _8808 = as_type<int>(_8822);
                    }
                    int _8824 = _8808;
                    _394 = _8824;
                    _8734 = true;
                }
                else
                {
                    float _8826 = rsqrt(_8706);
                    float _8828 = _8826 * 9.9999999747524270787835121154785e-07;
                    float _8830 = _7276 * _8828;
                    float _8832 = _7278 * _8828;
                    float _8834 = _7280 * _8828;
                    _390 = as_type<int>(_8830);
                    _392 = as_type<int>(_8832);
                    _394 = as_type<int>(_8834);
                    _8734 = true;
                }
            }
        }
    }
    else
    {
        float _8836 = _8710 * _8694;
        bool _8838 = _8836 >= 0.001000000047497451305389404296875;
        bool _8840 = isnan(_8836);
        bool _8842 = _8838 || _8840;
        bool _8844 = isnan(0.001000000047497451305389404296875);
        bool _8846 = _8842 || _8844;
        bool _8848 = _8836 > 0.0;
        bool _8850 = !_8846;
        bool _8852 = _8848 && _8850;
        bool _8854 = _8708 < 0.001000000047497451305389404296875;
        bool _8856 = _8854 && _8852;
        if (!_8856)
        {
            _384 = as_type<int>(_8534);
        }
        int _8858 = _384;
        int _8860 = _8858;
        if (_8856)
        {
            float _8862 = _8694 * _7276;
            _8860 = as_type<int>(_8862);
        }
        int _8864 = _8860;
        _390 = _8864;
        if (!_8856)
        {
            _386 = as_type<int>(_8542);
        }
        int _8866 = _386;
        int _8868 = _8866;
        if (_8856)
        {
            float _8870 = _8694 * _7278;
            _8868 = as_type<int>(_8870);
        }
        int _8872 = _8868;
        _392 = _8872;
        if (!_8856)
        {
            _388 = as_type<int>(_8556);
        }
        int _8874 = _388;
        _394 = _8874;
        if (_8856)
        {
            float _8876 = _8694 * _7280;
            _394 = as_type<int>(_8876);
        }
    }
    _8734 = false;
    int _8878 = _390;
    int _8880 = _392;
    int _8882 = _394;
    uint _8884 = uint(int(uint(_172) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_8884)] = uint(_8878);
    uint _8886 = uint(int(uint(_8612) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_8886)] = uint(_8880);
    uint _8888 = uint(int(uint(_8670) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_8888)] = uint(_8882);
}

