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
    texture2d<float> cp_t_tcb_2A [[id(16)]];
    sampler cp_t_tcb_2ASmplr [[id(17)]];
    texture2d<float> cp_t_tcb_2C [[id(18)]];
    sampler cp_t_tcb_2CSmplr [[id(19)]];
    texture2d<float> cp_t_tcb_26 [[id(20)]];
    sampler cp_t_tcb_26Smplr [[id(21)]];
    sampler cp_t_tcb_2ASmplr_w [[id(22)]];
    sampler cp_t_tcb_2CSmplr_w [[id(23)]];
    sampler cp_t_tcb_26Smplr_w [[id(24)]];
    constant dm_border_t* dm_border [[id(25)]];
};

static inline __attribute__((always_inline))
void _75(thread const int& _18969, thread const int& _18970, thread const int& _18971, thread const int& _18972, thread int& _18973, thread int& _18974, thread int& _18975, thread int& _18976, thread int& _18977)
{
    float _18980 = as_type<float>(_18971) + 0.0;
    bool _18982 = _18980 != 0.0;
    bool _18984 = isnan(_18980);
    bool _18986 = _18982 || _18984;
    bool _18988 = isnan(0.0);
    bool _18990 = _18986 || _18988;
    int _18992 = as_type<int>(_18980);
    int _18994 = _18970;
    int _18996 = _18990 ? (-1) : 0;
    if (!_18990)
    {
        float _18998 = as_type<float>(_18971) * 1.0;
        _18992 = as_type<int>(_18998);
    }
    int _19000 = _18992;
    bool _19002 = !_18990;
    int _19004 = _19000;
    if (!_19002)
    {
        float _19006 = as_type<float>(_18971) + 0.0;
        bool _19008 = _19006 >= 0.0;
        bool _19010 = isnan(_19006);
        bool _19012 = _19008 || _19010;
        bool _19014 = isnan(0.0);
        bool _19016 = _19012 || _19014;
        int _19018 = as_type<int>(_19006);
        _18996 = _19016 ? (-1) : 0;
        if (!_19016)
        {
            _19018 = 2147483647;
        }
        int _19020 = _19018;
        bool _19022 = !_19016;
        _19004 = _19020;
        if (!_19022)
        {
            float _19024 = as_type<float>(_18971) + 0.0;
            bool _19026 = _19024 > as_type<float>(0x7f800000u /* inf */);
            bool _19028 = isnan(_19024);
            bool _19030 = _19026 || _19028;
            bool _19032 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _19034 = _19030 || _19032;
            int _19036 = as_type<int>(_19024);
            _18996 = _19034 ? (-1) : 0;
            if (_19034)
            {
                float _19038 = as_type<float>(_18971) + 1.0;
                _19036 = as_type<int>(_19038);
            }
            int _19040 = _19036;
            _19004 = _19040;
            if (!_19034)
            {
                float _19042 = 0.0 + as_type<float>(_18971);
                bool _19044 = _19042 != as_type<float>(0x7f800000u /* inf */);
                bool _19046 = isnan(_19042);
                bool _19048 = _19044 || _19046;
                bool _19050 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _19052 = _19048 || _19050;
                int _19054 = as_type<int>(_19042);
                _18996 = _19052 ? (-1) : 0;
                if (!_19052)
                {
                    _19054 = _18971;
                }
                int _19056 = _19054;
                bool _19058 = !_19052;
                _19004 = _19056;
                if (!_19058)
                {
                    float _19060 = as_type<float>(_18971) * 18446744073709551616.0;
                    float _19062 = rsqrt(_19060);
                    float _19064 = _19060 * _19062;
                    float _19066 = _19062 * 0.5;
                    float _19068 = -_19064;
                    float _19070 = 0.0 + _19068;
                    float _19072 = fma(_19066, _19070, 0.5);
                    float _19074 = fma(_19064, _19072, _19064);
                    float _19076 = -_19074;
                    float _19078 = 0.0 + _19076;
                    float _19080 = fma(_19074, _19078, _19060);
                    float _19082 = fma(_19066, _19080, _19074);
                    float _19084 = _19082 * 2.3283064365386962890625e-10;
                    _19004 = as_type<int>(_19084);
                    _18994 = as_type<int>(_19074);
                }
            }
        }
    }
    int _19086 = _19004;
    int _19088 = _18994;
    int _19090 = _18996;
    _18973 = _19086;
    _18974 = _18972;
    _18975 = 0;
    _18976 = _19088;
    _18977 = _19090;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _7460 = false;
    bool _6984 = false;
    bool _6720 = false;
    bool _6360 = false;
    bool _5682 = false;
    bool _5510 = false;
    bool _5156 = false;
    bool _4218 = false;
    bool _3964 = false;
    bool _3598 = false;
    bool _2702 = false;
    bool _2056 = false;
    bool _2098 = false;
    bool _1890 = false;
    bool _528 = false;
    float _79 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _81 = as_type<float>(gl_LocalInvocationID.x);
    float _83 = as_type<float>(gl_WorkGroupID.x);
    int _85 = as_type<int>(_83) << 5;
    int _87 = _85 + as_type<int>(_81);
    float _89 = trunc(_79);
    int _91 = int(_89);
    bool _95 = _87 >= _91;
    int _97 = _91;
    if (_95)
    {
        _97 = 0;
    }
    int _99 = _97;
    int _101 = _99;
    int _103 = _99;
    if (!_95)
    {
        int _105 = _87 << 4;
        int _107 = _105 + 12;
        uint _110 = uint(int(uint(_107) >> uint(2)));
        float _112 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_110)]);
        float _114 = trunc(_112);
        int _116 = int(_114);
        bool _118 = _116 >= 1;
        int _120 = _118 ? (-1) : 0;
        if (!_118)
        {
            _101 = 0;
        }
        int _122 = _101;
        bool _124 = !_118;
        _103 = _122;
        if (!_124)
        {
            float _126 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _128 = uint(int(uint(_107) >> uint(2)));
            float _130 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_128)]);
            float _132 = float(_116);
            float _134 = -_130;
            float _136 = _126 + _134;
            bool _138 = _136 > _132;
            int _140 = as_type<int>(_126);
            if (!_138)
            {
                bool _142 = _126 >= _130;
                bool _144 = isnan(_126);
                bool _146 = _142 || _144;
                bool _148 = isnan(_130);
                bool _150 = _146 || _148;
                _120 = _150 ? (-1) : 0;
            }
            int _152 = _120;
            if (_138)
            {
                _140 = 0;
            }
            int _154 = _140;
            _103 = _154;
            if (!_138)
            {
                int _156 = ~_152;
                int _158 = (_156 != 0) ? 0 : 1;
                _103 = _158;
            }
        }
    }
    int _160 = _103;
    int _162 = _160 & 1;
    bool _164 = _162 != 0;
    if (!_164)
    {
        return;
    }
    float _166 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[86]);
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[68]);
    int _170 = _87 << 4;
    float _172 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[85]);
    int _174 = _170 + 12;
    float _176 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    uint _178 = uint(int(uint(_174) >> uint(2)));
    float _180 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_178)]);
    float _182 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[84]);
    uint _186 = uint(int(uint(_170) >> uint(2)));
    float _188 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_186)]);
    int _190 = _170 + 4;
    uint _192 = uint(int(uint(_190) >> uint(2)));
    float _194 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_192)]);
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    float _198 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
    float _200 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
    float _202 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
    float _204 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
    uint _206 = uint(int(uint(_174) >> uint(2)));
    float _208 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_206)]);
    uint _210 = uint(int(uint(_170) >> uint(2)));
    float _212 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_210)]);
    int _214 = _170 + 4;
    uint _216 = uint(int(uint(_214) >> uint(2)));
    float _218 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_216)]);
    int _220 = _170 + 8;
    uint _222 = uint(int(uint(_220) >> uint(2)));
    float _224 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_222)]);
    int _226 = _170 + 12;
    uint _228 = uint(int(uint(_226) >> uint(2)));
    float _230 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_228)]);
    uint _232 = uint(int(uint(_170) >> uint(2)));
    float _234 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_232)]);
    int _236 = _170 + 4;
    uint _238 = uint(int(uint(_236) >> uint(2)));
    float _240 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_238)]);
    int _242 = _170 + 8;
    uint _244 = uint(int(uint(_242) >> uint(2)));
    float _246 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_244)]);
    float _248 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[128]);
    float _250 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[129]);
    float _252 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[130]);
    uint _254 = uint(int(uint(_170) >> uint(2)));
    float _256 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_254)]);
    int _258 = _170 + 4;
    uint _260 = uint(int(uint(_258) >> uint(2)));
    float _262 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_260)]);
    int _264 = _170 + 8;
    uint _266 = uint(int(uint(_264) >> uint(2)));
    float _268 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_266)]);
    int _270 = _170 + 12;
    uint _272 = uint(int(uint(_270) >> uint(2)));
    float _274 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_272)]);
    uint _276 = uint(int(uint(_174) >> uint(2)));
    float _278 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_276)]);
    bool _280 = _166 > 0.0;
    float _282 = abs(_168);
    float _284 = log2(_282);
    float _286 = _166;
    float _288 = _184;
    float _290 = _208;
    float _292 = _196;
    int _294 = _280 ? (-1) : 0;
    float _296 = _230;
    if (_280)
    {
        float _298 = 1.0 / _166;
        _286 = _298;
    }
    float _300 = _286;
    bool _302 = _172 > 0.0;
    float _304 = -_180;
    float _306 = _176 + _304;
    float _308 = _182 * _284;
    float _310 = _184 * _172;
    float _312 = exp2(_308);
    float _314 = _306;
    if (_280)
    {
        float _316 = _306 * _300;
        _314 = _316;
    }
    float _318 = _314;
    float _320 = _318;
    if (_302)
    {
        float _322 = -_310;
        float _324 = fma(_188, _322, _184);
        _288 = _324;
    }
    float _326 = _288;
    int _328 = as_type<int>(_196) & 512;
    bool _330 = _328 != 0;
    float _332 = _326;
    bool _334 = _330;
    if (_280)
    {
        float _336 = precise::min(_318, 1.0);
        _320 = _336;
    }
    float _338 = _320;
    float _340 = _182 * _198;
    if (_280)
    {
        float _342 = _338 * _326;
        _332 = _342;
    }
    float _344 = _332;
    float _346 = _200 * _340;
    float _348 = _202 * _340;
    float _350 = _204 * _340;
    float _352 = _182 * _344;
    float _354 = _208 * _182;
    float _356 = fma(_212, _312, _346);
    float _358 = fma(_224, _312, _350);
    float _360 = fma(_218, _312, _348);
    float _362 = fma(_212, _354, _234);
    float _364 = fma(_218, _354, _240);
    float _366 = fma(_224, _354, _246);
    float _368 = _248 * _352;
    float _370 = _250 * _352;
    float _372 = _252 * _352;
    bool _374 = !_330;
    float _376 = _354;
    float _378 = _346;
    float _380 = _370;
    int _382 = as_type<int>(_274);
    float _384 = _364;
    int _386 = as_type<int>(_256);
    int _388 = as_type<int>(_262);
    int _390 = as_type<int>(_268);
    int _392 = as_type<int>(_256);
    int _394 = as_type<int>(_262);
    int _396 = as_type<int>(_268);
    int _398 = as_type<int>(_256);
    int _400 = as_type<int>(_262);
    int _402 = as_type<int>(_268);
    float _524;
    float _526;
    if (!_374)
    {
        float _404 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _406 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _408 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _410 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _412 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _414 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _416 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _418 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _420 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _422 = _408 * _410;
        float _424 = _408 * _412;
        float _426 = _406 * _410;
        float _428 = -_422;
        float _430 = fma(_404, _414, _428);
        float _432 = -_424;
        float _434 = fma(_406, _414, _432);
        float _436 = -_426;
        float _438 = fma(_404, _412, _436);
        float _440 = _418 * _404;
        float _442 = _418 * _430;
        float _444 = _420 * _406;
        float _446 = _416 * _412;
        float _448 = -_440;
        float _450 = fma(_416, _406, _448);
        float _452 = -_442;
        float _454 = fma(_416, _434, _452);
        float _456 = _418 * _414;
        float _458 = _420 * _410;
        float _460 = -_446;
        float _462 = fma(_418, _410, _460);
        float _464 = fma(_420, _438, _454);
        float _466 = -_456;
        float _468 = fma(_420, _412, _466);
        float _470 = -_458;
        float _472 = fma(_416, _414, _470);
        float _474 = _416 * _408;
        float _476 = -_404;
        float _478 = fma(_476, _414, _422);
        float _480 = -_444;
        float _482 = fma(_418, _408, _480);
        float _484 = 1.0 / _464;
        float _486 = -_474;
        float _488 = fma(_420, _404, _486);
        float _490 = _468 * _484;
        float _492 = _472 * _484;
        float _494 = _462 * _484;
        float _496 = _368 * _484;
        float _498 = _370 * _490;
        float _500 = _370 * _492;
        float _502 = _370 * _494;
        float _504 = _478 * _484;
        float _506 = fma(_434, _496, _498);
        float _508 = _482 * _484;
        float _510 = _488 * _484;
        float _512 = _450 * _484;
        float _514 = fma(_368, _504, _500);
        float _516 = fma(_438, _496, _502);
        float _518 = fma(_372, _508, _506);
        float _520 = fma(_372, _510, _514);
        float _522 = fma(_372, _512, _516);
        _290 = _404;
        _376 = _490;
        _292 = _408;
        _378 = _484;
        _380 = _520;
        _524 = _518;
        _526 = _522;
        _528 = true;
    }
    else
    {
        int _530 = as_type<int>(_196) & 1024;
        bool _532 = _530 != 0;
        _294 = _532 ? (-1) : 0;
        if (_532)
        {
            _334 = true;
        }
        bool _534 = _334;
        bool _536 = _534;
        if (!_532)
        {
            int _538 = as_type<int>(_196) & 2048;
            bool _540 = _538 != 0;
            _536 = _540;
        }
        bool _542 = _536;
        float _544 = 0.0;
        if (!_542)
        {
            _544 = _368;
        }
        float _546 = _544;
        float _548 = 0.0;
        _524 = _546;
        if (!_542)
        {
            _548 = _372;
        }
        float _550 = _548;
        bool _552 = !_542;
        _526 = _550;
        if (!_552)
        {
            uint _554 = uint(int(uint(_170) >> uint(2)));
            float _556 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_554)]);
            int _558 = _170 + 4;
            uint _560 = uint(int(uint(_558) >> uint(2)));
            float _562 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_560)]);
            int _564 = _170 + 8;
            uint _566 = uint(int(uint(_564) >> uint(2)));
            float _568 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_566)]);
            uint _570 = uint(int(uint(_170) >> uint(2)));
            float _572 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_570)]);
            int _574 = _170 + 4;
            uint _576 = uint(int(uint(_574) >> uint(2)));
            float _578 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_576)]);
            int _580 = _170 + 8;
            uint _582 = uint(int(uint(_580) >> uint(2)));
            float _584 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_582)]);
            uint _586 = uint(int(uint(_170) >> uint(2)));
            float _588 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_586)]);
            int _590 = _170 + 4;
            uint _592 = uint(int(uint(_590) >> uint(2)));
            float _594 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_592)]);
            int _596 = _170 + 8;
            uint _598 = uint(int(uint(_596) >> uint(2)));
            float _600 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_598)]);
            float _602 = _568 * _572;
            float _604 = _568 * _578;
            float _606 = _562 * _572;
            float _608 = -_602;
            float _610 = fma(_556, _584, _608);
            float _612 = -_604;
            float _614 = fma(_562, _584, _612);
            float _616 = -_606;
            float _618 = fma(_556, _578, _616);
            float _620 = _594 * _556;
            float _622 = _594 * _610;
            float _624 = _600 * _562;
            float _626 = _588 * _578;
            float _628 = -_620;
            float _630 = fma(_588, _562, _628);
            float _632 = -_622;
            float _634 = fma(_588, _614, _632);
            float _636 = _594 * _584;
            float _638 = _600 * _572;
            float _640 = -_626;
            float _642 = fma(_594, _572, _640);
            float _644 = fma(_600, _618, _634);
            float _646 = -_636;
            float _648 = fma(_600, _578, _646);
            float _650 = -_638;
            float _652 = fma(_588, _584, _650);
            float _654 = _588 * _568;
            float _656 = -_556;
            float _658 = fma(_656, _584, _602);
            float _660 = -_624;
            float _662 = fma(_594, _568, _660);
            float _664 = 1.0 / _644;
            float _666 = -_654;
            float _668 = fma(_600, _556, _666);
            float _670 = _648 * _664;
            float _672 = _652 * _664;
            float _674 = _642 * _664;
            float _676 = _368 * _664;
            float _678 = _370 * _670;
            float _680 = _370 * _672;
            float _682 = _370 * _674;
            float _684 = _658 * _664;
            float _686 = fma(_614, _676, _678);
            float _688 = _662 * _664;
            float _690 = _668 * _664;
            float _692 = _630 * _664;
            float _694 = fma(_368, _684, _680);
            float _696 = fma(_618, _676, _682);
            float _698 = fma(_372, _688, _686);
            float _700 = fma(_372, _690, _694);
            float _702 = fma(_372, _692, _696);
            _290 = _556;
            _376 = _670;
            _292 = _568;
            _378 = _664;
            _380 = _700;
            _524 = _698;
            _526 = _702;
        }
    }
    _528 = false;
    float _704 = _290;
    float _706 = _376;
    float _708 = _292;
    float _710 = _378;
    float _712 = _380;
    float _714 = _524;
    float _716 = _526;
    int _718 = _294;
    uint _720 = uint(int(uint(_174) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_720)] = as_type<uint>(_278);
    float _722 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    int _724 = _87 << 5;
    uint _726 = uint(int(uint(_170) >> uint(2)));
    float _728 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_726)]);
    int _730 = _170 + 4;
    uint _732 = uint(int(uint(_730) >> uint(2)));
    float _734 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_732)]);
    int _736 = _170 + 8;
    uint _738 = uint(int(uint(_736) >> uint(2)));
    float _740 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_738)]);
    int _742 = _170 + 12;
    uint _744 = uint(int(uint(_742) >> uint(2)));
    float _746 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_744)]);
    float _748 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[71]);
    uint _750 = uint(int(uint(_724) >> uint(2)));
    float _752 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_750)]);
    int _754 = _724 + 4;
    uint _756 = uint(int(uint(_754) >> uint(2)));
    float _758 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_756)]);
    int _760 = _724 + 8;
    uint _762 = uint(int(uint(_760) >> uint(2)));
    float _764 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_762)]);
    int _766 = _724 + 12;
    uint _768 = uint(int(uint(_766) >> uint(2)));
    float _770 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_768)]);
    float _772 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[82]);
    uint _774 = uint(int(uint(_170) >> uint(2)));
    float _776 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_774)]);
    int _778 = _170 + 4;
    uint _780 = uint(int(uint(_778) >> uint(2)));
    float _782 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_780)]);
    int _784 = _170 + 8;
    uint _786 = uint(int(uint(_784) >> uint(2)));
    float _788 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_786)]);
    int _790 = _170 + 12;
    uint _792 = uint(int(uint(_790) >> uint(2)));
    float _794 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_792)]);
    float _796 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[80]);
    float _798 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[79]);
    int _800 = as_type<int>(_722) & 512;
    bool _802 = _800 != 0;
    float _804 = _704;
    float _806 = _706;
    float _808 = _708;
    float _810 = _710;
    int _812 = _718;
    int _814 = as_type<int>(_722);
    int _816 = as_type<int>(_716);
    if (_802)
    {
        float _818 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _820 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _822 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _824 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _804 = _818;
        _806 = _820;
        _808 = _822;
        _810 = _824;
    }
    float _826 = _804;
    float _828 = _806;
    float _830 = _808;
    float _832 = _810;
    float _834 = 0.0;
    float _836 = 0.0;
    float _838 = 0.0;
    float _840 = 0.0;
    if (_802)
    {
        float _842 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _844 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _846 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _848 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _834 = _842;
        _836 = _844;
        _838 = _846;
        _840 = _848;
    }
    float _850 = _834;
    float _852 = _836;
    float _854 = _838;
    float _856 = _840;
    float _858 = 0.0;
    float _860 = 0.0;
    float _862 = 0.0;
    float _864 = 0.0;
    if (_802)
    {
        float _866 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _868 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _870 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _872 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _858 = _866;
        _860 = _868;
        _862 = _870;
        _864 = _872;
    }
    float _874 = _858;
    float _876 = _860;
    float _878 = _862;
    float _880 = _864;
    float _882 = -_748;
    float _884 = _734 + _882;
    float _886 = _752 + _758;
    float _888 = precise::max(0.0, _772);
    bool _890 = _888 != 0.0;
    bool _892 = isnan(_888);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    uint _900 = uint(int(uint(_170) >> uint(2)));
    float _902 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_900)]);
    int _904 = _724 + 16;
    int _906 = _170 + 8;
    uint _908 = uint(int(uint(_906) >> uint(2)));
    float _910 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_908)]);
    float _912 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[2607]);
    uint _914 = uint(int(uint(_170) >> uint(2)));
    float _916 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_914)]);
    int _918 = _170 + 4;
    uint _920 = uint(int(uint(_918) >> uint(2)));
    float _922 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_920)]);
    int _924 = _170 + 8;
    uint _926 = uint(int(uint(_924) >> uint(2)));
    float _928 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_926)]);
    int _930 = _170 + 12;
    uint _932 = uint(int(uint(_930) >> uint(2)));
    float _934 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_932)]);
    uint _936 = uint(int(uint(_904) >> uint(2)));
    float _938 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_936)]);
    int _940 = _904 + 4;
    uint _942 = uint(int(uint(_940) >> uint(2)));
    float _944 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_942)]);
    int _946 = _904 + 8;
    uint _948 = uint(int(uint(_946) >> uint(2)));
    float _950 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_948)]);
    int _952 = _904 + 12;
    uint _954 = uint(int(uint(_952) >> uint(2)));
    float _956 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_954)]);
    float _958 = _734;
    float _960 = _746;
    float _962 = _794;
    float _964 = _752;
    float _966 = _758;
    float _968 = _764;
    float _970 = _770;
    if (!_802)
    {
        _958 = 0.0;
    }
    float _972 = _958;
    float _974 = _972;
    if (!_802)
    {
        _960 = 0.0;
    }
    float _976 = _960;
    float _978 = _976;
    if (!_802)
    {
        _962 = 0.0;
    }
    float _980 = _962;
    float _982 = _980;
    if (!_898)
    {
        _812 = 0;
    }
    int _984 = _812;
    int _986 = 0;
    int _988 = _984;
    if (!_898)
    {
        _986 = as_type<int>(_782);
    }
    int _990 = _986;
    int _992 = _990;
    int _994 = _990;
    if (!_898)
    {
        _382 = as_type<int>(_788);
    }
    int _996 = _382;
    float _998 = _828;
    float _1000 = _852;
    float _1002 = _876;
    float _1004 = _830;
    float _1006 = _854;
    float _1008 = _878;
    float _1010 = _850;
    float _1012 = _856;
    float _1014 = _874;
    float _1016 = _880;
    float _1018 = _832;
    int _1020 = _996;
    if (_802)
    {
        float _1022 = _884 * _828;
        _998 = _1022;
    }
    float _1024 = _998;
    float _1026 = _1024;
    if (_802)
    {
        float _1028 = fma(_728, _826, _1024);
        _1026 = _1028;
    }
    float _1030 = _1026;
    float _1032 = _764 + _886;
    int _1034 = as_type<int>(_722) & 1024;
    bool _1036 = _1034 != 0;
    float _1038 = as_type<float>(_1034);
    if (_802)
    {
        float _1040 = _884 * _852;
        _1000 = _1040;
    }
    float _1042 = _1000;
    float _1044 = _1042;
    if (_802)
    {
        float _1046 = _884 * _876;
        _1002 = _1046;
    }
    float _1048 = _1002;
    float _1050 = _1048;
    if (_802)
    {
        float _1052 = fma(_728, _850, _1042);
        _1044 = _1052;
    }
    float _1054 = _1044;
    float _1056 = _1054;
    if (_802)
    {
        float _1058 = fma(_728, _874, _1048);
        _1050 = _1058;
    }
    float _1060 = _1050;
    float _1062 = _1060;
    if (_802)
    {
        float _1064 = fma(_740, _830, _1030);
        _1004 = _1064;
    }
    float _1066 = _1004;
    float _1068 = -_770;
    bool _1070 = _1032 != _1068;
    bool _1072 = isnan(_1032);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan(_1068);
    bool _1078 = _1074 || _1076;
    float _1080 = _1066;
    bool _1082 = _1078;
    if (_802)
    {
        float _1084 = fma(_740, _854, _1054);
        _1006 = _1084;
    }
    float _1086 = _1006;
    float _1088 = _1086;
    if (_802)
    {
        float _1090 = fma(_740, _878, _1060);
        _1008 = _1090;
    }
    float _1092 = _1008;
    int _1094 = as_type<int>(_722) & 2048;
    bool _1096 = _1094 != 0;
    float _1098 = _1092;
    float _1100 = as_type<float>(_1094);
    if (_802)
    {
        float _1102 = _832 + _1066;
        _974 = _1102;
    }
    float _1104 = _974;
    float _1106 = _1104;
    if (_802)
    {
        float _1108 = _856 + _1086;
        _978 = _1108;
    }
    float _1110 = _978;
    float _1112 = _1110;
    if (_802)
    {
        float _1114 = _880 + _1092;
        _982 = _1114;
    }
    float _1116 = _982;
    int _1118 = _1078 ? 0 : 1;
    float _1120 = _1116;
    int _1122 = _1118;
    int _1124 = _1118;
    if (!_898)
    {
        _814 = as_type<int>(_776);
    }
    int _1126 = _814;
    bool _1128 = !_1036;
    int _1130 = _1126;
    float _1132 = _938;
    float _1134 = _944;
    float _1136 = _950;
    float _1138 = _956;
    float _1140 = _910;
    float _1142 = _902;
    float _1144 = _912;
    float _1146 = _912;
    if (!_1128)
    {
        float _1148 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1150 = uint(int(uint(_170) >> uint(2)));
        float _1152 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1150)]);
        int _1154 = _170 + 4;
        uint _1156 = uint(int(uint(_1154) >> uint(2)));
        float _1158 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1156)]);
        int _1160 = _170 + 8;
        uint _1162 = uint(int(uint(_1160) >> uint(2)));
        float _1164 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1162)]);
        int _1166 = _170 + 12;
        uint _1168 = uint(int(uint(_1166) >> uint(2)));
        float _1170 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1168)]);
        uint _1172 = uint(int(uint(_170) >> uint(2)));
        float _1174 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1172)]);
        int _1176 = _170 + 4;
        uint _1178 = uint(int(uint(_1176) >> uint(2)));
        float _1180 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1178)]);
        int _1182 = _170 + 8;
        uint _1184 = uint(int(uint(_1182) >> uint(2)));
        float _1186 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1184)]);
        int _1188 = _170 + 12;
        uint _1190 = uint(int(uint(_1188) >> uint(2)));
        float _1192 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1190)]);
        uint _1194 = uint(int(uint(_170) >> uint(2)));
        float _1196 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1194)]);
        int _1198 = _170 + 4;
        uint _1200 = uint(int(uint(_1198) >> uint(2)));
        float _1202 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1200)]);
        int _1204 = _170 + 8;
        uint _1206 = uint(int(uint(_1204) >> uint(2)));
        float _1208 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1206)]);
        float _1210 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1212 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1214 = _884 * _1158;
        float _1216 = _884 * _1180;
        float _1218 = _884 * _1202;
        float _1220 = fma(_728, _1152, _1214);
        float _1222 = fma(_728, _1174, _1216);
        float _1224 = fma(_728, _1196, _1218);
        float _1226 = fma(_740, _1164, _1220);
        float _1228 = fma(_740, _1186, _1222);
        float _1230 = fma(_740, _1208, _1224);
        float _1232 = _1148 + _1226;
        float _1234 = _1210 + _1228;
        float _1236 = _1212 + _1230;
        _1010 = _1152;
        _1056 = _1220;
        _1088 = _1226;
        _1012 = _1170;
        _1014 = _1174;
        _1062 = _1222;
        _1098 = _1228;
        _1016 = _1192;
        _1106 = _1232;
        _1120 = _1236;
        _1112 = _1234;
    }
    float _1238 = _1010;
    float _1240 = _1056;
    float _1242 = _1088;
    float _1244 = _1012;
    float _1246 = _1014;
    float _1248 = _1062;
    float _1250 = _1098;
    float _1252 = _1016;
    float _1254 = _1106;
    float _1256 = _1120;
    float _1258 = _1112;
    bool _1260 = !_1096;
    float _1262 = _1238;
    float _1264 = _1242;
    float _1266 = _1254;
    float _1268 = _1256;
    float _1270 = _1248;
    float _1272 = _1258;
    float _1274 = _1246;
    float _1276 = _1250;
    float _1278 = _1240;
    float _1280 = _1244;
    float _1282 = _1252;
    if (!_1260)
    {
        uint _1284 = uint(int(uint(_170) >> uint(2)));
        float _1286 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1284)]);
        int _1288 = _170 + 4;
        uint _1290 = uint(int(uint(_1288) >> uint(2)));
        float _1292 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1290)]);
        int _1294 = _170 + 8;
        uint _1296 = uint(int(uint(_1294) >> uint(2)));
        float _1298 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1296)]);
        int _1300 = _170 + 12;
        uint _1302 = uint(int(uint(_1300) >> uint(2)));
        float _1304 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1302)]);
        uint _1306 = uint(int(uint(_170) >> uint(2)));
        float _1308 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1306)]);
        int _1310 = _170 + 4;
        uint _1312 = uint(int(uint(_1310) >> uint(2)));
        float _1314 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1312)]);
        int _1316 = _170 + 8;
        uint _1318 = uint(int(uint(_1316) >> uint(2)));
        float _1320 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1318)]);
        int _1322 = _170 + 12;
        uint _1324 = uint(int(uint(_1322) >> uint(2)));
        float _1326 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1324)]);
        uint _1328 = uint(int(uint(_170) >> uint(2)));
        float _1330 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1328)]);
        int _1332 = _170 + 4;
        uint _1334 = uint(int(uint(_1332) >> uint(2)));
        float _1336 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1334)]);
        int _1338 = _170 + 8;
        uint _1340 = uint(int(uint(_1338) >> uint(2)));
        float _1342 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1340)]);
        int _1344 = _170 + 12;
        uint _1346 = uint(int(uint(_1344) >> uint(2)));
        float _1348 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1346)]);
        float _1350 = _884 * _1292;
        float _1352 = _884 * _1314;
        float _1354 = _884 * _1336;
        float _1356 = fma(_728, _1286, _1350);
        float _1358 = fma(_728, _1308, _1352);
        float _1360 = fma(_728, _1330, _1354);
        float _1362 = fma(_740, _1298, _1356);
        float _1364 = fma(_740, _1320, _1358);
        float _1366 = fma(_740, _1342, _1360);
        float _1368 = _1362 + _1304;
        float _1370 = _1364 + _1326;
        float _1372 = _1366 + _1348;
        _1262 = _1286;
        _1264 = _1362;
        _1266 = _1368;
        _1268 = _1372;
        _1270 = _1358;
        _1272 = _1370;
        _1274 = _1308;
        _1276 = _1364;
        _1278 = _1356;
        _1280 = _1304;
        _1282 = _1326;
    }
    float _1374 = _1262;
    float _1376 = _1264;
    float _1378 = _1266;
    float _1380 = _1268;
    float _1382 = _1270;
    float _1384 = _1272;
    float _1386 = _1274;
    float _1388 = _1276;
    float _1390 = _1278;
    float _1392 = _1280;
    float _1394 = _1282;
    bool _1396 = !_898;
    float _1398 = _1378;
    float _1400 = _1380;
    float _1402 = _1378;
    float _1404 = _1380;
    float _1406 = _1376;
    float _1408 = _1374;
    float _1410 = _1390;
    float _1412 = _1392;
    float _1414 = _1384;
    float _1416 = _1386;
    float _1418 = _1382;
    float _1420 = _1388;
    float _1422 = _1394;
    float _1424 = _1384;
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
        float _1448 = _888 * 0.5;
        float _1450 = 1.0 / _888;
        float _1452 = -_1434;
        float _1454 = fma(_1448, _1452, _1428);
        float _1456 = -_1448;
        float _1458 = _1456 + _1454;
        float _1460 = -_1446;
        float _1462 = fma(_1448, _1460, _1440);
        float _1464 = -_1458;
        float _1466 = _1464 + _1378;
        float _1468 = -_1448;
        float _1470 = _1468 + _1462;
        float _1472 = _1466 * _1450;
        float _1474 = -_1470;
        float _1476 = _1474 + _1380;
        float _1478 = floor(_1472);
        float _1480 = _1476 * _1450;
        float _1482 = floor(_1480);
        float _1484 = -_1478;
        float _1486 = fma(_888, _1484, _1466);
        bool _1488 = _1486 != _1466;
        bool _1490 = isnan(_1486);
        bool _1492 = _1488 || _1490;
        bool _1494 = isnan(_1466);
        bool _1496 = _1492 || _1494;
        float _1498 = -_1482;
        float _1500 = fma(_888, _1498, _1476);
        bool _1502 = _1500 == _1476;
        bool _1504 = !_1496;
        bool _1506 = _1502 && _1504;
        bool _1508 = !_1506;
        int _1510 = as_type<int>(_1476);
        int _1512 = as_type<int>(_1478);
        _1080 = _1458;
        _1018 = _1466;
        _988 = _1508 ? (-1) : 0;
        _1406 = _1500;
        _1408 = _1470;
        _1410 = _1480;
        _1412 = _1486;
        _1082 = _1506;
        if (_1506)
        {
            _1510 = as_type<int>(_776);
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
            _992 = as_type<int>(_782);
        }
        int _1522 = _992;
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
            _1512 = as_type<int>(_788);
        }
        int _1530 = _1512;
        _1020 = _1530;
        if (!_1506)
        {
            _1122 = 1;
        }
        int _1532 = _1122;
        _1124 = _1532;
        if (!_1506)
        {
            _1516 = 0;
        }
        int _1534 = _1516;
        _1130 = _1534;
        if (!_1506)
        {
            _1524 = 0;
        }
        int _1536 = _1524;
        _994 = _1536;
        if (!_1506)
        {
            _1020 = 0;
        }
    }
    int _1538 = _1124;
    float _1540 = _1402;
    float _1542 = _1404;
    float _1544 = _1080;
    float _1546 = _1018;
    int _1548 = _988;
    float _1550 = _1406;
    float _1552 = _1408;
    float _1554 = _1410;
    float _1556 = _1412;
    bool _1558 = _1082;
    int _1560 = _1130;
    int _1562 = _994;
    int _1564 = _1020;
    int _1566 = _1538 & 1;
    bool _1568 = _1566 != 0;
    float _1570 = _796 * 0.5;
    float _1572 = _364 + _712;
    float _1574 = _362 + _714;
    float _1576 = _366 + _716;
    float _1578 = precise::max(_1570, 0.001000000047497451305389404296875);
    float _1580 = -_748;
    float _1582 = _1572 + _1580;
    float _1584 = precise::min(_1578, 10000.0);
    float _1586 = as_type<float>(_1538);
    float _1588 = _1544;
    float _1590 = _1546;
    bool _1592 = _1558;
    int _1594 = as_type<int>(_1570);
    int _1596 = as_type<int>(_1572);
    float _1598 = _1550;
    float _1600 = _1552;
    float _1602 = _1554;
    float _1604 = _1550;
    float _1606 = _1556;
    if (!_1568)
    {
        _1586 = _752;
    }
    float _1608 = _1586;
    float _1610 = _1608;
    if (!_1568)
    {
        _1588 = _758;
    }
    float _1612 = _1588;
    float _1614 = _1612;
    if (!_1568)
    {
        _1590 = _764;
    }
    float _1616 = _1590;
    float _1618 = _1616;
    if (!_1568)
    {
        _964 = _770;
    }
    float _1620 = _964;
    float _1622 = _1620;
    if (!_1568)
    {
        _966 = _938;
    }
    float _1624 = _966;
    float _1626 = _1624;
    if (!_1568)
    {
        _968 = _944;
    }
    float _1628 = _968;
    float _1630 = _1628;
    if (!_1568)
    {
        _970 = _950;
    }
    float _1632 = _970;
    float _1634 = _1632;
    if (!_1568)
    {
        _1592 = false;
    }
    bool _1636 = _1592;
    bool _1638 = _1636;
    if (!_1568)
    {
        _384 = _956;
    }
    float _1640 = _384;
    float _1642 = _1640;
    if (!_1568)
    {
        _1594 = as_type<int>(_728);
    }
    int _1644 = _1594;
    int _1646 = _1644;
    int _1648 = _1644;
    if (!_1568)
    {
        _816 = as_type<int>(_884);
    }
    int _1650 = _816;
    int _1652 = _1650;
    int _1654 = _1650;
    if (!_1568)
    {
        _1596 = as_type<int>(_740);
    }
    int _1656 = _1596;
    bool _1658 = !_1568;
    int _1660 = _1656;
    int _1662 = _1656;
    float _1664 = 0.0;
    float _1666 = 0.0;
    if (!_1658)
    {
        float _1668 = fma(_1540, 6.2500002968590706586837768554688e-05, 0.5);
        float _1670 = fma(_1542, 6.2500002968590706586837768554688e-05, 0.5);
        float _1672 = fma(_1540, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
        float _1674 = fma(_1542, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
        float _1676 = fma(_1542, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
        float2 _9977 = float2(_1668, _1670);
        float2 _1680 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_9977, float2(0.0), isnan(_9977)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_9977, float2(0.0), isnan(_9977)), level(0.0)).xy;
        float _1682 = _1680.x;
        float _1684 = _1680.y;
        float _1686 = fma(_1540, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
        float _1688 = fma(_1540, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
        float _1690 = fma(_1542, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
        float2 _9998 = float2(_1672, _1674);
        float _1692 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_9998, float2(0.0), isnan(_9998)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_9998, float2(0.0), isnan(_9998)), level(0.0)).x;
        float2 _10006 = float2(_1672, _1676);
        float _1694 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_10006, float2(0.0), isnan(_10006)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_10006, float2(0.0), isnan(_10006)), level(0.0)).x;
        float2 _10014 = float2(_1686, _1674);
        float _1696 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_10014, float2(0.0), isnan(_10014)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_10014, float2(0.0), isnan(_10014)), level(0.0)).x;
        float2 _10022 = float2(_1688, _1670);
        float2 _1698 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_10022, float2(0.0), isnan(_10022)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_10022, float2(0.0), isnan(_10022)), level(0.0)).xy;
        float _1700 = _1698.x;
        float _1702 = _1698.y;
        float2 _10034 = float2(_1668, _1690);
        float2 _1704 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_10034, float2(0.0), isnan(_10034)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_10034, float2(0.0), isnan(_10034)), level(0.0)).xy;
        float _1706 = _1704.x;
        float _1708 = _1704.y;
        float2 _10046 = float2(_1686, _1676);
        float _1710 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_10046, float2(0.0), isnan(_10046)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_10046, float2(0.0), isnan(_10046)), level(0.0)).x;
        float _1712 = -_1684;
        float _1714 = _1682 + _1712;
        float _1716 = _1714 * 2000.0;
        float _1718 = abs(_1716);
        bool _1720 = _1718 >= 2.0;
        bool _1722 = isnan(_1718);
        bool _1724 = _1720 || _1722;
        bool _1726 = isnan(2.0);
        bool _1728 = _1724 || _1726;
        float _1730 = _1716;
        float _1732 = _1672;
        float _1734 = _1670;
        float _1736 = _1686;
        if (_1728)
        {
            int _1738 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 4;
            uint _1740 = uint(int(uint(_1738) >> uint(2)));
            float _1742 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_1740)]);
            _1730 = _1742;
        }
        float _1744 = _1730;
        float _1746 = _1682 * 2000.0;
        float _1748 = -_1682;
        float _1750 = _1748 + _1700;
        float _1752 = -_1682;
        float _1754 = _1752 + _1706;
        float _1756 = -_1682;
        float _1758 = _1756 + _1692;
        if (_1728)
        {
            float _1760 = _1746 + (-2.0);
            _1732 = _1760;
        }
        float _1762 = _1732;
        float _1764 = _1750 * 1000.0;
        float _1766 = _1754 * 1000.0;
        float _1768 = -_1682;
        float _1770 = _1768 + _1694;
        float _1772 = _1758 * 2000.0;
        float _1774 = -_1682;
        float _1776 = _1774 + _1696;
        float _1778 = -_1682;
        float _1780 = _1778 + _1710;
        float _1782 = _1770 * 2000.0;
        float _1784 = _1776 * 2000.0;
        float _1786 = _1780 * 2000.0;
        float _1788 = abs(_1772);
        float _1790 = abs(_1782);
        float _1792 = precise::max(_1788, _1790);
        float _1794 = abs(_1784);
        float _1796 = precise::max(_1792, _1794);
        float _1798 = abs(_1786);
        float _1800 = precise::max(_1796, _1798);
        float _1802 = _1744;
        float _1804 = _1764;
        _1606 = _1784;
        _1418 = _1786;
        if (_1728)
        {
            float _1806 = _1744 + 10.0;
            _1802 = _1806;
        }
        float _1808 = _1802;
        bool _1810 = _1808 < _1762;
        bool _1812 = !_1728;
        bool _1814 = _1810 || _1812;
        float _1816 = fma(_1764, _1764, 0.0625);
        float _1818 = fma(_1766, _1766, _1816);
        float _1820 = rsqrt(_1818);
        float _1822 = _1820 * 0.25;
        float _1824 = _1766 * _1820;
        bool _1826 = _1822 < 0.891006529331207275390625;
        bool _1828 = _1826 || _1814;
        bool _1830 = _1800 >= 2.0;
        bool _1832 = isnan(_1800);
        bool _1834 = _1830 || _1832;
        bool _1836 = isnan(2.0);
        bool _1838 = _1834 || _1836;
        bool _1840 = _1838 || _1828;
        float _1842 = _1764 * _1820;
        bool _1844 = !_1840;
        float _1846 = _1822;
        float _1848 = _1808;
        float _1850 = _1824;
        float _1882;
        float _1884;
        float _1886;
        float _1888;
        if (!_1844)
        {
            float _1852 = -_1684;
            float _1854 = _1852 + _1702;
            float _1856 = -_1684;
            float _1858 = _1856 + _1708;
            float _1860 = _1684 * 2000.0;
            float _1862 = _1854 * 1000.0;
            float _1864 = _1858 * 1000.0;
            float _1866 = fma(_1862, _1862, 0.0625);
            float _1868 = fma(_1864, _1864, _1866);
            float _1870 = rsqrt(_1868);
            float _1872 = -_1862;
            float _1874 = fma(_1872, _1870, -0.0);
            float _1876 = -_1864;
            float _1878 = fma(_1876, _1870, -0.0);
            float _1880 = _1870 * 0.25;
            _1882 = _1860;
            _1884 = _1878;
            _1886 = _1874;
            _1888 = _1880;
            _1890 = true;
        }
        else
        {
            float _1892 = _1824 * _1824;
            float _1894 = 1.0 / _1822;
            float _1896 = -_1842;
            float _1898 = (-0.0) + _1896;
            float _1900 = fma(_1842, _1842, _1892);
            float _1902 = sqrt(_1900);
            bool _1904 = _1902 > 9.9999997473787516355514526367188e-05;
            float _1906 = _1902 * _1894;
            float _1908 = _1892;
            _1886 = _1898;
            if (_1904)
            {
                float _1910 = abs(_1842);
                float _1912 = abs(_1824);
                float _1914 = precise::max(_1910, _1912);
                _1804 = _1914;
            }
            float _1916 = _1804;
            if (!_1904)
            {
                _1908 = 0.0;
            }
            float _1918 = _1908;
            float _1920 = _1916;
            float _1922 = _1918;
            if (_1904)
            {
                float _1924 = 1.0 / _1916;
                _1920 = _1924;
            }
            float _1926 = _1920;
            if (_1904)
            {
                float _1928 = _1902 * _1926;
                _1922 = _1928;
            }
            float _1930 = _1922;
            float _1932 = _1930 * 0.9649016857147216796875;
            float _1934 = -_1932;
            float _1936 = fma(_1934, _1906, _1746);
            float _1938 = -_1824;
            float _1940 = (-0.0) + _1938;
            _1882 = _1936;
            _1884 = _1940;
            _1888 = _1822;
        }
        _1890 = false;
        float _1942 = _1882;
        float _1944 = _1884;
        float _1946 = _1886;
        float _1948 = _1888;
        float2 _10355 = float2(_1668, _1670);
        float _1950 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_10355, float2(0.0), isnan(_10355)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_10355, float2(0.0), isnan(_10355)), level(0.0)).y;
        float _1952 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[81]);
        bool _1954 = _1384 >= _1942;
        int _1956 = (_1954 ? (-1) : 0) | _1548;
        float _1958 = 0.0 + _1952;
        float _1960 = precise::clamp(_1958, 0.0, 1.0);
        bool _1962 = _934 >= _1960;
        int _1964 = (_1962 ? (-1) : 0) & _1956;
        int _1966 = ~_1964;
        float _1968 = _1942;
        float _1970 = _1942;
        _1422 = _1950;
        float _2032;
        float _2034;
        float _2036;
        float _2038;
        float _2040;
        float _2042;
        float _2044;
        float _2046;
        bool _2048;
        float _2050;
        float _2052;
        float _2054;
        if (!(_1966 != 0))
        {
            float _1972 = _922 * 6.283185482025146484375;
            float _1974 = _916 * 6.283185482025146484375;
            float _1976 = _928 * 6.283185482025146484375;
            if (_1548 != 0)
            {
                float _1978 = fma(_922, _888, _1942);
                _1414 = _1978;
            }
            float _1980 = _1414;
            float _1982 = _1972 * _1972;
            float _1984 = fma(_1974, _1974, _1982);
            float _1986 = fma(_1976, _1976, _1984);
            float _1988 = sqrt(_1986);
            float _1990 = rsqrt(_1986);
            float _1992 = _1988 * 0.5;
            bool _1994 = _1988 != 0.0;
            bool _1996 = isnan(_1988);
            bool _1998 = _1994 || _1996;
            bool _2000 = isnan(0.0);
            bool _2002 = _1998 || _2000;
            float _2004 = _1992 * 0.15915493667125701904296875;
            float _2006 = _1974 * _1990;
            float _2008 = _2004 * 6.283185482025146484375;
            float _2010 = sin(_2008);
            float _2012 = _1972 * _1990;
            float _2014 = _1976 * _1990;
            float _2016 = _2002 ? _2006 : 0.0;
            float _2018 = _2002 ? _2012 : 0.0;
            float _2020 = _2004 * 6.283185482025146484375;
            float _2022 = cos(_2020);
            float _2024 = _2002 ? _2014 : 0.0;
            float _2026 = _2016 * _2010;
            float _2028 = _2018 * _2010;
            float _2030 = _2024 * _2010;
            _2032 = _1986;
            _2034 = _2016;
            _2036 = _2018;
            _2038 = _2004;
            _2040 = _1988;
            _2042 = _1980;
            _2044 = _2022;
            _2046 = _2028;
            _2048 = _2002;
            _2050 = _2026;
            _2052 = _2030;
            _2054 = 0.0;
            _2056 = true;
        }
        else
        {
            float _2058 = _1946 * _1946;
            float _2060 = fma(_1944, _1944, _2058);
            float _2062 = sqrt(_2060);
            float _2064 = precise::max(_2062, -1.0);
            float _2066 = precise::min(_2064, 1.0);
            float _2068 = abs(_2066);
            float _2070 = fma(_2068, -0.5, 0.5);
            int _2072 = as_type<int>(_2070) + (-218103808);
            bool _2074 = uint(_2072) >= 1920991232u;
            bool _2076 = !_2074;
            int _2096;
            if (!_2076)
            {
                int _2078 = 1056964608;
                int _2080 = as_type<int>(_1842);
                int _2082 = as_type<int>(_2070);
                int _2084 = 7504;
                int _2086;
                int _2088;
                int _2090;
                int _2092;
                int _2094;
                _75(_2078, _2080, _2082, _2084, _2086, _2088, _2090, _2092, _2094);
                _2096 = _2086;
                _2098 = true;
            }
            else
            {
                float _2100 = rsqrt(_2070);
                float _2102 = _2070 * _2100;
                float _2104 = _2100 * 0.5;
                float _2106 = -_2102;
                float _2108 = 0.0 + _2106;
                float _2110 = fma(_2104, _2108, 0.5);
                float _2112 = fma(_2102, _2110, _2102);
                float _2114 = -_2112;
                float _2116 = 0.0 + _2114;
                float _2118 = fma(_2112, _2116, _2070);
                float _2120 = fma(_2104, _2118, _2112);
                _2096 = as_type<int>(_2120);
            }
            _2098 = false;
            int _2122 = _2096;
            float _2124 = abs(_2066);
            bool _2126 = _2124 > 0.569999992847442626953125;
            float _2128 = _2062 + 9.9999997473787516355514526367188e-06;
            float _2130 = _928 * 6.283185482025146484375;
            float _2132 = abs(_2066);
            float _2134 = _2126 ? as_type<float>(_2122) : _2132;
            float _2136 = 1.0 / _2128;
            float _2138 = _2130 * _1948;
            float _2140 = _2130 * _1946;
            float _2142 = _2134 * _2134;
            float _2144 = fma(_2142, 0.0517513789236545562744140625, 0.01816697604954242706298828125);
            float _2146 = fma(_2142, _2144, 0.0467568598687648773193359375);
            float _2148 = fma(_2142, _2146, 0.074846573173999786376953125);
            float _2150 = fma(_2142, _2148, 0.166670143604278564453125);
            float _2152 = _2142 * _2150;
            float _2154 = fma(_2134, _2152, _2134);
            float _2156 = _2138 * _2138;
            float _2158 = _2154;
            if (_2126)
            {
                float _2160 = fma(_2154, -2.0, 1.57079637050628662109375);
                _2158 = _2160;
            }
            float _2162 = _2158;
            bool _2164 = _2066 >= 0.0;
            bool _2166 = isnan(_2066);
            bool _2168 = _2164 || _2166;
            bool _2170 = isnan(0.0);
            bool _2172 = _2168 || _2170;
            float _2174 = fma(_2140, _2140, _2156);
            float _2176 = _2136 * _1946;
            float _2178 = _2130 * _1944;
            bool _2180 = !_2172;
            float _2182 = -_2162;
            float _2184 = _2180 ? _2182 : _2162;
            float _2186 = -_1944;
            float _2188 = _2136 * _2186;
            float _2190 = -_1942;
            float _2192 = fma(_1950, 2000.0, _2190);
            float _2194 = fma(_2178, _2178, _2174);
            float _2196 = _2184 * _2176;
            float _2198 = _2184 * _2188;
            float _2200 = sqrt(_2194);
            float _2202 = abs(_2192);
            bool _2204 = _2202 >= 2.0;
            bool _2206 = isnan(_2202);
            bool _2208 = _2204 || _2206;
            bool _2210 = isnan(2.0);
            bool _2212 = _2208 || _2210;
            float _2214 = _2196 * _2196;
            bool _2216 = _1948 <= 0.891006529331207275390625;
            bool _2218 = !_2212;
            bool _2220 = _2216 || _2218;
            float _2222 = fma(_2198, _2198, _2214);
            float _2224 = rsqrt(_2194);
            float _2226 = sqrt(_2222);
            float _2228 = _2200 * 0.5;
            bool _2230 = _2200 != 0.0;
            bool _2232 = isnan(_2200);
            bool _2234 = _2230 || _2232;
            bool _2236 = isnan(0.0);
            bool _2238 = _2234 || _2236;
            _1598 = _2200;
            _2048 = _2220;
            if (_2220)
            {
                float _2240 = _1942 + (-1000.0);
                _1968 = _2240;
            }
            float _2242 = _1968;
            float _2244 = _2228 * 0.15915493667125701904296875;
            float _2246 = rsqrt(_2222);
            float _2248 = _2140 * _2224;
            float _2250 = _2178 * _2224;
            float _2252 = _2138 * _2224;
            float _2254 = _2238 ? _2248 : 0.0;
            float _2256 = _2226 * 0.5;
            float _2258 = _2244 * 6.283185482025146484375;
            float _2260 = sin(_2258);
            bool _2262 = _2226 != 0.0;
            bool _2264 = isnan(_2226);
            bool _2266 = _2262 || _2264;
            bool _2268 = isnan(0.0);
            bool _2270 = _2266 || _2268;
            float _2272 = _2256 * 0.15915493667125701904296875;
            float _2274 = _2238 ? _2250 : 0.0;
            float _2276 = _2238 ? _2252 : 0.0;
            float _2278 = _2196 * _2246;
            float _2280 = _2272 * 6.283185482025146484375;
            float _2282 = sin(_2280);
            float _2284 = _2198 * _2246;
            float _2286 = _2270 ? _2278 : 0.0;
            float _2288 = _2270 ? _2284 : 0.0;
            float _2290 = _2272 * 6.283185482025146484375;
            float _2292 = cos(_2290);
            float _2294 = _2254 * _2260;
            float _2296 = _2274 * _2260;
            float _2298 = _2276 * _2260;
            float _2300 = _2244 * 6.283185482025146484375;
            float _2302 = cos(_2300);
            float _2304 = _2286 * _2282;
            float _2306 = _2288 * _2282;
            float _2308 = _2304 * _2294;
            float _2310 = _2304 * _2296;
            float _2312 = _2292 * _2294;
            float _2314 = _2292 * _2296;
            float _2316 = -_2308;
            float _2318 = fma(_2306, _2296, _2316);
            float _2320 = fma(_2306, _2294, _2310);
            float _2322 = fma(_2292, _2298, _2318);
            float _2324 = fma(_2306, _2302, _2312);
            float _2326 = fma(_2304, _2302, _2314);
            float _2328 = -_2320;
            float _2330 = fma(_2292, _2302, _2328);
            float _2332 = fma(_2304, _2298, _2324);
            float _2334 = -_2306;
            float _2336 = fma(_2334, _2298, _2326);
            _2032 = _2304;
            _2034 = _2302;
            _2036 = _2306;
            _2038 = _2314;
            _2040 = _2326;
            _1846 = _2318;
            _1848 = _2320;
            _1850 = _2272;
            _1734 = _2224;
            _1736 = _2244;
            _2042 = _2242;
            _2044 = _2330;
            _2046 = _2322;
            _1970 = _2242;
            _2050 = _2332;
            _2052 = _2336;
            _2054 = 1.0;
        }
        _2056 = false;
        float _2338 = _2032;
        float _2340 = _2034;
        float _2342 = _2036;
        float _2344 = _2038;
        float _2346 = _2040;
        float _2348 = _1846;
        float _2350 = _1848;
        float _2352 = _1850;
        float _2354 = _1734;
        float _2356 = _1736;
        float _2358 = _1598;
        float _2360 = _2042;
        float _2362 = _2044;
        float _2364 = _2046;
        float _2366 = _1970;
        bool _2368 = _2048;
        float _2370 = _2050;
        float _2372 = _2052;
        float _2374 = _2054;
        bool _2376 = !_802;
        bool _2378 = _2368;
        float _2380 = _2342;
        float _2382 = _2344;
        float _2384 = _2340;
        float _2386 = _2366;
        float _2388 = _2338;
        _1132 = _2346;
        _1134 = _2348;
        _1136 = _2350;
        _1138 = _2352;
        _1600 = _2354;
        _1602 = _2356;
        _1604 = _2358;
        _1610 = _2370;
        _1618 = _2372;
        _1424 = _2360;
        _1642 = _2374;
        if (!_2376)
        {
            float _2390 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _2392 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _2394 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _2396 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _2398 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[28]);
            float _2400 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[29]);
            float _2402 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[30]);
            float _2404 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[31]);
            float _2406 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _2408 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _2410 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _2412 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _2414 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _2416 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _2418 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _2420 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _2422 = _2396 * _2402;
            float _2424 = _2396 * _2400;
            float _2426 = _2396 * _2398;
            float _2428 = _2412 * _2402;
            float _2430 = _2412 * _2400;
            float _2432 = _2412 * _2398;
            float _2434 = _2412 * _2394;
            float _2436 = _2412 * _2390;
            float _2438 = _2412 * _2392;
            float _2440 = -_2422;
            float _2442 = fma(_2394, _2404, _2440);
            float _2444 = -_2424;
            float _2446 = fma(_2392, _2404, _2444);
            float _2448 = -_2426;
            float _2450 = fma(_2390, _2404, _2448);
            float _2452 = -_2428;
            float _2454 = fma(_2410, _2404, _2452);
            float _2456 = -_2430;
            float _2458 = fma(_2408, _2404, _2456);
            float _2460 = -_2432;
            float _2462 = fma(_2406, _2404, _2460);
            float _2464 = -_2434;
            float _2466 = fma(_2410, _2396, _2464);
            float _2468 = -_2436;
            float _2470 = fma(_2406, _2396, _2468);
            float _2472 = _2394 * _2400;
            float _2474 = _2394 * _2398;
            float _2476 = _2410 * _2400;
            float _2478 = _2410 * _2398;
            float _2480 = _2392 * _2398;
            float _2482 = -_2438;
            float _2484 = fma(_2408, _2396, _2482);
            float _2486 = -_2472;
            float _2488 = fma(_2392, _2402, _2486);
            float _2490 = -_2474;
            float _2492 = fma(_2390, _2402, _2490);
            float _2494 = -_2476;
            float _2496 = fma(_2408, _2402, _2494);
            float _2498 = -_2478;
            float _2500 = fma(_2406, _2402, _2498);
            float _2502 = _2410 * _2390;
            float _2504 = -_2480;
            float _2506 = fma(_2390, _2400, _2504);
            float _2508 = _2408 * _2390;
            float _2510 = _2408 * _2398;
            float _2512 = _2410 * _2450;
            float _2514 = _2410 * _2392;
            float _2516 = _2408 * _2492;
            float _2518 = -_2510;
            float _2520 = fma(_2406, _2400, _2518);
            float _2522 = _2410 * _2446;
            float _2524 = -_2512;
            float _2526 = fma(_2406, _2442, _2524);
            float _2528 = -_2514;
            float _2530 = fma(_2408, _2394, _2528);
            float _2532 = -_2508;
            float _2534 = fma(_2406, _2392, _2532);
            float _2536 = _2408 * _2450;
            float _2538 = -_2522;
            float _2540 = fma(_2408, _2442, _2538);
            float _2542 = fma(_2412, _2492, _2526);
            float _2544 = -_2502;
            float _2546 = fma(_2406, _2394, _2544);
            float _2548 = -_2536;
            float _2550 = fma(_2406, _2446, _2548);
            float _2552 = fma(_2412, _2488, _2540);
            float _2554 = _2416 * _2542;
            float _2556 = _2418 * _2446;
            float _2558 = -_2516;
            float _2560 = fma(_2406, _2488, _2558);
            float _2562 = fma(_2412, _2506, _2550);
            float _2564 = -_2554;
            float _2566 = fma(_2414, _2552, _2564);
            float _2568 = -_2556;
            float _2570 = fma(_2416, _2442, _2568);
            float _2572 = fma(_2410, _2506, _2560);
            float _2574 = _2418 * _2450;
            float _2576 = fma(_2418, _2562, _2566);
            float _2578 = _2416 * _2450;
            float _2580 = _2418 * _2462;
            float _2582 = -_2574;
            float _2584 = fma(_2414, _2442, _2582);
            float _2586 = -_2420;
            float _2588 = fma(_2586, _2572, _2576);
            float _2590 = -_2578;
            float _2592 = fma(_2414, _2446, _2590);
            float _2594 = _2418 * _2458;
            float _2596 = fma(_2420, _2488, _2570);
            float _2598 = 1.0 / _2588;
            float _2600 = -_2580;
            float _2602 = fma(_2414, _2454, _2600);
            float _2604 = _2416 * _2462;
            float _2606 = fma(_2420, _2506, _2592);
            float _2608 = _2418 * _2484;
            float _2610 = _2418 * _2470;
            float _2612 = _2416 * _2470;
            float _2614 = -_2594;
            float _2616 = fma(_2416, _2454, _2614);
            float _2618 = fma(_2420, _2492, _2584);
            float _2620 = -_2604;
            float _2622 = fma(_2414, _2458, _2620);
            float _2624 = -_2608;
            float _2626 = fma(_2416, _2466, _2624);
            float _2628 = -_2610;
            float _2630 = fma(_2414, _2466, _2628);
            float _2632 = -_2612;
            float _2634 = fma(_2414, _2484, _2632);
            float _2636 = fma(_2420, _2496, _2616);
            float _2638 = fma(_2420, _2500, _2602);
            float _2640 = fma(_2420, _2520, _2622);
            float _2642 = _2596 * _2598;
            float _2644 = _2542 * _2598;
            float _2646 = _2606 * _2598;
            float _2648 = _2552 * _2598;
            float _2650 = _2618 * _2598;
            float _2652 = _2644 * _1540;
            float _2654 = _2642 * _2360;
            float _2656 = _2562 * _2598;
            float _2658 = _2646 * _2360;
            float _2660 = -_2652;
            float _2662 = fma(_2650, _2360, _2660);
            float _2664 = -_2654;
            float _2666 = fma(_2648, _1540, _2664);
            float _2668 = _2636 * _2598;
            float _2670 = _2638 * _2598;
            float _2672 = -_2658;
            float _2674 = fma(_2656, _1540, _2672);
            float _2676 = _2640 * _2598;
            float _2678 = fma(_2420, _2530, _2626);
            float _2680 = fma(_2420, _2546, _2630);
            float _2682 = fma(_2668, _1542, _2666);
            float _2684 = -_2670;
            float _2686 = fma(_2684, _1542, _2662);
            float _2688 = fma(_2420, _2534, _2634);
            float _2690 = fma(_2676, _1542, _2674);
            float _2692 = -_2678;
            float _2694 = fma(_2692, _2598, _2682);
            float _2696 = fma(_2680, _2598, _2686);
            float _2698 = -_2688;
            float _2700 = fma(_2698, _2598, _2690);
            _1132 = _2644;
            _1134 = _2690;
            _1136 = _2656;
            _1138 = _2604;
            _1600 = _2642;
            _1602 = _2618;
            _1604 = _2668;
            _1606 = _2412;
            _1416 = _2650;
            _1418 = _2416;
            _1420 = _2676;
            _1422 = _2420;
            _1638 = true;
            _1648 = as_type<int>(_2694);
            _1622 = _2362;
            _1662 = as_type<int>(_2700);
            _1654 = as_type<int>(_2696);
            _1614 = _2364;
            _1664 = _2462;
            _1666 = _2530;
            _296 = _2484;
            _1634 = 0.0;
            _1626 = 0.0;
            _1630 = 0.0;
            _2702 = true;
        }
        else
        {
            bool _2704 = !_1036;
            if (!_2704)
            {
                float _2706 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                uint _2708 = uint(int(uint(_170) >> uint(2)));
                float _2710 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2708)]);
                int _2712 = _170 + 4;
                uint _2714 = uint(int(uint(_2712) >> uint(2)));
                float _2716 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2714)]);
                int _2718 = _170 + 8;
                uint _2720 = uint(int(uint(_2718) >> uint(2)));
                float _2722 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2720)]);
                uint _2724 = uint(int(uint(_170) >> uint(2)));
                float _2726 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2724)]);
                int _2728 = _170 + 4;
                uint _2730 = uint(int(uint(_2728) >> uint(2)));
                float _2732 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2730)]);
                int _2734 = _170 + 8;
                uint _2736 = uint(int(uint(_2734) >> uint(2)));
                float _2738 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2736)]);
                uint _2740 = uint(int(uint(_170) >> uint(2)));
                float _2742 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2740)]);
                int _2744 = _170 + 4;
                uint _2746 = uint(int(uint(_2744) >> uint(2)));
                float _2748 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2746)]);
                int _2750 = _170 + 8;
                uint _2752 = uint(int(uint(_2750) >> uint(2)));
                float _2754 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2752)]);
                float _2756 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _2758 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _2760 = _2722 * _2726;
                float _2762 = _2722 * _2732;
                float _2764 = -_2760;
                float _2766 = fma(_2710, _2738, _2764);
                float _2768 = _2716 * _2726;
                float _2770 = -_2762;
                float _2772 = fma(_2716, _2738, _2770);
                float _2774 = _2748 * _2766;
                float _2776 = -_2768;
                float _2778 = fma(_2710, _2732, _2776);
                float _2780 = _2706 * _2732;
                float _2782 = -_2774;
                float _2784 = fma(_2742, _2772, _2782);
                float _2786 = fma(_2754, _2778, _2784);
                float _2788 = -_2780;
                float _2790 = fma(_2716, _2756, _2788);
                float _2792 = 1.0 / _2786;
                float _2794 = _2706 * _2738;
                float _2796 = _2706 * _2726;
                float _2798 = _2754 * _2726;
                float _2800 = _2748 * _2738;
                float _2802 = -_2710;
                float _2804 = fma(_2802, _2738, _2760);
                float _2806 = -_2798;
                float _2808 = fma(_2742, _2738, _2806);
                float _2810 = -_2800;
                float _2812 = fma(_2754, _2732, _2810);
                float _2814 = _2742 * _2732;
                float _2816 = -_2794;
                float _2818 = fma(_2722, _2756, _2816);
                float _2820 = -_2796;
                float _2822 = fma(_2710, _2756, _2820);
                float _2824 = _2754 * _2716;
                float _2826 = _2742 * _2722;
                float _2828 = _2748 * _2710;
                float _2830 = -_2814;
                float _2832 = fma(_2748, _2726, _2830);
                float _2834 = -_2824;
                float _2836 = fma(_2748, _2722, _2834);
                float _2838 = -_2826;
                float _2840 = fma(_2754, _2710, _2838);
                float _2842 = _2754 * _2790;
                float _2844 = _2812 * _2792;
                float _2846 = _2808 * _2792;
                float _2848 = -_2828;
                float _2850 = fma(_2742, _2716, _2848);
                float _2852 = _2832 * _2792;
                float _2854 = _2754 * _2822;
                float _2856 = _2748 * _2822;
                float _2858 = -_2842;
                float _2860 = fma(_2748, _2818, _2858);
                float _2862 = _2844 * _2360;
                float _2864 = _2846 * _2360;
                float _2866 = _2852 * _2360;
                float _2868 = _2804 * _2792;
                float _2870 = _2772 * _2792;
                float _2872 = _2778 * _2792;
                float _2874 = -_2854;
                float _2876 = fma(_2742, _2818, _2874);
                float _2878 = fma(_2868, _1540, _2864);
                float _2880 = fma(_2870, _1540, _2862);
                float _2882 = fma(_2872, _1540, _2866);
                float _2884 = _2840 * _2792;
                float _2886 = _2836 * _2792;
                float _2888 = _2850 * _2792;
                float _2890 = -_2856;
                float _2892 = fma(_2742, _2790, _2890);
                float _2894 = fma(_2884, _1542, _2878);
                float _2896 = fma(_2886, _1542, _2880);
                float _2898 = fma(_2758, _2766, _2876);
                float _2900 = fma(_2758, _2772, _2860);
                float _2902 = fma(_2888, _1542, _2882);
                float _2904 = fma(_2758, _2778, _2892);
                float _2906 = fma(_2898, _2792, _2894);
                float _2908 = -_2900;
                float _2910 = fma(_2908, _2792, _2896);
                float _2912 = -_2904;
                float _2914 = fma(_2912, _2792, _2902);
                _1132 = _2894;
                _1134 = _2836;
                _1136 = _2888;
                _1138 = _2804;
                _1600 = _2904;
                _1602 = _2896;
                _1604 = _2754;
                _1606 = _2878;
                _1416 = _2792;
                _1418 = _2812;
                _1420 = _2766;
                _1422 = _2840;
                _1638 = true;
                _1648 = as_type<int>(_2910);
                _1622 = _2362;
                _1662 = as_type<int>(_2914);
                _1654 = as_type<int>(_2906);
                _1614 = _2364;
                _1664 = 0.0;
                _1424 = _2902;
                _1666 = 0.0;
                _1634 = 0.0;
                _1626 = 0.0;
                _1630 = 0.0;
                _2702 = true;
            }
            else
            {
                if (!_1096)
                {
                    _2378 = true;
                }
                bool _2916 = _2378;
                _1638 = _2916;
                if (!_1096)
                {
                    _2380 = 0.0;
                    _2382 = 0.0;
                }
                float _2918 = _2380;
                float _2920 = _2382;
                _1634 = _2920;
                _1630 = _2918;
                if (!_1096)
                {
                    _2384 = 0.0;
                }
                float _2922 = _2384;
                _1626 = _2922;
                if (!_1096)
                {
                    _2386 = _2364;
                }
                float _2924 = _2386;
                _1614 = _2924;
                if (!_1096)
                {
                    _2388 = _2362;
                }
                float _2926 = _2388;
                _1622 = _2926;
                if (!_1096)
                {
                    _1646 = as_type<int>(_1540);
                }
                int _2928 = _1646;
                _1648 = _2928;
                if (!_1096)
                {
                    _1652 = as_type<int>(_2360);
                }
                int _2930 = _1652;
                _1654 = _2930;
                if (!_1096)
                {
                    _1660 = as_type<int>(_1542);
                }
                int _2932 = _1660;
                bool _2934 = !_1096;
                _1662 = _2932;
                _1664 = 0.0;
                _1666 = 0.0;
                if (!_2934)
                {
                    uint _2936 = uint(int(uint(_170) >> uint(2)));
                    float _2938 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2936)]);
                    int _2940 = _170 + 4;
                    uint _2942 = uint(int(uint(_2940) >> uint(2)));
                    float _2944 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2942)]);
                    int _2946 = _170 + 8;
                    uint _2948 = uint(int(uint(_2946) >> uint(2)));
                    float _2950 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2948)]);
                    int _2952 = _170 + 12;
                    uint _2954 = uint(int(uint(_2952) >> uint(2)));
                    float _2956 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2954)]);
                    uint _2958 = uint(int(uint(_170) >> uint(2)));
                    float _2960 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2958)]);
                    int _2962 = _170 + 4;
                    uint _2964 = uint(int(uint(_2962) >> uint(2)));
                    float _2966 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2964)]);
                    int _2968 = _170 + 8;
                    uint _2970 = uint(int(uint(_2968) >> uint(2)));
                    float _2972 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2970)]);
                    int _2974 = _170 + 12;
                    uint _2976 = uint(int(uint(_2974) >> uint(2)));
                    float _2978 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2976)]);
                    uint _2980 = uint(int(uint(_170) >> uint(2)));
                    float _2982 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2980)]);
                    int _2984 = _170 + 4;
                    uint _2986 = uint(int(uint(_2984) >> uint(2)));
                    float _2988 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2986)]);
                    int _2990 = _170 + 8;
                    uint _2992 = uint(int(uint(_2990) >> uint(2)));
                    float _2994 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2992)]);
                    int _2996 = _170 + 12;
                    uint _2998 = uint(int(uint(_2996) >> uint(2)));
                    float _3000 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2998)]);
                    float _3002 = _2950 * _2960;
                    float _3004 = _2950 * _2966;
                    float _3006 = _2944 * _2960;
                    float _3008 = _2972 * _2956;
                    float _3010 = -_3002;
                    float _3012 = fma(_2938, _2972, _3010);
                    float _3014 = -_3004;
                    float _3016 = fma(_2944, _2972, _3014);
                    float _3018 = -_3006;
                    float _3020 = fma(_2938, _2966, _3018);
                    float _3022 = _2966 * _2956;
                    float _3024 = _2988 * _3012;
                    float _3026 = _2960 * _2956;
                    float _3028 = _2988 * _2972;
                    float _3030 = -_3008;
                    float _3032 = fma(_2950, _2978, _3030);
                    float _3034 = -_3024;
                    float _3036 = fma(_2982, _3016, _3034);
                    float _3038 = -_3022;
                    float _3040 = fma(_2944, _2978, _3038);
                    float _3042 = -_3026;
                    float _3044 = fma(_2938, _2978, _3042);
                    float _3046 = -_3028;
                    float _3048 = fma(_2994, _2966, _3046);
                    float _3050 = fma(_2994, _3020, _3036);
                    float _3052 = _2982 * _2966;
                    float _3054 = _2994 * _2960;
                    float _3056 = _2994 * _2944;
                    float _3058 = _2982 * _2950;
                    float _3060 = -_2938;
                    float _3062 = fma(_3060, _2972, _3002);
                    float _3064 = 1.0 / _3050;
                    float _3066 = -_3054;
                    float _3068 = fma(_2982, _2972, _3066);
                    float _3070 = -_3052;
                    float _3072 = fma(_2988, _2960, _3070);
                    float _3074 = -_3056;
                    float _3076 = fma(_2988, _2950, _3074);
                    float _3078 = -_3058;
                    float _3080 = fma(_2994, _2938, _3078);
                    float _3082 = _2988 * _2938;
                    float _3084 = _2988 * _3044;
                    float _3086 = _2994 * _3040;
                    float _3088 = _2994 * _3044;
                    float _3090 = -_3082;
                    float _3092 = fma(_2982, _2944, _3090);
                    float _3094 = -_3084;
                    float _3096 = fma(_2982, _3040, _3094);
                    float _3098 = -_3086;
                    float _3100 = fma(_2988, _3032, _3098);
                    float _3102 = -_3088;
                    float _3104 = fma(_2982, _3032, _3102);
                    float _3106 = fma(_3020, _3000, _3096);
                    float _3108 = fma(_3016, _3000, _3100);
                    float _3110 = _3048 * _3064;
                    float _3112 = _3068 * _3064;
                    float _3114 = _3072 * _3064;
                    float _3116 = _3062 * _3064;
                    float _3118 = _3110 * _2360;
                    float _3120 = _3112 * _2360;
                    float _3122 = _3114 * _2360;
                    float _3124 = _3016 * _3064;
                    float _3126 = _3020 * _3064;
                    float _3128 = fma(_3116, _1540, _3120);
                    float _3130 = _3080 * _3064;
                    float _3132 = fma(_3124, _1540, _3118);
                    float _3134 = fma(_3126, _1540, _3122);
                    float _3136 = _3076 * _3064;
                    float _3138 = _3092 * _3064;
                    float _3140 = fma(_3012, _3000, _3104);
                    float _3142 = fma(_3130, _1542, _3128);
                    float _3144 = fma(_3136, _1542, _3132);
                    float _3146 = fma(_3138, _1542, _3134);
                    float _3148 = fma(_3140, _3064, _3142);
                    float _3150 = -_3108;
                    float _3152 = fma(_3150, _3064, _3144);
                    float _3154 = -_3106;
                    float _3156 = fma(_3154, _3064, _3146);
                    _1132 = _3136;
                    _1134 = _3082;
                    _1136 = _3126;
                    _1138 = _3054;
                    _1600 = _2982;
                    _1602 = _2988;
                    _1604 = _3140;
                    _1606 = _3000;
                    _1416 = _3110;
                    _1418 = _3032;
                    _1420 = _3116;
                    _1422 = _3044;
                    _1638 = true;
                    _1648 = as_type<int>(_3152);
                    _1622 = _2362;
                    _1662 = as_type<int>(_3156);
                    _1654 = as_type<int>(_3148);
                    _1614 = _2364;
                    _1664 = 0.0;
                    _1424 = _3146;
                    _1666 = 0.0;
                    _1634 = 0.0;
                    _1626 = 0.0;
                    _1630 = 0.0;
                }
            }
        }
    }
    _2702 = false;
    float _3158 = _1132;
    float _3160 = _1134;
    float _3162 = _1136;
    float _3164 = _1138;
    float _3166 = _1600;
    float _3168 = _1602;
    float _3170 = _1604;
    float _3172 = _1606;
    float _3174 = _1416;
    float _3176 = _1418;
    float _3178 = _1420;
    float _3180 = _1422;
    bool _3182 = _1638;
    int _3184 = _1648;
    float _3186 = _1622;
    float _3188 = _1610;
    int _3190 = _1662;
    float _3192 = _1618;
    int _3194 = _1654;
    float _3196 = _1614;
    float _3198 = _1664;
    float _3200 = _1424;
    float _3202 = _1666;
    float _3204 = _296;
    float _3206 = _1634;
    float _3208 = _1626;
    float _3210 = _1630;
    float _3212 = _1642;
    float _3214 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _3216 = _3158;
    float _3218 = _3160;
    float _3220 = _3162;
    float _3222 = _3164;
    float _3224 = _3198;
    float _3226 = _3204;
    float _3228 = _3202;
    float _3230 = _3200;
    float _3232 = as_type<float>(_3190);
    float _3234 = _3206;
    float _3236 = _3210;
    float _3238 = _3208;
    if (_802)
    {
        float _3240 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _3242 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _3244 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _3246 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _3216 = _3240;
        _3218 = _3242;
        _3220 = _3244;
        _3222 = _3246;
    }
    float _3248 = _3216;
    float _3250 = _3218;
    float _3252 = _3220;
    float _3254 = _3222;
    float _3256 = _3166;
    float _3258 = _3168;
    float _3260 = _3170;
    float _3262 = _3172;
    if (_802)
    {
        float _3264 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _3266 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _3268 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _3270 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _3256 = _3264;
        _3258 = _3266;
        _3260 = _3268;
        _3262 = _3270;
    }
    float _3272 = _3256;
    float _3274 = _3258;
    float _3276 = _3260;
    float _3278 = _3262;
    float _3280 = _3174;
    float _3282 = _3176;
    float _3284 = _3178;
    float _3286 = _3180;
    if (_802)
    {
        float _3288 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _3290 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _3292 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _3294 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _3280 = _3288;
        _3282 = _3290;
        _3284 = _3292;
        _3286 = _3294;
    }
    float _3296 = _3280;
    float _3298 = _3282;
    float _3300 = _3284;
    float _3302 = _3286;
    float _3304 = _3182 ? as_type<float>(_3184) : _728;
    float _3306 = _3186 * 2.0;
    float _3308 = _3182 ? as_type<float>(_3184) : _1574;
    float _3310 = _3188 * 2.0;
    float _3312 = _3182 ? as_type<float>(_3190) : _740;
    float _3314 = _3188 * _3188;
    float _3316 = _3314 * 2.0;
    float _3318 = _3182 ? as_type<float>(_1560) : _776;
    float _3320 = _3306 * _3192;
    float _3322 = _3182 ? as_type<float>(_3194) : _884;
    float _3324 = _3182 ? as_type<float>(_1562) : _782;
    float _3326 = fma(_3310, _3196, _3320);
    float _3328 = _3182 ? as_type<float>(_1564) : _788;
    float _3330 = _3306 * _3188;
    float _3332 = _3182 ? as_type<float>(_1564) : _358;
    float _3334 = -_3320;
    float _3336 = fma(_3310, _3196, _3334);
    float _3338 = _3182 ? as_type<float>(_1560) : _356;
    float _3340 = _3192 * 2.0;
    float _3342 = _3306 * _3196;
    float _3344 = _3182 ? as_type<float>(_1562) : _360;
    float _3346 = _3182 ? as_type<float>(_3194) : _1582;
    float _3348 = -_3342;
    float _3350 = fma(_3340, _3188, _3348);
    float _3352 = fma(_3340, _3188, _3342);
    float _3354 = _3182 ? as_type<float>(_3190) : _1576;
    float _3356 = fma(_3324, _3214, _3322);
    float _3358 = fma(_3328, _3214, _3312);
    float _3360 = fma(_3318, _3214, _3304);
    float _3362 = _3196 * 2.0;
    float _3364 = _3340;
    float _3366 = _3328;
    float _3368 = _3248;
    float _3370 = _3304;
    float _3372 = _3306;
    float _3374 = _3322;
    float _3376 = _3318;
    float _3378 = _3250;
    float _3380 = _3252;
    float _3382 = _3254;
    float _3384 = _3332;
    float _3386 = _3308;
    if (_802)
    {
        float _3388 = _3356 * _3250;
        _3364 = _3388;
    }
    float _3390 = _3364;
    float _3392 = fma(_3362, _3192, _3330);
    float _3394 = _3298;
    float _3396 = _3276;
    float _3398 = _3300;
    float _3400 = _3274;
    float _3402 = _3278;
    if (_802)
    {
        float _3404 = _3356 * _3274;
        _3366 = _3404;
    }
    float _3406 = _3366;
    if (_802)
    {
        float _3408 = fma(_3360, _3248, _3390);
        _3368 = _3408;
    }
    float _3410 = _3368;
    float _3412 = _3196 * _3196;
    float _3414 = -_3330;
    float _3416 = fma(_3362, _3192, _3414);
    float _3418 = _3410;
    float _3420 = _3412;
    if (_802)
    {
        float _3422 = _3356 * _3298;
        _3394 = _3422;
    }
    float _3424 = _3394;
    float _3426 = _3424;
    if (_802)
    {
        float _3428 = fma(_3360, _3272, _3406);
        _3370 = _3428;
    }
    float _3430 = _3370;
    float _3432 = _3192 * _3192;
    float _3434 = -_3316;
    float _3436 = _3434 + 1.0;
    float _3438 = _3436;
    float _3440 = _3432;
    float _3442 = _3430;
    if (_802)
    {
        float _3444 = fma(_3360, _3296, _3424);
        _3426 = _3444;
    }
    float _3446 = _3426;
    float _3448 = fma(_3412, -2.0, 1.0);
    float _3450 = _3446;
    if (_802)
    {
        float _3452 = fma(_3358, _3252, _3410);
        _3418 = _3452;
    }
    float _3454 = _3418;
    float _3456 = _3454;
    if (_802)
    {
        float _3458 = fma(_3358, _3276, _3430);
        _3396 = _3458;
    }
    float _3460 = _3396;
    if (_802)
    {
        float _3462 = fma(_3358, _3300, _3446);
        _3398 = _3462;
    }
    float _3464 = _3398;
    float _3466 = fma(_3432, -2.0, 1.0);
    float _3468 = fma(_3412, -2.0, _3436);
    float _3470 = fma(_3432, -2.0, _3448);
    if (_802)
    {
        float _3472 = _3454 + _3254;
        _3224 = _3472;
    }
    float _3474 = _3224;
    float _3476 = _3474;
    float _3478 = _3474;
    if (_802)
    {
        float _3480 = _3460 + _3278;
        _3226 = _3480;
    }
    float _3482 = _3226;
    float _3484 = _3482;
    float _3486 = _3482;
    if (_802)
    {
        float _3488 = _3464 + _3302;
        _3228 = _3488;
    }
    float _3490 = _3228;
    float _3492 = -_3316;
    float _3494 = _3492 + _3466;
    float _3496 = _3490;
    float _3498 = _3490;
    if (!_802)
    {
        bool _3500 = !_1036;
        if (!_3500)
        {
            float _3502 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            uint _3504 = uint(int(uint(_170) >> uint(2)));
            float _3506 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3504)]);
            int _3508 = _170 + 4;
            uint _3510 = uint(int(uint(_3508) >> uint(2)));
            float _3512 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3510)]);
            int _3514 = _170 + 8;
            uint _3516 = uint(int(uint(_3514) >> uint(2)));
            float _3518 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3516)]);
            int _3520 = _170 + 12;
            uint _3522 = uint(int(uint(_3520) >> uint(2)));
            float _3524 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3522)]);
            uint _3526 = uint(int(uint(_170) >> uint(2)));
            float _3528 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3526)]);
            int _3530 = _170 + 4;
            uint _3532 = uint(int(uint(_3530) >> uint(2)));
            float _3534 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3532)]);
            int _3536 = _170 + 8;
            uint _3538 = uint(int(uint(_3536) >> uint(2)));
            float _3540 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3538)]);
            int _3542 = _170 + 12;
            uint _3544 = uint(int(uint(_3542) >> uint(2)));
            float _3546 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3544)]);
            uint _3548 = uint(int(uint(_170) >> uint(2)));
            float _3550 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3548)]);
            int _3552 = _170 + 4;
            uint _3554 = uint(int(uint(_3552) >> uint(2)));
            float _3556 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3554)]);
            int _3558 = _170 + 8;
            uint _3560 = uint(int(uint(_3558) >> uint(2)));
            float _3562 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3560)]);
            int _3564 = _170 + 12;
            uint _3566 = uint(int(uint(_3564) >> uint(2)));
            float _3568 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3566)]);
            float _3570 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _3572 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _3574 = _3512 * _3356;
            float _3576 = _3534 * _3356;
            float _3578 = _3556 * _3356;
            float _3580 = fma(_3506, _3360, _3574);
            float _3582 = fma(_3528, _3360, _3576);
            float _3584 = fma(_3550, _3360, _3578);
            float _3586 = fma(_3518, _3358, _3580);
            float _3588 = fma(_3540, _3358, _3582);
            float _3590 = fma(_3562, _3358, _3584);
            float _3592 = _3502 + _3586;
            float _3594 = _3570 + _3588;
            float _3596 = _3572 + _3590;
            _3420 = _3506;
            _3438 = _3586;
            _3440 = _3518;
            _3442 = _3524;
            _3372 = _3528;
            _3374 = _3588;
            _3376 = _3540;
            _3230 = _3546;
            _3456 = _3550;
            _3378 = _3590;
            _3380 = _3562;
            _3382 = _3568;
            _3478 = _3592;
            _3498 = _3596;
            _3486 = _3594;
            _3598 = true;
        }
        else
        {
            if (!_1096)
            {
                _3476 = _3360;
            }
            float _3600 = _3476;
            _3478 = _3600;
            if (!_1096)
            {
                _3484 = _3356;
            }
            float _3602 = _3484;
            _3486 = _3602;
            if (!_1096)
            {
                _3496 = _3358;
            }
            float _3604 = _3496;
            bool _3606 = !_1096;
            _3498 = _3604;
            if (!_3606)
            {
                uint _3608 = uint(int(uint(_170) >> uint(2)));
                float _3610 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3608)]);
                int _3612 = _170 + 4;
                uint _3614 = uint(int(uint(_3612) >> uint(2)));
                float _3616 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3614)]);
                int _3618 = _170 + 8;
                uint _3620 = uint(int(uint(_3618) >> uint(2)));
                float _3622 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3620)]);
                int _3624 = _170 + 12;
                uint _3626 = uint(int(uint(_3624) >> uint(2)));
                float _3628 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3626)]);
                uint _3630 = uint(int(uint(_170) >> uint(2)));
                float _3632 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3630)]);
                int _3634 = _170 + 4;
                uint _3636 = uint(int(uint(_3634) >> uint(2)));
                float _3638 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3636)]);
                int _3640 = _170 + 8;
                uint _3642 = uint(int(uint(_3640) >> uint(2)));
                float _3644 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3642)]);
                int _3646 = _170 + 12;
                uint _3648 = uint(int(uint(_3646) >> uint(2)));
                float _3650 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3648)]);
                uint _3652 = uint(int(uint(_170) >> uint(2)));
                float _3654 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3652)]);
                int _3656 = _170 + 4;
                uint _3658 = uint(int(uint(_3656) >> uint(2)));
                float _3660 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3658)]);
                int _3662 = _170 + 8;
                uint _3664 = uint(int(uint(_3662) >> uint(2)));
                float _3666 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3664)]);
                int _3668 = _170 + 12;
                uint _3670 = uint(int(uint(_3668) >> uint(2)));
                float _3672 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3670)]);
                float _3674 = _3616 * _3356;
                float _3676 = _3638 * _3356;
                float _3678 = _3660 * _3356;
                float _3680 = fma(_3610, _3360, _3674);
                float _3682 = fma(_3632, _3360, _3676);
                float _3684 = fma(_3654, _3360, _3678);
                float _3686 = fma(_3622, _3358, _3680);
                float _3688 = fma(_3644, _3358, _3682);
                float _3690 = fma(_3666, _3358, _3684);
                float _3692 = _3686 + _3628;
                float _3694 = _3688 + _3650;
                float _3696 = _3690 + _3672;
                _3420 = _3610;
                _3438 = _3680;
                _3440 = _3686;
                _3442 = _3628;
                _3372 = _3632;
                _3374 = _3682;
                _3376 = _3688;
                _3230 = _3650;
                _3456 = _3654;
                _3378 = _3684;
                _3380 = _3690;
                _3382 = _3672;
                _3478 = _3692;
                _3498 = _3696;
                _3486 = _3694;
            }
        }
    }
    _3598 = false;
    float _3698 = _3420;
    float _3700 = _3438;
    float _3702 = _3440;
    float _3704 = _3442;
    float _3706 = _3372;
    float _3708 = _3374;
    float _3710 = _3376;
    float _3712 = _3230;
    float _3714 = _3456;
    float _3716 = _3378;
    float _3718 = _3380;
    float _3720 = _3382;
    float _3722 = _3478;
    float _3724 = _3498;
    float _3726 = _3486;
    float _3728 = _3698;
    float _3730 = _3700;
    float _3732 = _3702;
    float _3734 = _3704;
    if (_802)
    {
        float _3736 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _3738 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _3740 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _3742 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _3728 = _3736;
        _3730 = _3738;
        _3732 = _3740;
        _3734 = _3742;
    }
    float _3744 = _3728;
    float _3746 = _3730;
    float _3748 = _3732;
    float _3750 = _3734;
    float _3752 = _3706;
    float _3754 = _3708;
    float _3756 = _3710;
    float _3758 = _3712;
    if (_802)
    {
        float _3760 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _3762 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _3764 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _3766 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _3752 = _3760;
        _3754 = _3762;
        _3756 = _3764;
        _3758 = _3766;
    }
    float _3768 = _3752;
    float _3770 = _3754;
    float _3772 = _3756;
    float _3774 = _3758;
    float _3776 = _3714;
    float _3778 = _3716;
    float _3780 = _3718;
    float _3782 = _3720;
    if (_802)
    {
        float _3784 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _3786 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _3788 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _3790 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _3776 = _3784;
        _3778 = _3786;
        _3780 = _3788;
        _3782 = _3790;
    }
    float _3792 = _3776;
    float _3794 = _3778;
    float _3796 = _3780;
    float _3798 = _3782;
    float _3800 = _3344 * 59.999996185302734375;
    float _3802 = _3338 * 59.999996185302734375;
    float _3804 = _3332 * 59.999996185302734375;
    float _3806 = _3750;
    float _3808 = _3746;
    float _3810 = _3748;
    if (_802)
    {
        float _3812 = _3800 * _3746;
        _3806 = _3812;
    }
    float _3814 = _3806;
    float _3816 = _3774;
    float _3818 = _3814;
    float _3820 = _3770;
    float _3822 = _3772;
    if (_802)
    {
        float _3824 = _3800 * _3770;
        _3816 = _3824;
    }
    float _3826 = _3816;
    float _3828 = _3826;
    if (_802)
    {
        float _3830 = fma(_3802, _3744, _3814);
        _3818 = _3830;
    }
    float _3832 = _3818;
    float _3834 = _3798;
    float _3836 = _3832;
    float _3838 = _3794;
    float _3840 = _3796;
    if (_802)
    {
        float _3842 = _3800 * _3794;
        _3834 = _3842;
    }
    float _3844 = _3834;
    float _3846 = _3844;
    if (_802)
    {
        float _3848 = fma(_3802, _3768, _3826);
        _3828 = _3848;
    }
    float _3850 = _3828;
    float _3852 = _3850;
    if (_802)
    {
        float _3854 = fma(_3804, _3748, _3832);
        _3836 = _3854;
    }
    float _3856 = _3836;
    float _3858 = _3856;
    float _3860 = _3856;
    if (_802)
    {
        float _3862 = fma(_3802, _3792, _3844);
        _3846 = _3862;
    }
    float _3864 = _3846;
    float _3866 = _3864;
    if (_802)
    {
        float _3868 = fma(_3804, _3772, _3850);
        _3852 = _3868;
    }
    float _3870 = _3852;
    float _3872 = _3870;
    float _3874 = _3870;
    if (_802)
    {
        float _3876 = fma(_3804, _3796, _3864);
        _3866 = _3876;
    }
    float _3878 = _3866;
    float _3880 = _3878;
    float _3882 = _3878;
    if (!_802)
    {
        bool _3884 = !_1036;
        if (!_3884)
        {
            uint _3886 = uint(int(uint(_170) >> uint(2)));
            float _3888 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3886)]);
            int _3890 = _170 + 4;
            uint _3892 = uint(int(uint(_3890) >> uint(2)));
            float _3894 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3892)]);
            int _3896 = _170 + 8;
            uint _3898 = uint(int(uint(_3896) >> uint(2)));
            float _3900 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3898)]);
            int _3902 = _170 + 12;
            uint _3904 = uint(int(uint(_3902) >> uint(2)));
            float _3906 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3904)]);
            uint _3908 = uint(int(uint(_170) >> uint(2)));
            float _3910 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3908)]);
            int _3912 = _170 + 4;
            uint _3914 = uint(int(uint(_3912) >> uint(2)));
            float _3916 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3914)]);
            int _3918 = _170 + 8;
            uint _3920 = uint(int(uint(_3918) >> uint(2)));
            float _3922 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3920)]);
            uint _3924 = uint(int(uint(_170) >> uint(2)));
            float _3926 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3924)]);
            int _3928 = _170 + 4;
            uint _3930 = uint(int(uint(_3928) >> uint(2)));
            float _3932 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3930)]);
            int _3934 = _170 + 8;
            uint _3936 = uint(int(uint(_3934) >> uint(2)));
            float _3938 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3936)]);
            int _3940 = _170 + 12;
            uint _3942 = uint(int(uint(_3940) >> uint(2)));
            float _3944 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3942)]);
            float _3946 = _3894 * _3800;
            float _3948 = _3916 * _3800;
            float _3950 = _3932 * _3800;
            float _3952 = fma(_3888, _3802, _3946);
            float _3954 = fma(_3910, _3802, _3948);
            float _3956 = fma(_3926, _3802, _3950);
            float _3958 = fma(_3900, _3804, _3952);
            float _3960 = fma(_3922, _3804, _3954);
            float _3962 = fma(_3938, _3804, _3956);
            _3400 = _3952;
            _3402 = _3906;
            _3450 = _3954;
            _3384 = _3938;
            _3232 = _3944;
            _3874 = _3960;
            _3860 = _3958;
            _3882 = _3962;
            _3964 = true;
        }
        else
        {
            if (!_1096)
            {
                _3858 = _3802;
            }
            float _3966 = _3858;
            _3860 = _3966;
            if (!_1096)
            {
                _3872 = _3800;
            }
            float _3968 = _3872;
            _3874 = _3968;
            if (!_1096)
            {
                _3880 = _3804;
            }
            float _3970 = _3880;
            bool _3972 = !_1096;
            _3882 = _3970;
            if (!_3972)
            {
                uint _3974 = uint(int(uint(_170) >> uint(2)));
                float _3976 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3974)]);
                int _3978 = _170 + 4;
                uint _3980 = uint(int(uint(_3978) >> uint(2)));
                float _3982 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3980)]);
                int _3984 = _170 + 8;
                uint _3986 = uint(int(uint(_3984) >> uint(2)));
                float _3988 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3986)]);
                int _3990 = _170 + 12;
                uint _3992 = uint(int(uint(_3990) >> uint(2)));
                float _3994 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3992)]);
                uint _3996 = uint(int(uint(_170) >> uint(2)));
                float _3998 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3996)]);
                int _4000 = _170 + 4;
                uint _4002 = uint(int(uint(_4000) >> uint(2)));
                float _4004 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4002)]);
                int _4006 = _170 + 8;
                uint _4008 = uint(int(uint(_4006) >> uint(2)));
                float _4010 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4008)]);
                uint _4012 = uint(int(uint(_170) >> uint(2)));
                float _4014 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4012)]);
                int _4016 = _170 + 4;
                uint _4018 = uint(int(uint(_4016) >> uint(2)));
                float _4020 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4018)]);
                int _4022 = _170 + 8;
                uint _4024 = uint(int(uint(_4022) >> uint(2)));
                float _4026 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4024)]);
                int _4028 = _170 + 12;
                uint _4030 = uint(int(uint(_4028) >> uint(2)));
                float _4032 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4030)]);
                float _4034 = _3982 * _3800;
                float _4036 = _4004 * _3800;
                float _4038 = _4020 * _3800;
                float _4040 = fma(_3976, _3802, _4034);
                float _4042 = fma(_3998, _3802, _4036);
                float _4044 = fma(_4014, _3802, _4038);
                float _4046 = fma(_3988, _3804, _4040);
                float _4048 = fma(_4010, _3804, _4042);
                float _4050 = fma(_4026, _3804, _4044);
                _3400 = _4040;
                _3402 = _3994;
                _3450 = _4042;
                _3384 = _4026;
                _3232 = _4032;
                _3874 = _4048;
                _3860 = _4046;
                _3882 = _4050;
            }
        }
    }
    _3964 = false;
    float _4052 = _3400;
    float _4054 = _3402;
    float _4056 = _3450;
    float _4058 = _3384;
    float _4060 = _3232;
    float _4062 = _3874;
    float _4064 = _3860;
    float _4066 = _3882;
    float _4068 = -_3356;
    float _4070 = _4068 + _3346;
    float _4072 = -_3360;
    float _4074 = _4072 + _3308;
    float _4076 = -_3358;
    float _4078 = _4076 + _3354;
    float _4080 = _4052;
    float _4082 = _4054;
    float _4084 = _4056;
    float _4086 = _4060;
    float _4088 = _4058;
    float _4090 = _4064;
    float _4092 = _4062;
    float _4094 = _4066;
    if (_802)
    {
        float _4096 = _4070 * _3746;
        _4080 = _4096;
    }
    float _4098 = _4080;
    float _4100 = _4098;
    if (_802)
    {
        float _4102 = _4070 * _3770;
        _4082 = _4102;
    }
    float _4104 = _4082;
    float _4106 = _4104;
    if (_802)
    {
        float _4108 = _4070 * _3794;
        _4084 = _4108;
    }
    float _4110 = _4084;
    float _4112 = _4110;
    if (_802)
    {
        float _4114 = fma(_4074, _3744, _4098);
        _4100 = _4114;
    }
    float _4116 = _4100;
    if (_802)
    {
        float _4118 = fma(_4074, _3768, _4104);
        _4106 = _4118;
    }
    float _4120 = _4106;
    if (_802)
    {
        float _4122 = fma(_4074, _3792, _4110);
        _4112 = _4122;
    }
    float _4124 = _4112;
    if (_802)
    {
        float _4126 = fma(_4078, _3748, _4116);
        _4086 = _4126;
    }
    float _4128 = _4086;
    float _4130 = _4128;
    float _4132 = _4128;
    if (_802)
    {
        float _4134 = fma(_4078, _3772, _4120);
        _3386 = _4134;
    }
    float _4136 = _3386;
    float _4138 = _4136;
    float _4140 = _4136;
    if (_802)
    {
        float _4142 = fma(_4078, _3796, _4124);
        _4088 = _4142;
    }
    float _4144 = _4088;
    float _4146 = _4144;
    float _4148 = _4144;
    if (!_802)
    {
        bool _4150 = !_1036;
        if (!_4150)
        {
            uint _4152 = uint(int(uint(_170) >> uint(2)));
            float _4154 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4152)]);
            int _4156 = _170 + 4;
            uint _4158 = uint(int(uint(_4156) >> uint(2)));
            float _4160 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4158)]);
            int _4162 = _170 + 8;
            uint _4164 = uint(int(uint(_4162) >> uint(2)));
            float _4166 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4164)]);
            uint _4168 = uint(int(uint(_170) >> uint(2)));
            float _4170 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4168)]);
            int _4172 = _170 + 4;
            uint _4174 = uint(int(uint(_4172) >> uint(2)));
            float _4176 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4174)]);
            int _4178 = _170 + 8;
            uint _4180 = uint(int(uint(_4178) >> uint(2)));
            float _4182 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4180)]);
            uint _4184 = uint(int(uint(_170) >> uint(2)));
            float _4186 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4184)]);
            int _4188 = _170 + 4;
            uint _4190 = uint(int(uint(_4188) >> uint(2)));
            float _4192 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4190)]);
            int _4194 = _170 + 8;
            uint _4196 = uint(int(uint(_4194) >> uint(2)));
            float _4198 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4196)]);
            float _4200 = _4160 * _4070;
            float _4202 = _4176 * _4070;
            float _4204 = _4192 * _4070;
            float _4206 = fma(_4154, _4074, _4200);
            float _4208 = fma(_4170, _4074, _4202);
            float _4210 = fma(_4186, _4074, _4204);
            float _4212 = fma(_4166, _4078, _4206);
            float _4214 = fma(_4182, _4078, _4208);
            float _4216 = fma(_4198, _4078, _4210);
            _4148 = _4216;
            _4132 = _4212;
            _4140 = _4214;
            _4218 = true;
        }
        else
        {
            if (!_1096)
            {
                _4130 = _4074;
            }
            float _4220 = _4130;
            _4132 = _4220;
            if (!_1096)
            {
                _4138 = _4070;
            }
            float _4222 = _4138;
            _4140 = _4222;
            if (!_1096)
            {
                _4146 = _4078;
            }
            float _4224 = _4146;
            bool _4226 = !_1096;
            _4148 = _4224;
            if (!_4226)
            {
                uint _4228 = uint(int(uint(_170) >> uint(2)));
                float _4230 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4228)]);
                int _4232 = _170 + 4;
                uint _4234 = uint(int(uint(_4232) >> uint(2)));
                float _4236 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4234)]);
                int _4238 = _170 + 8;
                uint _4240 = uint(int(uint(_4238) >> uint(2)));
                float _4242 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_4240)]);
                uint _4244 = uint(int(uint(_170) >> uint(2)));
                float _4246 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4244)]);
                int _4248 = _170 + 4;
                uint _4250 = uint(int(uint(_4248) >> uint(2)));
                float _4252 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4250)]);
                int _4254 = _170 + 8;
                uint _4256 = uint(int(uint(_4254) >> uint(2)));
                float _4258 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4256)]);
                uint _4260 = uint(int(uint(_170) >> uint(2)));
                float _4262 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4260)]);
                int _4264 = _170 + 4;
                uint _4266 = uint(int(uint(_4264) >> uint(2)));
                float _4268 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4266)]);
                int _4270 = _170 + 8;
                uint _4272 = uint(int(uint(_4270) >> uint(2)));
                float _4274 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4272)]);
                float _4276 = _4236 * _4070;
                float _4278 = _4252 * _4070;
                float _4280 = _4268 * _4070;
                float _4282 = fma(_4230, _4074, _4276);
                float _4284 = fma(_4246, _4074, _4278);
                float _4286 = fma(_4262, _4074, _4280);
                float _4288 = fma(_4242, _4078, _4282);
                float _4290 = fma(_4258, _4078, _4284);
                float _4292 = fma(_4274, _4078, _4286);
                _4148 = _4292;
                _4132 = _4288;
                _4140 = _4290;
            }
        }
    }
    _4218 = false;
    float _4294 = _4148;
    float _4296 = _4132;
    float _4298 = _4140;
    int _4300 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 24;
    uint _4302 = uint(int(uint(_4300) >> uint(2)));
    float _4304 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_4302)]);
    int _4306 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 16;
    uint _4308 = uint(int(uint(_4306) >> uint(2)));
    float _4310 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_4308)]);
    int _4312 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 8;
    uint _4314 = uint(int(uint(_4312) >> uint(2)));
    float _4316 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_4314)]);
    uint _4318 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
    float _4320 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[int(_4318)]);
    float _4322 = fma(_3722, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
    float _4324 = fma(_3724, 6.2500002968590706586837768554688e-05, 0.50018751621246337890625);
    float _4326 = fma(_3722, 6.2500002968590706586837768554688e-05, 0.5);
    float _4328 = fma(_3724, 6.2500002968590706586837768554688e-05, 0.5);
    float _4330 = fma(_3724, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
    float _4332 = fma(_3722, 6.2500002968590706586837768554688e-05, 0.4998125135898590087890625);
    float _4334 = fma(_3722, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
    float _4336 = fma(_3724, 6.2500002968590706586837768554688e-05, 0.5000312328338623046875);
    float _4338 = _4304 * _4304;
    float _4340 = fma(_4310, _4310, _4338);
    float _4342 = rsqrt(_4340);
    float _4344 = _4342 * (-20.0);
    float _4346 = fma(_4304, _4344, _4316);
    float _4348 = fma(_4310, _4344, _4320);
    float _4350 = _4346 * 0.5;
    float _4352 = _4348 * 0.5;
    float _4354 = floor(_4352);
    float _4356 = floor(_4350);
    float _4358 = fma(_4354, 2.0, -32.0);
    float _4360 = -_4358;
    float _4362 = _4360 + _3722;
    float _4364 = fma(_4356, 2.0, -32.0);
    float _4366 = -_4364;
    float _4368 = _4366 + _3724;
    float _4370 = _4362 * 0.015625;
    float _4372 = _4368 * 0.015625;
    float2 _14072 = float2(_4370, _4372);
    float2 _4374 = dm_bs(spvDescriptorSet0.cp_t_tcb_26.sample(spvDescriptorSet0.cp_t_tcb_26Smplr, select(_14072, float2(0.0), isnan(_14072)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_26, spvDescriptorSet0.cp_t_tcb_26Smplr_w, select(_14072, float2(0.0), isnan(_14072)), level(0.0)).xy;
    float _4376 = _4374.x;
    float _4378 = _4374.y;
    float2 _14084 = float2(_4322, _4324);
    float _4380 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_14084, float2(0.0), isnan(_14084)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_14084, float2(0.0), isnan(_14084)), level(0.0)).x;
    float2 _14092 = float2(_4326, _4328);
    float2 _4382 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_14092, float2(0.0), isnan(_14092)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_14092, float2(0.0), isnan(_14092)), level(0.0)).xy;
    float _4384 = _4382.x;
    float _4386 = _4382.y;
    float2 _14104 = float2(_4322, _4330);
    float _4388 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_14104, float2(0.0), isnan(_14104)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_14104, float2(0.0), isnan(_14104)), level(0.0)).x;
    float2 _14112 = float2(_4332, _4324);
    float _4390 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_14112, float2(0.0), isnan(_14112)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_14112, float2(0.0), isnan(_14112)), level(0.0)).x;
    float2 _14120 = float2(_4332, _4330);
    float _4392 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_14120, float2(0.0), isnan(_14120)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_14120, float2(0.0), isnan(_14120)), level(0.0)).x;
    float2 _14128 = float2(_4334, _4328);
    float _4394 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_14128, float2(0.0), isnan(_14128)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_14128, float2(0.0), isnan(_14128)), level(0.0)).x;
    float2 _14136 = float2(_4326, _4336);
    float _4396 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_14136, float2(0.0), isnan(_14136)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_14136, float2(0.0), isnan(_14136)), level(0.0)).x;
    float2 _14144 = float2(_4326, _4328);
    float _4398 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_14144, float2(0.0), isnan(_14144)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_14144, float2(0.0), isnan(_14144)), level(0.0)).y;
    float2 _14152 = float2(_4334, _4328);
    float2 _4400 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_14152, float2(0.0), isnan(_14152)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_14152, float2(0.0), isnan(_14152)), level(0.0)).xy;
    float _4402 = _4400.x;
    float _4404 = _4400.y;
    float2 _14164 = float2(_4326, _4336);
    float2 _4406 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_14164, float2(0.0), isnan(_14164)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_14164, float2(0.0), isnan(_14164)), level(0.0)).xy;
    float _4408 = _4406.x;
    float _4410 = _4406.y;
    float _4412 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[73]);
    float _4414 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[72]);
    float _4416 = _934 * 19.23889923095703125;
    float _4418 = _4416 * 0.15915493667125701904296875;
    float _4420 = _4418 * 6.283185482025146484375;
    float _4422 = sin(_4420);
    float _4424 = _928 * 19.23889923095703125;
    float _4426 = fma(_188, 3.1415927410125732421875, -1.57079637050628662109375);
    float _4428 = _4424 * 0.15915493667125701904296875;
    float _4430 = _4426 * 0.15915493667125701904296875;
    float _4432 = _4430 * 6.283185482025146484375;
    float _4434 = sin(_4432);
    float _4436 = _4422 * 34873.41015625;
    float _4438 = _4428 * 6.283185482025146484375;
    float _4440 = sin(_4438);
    float _4442 = _4430 * 6.283185482025146484375;
    float _4444 = cos(_4442);
    float _4446 = floor(_4436);
    float _4448 = 1.0 / _3214;
    float _4450 = _4440 * 34873.41015625;
    float _4452 = floor(_4450);
    float _4454 = -_4446;
    float _4456 = _4454 + _4436;
    float _4458 = _4448 * 59.999996185302734375;
    float _4460 = -_4452;
    float _4462 = _4450 + _4460;
    float _4464 = _4294 * _4458;
    float _4466 = _4378 * 14.99999904632568359375;
    float _4468 = _4376 * 14.99999904632568359375;
    float _4470 = _4466 * _4434;
    float _4472 = _4466 * _4444;
    float _4474 = _4466 * _4466;
    float _4476 = -_4470;
    float _4478 = fma(_4468, _4444, _4476);
    float _4480 = fma(_4468, _4434, _4472);
    float _4482 = _4384 * 2000.0;
    float _4484 = fma(_4468, _4468, _4474);
    float _4486 = _4296 * _4458;
    float _4488 = fma(_4456, 0.800000011920928955078125, 0.20000000298023223876953125);
    float _4490 = -_4386;
    float _4492 = _4384 + _4490;
    float _4494 = _4482 + (-2.0);
    float _4496 = -_4384;
    float _4498 = _4496 + _4394;
    float _4500 = _4492 * 2000.0;
    float _4502 = -_4384;
    float _4504 = _4502 + _4396;
    bool _4506 = _3726 >= _4494;
    bool _4508 = isnan(_3726);
    bool _4510 = _4506 || _4508;
    bool _4512 = isnan(_4494);
    bool _4514 = _4510 || _4512;
    float _4516 = _4498 * 1000.0;
    float _4518 = _4504 * 1000.0;
    float _4520 = abs(_4500);
    bool _4522 = _4520 < 2.0;
    bool _4524 = !_4514;
    bool _4526 = _4522 || _4524;
    float _4528 = fma(_4516, _4516, 0.0625);
    float _4530 = -_4412;
    float _4532 = _4530 + 1.0;
    float _4534 = fma(_4518, _4518, _4528);
    float _4536 = fma(_194, _4412, _4532);
    float _4538 = fma(_4462, _4462, 0.0400000028312206268310546875);
    float _4540 = rsqrt(_4534);
    float _4542 = fma(_4488, _4488, _4538);
    float _4544 = -_4384;
    float _4546 = _4544 + _4380;
    float _4548 = -_4384;
    float _4550 = _4548 + _4388;
    float _4552 = _4298 * _4458;
    float _4554 = -_4384;
    float _4556 = _4554 + _4390;
    float _4558 = _4546 * 2000.0;
    float _4560 = _4550 * 2000.0;
    float _4562 = sqrt(_4542);
    float _4564 = -_4384;
    float _4566 = _4564 + _4392;
    float _4568 = _4556 * 2000.0;
    float _4570 = abs(_4558);
    float _4572 = abs(_4560);
    float _4574 = precise::max(_4570, _4572);
    float _4576 = sqrt(_4484);
    float _4578 = _4566 * 2000.0;
    float _4580 = _4540 * 0.25;
    float _4582 = abs(_4568);
    float _4584 = precise::max(_4574, _4582);
    float _4586 = abs(_4578);
    float _4588 = precise::max(_4584, _4586);
    bool _4590 = _4580 < 0.891006529331207275390625;
    bool _4592 = _4590 || _4526;
    float _4594 = _4562 + 9.9999997473787516355514526367188e-06;
    bool _4596 = _4588 >= 2.0;
    bool _4598 = isnan(_4588);
    bool _4600 = _4596 || _4598;
    bool _4602 = isnan(2.0);
    bool _4604 = _4600 || _4602;
    bool _4606 = _4604 || _4592;
    float _4608 = 1.0 / _4594;
    float _4610 = sqrt(_4576);
    float _4612 = _4386 * 2000.0;
    float _4614 = _4516;
    float _4616 = _4612;
    float _4618 = _4478;
    float _4620 = _4486;
    float _4622 = _4464;
    float _4624 = _4410;
    float _4626 = _4404;
    if (!_4606)
    {
        float _4628 = _4518 * _4540;
        float _4630 = _4516 * _4540;
        float _4632 = _4628 * _4628;
        float _4634 = fma(_4630, _4630, _4632);
        float _4636 = sqrt(_4634);
        bool _4638 = _4636 > 9.9999997473787516355514526367188e-05;
        float _4640 = _4632;
        if (_4638)
        {
            float _4642 = abs(_4630);
            float _4644 = abs(_4628);
            float _4646 = precise::max(_4642, _4644);
            _4614 = _4646;
        }
        float _4648 = _4614;
        float _4650 = 1.0 / _4580;
        if (!_4638)
        {
            _4640 = 0.0;
        }
        float _4652 = _4640;
        float _4654 = _4648;
        float _4656 = _4652;
        if (_4638)
        {
            float _4658 = 1.0 / _4648;
            _4654 = _4658;
        }
        float _4660 = _4654;
        float _4662 = _4636 * _4650;
        if (_4638)
        {
            float _4664 = _4636 * _4660;
            _4656 = _4664;
        }
        float _4666 = _4656;
        float _4668 = _4666 * 0.9649016857147216796875;
        float _4670 = -_4668;
        float _4672 = fma(_4670, _4662, _4482);
        _4616 = _4672;
    }
    float _4674 = _4616;
    float _4676 = -_4674;
    float _4678 = _3726 + _4676;
    float _4680 = _4608 * _4462;
    bool _4682 = _4610 >= 0.5;
    float _4684 = _4608 * 0.20000000298023223876953125;
    float _4686 = abs(_4678);
    float _4688 = _4686 * 0.20000000298023223876953125;
    float _4690 = precise::clamp(_4688, 0.0, 1.0);
    float _4692 = _3494 * _4680;
    bool _4694 = _4610 >= 1.0;
    float _4696 = -_4608;
    float _4698 = _4488 * _4696;
    float _4700 = -_4690;
    float _4702 = _4700 + 1.0;
    float _4704 = fma(_3326, _4684, _4692);
    float _4706 = _4414 * 300.0;
    float _4708 = _3336 * _4680;
    float _4710 = _4702 * _4702;
    float _4712 = _3392 * _4680;
    float _4714 = -_4384;
    float _4716 = _4714 + _4402;
    float _4718 = fma(_3470, _4684, _4708);
    float _4720 = _4710 * _4710;
    float _4722 = _4414 * 500.0;
    float _4724 = fma(_3416, _4698, _4704);
    float _4726 = fma(_3350, _4684, _4712);
    float _4728 = _4536 * _4720;
    float _4730 = fma(_3352, _4698, _4718);
    float _4732 = _3468 * 0.100000001490116119384765625;
    float _4734 = -_4384;
    float _4736 = _4734 + _4408;
    float _4738 = _4704;
    float _4740 = _4722;
    if (_4682)
    {
        float _4742 = _4706 * _4728;
        _4738 = _4742;
    }
    float _4744 = _4738;
    float _4746 = fma(_3468, _4698, _4726);
    float _4748 = _4744;
    if (_4694)
    {
        float _4750 = _4722 * _4728;
        _4740 = _4750;
    }
    float _4752 = _4740;
    float _4754 = _3416 * 0.100000001490116119384765625;
    float _4756 = _4752;
    if (_4682)
    {
        float _4758 = _4478 * _4744;
        _4618 = _4758;
    }
    float _4760 = _4618;
    if (_4682)
    {
        float _4762 = _4480 * _4744;
        _4748 = _4762;
    }
    float _4764 = _4748;
    float _4766 = _4552;
    if (_4694)
    {
        float _4768 = _4610 * _4752;
        _4756 = _4768;
    }
    float _4770 = _4756;
    if (_4682)
    {
        float _4772 = fma(_3214, _4760, _4486);
        _4620 = _4772;
    }
    float _4774 = _4620;
    float _4776 = _4774;
    if (_4682)
    {
        float _4778 = fma(_3214, _4764, _4464);
        _4622 = _4778;
    }
    float _4780 = _4622;
    float _4782 = fma(_3350, 0.20000000298023223876953125, _4732);
    float _4784 = fma(_3326, 0.20000000298023223876953125, _4754);
    float _4786 = _3352 * 0.100000001490116119384765625;
    if (_4694)
    {
        float _4788 = fma(_3214, _4770, _4552);
        _4766 = _4788;
    }
    float _4790 = _4766;
    float _4792 = _3350 * (-0.20000000298023223876953125);
    float _4794 = _4784 * _3206;
    float _4796 = fma(_3470, 0.20000000298023223876953125, _4786);
    float _4798 = _4782 * _3208;
    float _4800 = _3326 * (-0.20000000298023223876953125);
    float _4802 = -_4794;
    float _4804 = fma(_4782, _3210, _4802);
    float _4806 = _3470 * (-0.20000000298023223876953125);
    float _4808 = _4792 * _3208;
    float _4810 = -_4798;
    float _4812 = fma(_4796, _3206, _4810);
    float _4814 = -_4790;
    float _4816 = _4062 + _4814;
    float _4818 = _4800 * _3206;
    float _4820 = -_4808;
    float _4822 = fma(_4806, _3206, _4820);
    float _4824 = _4796 * _3210;
    float _4826 = -_4774;
    float _4828 = _4064 + _4826;
    float _4830 = _4816 + _4812;
    float _4832 = -_4818;
    float _4834 = fma(_4792, _3210, _4832);
    float _4836 = _4806 * _3210;
    float _4838 = _4816 + _4822;
    float _4840 = -_4824;
    float _4842 = fma(_4784, _3208, _4840);
    float _4844 = -_4780;
    float _4846 = _4066 + _4844;
    float _4848 = _4828 + _4804;
    float _4850 = _4830 * _4830;
    float _4852 = _4828 + _4834;
    float _4854 = -_4836;
    float _4856 = fma(_4800, _3208, _4854);
    float _4858 = _4838 * _4838;
    float _4860 = _4846 + _4842;
    float _4862 = fma(_4848, _4848, _4850);
    float _4864 = _4846 + _4856;
    float _4866 = fma(_4852, _4852, _4858);
    float _4868 = -_4386;
    float _4870 = _4384 + _4868;
    float _4872 = fma(_4860, _4860, _4862);
    float _4874 = _4482 + (-2.0);
    float _4876 = fma(_4864, _4864, _4866);
    float _4878 = _4870 * 2000.0;
    float _4880 = rsqrt(_4872);
    float _4882 = _3468 * 0.980571091175079345703125;
    bool _4884 = _3726 >= _4874;
    bool _4886 = isnan(_3726);
    bool _4888 = _4884 || _4886;
    bool _4890 = isnan(_4874);
    bool _4892 = _4888 || _4890;
    float _4894 = fma(_3392, 0.19611422717571258544921875, _4882);
    float _4896 = abs(_4878);
    bool _4898 = _4896 < 2.0;
    bool _4900 = !_4892;
    bool _4902 = _4898 || _4900;
    float _4904 = _3416 * 0.980571091175079345703125;
    float _4906 = sqrt(_4876);
    float _4908 = fma(_3494, 0.19611422717571258544921875, _4904);
    float _4910 = sqrt(_4872);
    float _4912 = _4830 * _4880;
    float _4914 = _4848 * _4880;
    float _4916 = _4860 * _4880;
    float _4918 = _4736 * 1000.0;
    float _4920 = rsqrt(_4876);
    bool _4922 = _4906 != 0.0;
    bool _4924 = isnan(_4906);
    bool _4926 = _4922 || _4924;
    bool _4928 = isnan(0.0);
    bool _4930 = _4926 || _4928;
    float _4932 = _4716 * 1000.0;
    float _4934 = fma(_4932, _4932, 0.0625);
    bool _4936 = _4910 != 0.0;
    bool _4938 = isnan(_4910);
    bool _4940 = _4936 || _4938;
    bool _4942 = isnan(0.0);
    bool _4944 = _4940 || _4942;
    float _4946 = _3352 * 0.980571091175079345703125;
    float _4948 = fma(_4918, _4918, _4934);
    float _4950 = _4944 ? _4912 : 0.0;
    float _4952 = fma(_3336, 0.19611422717571258544921875, _4946);
    float _4954 = _4944 ? _4914 : 0.0;
    float _4956 = _4838 * _4920;
    float _4958 = rsqrt(_4948);
    float _4960 = _4852 * _4920;
    float _4962 = _4950 * _4908;
    float _4964 = _4864 * _4920;
    float _4966 = _4930 ? _4956 : 0.0;
    float _4968 = fma(_4954, _4952, _4962);
    float _4970 = _4930 ? _4960 : 0.0;
    float _4972 = _4944 ? _4916 : 0.0;
    float _4974 = _4966 * _4724;
    float _4976 = _4930 ? _4964 : 0.0;
    float _4978 = fma(_4970, _4730, _4974);
    float _4980 = fma(_4972, _4894, _4968);
    float _4982 = _1584 * 0.300000011920928955078125;
    float _4984 = fma(_4976, _4746, _4978);
    float _4986 = _4872 * _4980;
    float _4988 = _4958 * 0.25;
    float _4990 = _4876 * _4984;
    float _4992 = _4894 * _4986;
    float _4994 = _4952 * _4986;
    float _4996 = _4908 * _4986;
    bool _4998 = _4988 < 0.891006529331207275390625;
    bool _5000 = _4998 || _4902;
    float _5002 = _4724 * _4990;
    float _5004 = -_4992;
    float _5006 = _4796 * _5004;
    float _5008 = -_4996;
    float _5010 = _4782 * _5008;
    bool _5012 = _4588 >= 2.0;
    bool _5014 = isnan(_4588);
    bool _5016 = _5012 || _5014;
    bool _5018 = isnan(2.0);
    bool _5020 = _5016 || _5018;
    bool _5022 = _5020 || _5000;
    float _5024 = _4730 * _4990;
    float _5026 = _4746 * _4990;
    float _5028 = -_5002;
    float _5030 = _4792 * _5028;
    float _5032 = -_4994;
    float _5034 = -_5006;
    float _5036 = fma(_4782, _5032, _5034);
    float _5038 = -_4992;
    float _5040 = -_5010;
    float _5042 = fma(_4784, _5038, _5040);
    float _5044 = -_4992;
    float _5046 = -_5026;
    float _5048 = _5044 + _5046;
    float _5050 = -_5026;
    float _5052 = -_5030;
    float _5054 = fma(_4800, _5050, _5052);
    float _5056 = -_5026;
    float _5058 = _4806 * _5056;
    float _5060 = -_4994;
    float _5062 = _4784 * _5060;
    float _5064 = -_5024;
    float _5066 = _4800 * _5064;
    float _5068 = _5042 + _5054;
    float _5070 = -_5024;
    float _5072 = -_5058;
    float _5074 = fma(_4792, _5070, _5072);
    float _5076 = -_4996;
    float _5078 = -_5062;
    float _5080 = fma(_4796, _5076, _5078);
    float _5082 = -_5002;
    float _5084 = -_5066;
    float _5086 = fma(_4806, _5082, _5084);
    float _5088 = _4932 * _4958;
    float _5090 = -_4994;
    float _5092 = -_5024;
    float _5094 = _5090 + _5092;
    float _5096 = -_4996;
    float _5098 = -_5002;
    float _5100 = _5096 + _5098;
    float _5102 = _5036 + _5074;
    float _5104 = _5080 + _5086;
    float _5106 = _4918 * _4958;
    float _5108 = _1584 * 0.5;
    bool _5110 = !_5022;
    float _5112 = _4988;
    float _5114 = _4790;
    float _5116 = _5094;
    float _5118 = _5048;
    float _5150;
    float _5152;
    float _5154;
    if (!_5110)
    {
        float _5120 = -_4386;
        float _5122 = _5120 + _4404;
        float _5124 = -_4386;
        float _5126 = _5124 + _4410;
        float _5128 = _4386 * 2000.0;
        float _5130 = _5122 * 1000.0;
        float _5132 = _5126 * 1000.0;
        float _5134 = fma(_5130, _5130, 0.0625);
        float _5136 = fma(_5132, _5132, _5134);
        float _5138 = rsqrt(_5136);
        float _5140 = -_5130;
        float _5142 = fma(_5140, _5138, -0.0);
        float _5144 = -_5132;
        float _5146 = fma(_5144, _5138, -0.0);
        float _5148 = _5138 * 0.25;
        _5150 = _5128;
        _5112 = _5148;
        _5152 = _5142;
        _5154 = _5146;
        _5156 = true;
    }
    else
    {
        float _5158 = _5106 * _5106;
        float _5160 = 1.0 / _4988;
        float _5162 = fma(_5088, _5088, _5158);
        float _5164 = sqrt(_5162);
        bool _5166 = _5164 > 9.9999997473787516355514526367188e-05;
        float _5168 = _5164 * _5160;
        float _5170 = _5158;
        _4626 = _5168;
        if (_5166)
        {
            float _5172 = abs(_5088);
            float _5174 = abs(_5106);
            float _5176 = precise::max(_5172, _5174);
            _4624 = _5176;
        }
        float _5178 = _4624;
        float _5180 = -_5088;
        float _5182 = (-0.0) + _5180;
        _5152 = _5182;
        if (!_5166)
        {
            _5170 = 0.0;
        }
        float _5184 = _5170;
        float _5186 = _5178;
        float _5188 = _5184;
        if (_5166)
        {
            float _5190 = 1.0 / _5178;
            _5186 = _5190;
        }
        float _5192 = _5186;
        if (_5166)
        {
            float _5194 = _5164 * _5192;
            _5188 = _5194;
        }
        float _5196 = _5188;
        float _5198 = -_5106;
        float _5200 = (-0.0) + _5198;
        float _5202 = _5196 * 0.9649016857147216796875;
        float _5204 = -_5202;
        float _5206 = fma(_5204, _5168, _4482);
        _5150 = _5206;
        _5154 = _5200;
    }
    _5156 = false;
    float _5208 = _5150;
    float _5210 = _5112;
    float _5212 = _5152;
    float _5214 = _5154;
    float _5216 = _4626;
    float _5218 = -_3726;
    float _5220 = _5218 + _5208;
    bool _5222 = _5208 >= _3726;
    bool _5224 = isnan(_5208);
    bool _5226 = _5222 || _5224;
    bool _5228 = isnan(_3726);
    bool _5230 = _5226 || _5228;
    float _5232 = -_5208;
    float _5234 = fma(_4398, 2000.0, _5232);
    bool _5236 = _5208 > _3726;
    float _5238 = _5220 * _5220;
    float _5240 = precise::max(_798, 0.001000000047497451305389404296875);
    bool _5242 = !_5236;
    float _5244 = _5242 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _5246 = _3212 >= 0.5;
    float _5248 = sqrt(_5238);
    int _5250 = ~as_type<int>(_5244);
    int _5252 = _5250 + 1;
    int _5254 = _5252 + 1;
    float _5256 = abs(_5234);
    bool _5258 = _5256 >= 2.0;
    bool _5260 = isnan(_5256);
    bool _5262 = _5258 || _5260;
    bool _5264 = isnan(2.0);
    bool _5266 = _5262 || _5264;
    int _5268 = _5254;
    float _5270 = _5216;
    float _5272 = _5244;
    float _5274 = _5212;
    if (_5230)
    {
        int _5276 = ~as_type<int>(_5244);
        int _5278 = _5276 + 1;
        _5268 = _5278;
    }
    int _5280 = _5268;
    bool _5282 = _5210 >= 0.891006529331207275390625;
    bool _5284 = _5282 && _5266;
    float _5286 = float(_5280);
    float _5288 = precise::min(_5240, 10000.0);
    float _5290 = _5248 * _5286;
    bool _5292 = !_5246;
    float _5294 = _5248;
    float _5296 = _5290;
    float _5298 = _5286;
    float _5392;
    float _5394;
    float _5628;
    float _5630;
    float _5632;
    float _5634;
    float _5636;
    float _5638;
    float _5640;
    float _5676;
    float _5678;
    float _5680;
    if (!_5292)
    {
        bool _5300 = _3466 > _3316;
        bool _5302 = _3466 >= _3316;
        bool _5304 = isnan(_3466);
        bool _5306 = _5302 || _5304;
        bool _5308 = isnan(_3316);
        bool _5310 = _5306 || _5308;
        int _5312 = _5310 ? 0 : 1;
        int _5314 = ~_5312;
        int _5316 = _5314 + 1;
        int _5318 = _5316 + 1;
        int _5320 = _5318;
        int _5322 = _5310 ? (-1) : 0;
        if (!_5300)
        {
            int _5324 = ~_5312;
            int _5326 = _5324 + 1;
            _5320 = _5326;
        }
        int _5328 = _5320;
        bool _5330 = _3212 != 1.0;
        bool _5332 = isnan(_3212);
        bool _5334 = _5330 || _5332;
        bool _5336 = isnan(1.0);
        bool _5338 = _5334 || _5336;
        float _5340 = float(_5328);
        float _5342 = _3494 * _5340;
        float _5344 = _3336 * _5340;
        float _5346 = _3392 * _5340;
        float _5348 = _4062 * _5210;
        float _5350 = _5342 * _5210;
        float _5352 = fma(_4064, _5212, _5348);
        float _5354 = fma(_5344, _5212, _5350);
        float _5356 = fma(_4066, _5214, _5352);
        float _5358 = fma(_5346, _5214, _5354);
        float _5360 = abs(_5358);
        float _5362 = -_5360;
        float _5364 = _5362 + 1.0;
        bool _5366 = _5356 <= 0.0;
        float _5368 = float(_5366);
        float _5370 = abs(_5364);
        float _5372 = log2(_5370);
        float _5374 = _5356 * _5368;
        float _5376 = -_5374;
        float _5378 = fma(_5212, _5376, _4064);
        float _5380 = -_5374;
        float _5382 = fma(_5210, _5380, _4062);
        float _5384 = -_5374;
        float _5386 = fma(_5214, _5384, _4066);
        float _5388 = _5372 * 0.20000000298023223876953125;
        float _5390 = exp2(_5388);
        _5392 = _5378;
        _5394 = _5382;
        int _5440;
        float _5502;
        int _5504;
        float _5506;
        float _5508;
        if (!_5338)
        {
            float _5396 = _5382 * _5382;
            float _5398 = _3208 * 0.89999997615814208984375;
            float _5400 = _3210 * 0.89999997615814208984375;
            float _5402 = _3206 * 0.89999997615814208984375;
            float _5404 = fma(_5378, _5378, _5396);
            float _5406 = fma(_5386, _5386, _5404);
            float _5408 = sqrt(_5406);
            bool _5410 = _5408 > 0.5;
            bool _5412 = !_5410;
            if (!_5412)
            {
                bool _5414 = _5358 > 0.0;
                bool _5416 = _5358 >= 0.0;
                bool _5418 = isnan(_5358);
                bool _5420 = _5416 || _5418;
                bool _5422 = isnan(0.0);
                bool _5424 = _5420 || _5422;
                float _5426 = precise::max(_910, 0.100000001490116119384765625);
                int _5428 = _5424 ? 0 : 1;
                float _5430 = precise::max(_902, 0.100000001490116119384765625);
                int _5432 = ~_5428;
                int _5434 = _5432 + 1;
                int _5436 = _5434 + 1;
                int _5438 = _5436;
                _5322 = _5424 ? (-1) : 0;
                _5440 = _5414 ? (-1) : 0;
                if (!_5414)
                {
                    int _5442 = ~_5428;
                    int _5444 = _5442 + 1;
                    _5438 = _5444;
                }
                int _5446 = _5438;
                float _5448 = float(_5446);
                float _5450 = _5344 * _5448;
                float _5452 = _5346 * _5448;
                float _5454 = _5342 * _5448;
                float _5456 = _5386 * _5450;
                float _5458 = _5382 * _5452;
                float _5460 = -_5456;
                float _5462 = fma(_5378, _5452, _5460);
                float _5464 = _5378 * _5454;
                float _5466 = -_5458;
                float _5468 = fma(_5386, _5454, _5466);
                float _5470 = _5462 * _5462;
                float _5472 = -_5464;
                float _5474 = fma(_5382, _5450, _5472);
                float _5476 = fma(_5468, _5468, _5470);
                float _5478 = fma(_5474, _5474, _5476);
                float _5480 = _5426 + _5430;
                float _5482 = 1.0 / _5480;
                float _5484 = sqrt(_5478);
                float _5486 = _5482 * 0.4000000059604644775390625;
                float _5488 = _5408 * _5486;
                float _5490 = _5484 + 9.9999997473787516355514526367188e-06;
                float _5492 = 1.0 / _5490;
                float _5494 = _5488 * _5492;
                float _5496 = fma(_5468, _5494, _5398);
                float _5498 = fma(_5462, _5494, _5400);
                float _5500 = fma(_5474, _5494, _5402);
                _5502 = _5500;
                _5504 = 1065353216;
                _5506 = _5498;
                _5508 = _5496;
                _5510 = true;
            }
            else
            {
                bool _5512 = _5390 > 0.5;
                bool _5514 = _5290 > (-0.800000011920928955078125);
                bool _5516 = _5514 && _5512;
                bool _5518 = !_5516;
                int _5520 = _5518 ? 1065353216 : 1056964608;
                _5502 = _5402;
                _5440 = _5516 ? (-1) : 0;
                _5504 = _5520;
                _5506 = _5400;
                _5508 = _5398;
                _5510 = true;
            }
        }
        else
        {
            bool _5522 = _5358 > 0.0;
            float _5524 = _5390 * 10.0;
            bool _5526 = _5358 >= 0.0;
            bool _5528 = isnan(_5358);
            bool _5530 = _5526 || _5528;
            bool _5532 = isnan(0.0);
            bool _5534 = _5530 || _5532;
            int _5536 = _5534 ? 0 : 1;
            int _5538 = ~_5536;
            int _5540 = _5538 + 1;
            int _5542 = _5540 + 1;
            int _5544 = _5542;
            _5322 = _5534 ? (-1) : 0;
            if (!_5522)
            {
                int _5546 = ~_5536;
                int _5548 = _5546 + 1;
                _5544 = _5548;
            }
            int _5550 = _5544;
            bool _5552 = _5390 >= 0.300000011920928955078125;
            bool _5554 = isnan(_5390);
            bool _5556 = _5552 || _5554;
            bool _5558 = isnan(0.300000011920928955078125);
            bool _5560 = _5556 || _5558;
            float _5562 = float(_5550);
            int _5564 = _5560 ? as_type<int>(_3212) : 1065353216;
            float _5566 = _5346 * _5562;
            float _5568 = _5344 * _5562;
            float _5570 = _5342 * _5562;
            float _5572 = _5566 * _5210;
            float _5574 = _5568 * _5214;
            float _5576 = _5570 * _5212;
            float _5578 = -_5572;
            float _5580 = fma(_5570, _5214, _5578);
            float _5582 = -_5574;
            float _5584 = fma(_5566, _5212, _5582);
            float _5586 = -_5576;
            float _5588 = fma(_5568, _5210, _5586);
            float _5590 = _5524 * _5580;
            float _5592 = _5524 * _5584;
            float _5594 = _5524 * _5588;
            _5502 = _5594;
            _5440 = _5560 ? (-1) : 0;
            _5504 = _5564;
            _5506 = _5592;
            _5508 = _5590;
        }
        _5510 = false;
        int _5596 = _5322;
        float _5598 = _5502;
        int _5600 = _5440;
        int _5602 = _5504;
        float _5604 = _5506;
        float _5606 = _5508;
        bool _5608 = _5220 >= (-0.20000000298023223876953125);
        bool _5610 = isnan(_5220);
        bool _5612 = _5608 || _5610;
        bool _5614 = isnan(-0.20000000298023223876953125);
        bool _5616 = _5612 || _5614;
        float _5618 = _4774 * 0.20000000298023223876953125;
        float _5620 = _4790 * 0.20000000298023223876953125;
        float _5622 = _4780 * 0.20000000298023223876953125;
        int _5624 = _5596;
        int _5626 = _5600;
        _5628 = _5620;
        _5116 = _5618;
        _5118 = _5622;
        _5630 = 0.0;
        _5632 = 0.0;
        _5634 = 0.0;
        _5636 = _5386;
        _5638 = _5604;
        _5640 = _5606;
        if (_5616)
        {
            bool _5642 = _5290 > 2.0;
            _5624 = _5642 ? (-1) : 0;
        }
        int _5644 = _5624;
        if (!_5616)
        {
            _5626 = -1;
        }
        int _5646 = _5626;
        int _5648 = _5646;
        if (_5616)
        {
            bool _5650 = _5220 >= (-0.20000000298023223876953125);
            int _5652 = (_5650 ? (-1) : 0) & _5644;
            _5648 = _5652;
        }
        int _5654 = _5648;
        int _5656 = ~_5654;
        bool _5658 = !_5284;
        int _5660 = _5656 & (_5658 ? (-1) : 0);
        bool _5662 = !_5284;
        int _5664 = _5654 & (_5662 ? (-1) : 0);
        int _5666 = _5660 | _5664;
        int _5668 = _5654 & (_5284 ? (-1) : 0);
        int _5670 = _5666 | _5668;
        int _5672 = ~_5670;
        float _5674 = (_5672 != 0) ? as_type<float>(_5602) : 0.0;
        _5676 = _5674;
        _5678 = 0.0;
        _5680 = _5598;
        _5682 = true;
    }
    else
    {
        bool _5684 = _5290 < 0.0;
        bool _5686 = _5684 && _5284;
        bool _5688 = _5290 > (-0.800000011920928955078125);
        bool _5690 = _5688 && _5686;
        if (_5690)
        {
            float _5692 = _4062 * _5210;
            _1140 = _5692;
        }
        float _5694 = _1140;
        float _5696 = _5694;
        if (!_5690)
        {
            _5294 = 0.0;
        }
        float _5698 = _5294;
        float _5700 = _5698;
        if (!_5690)
        {
            _5114 = _5100;
        }
        float _5702 = _5114;
        float _5704 = _5702;
        if (_5690)
        {
            float _5706 = fma(_4064, _5212, _5694);
            _5696 = _5706;
        }
        float _5708 = _5696;
        float _5710 = _5708;
        if (!_5690)
        {
            _5270 = _5068;
        }
        float _5712 = _5270;
        float _5714 = _5712;
        if (!_5690)
        {
            _4776 = _5102;
        }
        float _5716 = _4776;
        float _5718 = _5716;
        if (_5690)
        {
            float _5720 = fma(_4066, _5214, _5708);
            _5710 = _5720;
        }
        float _5722 = _5710;
        float _5724 = _5722;
        if (!_5690)
        {
            _5272 = _5104;
        }
        float _5726 = _5272;
        float _5728 = _5726;
        if (!_5690)
        {
            _1142 = _3208;
        }
        float _5730 = _1142;
        float _5732 = _5730;
        if (_5690)
        {
            float _5734 = -_5212;
            float _5736 = fma(_5734, _5722, _4064);
            _4090 = _5736;
        }
        float _5738 = _4090;
        _5392 = _5738;
        if (_5690)
        {
            float _5740 = -_5210;
            float _5742 = fma(_5740, _5722, _4062);
            _4092 = _5742;
        }
        float _5744 = _4092;
        _5394 = _5744;
        if (_5690)
        {
            float _5746 = -_5214;
            float _5748 = fma(_5746, _5722, _4066);
            _4094 = _5748;
        }
        float _5750 = _4094;
        _5636 = _5750;
        if (!_5690)
        {
            _5724 = _3210;
        }
        float _5752 = _5724;
        float _5754 = _5752;
        if (!_5690)
        {
            _5296 = _3206;
        }
        float _5756 = _5296;
        float _5758 = _5756;
        if (!_5690)
        {
            _5298 = _3212;
        }
        float _5760 = _5298;
        _5676 = _5760;
        if (_5690)
        {
            _5700 = _5220;
        }
        float _5762 = _5700;
        _5678 = _5762;
        if (_5690)
        {
            _5704 = _5100;
        }
        float _5764 = _5704;
        _5628 = _5764;
        if (_5690)
        {
            _5714 = _5068;
        }
        float _5766 = _5714;
        _5630 = _5766;
        if (_5690)
        {
            _5718 = _5102;
        }
        float _5768 = _5718;
        _5632 = _5768;
        if (_5690)
        {
            _5728 = _5104;
        }
        float _5770 = _5728;
        _5634 = _5770;
        if (_5690)
        {
            _5732 = _3208;
        }
        float _5772 = _5732;
        _5640 = _5772;
        if (_5690)
        {
            _5754 = _3210;
        }
        float _5774 = _5754;
        _5638 = _5774;
        if (_5690)
        {
            _5758 = _3206;
        }
        float _5776 = _5758;
        _5680 = _5776;
        if (_5690)
        {
            _5676 = 0.5;
        }
    }
    _5682 = false;
    float _5778 = _5676;
    float _5780 = _5628;
    float _5782 = _5116;
    float _5784 = _5118;
    float _5786 = _5392;
    float _5788 = _5394;
    float _5790 = _5630;
    float _5792 = _5632;
    float _5794 = _5634;
    float _5796 = _5636;
    float _5798 = _5678;
    float _5800 = _5638;
    float _5802 = _5640;
    float _5804 = _5680;
    float _5806 = 1.0 / _5288;
    bool _5808 = _5778 >= 0.5;
    float _5810 = _5806 * _5780;
    float _5812 = _5806 * _5782;
    float _5814 = _5806 * _5784;
    float _5816 = _1584 * _1584;
    float _5818 = _5810 * _5810;
    float _5820 = _4982 * _4982;
    float _5822 = fma(_5812, _5812, _5818);
    float _5824 = fma(_5108, _5108, _5820);
    float _5826 = fma(_5814, _5814, _5822);
    float _5828 = fma(_5108, _5108, _5816);
    float _5830 = fma(_4982, _4982, _5816);
    float _5832 = _5824 * 0.083333335816860198974609375;
    float _5834 = sqrt(_5826);
    float _5836 = _5828 * 0.083333335816860198974609375;
    float _5838 = _5830 * 0.083333335816860198974609375;
    float _5840 = _3494 * _5836;
    float _5842 = _3392 * _5836;
    float _5844 = _3470 * _5838;
    float _5846 = _3336 * _5840;
    float _5848 = _3494 * _5840;
    float _5850 = _3494 * _5842;
    float _5852 = _3392 * _5842;
    bool _5854 = _5834 > 80.0;
    float _5856 = _3336 * _5836;
    float _5858 = _3326 * _5838;
    float _5860 = _3350 * _5838;
    float _5862 = _3336 * _5856;
    float _5864 = _3336 * _5842;
    float _5866 = _3494 * _5856;
    float _5868 = _3392 * _5840;
    float _5870 = fma(_3326, _5858, _5848);
    float _5872 = fma(_3470, _5860, _5864);
    float _5874 = fma(_3326, _5844, _5866);
    float _5876 = fma(_3326, _5860, _5850);
    float _5878 = _3392 * _5856;
    float _5880 = _3326;
    float _5882 = _5860;
    float _5884 = _5872;
    float _5886 = _5788;
    float _5888 = _5786;
    if (_5854)
    {
        float _5890 = rsqrt(_5826);
        _5880 = _5890;
    }
    float _5892 = _5880;
    float _5894 = fma(_3470, _5858, _5846);
    float _5896 = _3352 * _5832;
    float _5898 = _3416 * _5832;
    float _5900 = fma(_3350, _5844, _5878);
    float _5902 = fma(_3350, _5860, _5852);
    float _5904 = _3468 * _5832;
    float _5906 = fma(_3350, _5858, _5868);
    float _5908 = fma(_3416, _5896, _5874);
    float _5910 = fma(_3468, _5896, _5900);
    float _5912 = fma(_3416, _5904, _5876);
    float _5914 = fma(_3468, _5904, _5902);
    float _5916 = fma(_3470, _5844, _5862);
    float _5918 = fma(_3468, _5898, _5906);
    float _5920 = _5912 * _5910;
    float _5922 = _5908 * _5914;
    float _5924 = fma(_3352, _5896, _5916);
    float _5926 = fma(_3352, _5904, _5872);
    float _5928 = _5892;
    float _5930 = _5894;
    float _5932 = _5908;
    float _5934 = _5924;
    float _5936 = _5910;
    if (_5854)
    {
        float _5938 = _5892 * 80.0;
        _5928 = _5938;
    }
    float _5940 = _5928;
    float _5942 = fma(_3352, _5898, _5894);
    float _5944 = fma(_3416, _5898, _5870);
    float _5946 = _5912 * _5918;
    float _5948 = -_5920;
    float _5950 = _5922 + _5948;
    if (!_5854)
    {
        _5882 = _5812;
    }
    float _5952 = _5882;
    float _5954 = _5952;
    if (_5854)
    {
        float _5956 = _5812 * _5940;
        _5954 = _5956;
    }
    float _5958 = _5954;
    if (!_5854)
    {
        _5884 = _5810;
    }
    float _5960 = _5884;
    float _5962 = _5960;
    if (_5854)
    {
        float _5964 = _5810 * _5940;
        _5962 = _5964;
    }
    float _5966 = _5962;
    if (!_5854)
    {
        _5930 = _5814;
    }
    float _5968 = _5930;
    float _5970 = _5968;
    if (_5854)
    {
        float _5972 = _5814 * _5940;
        _5970 = _5972;
    }
    float _5974 = _5970;
    float _5976 = _5944 * _5910;
    float _5978 = -_5946;
    float _5980 = fma(_5944, _5914, _5978);
    float _5982 = _5942 * _5950;
    float _5984 = _5908 * _3210;
    float _5986 = -_5976;
    float _5988 = fma(_5908, _5918, _5986);
    float _5990 = _5912 * _3210;
    float _5992 = -_5982;
    float _5994 = fma(_5924, _5980, _5992);
    float _5996 = _5944 * _3210;
    float _5998 = fma(_5924, _3208, _5984);
    float _6000 = fma(_5926, _3208, _5990);
    float _6002 = fma(_5926, _5988, _5994);
    float _6004 = fma(_5942, _3208, _5996);
    float _6006 = fma(_5910, _3206, _5998);
    float _6008 = fma(_5914, _3206, _6000);
    float _6010 = _3214 * 0.01666666753590106964111328125;
    bool _6012 = _6002 != 0.0;
    bool _6014 = isnan(_6002);
    bool _6016 = _6012 || _6014;
    bool _6018 = isnan(0.0);
    bool _6020 = _6016 || _6018;
    float _6022 = fma(_5918, _3206, _6004);
    float _6024 = _6008 * _3210;
    float _6026 = _6006 * _3206;
    float _6028 = fma(_6010, _5958, _5786);
    float _6030 = _6022 * _3208;
    float _6032 = -_6024;
    float _6034 = fma(_6022, _3206, _6032);
    float _6036 = -_6026;
    float _6038 = fma(_6008, _3208, _6036);
    float _6040 = fma(_6010, _5966, _5788);
    float _6042 = -_6030;
    float _6044 = fma(_6006, _3210, _6042);
    float _6046 = _6034 + _5790;
    float _6048 = _6038 + _5792;
    float _6050 = _6006;
    float _6052 = _6026;
    float _6054 = _6040;
    float _6056 = _6028;
    if (!_6020)
    {
        _5886 = _5918;
    }
    float _6058 = _5886;
    float _6060 = _6058;
    if (!_6020)
    {
        _5888 = _5914;
    }
    float _6062 = _5888;
    float _6064 = _6062;
    if (!_6020)
    {
        _6050 = _5944;
    }
    float _6066 = _6050;
    float _6068 = _6066;
    if (!_6020)
    {
        _3234 = _5912;
    }
    float _6070 = _3234;
    float _6072 = _6070;
    if (!_6020)
    {
        _3236 = _5942;
    }
    float _6074 = _3236;
    float _6076 = _6074;
    if (!_6020)
    {
        _3238 = _5926;
    }
    float _6078 = _3238;
    bool _6080 = !_6020;
    float _6082 = _6078;
    if (!_6080)
    {
        float _6084 = 1.0 / _6002;
        float _6086 = _5924 * _5912;
        float _6088 = _5942 * _5914;
        float _6090 = _5926 * _5944;
        float _6092 = _5926 * _5910;
        float _6094 = -_6086;
        float _6096 = fma(_5926, _5908, _6094);
        float _6098 = _5924 * _5918;
        float _6100 = _5942 * _5908;
        float _6102 = -_5922;
        float _6104 = _6102 + _5920;
        float _6106 = -_6088;
        float _6108 = fma(_5926, _5918, _6106);
        float _6110 = -_6090;
        float _6112 = fma(_5942, _5912, _6110);
        float _6114 = -_6092;
        float _6116 = fma(_5924, _5914, _6114);
        float _6118 = -_6098;
        float _6120 = fma(_5942, _5910, _6118);
        float _6122 = -_6100;
        float _6124 = fma(_5924, _5944, _6122);
        float _6126 = _6104 * _6084;
        float _6128 = _6108 * _6084;
        float _6130 = _6112 * _6084;
        float _6132 = _6116 * _6084;
        float _6134 = _5980 * _6084;
        float _6136 = _5988 * _6084;
        float _6138 = _6096 * _6084;
        float _6140 = _6120 * _6084;
        float _6142 = _6124 * _6084;
        _5932 = _6126;
        _6068 = _6132;
        _6072 = _6138;
        _5934 = _6134;
        _6076 = _6128;
        _6082 = _6130;
        _5936 = _6136;
        _6060 = _6140;
        _6064 = _6142;
        _6052 = _6124;
    }
    float _6144 = _5932;
    float _6146 = _6068;
    float _6148 = _6072;
    float _6150 = _5934;
    float _6152 = _6076;
    float _6154 = _6082;
    float _6156 = _5936;
    float _6158 = _6060;
    float _6160 = _6064;
    float _6162 = _6052;
    float _6164 = _6048 * _6144;
    float _6166 = _6048 * _6146;
    float _6168 = _6048 * _6148;
    float _6170 = _6044 + _5794;
    float _6172 = fma(_6046, _6150, _6164);
    float _6174 = fma(_6046, _6152, _6166);
    float _6176 = fma(_6046, _6154, _6168);
    float _6178 = fma(_6170, _6156, _6172);
    float _6180 = fma(_6010, _5974, _5796);
    float _6182 = fma(_6170, _6158, _6174);
    float _6184 = fma(_6170, _6160, _6176);
    float _6186 = _6162;
    float _6188 = _6150;
    float _6190 = _6180;
    float _6192 = _6180;
    float _6194 = _6182;
    float _6196 = _6178;
    float _6198 = _6184;
    if (!_5808)
    {
        _6186 = _6028;
    }
    float _6200 = _6186;
    float _6202 = _6200;
    if (!_5808)
    {
        _6188 = _6040;
    }
    float _6204 = _6188;
    bool _6206 = !_5808;
    float _6208 = _6204;
    if (!_6206)
    {
        float _6210 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
        float _6212 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
        float _6214 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
        float _6216 = _6040 * _6040;
        float _6218 = fma(_6028, _6028, _6216);
        float _6220 = fma(_6180, _6180, _6218);
        float _6222 = sqrt(_6220);
        float _6224 = _6222 + 9.9999997473787516355514526367188e-06;
        float _6226 = 1.0 / _6224;
        float _6228 = _6028 * _6226;
        float _6230 = _6180 * _6226;
        float _6232 = _6212;
        float _6234 = _6210;
        if (_802)
        {
            float _6236 = _6212 * _3746;
            _3808 = _6236;
        }
        float _6238 = _3808;
        float _6240 = _6238;
        if (_802)
        {
            float _6242 = _6212 * _3770;
            _3820 = _6242;
        }
        float _6244 = _3820;
        float _6246 = _6244;
        if (_802)
        {
            float _6248 = _6212 * _3794;
            _3838 = _6248;
        }
        float _6250 = _3838;
        float _6252 = _6040 * _6226;
        float _6254 = _6250;
        if (_802)
        {
            float _6256 = fma(_6210, _3744, _6238);
            _6240 = _6256;
        }
        float _6258 = _6240;
        if (_802)
        {
            float _6260 = fma(_6210, _3768, _6244);
            _6246 = _6260;
        }
        float _6262 = _6246;
        if (_802)
        {
            float _6264 = fma(_6210, _3792, _6250);
            _6254 = _6264;
        }
        float _6266 = _6254;
        if (_802)
        {
            float _6268 = fma(_6214, _3748, _6258);
            _3810 = _6268;
        }
        float _6270 = _3810;
        float _6272 = _6270;
        float _6274 = _6270;
        if (_802)
        {
            float _6276 = fma(_6214, _3772, _6262);
            _3822 = _6276;
        }
        float _6278 = _3822;
        float _6280 = _6278;
        float _6282 = _6278;
        if (_802)
        {
            float _6284 = fma(_6214, _3796, _6266);
            _3840 = _6284;
        }
        float _6286 = _3840;
        float _6288 = _6286;
        float _6290 = _6286;
        if (!_802)
        {
            bool _6292 = !_1036;
            if (!_6292)
            {
                uint _6294 = uint(int(uint(_170) >> uint(2)));
                float _6296 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_6294)]);
                int _6298 = _170 + 4;
                uint _6300 = uint(int(uint(_6298) >> uint(2)));
                float _6302 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_6300)]);
                int _6304 = _170 + 8;
                uint _6306 = uint(int(uint(_6304) >> uint(2)));
                float _6308 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_6306)]);
                uint _6310 = uint(int(uint(_170) >> uint(2)));
                float _6312 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_6310)]);
                int _6314 = _170 + 4;
                uint _6316 = uint(int(uint(_6314) >> uint(2)));
                float _6318 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_6316)]);
                int _6320 = _170 + 8;
                uint _6322 = uint(int(uint(_6320) >> uint(2)));
                float _6324 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_6322)]);
                uint _6326 = uint(int(uint(_170) >> uint(2)));
                float _6328 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6326)]);
                int _6330 = _170 + 4;
                uint _6332 = uint(int(uint(_6330) >> uint(2)));
                float _6334 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6332)]);
                int _6336 = _170 + 8;
                uint _6338 = uint(int(uint(_6336) >> uint(2)));
                float _6340 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6338)]);
                float _6342 = _6302 * _6212;
                float _6344 = _6318 * _6212;
                float _6346 = _6334 * _6212;
                float _6348 = fma(_6296, _6210, _6342);
                float _6350 = fma(_6312, _6210, _6344);
                float _6352 = fma(_6328, _6210, _6346);
                float _6354 = fma(_6308, _6214, _6348);
                float _6356 = fma(_6324, _6214, _6350);
                float _6358 = fma(_6340, _6214, _6352);
                _6282 = _6356;
                _6274 = _6354;
                _6290 = _6358;
                _6360 = true;
            }
            else
            {
                if (!_1096)
                {
                    _6272 = _6210;
                }
                float _6362 = _6272;
                _6274 = _6362;
                if (!_1096)
                {
                    _6280 = _6212;
                }
                float _6364 = _6280;
                _6282 = _6364;
                if (!_1096)
                {
                    _6288 = _6214;
                }
                float _6366 = _6288;
                bool _6368 = !_1096;
                _6290 = _6366;
                if (!_6368)
                {
                    uint _6370 = uint(int(uint(_170) >> uint(2)));
                    float _6372 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_6370)]);
                    int _6374 = _170 + 4;
                    uint _6376 = uint(int(uint(_6374) >> uint(2)));
                    float _6378 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_6376)]);
                    int _6380 = _170 + 8;
                    uint _6382 = uint(int(uint(_6380) >> uint(2)));
                    float _6384 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_6382)]);
                    uint _6386 = uint(int(uint(_170) >> uint(2)));
                    float _6388 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_6386)]);
                    int _6390 = _170 + 4;
                    uint _6392 = uint(int(uint(_6390) >> uint(2)));
                    float _6394 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_6392)]);
                    int _6396 = _170 + 8;
                    uint _6398 = uint(int(uint(_6396) >> uint(2)));
                    float _6400 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_6398)]);
                    uint _6402 = uint(int(uint(_170) >> uint(2)));
                    float _6404 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6402)]);
                    int _6406 = _170 + 4;
                    uint _6408 = uint(int(uint(_6406) >> uint(2)));
                    float _6410 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6408)]);
                    int _6412 = _170 + 8;
                    uint _6414 = uint(int(uint(_6412) >> uint(2)));
                    float _6416 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6414)]);
                    float _6418 = _6378 * _6212;
                    float _6420 = _6394 * _6212;
                    float _6422 = _6410 * _6212;
                    float _6424 = fma(_6372, _6210, _6418);
                    float _6426 = fma(_6388, _6210, _6420);
                    float _6428 = fma(_6404, _6210, _6422);
                    float _6430 = fma(_6384, _6214, _6424);
                    float _6432 = fma(_6400, _6214, _6426);
                    float _6434 = fma(_6416, _6214, _6428);
                    _6282 = _6432;
                    _6274 = _6430;
                    _6290 = _6434;
                }
            }
        }
        _6360 = false;
        float _6436 = _6282;
        float _6438 = _6274;
        float _6440 = _6290;
        float _6442 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
        float _6444 = _6442 * 59.999996185302734375;
        float _6446 = _6436 * _6444;
        float _6448 = _6438 * _6444;
        float _6450 = _3214 * _6446;
        float _6452 = _6440 * _6444;
        float _6454 = _3214 * _6448;
        float _6456 = _6450 * _5210;
        float _6458 = _3214 * _6452;
        float _6460 = fma(_6454, _5212, _6456);
        float _6462 = fma(_6458, _5214, _6460);
        float _6464 = -_5210;
        float _6466 = fma(_6462, _6464, _6450);
        float _6468 = -_5212;
        float _6470 = fma(_6462, _6468, _6454);
        float _6472 = -_5214;
        float _6474 = fma(_6462, _6472, _6458);
        float _6476 = _6466 * _6466;
        float _6478 = fma(_6470, _6470, _6476);
        float _6480 = fma(_6474, _6474, _6478);
        float _6482 = sqrt(_6480);
        float _6484 = _6482 + 9.9999997473787516355514526367188e-06;
        float _6486 = 1.0 / _6484;
        float _6488 = _6466 * _6486;
        float _6490 = _6470 * _6486;
        float _6492 = _6474 * _6486;
        float _6494 = _6040 * _6488;
        float _6496 = fma(_6028, _6490, _6494);
        float _6498 = fma(_6180, _6492, _6496);
        float _6500 = _6498 * 0.5;
        bool _6502 = _6498 >= 0.0;
        float _6504 = float(_6502);
        float _6506 = precise::min(_6482, _6500);
        float _6508 = _6506 * _6504;
        float _6510 = -_6508;
        float _6512 = fma(_6488, _6510, _6040);
        float _6514 = -_6508;
        float _6516 = fma(_6490, _6514, _6028);
        float _6518 = -_6508;
        float _6520 = fma(_6492, _6518, _6180);
        float _6522 = _6512 * _6512;
        float _6524 = fma(_6516, _6516, _6522);
        float _6526 = fma(_6520, _6520, _6524);
        float _6528 = sqrt(_6526);
        bool _6530 = _6528 > 0.5;
        bool _6532 = isnan(_6528);
        bool _6534 = _6530 || _6532;
        bool _6536 = isnan(0.5);
        bool _6538 = _6534 || _6536;
        float _6540 = _6498;
        _6056 = _6528;
        if (!_6538)
        {
            float _6542 = _912 * 20.0;
            _6054 = _6542;
        }
        float _6544 = _6054;
        float _6546 = _6544;
        if (_6538)
        {
            float _6548 = _912 * 10.0;
            _6190 = _6548;
        }
        float _6550 = _6190;
        float _6552 = _6550;
        if (!_6538)
        {
            float _6554 = _3214 * _6544;
            _6546 = _6554;
        }
        float _6556 = _6546;
        float _6558 = _6556;
        if (_6538)
        {
            float _6560 = _3214 * _6550;
            _6552 = _6560;
        }
        float _6562 = _6552;
        float _6564 = _6562;
        if (!_6538)
        {
            float _6566 = _6556 * 0.01666666753590106964111328125;
            _6558 = _6566;
        }
        float _6568 = _6558;
        if (_6538)
        {
            float _6570 = _6562 * 0.01666666753590106964111328125;
            _6564 = _6570;
        }
        float _6572 = _6564;
        float _6574 = _6572;
        if (!_6538)
        {
            float _6576 = precise::min(_6528, _6568);
            _1144 = _6576;
        }
        float _6578 = _1144;
        _1146 = _6578;
        if (_6538)
        {
            float _6580 = precise::min(_6528, _6572);
            _6540 = _6580;
        }
        float _6582 = _6540;
        _5274 = _6582;
        if (!_6538)
        {
            float _6584 = -_6228;
            float _6586 = fma(_6584, _6578, _6516);
            _6232 = _6586;
        }
        float _6588 = _6232;
        float _6590 = _6588;
        if (!_6538)
        {
            float _6592 = -_6252;
            float _6594 = fma(_6592, _6578, _6512);
            _6234 = _6594;
        }
        float _6596 = _6234;
        float _6598 = _6596;
        if (!_6538)
        {
            float _6600 = -_6230;
            float _6602 = fma(_6600, _6578, _6520);
            _6574 = _6602;
        }
        float _6604 = _6574;
        _6192 = _6604;
        if (_6538)
        {
            float _6606 = -_6228;
            float _6608 = fma(_6606, _6582, _6516);
            _6590 = _6608;
        }
        float _6610 = _6590;
        _6202 = _6610;
        if (_6538)
        {
            float _6612 = -_6252;
            float _6614 = fma(_6612, _6582, _6512);
            _6598 = _6614;
        }
        float _6616 = _6598;
        _6208 = _6616;
        if (_6538)
        {
            float _6618 = -_6230;
            float _6620 = fma(_6618, _6582, _6520);
            _6192 = _6620;
        }
    }
    float _6622 = _6056;
    float _6624 = _5274;
    float _6626 = _6202;
    float _6628 = _6208;
    float _6630 = _6192;
    float _6632 = _1146;
    bool _6634 = !_802;
    float _6636 = _6624;
    float _6638 = _6632;
    float _6640 = _6622;
    float _6714;
    float _6716;
    float _6718;
    if (!_6634)
    {
        float _6642 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _6644 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _6646 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _6648 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _6650 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _6652 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _6654 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _6656 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _6658 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _6660 = _6646 * _6648;
        float _6662 = _6646 * _6650;
        float _6664 = -_6660;
        float _6666 = fma(_6642, _6652, _6664);
        float _6668 = -_6662;
        float _6670 = fma(_6644, _6652, _6668);
        float _6672 = _6644 * _6648;
        float _6674 = _6656 * _6652;
        float _6676 = _6656 * _6666;
        float _6678 = _6654 * _6650;
        float _6680 = -_6672;
        float _6682 = fma(_6642, _6650, _6680);
        float _6684 = -_6674;
        float _6686 = fma(_6658, _6650, _6684);
        float _6688 = -_6676;
        float _6690 = fma(_6654, _6670, _6688);
        float _6692 = -_6678;
        float _6694 = fma(_6656, _6648, _6692);
        float _6696 = fma(_6658, _6682, _6690);
        float _6698 = _6658 * _6648;
        float _6700 = -_6698;
        float _6702 = fma(_6654, _6652, _6700);
        float _6704 = 1.0 / _6696;
        float _6706 = _6704 * _5798;
        float _6708 = _6686 * _6706;
        float _6710 = _6702 * _6706;
        float _6712 = _6694 * _6706;
        _6714 = _6712;
        _6716 = _6708;
        _6718 = _6710;
        _6720 = true;
    }
    else
    {
        bool _6722 = _1034 != 0;
        bool _6724 = _1094 != 0;
        bool _6726 = _6724 || _6722;
        if (!_6726)
        {
            _6636 = 0.0;
        }
        float _6728 = _6636;
        _6716 = _6728;
        if (!_6726)
        {
            _6638 = _5798;
        }
        float _6730 = _6638;
        _6718 = _6730;
        if (!_6726)
        {
            _6640 = 0.0;
        }
        float _6732 = _6640;
        bool _6734 = !_6726;
        _6714 = _6732;
        if (!_6734)
        {
            uint _6736 = uint(int(uint(_170) >> uint(2)));
            float _6738 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_6736)]);
            int _6740 = _170 + 4;
            uint _6742 = uint(int(uint(_6740) >> uint(2)));
            float _6744 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_6742)]);
            int _6746 = _170 + 8;
            uint _6748 = uint(int(uint(_6746) >> uint(2)));
            float _6750 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_6748)]);
            uint _6752 = uint(int(uint(_170) >> uint(2)));
            float _6754 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6752)]);
            int _6756 = _170 + 4;
            uint _6758 = uint(int(uint(_6756) >> uint(2)));
            float _6760 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6758)]);
            int _6762 = _170 + 8;
            uint _6764 = uint(int(uint(_6762) >> uint(2)));
            float _6766 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6764)]);
            uint _6768 = uint(int(uint(_170) >> uint(2)));
            float _6770 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_6768)]);
            int _6772 = _170 + 4;
            uint _6774 = uint(int(uint(_6772) >> uint(2)));
            float _6776 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_6774)]);
            int _6778 = _170 + 8;
            uint _6780 = uint(int(uint(_6778) >> uint(2)));
            float _6782 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_6780)]);
            float _6784 = _6750 * _6754;
            float _6786 = _6750 * _6760;
            float _6788 = -_6784;
            float _6790 = fma(_6738, _6766, _6788);
            float _6792 = -_6786;
            float _6794 = fma(_6744, _6766, _6792);
            float _6796 = _6744 * _6754;
            float _6798 = _6776 * _6790;
            float _6800 = _6770 * _6760;
            float _6802 = -_6796;
            float _6804 = fma(_6738, _6760, _6802);
            float _6806 = -_6798;
            float _6808 = fma(_6770, _6794, _6806);
            float _6810 = _6776 * _6766;
            float _6812 = -_6800;
            float _6814 = fma(_6776, _6754, _6812);
            float _6816 = fma(_6782, _6804, _6808);
            float _6818 = _6782 * _6754;
            float _6820 = -_6810;
            float _6822 = fma(_6782, _6760, _6820);
            float _6824 = -_6818;
            float _6826 = fma(_6770, _6766, _6824);
            float _6828 = 1.0 / _6816;
            float _6830 = _6828 * _5798;
            float _6832 = _6822 * _6830;
            float _6834 = _6826 * _6830;
            float _6836 = _6814 * _6830;
            _6714 = _6836;
            _6716 = _6832;
            _6718 = _6834;
        }
    }
    _6720 = false;
    float _6838 = _6714;
    float _6840 = _6716;
    float _6842 = _6718;
    float _6844 = _3358 + _6838;
    float _6846 = _3360 + _6840;
    float _6848 = _6626 * 0.01666666753590106964111328125;
    float _6850 = _6628 * 0.01666666753590106964111328125;
    float _6852 = _6630 * 0.01666666753590106964111328125;
    bool _6854 = !_802;
    float _6856 = _6840;
    float _6978;
    float _6980;
    float _6982;
    if (!_6854)
    {
        float _6858 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _6860 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _6862 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _6864 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _6866 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _6868 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _6870 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _6872 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _6874 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _6876 = _6862 * _6864;
        float _6878 = _6862 * _6866;
        float _6880 = _6860 * _6864;
        float _6882 = -_6876;
        float _6884 = fma(_6858, _6868, _6882);
        float _6886 = -_6878;
        float _6888 = fma(_6860, _6868, _6886);
        float _6890 = -_6880;
        float _6892 = fma(_6858, _6866, _6890);
        float _6894 = _6874 * _6864;
        float _6896 = _6872 * _6884;
        float _6898 = _6874 * _6860;
        float _6900 = _6872 * _6868;
        float _6902 = _6870 * _6866;
        float _6904 = -_6896;
        float _6906 = fma(_6870, _6888, _6904);
        float _6908 = -_6898;
        float _6910 = fma(_6872, _6862, _6908);
        float _6912 = -_6900;
        float _6914 = fma(_6874, _6866, _6912);
        float _6916 = -_6902;
        float _6918 = fma(_6872, _6864, _6916);
        float _6920 = fma(_6874, _6892, _6906);
        float _6922 = _6872 * _6858;
        float _6924 = 1.0 / _6920;
        float _6926 = -_6922;
        float _6928 = fma(_6870, _6860, _6926);
        float _6930 = _6870 * _6862;
        float _6932 = -_6894;
        float _6934 = fma(_6870, _6868, _6932);
        float _6936 = -_6858;
        float _6938 = fma(_6936, _6868, _6876);
        float _6940 = -_6930;
        float _6942 = fma(_6874, _6858, _6940);
        float _6944 = _6934 * _6924;
        float _6946 = _6914 * _6924;
        float _6948 = _6918 * _6924;
        float _6950 = _6938 * _6924;
        float _6952 = _6850 * _6944;
        float _6954 = _6850 * _6946;
        float _6956 = _6850 * _6948;
        float _6958 = _6848 * _6924;
        float _6960 = _6942 * _6924;
        float _6962 = fma(_6848, _6950, _6952);
        float _6964 = _6910 * _6924;
        float _6966 = _6928 * _6924;
        float _6968 = fma(_6888, _6958, _6954);
        float _6970 = fma(_6892, _6958, _6956);
        float _6972 = fma(_6852, _6960, _6962);
        float _6974 = fma(_6852, _6964, _6968);
        float _6976 = fma(_6852, _6966, _6970);
        _6978 = _6974;
        _6980 = _6972;
        _6982 = _6976;
        _6984 = true;
    }
    else
    {
        bool _6986 = _1034 != 0;
        bool _6988 = _1094 != 0;
        bool _6990 = _6988 || _6986;
        if (!_6990)
        {
            _1038 = _6848;
        }
        float _6992 = _1038;
        _6978 = _6992;
        if (!_6990)
        {
            _1100 = _6850;
        }
        float _6994 = _1100;
        _6980 = _6994;
        if (!_6990)
        {
            _6856 = _6852;
        }
        float _6996 = _6856;
        bool _6998 = !_6990;
        _6982 = _6996;
        if (!_6998)
        {
            uint _7000 = uint(int(uint(_170) >> uint(2)));
            float _7002 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7000)]);
            int _7004 = _170 + 4;
            uint _7006 = uint(int(uint(_7004) >> uint(2)));
            float _7008 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7006)]);
            int _7010 = _170 + 8;
            uint _7012 = uint(int(uint(_7010) >> uint(2)));
            float _7014 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_7012)]);
            uint _7016 = uint(int(uint(_170) >> uint(2)));
            float _7018 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7016)]);
            int _7020 = _170 + 4;
            uint _7022 = uint(int(uint(_7020) >> uint(2)));
            float _7024 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7022)]);
            int _7026 = _170 + 8;
            uint _7028 = uint(int(uint(_7026) >> uint(2)));
            float _7030 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_7028)]);
            uint _7032 = uint(int(uint(_170) >> uint(2)));
            float _7034 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7032)]);
            int _7036 = _170 + 4;
            uint _7038 = uint(int(uint(_7036) >> uint(2)));
            float _7040 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7038)]);
            int _7042 = _170 + 8;
            uint _7044 = uint(int(uint(_7042) >> uint(2)));
            float _7046 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_7044)]);
            float _7048 = _7014 * _7018;
            float _7050 = _7014 * _7024;
            float _7052 = _7008 * _7018;
            float _7054 = -_7048;
            float _7056 = fma(_7002, _7030, _7054);
            float _7058 = -_7050;
            float _7060 = fma(_7008, _7030, _7058);
            float _7062 = -_7052;
            float _7064 = fma(_7002, _7024, _7062);
            float _7066 = _7040 * _7002;
            float _7068 = _7040 * _7056;
            float _7070 = _7046 * _7008;
            float _7072 = _7034 * _7024;
            float _7074 = -_7066;
            float _7076 = fma(_7034, _7008, _7074);
            float _7078 = -_7068;
            float _7080 = fma(_7034, _7060, _7078);
            float _7082 = _7040 * _7030;
            float _7084 = _7046 * _7018;
            float _7086 = -_7070;
            float _7088 = fma(_7040, _7014, _7086);
            float _7090 = fma(_7046, _7064, _7080);
            float _7092 = -_7082;
            float _7094 = fma(_7046, _7024, _7092);
            float _7096 = -_7084;
            float _7098 = fma(_7034, _7030, _7096);
            float _7100 = -_7072;
            float _7102 = fma(_7040, _7018, _7100);
            float _7104 = 1.0 / _7090;
            float _7106 = _7034 * _7014;
            float _7108 = -_7002;
            float _7110 = fma(_7108, _7030, _7048);
            float _7112 = -_7106;
            float _7114 = fma(_7046, _7002, _7112);
            float _7116 = _7094 * _7104;
            float _7118 = _7098 * _7104;
            float _7120 = _7102 * _7104;
            float _7122 = _6848 * _7104;
            float _7124 = _7116 * _6850;
            float _7126 = _7118 * _6850;
            float _7128 = _7120 * _6850;
            float _7130 = _7110 * _7104;
            float _7132 = _7088 * _7104;
            float _7134 = _7114 * _7104;
            float _7136 = fma(_7060, _7122, _7124);
            float _7138 = _7076 * _7104;
            float _7140 = fma(_7130, _6848, _7126);
            float _7142 = fma(_7064, _7122, _7128);
            float _7144 = fma(_7132, _6852, _7136);
            float _7146 = fma(_7134, _6852, _7140);
            float _7148 = fma(_7138, _6852, _7142);
            _6978 = _7144;
            _6980 = _7146;
            _6982 = _7148;
        }
    }
    _6984 = false;
    float _7150 = _6978;
    float _7152 = _6980;
    float _7154 = _6982;
    float _7156 = _6182 * _6182;
    float _7158 = _3214 * (-0.0291463173925876617431640625);
    float _7160 = fma(_6178, _6178, _7156);
    float _7162 = exp2(_7158);
    float _7164 = fma(_6184, _6184, _7160);
    float _7166 = sqrt(_7164);
    float _7168 = _7166 * 0.01666666753590106964111328125;
    bool _7170 = _7168 > 1.57079637050628662109375;
    float _7172 = _7168;
    if (_7170)
    {
        float _7174 = rsqrt(_7164);
        _7172 = _7174;
    }
    float _7176 = _7172;
    float _7178 = _7176;
    if (_7170)
    {
        float _7180 = _7176 * 94.24777984619140625;
        _7178 = _7180;
    }
    float _7182 = _7178;
    if (_7170)
    {
        float _7184 = _6182 * _7182;
        _6194 = _7184;
    }
    float _7186 = _6194;
    if (_7170)
    {
        float _7188 = _6178 * _7182;
        _6196 = _7188;
    }
    float _7190 = _6196;
    if (_7170)
    {
        float _7192 = _6184 * _7182;
        _6198 = _7192;
    }
    float _7194 = _6198;
    float _7196 = fma(_6010, _7186, _5800);
    float _7198 = fma(_6010, _7190, _5802);
    float _7200 = fma(_6010, _7194, _5804);
    float _7202 = _7196 * _7162;
    float _7204 = _7198 * _7162;
    float _7206 = _7200 * _7162;
    float _7208 = _7202 * _7202;
    float _7210 = fma(_7204, _7204, _7208);
    float _7212 = fma(_7206, _7206, _7210);
    float _7214 = sqrt(_7212);
    bool _7216 = _7214 > 31.4159259796142578125;
    float _7218 = _7214;
    float _7220 = _7202;
    float _7222 = _7204;
    float _7224 = _7206;
    if (_7216)
    {
        float _7226 = rsqrt(_7212);
        _7218 = _7226;
    }
    float _7228 = _7218;
    float _7230 = _7228;
    if (_7216)
    {
        float _7232 = _7228 * 31.4159259796142578125;
        _7230 = _7232;
    }
    float _7234 = _7230;
    if (_7216)
    {
        float _7236 = _7202 * _7234;
        _7220 = _7236;
    }
    float _7238 = _7220;
    if (_7216)
    {
        float _7240 = _7204 * _7234;
        _7222 = _7240;
    }
    float _7242 = _7222;
    if (_7216)
    {
        float _7244 = _7206 * _7234;
        _7224 = _7244;
    }
    float _7246 = _7224;
    float _7248 = _6010 * _7238;
    float _7250 = _6010 * _7242;
    float _7252 = _6010 * _7246;
    float _7254 = _7248 * _7248;
    float _7256 = fma(_7250, _7250, _7254);
    float _7258 = fma(_7252, _7252, _7256);
    float _7260 = sqrt(_7258);
    float _7262 = rsqrt(_7258);
    float _7264 = _7260 * 0.5;
    bool _7266 = _7260 != 0.0;
    bool _7268 = isnan(_7260);
    bool _7270 = _7266 || _7268;
    bool _7272 = isnan(0.0);
    bool _7274 = _7270 || _7272;
    float _7276 = _7264 * 0.15915493667125701904296875;
    float _7278 = _7276 * 6.283185482025146484375;
    float _7280 = sin(_7278);
    float _7282 = _7252 * _7262;
    float _7284 = _7248 * _7262;
    float _7286 = _7250 * _7262;
    float _7288 = _7274 ? _7282 : 0.0;
    float _7290 = _7276 * 6.283185482025146484375;
    float _7292 = cos(_7290);
    float _7294 = _7274 ? _7284 : 0.0;
    float _7296 = _7274 ? _7286 : 0.0;
    float _7298 = _7288 * _7280;
    float _7300 = _7294 * _7280;
    float _7302 = _7296 * _7280;
    float _7304 = _7298 * _3196;
    float _7306 = _7300 * _3188;
    float _7308 = _7300 * _3186;
    float _7310 = _7300 * _3196;
    float _7312 = -_7304;
    float _7314 = fma(_7300, _3192, _7312);
    float _7316 = -_7306;
    float _7318 = fma(_7302, _3196, _7316);
    float _7320 = _7302 * _3186;
    float _7322 = fma(_7292, _3196, _7308);
    float _7324 = _7302 * _3192;
    float _7326 = _7298 * _3186;
    float _7328 = fma(_7302, _3188, _7310);
    float _7330 = fma(_7292, _3188, _7320);
    float _7332 = -_7324;
    float _7334 = fma(_7298, _3188, _7332);
    float _7336 = fma(_7292, _3192, _7326);
    float _7338 = fma(_7298, _3192, _7328);
    float _7340 = _7330 + _7314;
    float _7342 = _7322 + _7334;
    float _7344 = _7336 + _7318;
    float _7346 = -_7338;
    float _7348 = fma(_7292, _3186, _7346);
    uint _7350 = uint(int(uint(_724) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_7350)] = as_type<uint>(_7340);
    int _7352 = _724 + 4;
    uint _7354 = uint(int(uint(_7352) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_7354)] = as_type<uint>(_7342);
    int _7356 = _724 + 8;
    uint _7358 = uint(int(uint(_7356) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_7358)] = as_type<uint>(_7344);
    int _7360 = _724 + 12;
    uint _7362 = uint(int(uint(_7360) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_7362)] = as_type<uint>(_7348);
    uint _7364 = uint(int(uint(_904) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_7364)] = as_type<uint>(_7242);
    int _7366 = _904 + 4;
    uint _7368 = uint(int(uint(_7366) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_7368)] = as_type<uint>(_7238);
    int _7370 = _904 + 8;
    uint _7372 = uint(int(uint(_7370) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_7372)] = as_type<uint>(_7246);
    int _7374 = _904 + 12;
    uint _7376 = uint(int(uint(_7374) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_7376)] = as_type<uint>(_5778);
    float _7378 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[71]);
    float _7380 = -_234;
    float _7382 = _7380 + _6846;
    uint _7384 = uint(int(uint(_174) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_7384)] = as_type<uint>(_278);
    float _7386 = -_246;
    float _7388 = _7386 + _6844;
    int _7390 = _170 + 8;
    uint _7392 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_7392)] = as_type<uint>(_6846);
    float _7394 = _3356 + _7378;
    float _7396 = _7394 + _6842;
    int _7398 = _170 + 4;
    float _7400 = -_240;
    float _7402 = _7400 + _7396;
    uint _7404 = uint(int(uint(_7398) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_7404)] = as_type<uint>(_7396);
    uint _7406 = uint(int(uint(_7390) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_7406)] = as_type<uint>(_6844);
    uint _7408 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_7408)] = as_type<uint>(_7150);
    uint _7410 = uint(int(uint(_7398) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_7410)] = as_type<uint>(_7152);
    uint _7412 = uint(int(uint(_7390) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_7412)] = as_type<uint>(_7154);
    uint _7414 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_7414)] = as_type<uint>(_7382);
    uint _7416 = uint(int(uint(_7398) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_7416)] = as_type<uint>(_7402);
    uint _7418 = uint(int(uint(_7390) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_7418)] = as_type<uint>(_7388);
    float _7420 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _7422 = _7402 * _7402;
    float _7424 = _7152 * _7152;
    float _7426 = fma(_7382, _7382, _7422);
    float _7428 = fma(_7150, _7150, _7424);
    float _7430 = fma(_7388, _7388, _7426);
    float _7432 = fma(_7154, _7154, _7428);
    float _7434 = sqrt(_7430);
    float _7436 = sqrt(_7432);
    bool _7438 = _7434 >= 9.9999999747524270787835121154785e-07;
    bool _7440 = isnan(_7434);
    bool _7442 = _7438 || _7440;
    bool _7444 = isnan(9.9999999747524270787835121154785e-07);
    bool _7446 = _7442 || _7444;
    float _7448 = _7436;
    if (!_7446)
    {
        bool _7450 = _176 != _180;
        bool _7452 = isnan(_176);
        bool _7454 = _7450 || _7452;
        bool _7456 = isnan(_180);
        bool _7458 = _7454 || _7456;
        _7460 = _7458;
        if (!_7460)
        {
            float _7462 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
            bool _7464 = _7462 > 0.0;
            bool _7466 = !_7464;
            if (!_7466)
            {
                float _7468 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
                float _7470 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
                float _7472 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
                float _7474 = _7470 * _7470;
                float _7476 = fma(_7468, _7468, _7474);
                float _7478 = fma(_7472, _7472, _7476);
                float _7480 = rsqrt(_7478);
                float _7482 = _7480 * 9.9999999747524270787835121154785e-07;
                float _7484 = _7468 * _7482;
                float _7486 = _7470 * _7482;
                float _7488 = _7472 * _7482;
                _398 = as_type<int>(_7484);
                _400 = as_type<int>(_7486);
                _402 = as_type<int>(_7488);
                _7460 = true;
            }
            else
            {
                bool _7490 = _7436 >= 9.9999999747524270787835121154785e-07;
                bool _7492 = isnan(_7436);
                bool _7494 = _7490 || _7492;
                bool _7496 = isnan(9.9999999747524270787835121154785e-07);
                bool _7498 = _7494 || _7496;
                if (!_7498)
                {
                    float _7500 = _7396 * _7396;
                    float _7502 = fma(_6846, _6846, _7500);
                    float _7504 = fma(_6844, _6844, _7502);
                    float _7506 = sqrt(_7504);
                    bool _7508 = _7506 >= 9.9999999747524270787835121154785e-07;
                    bool _7510 = isnan(_7506);
                    bool _7512 = _7508 || _7510;
                    bool _7514 = isnan(9.9999999747524270787835121154785e-07);
                    bool _7516 = _7512 || _7514;
                    float _7518 = _7506;
                    if (_7516)
                    {
                        float _7520 = rsqrt(_7504);
                        _7518 = _7520;
                    }
                    float _7522 = _7518;
                    if (!_7516)
                    {
                        _386 = 0;
                    }
                    int _7524 = _386;
                    int _7526 = _7524;
                    if (!_7516)
                    {
                        _388 = 897988541;
                    }
                    int _7528 = _388;
                    int _7530 = _7528;
                    if (!_7516)
                    {
                        _390 = 0;
                    }
                    int _7532 = _390;
                    int _7534 = _7532;
                    if (_7516)
                    {
                        float _7536 = _7522 * 9.9999999747524270787835121154785e-07;
                        _7448 = _7536;
                    }
                    float _7538 = _7448;
                    if (_7516)
                    {
                        float _7540 = _6846 * _7538;
                        _7526 = as_type<int>(_7540);
                    }
                    int _7542 = _7526;
                    _398 = _7542;
                    if (_7516)
                    {
                        float _7544 = _7396 * _7538;
                        _7530 = as_type<int>(_7544);
                    }
                    int _7546 = _7530;
                    _400 = _7546;
                    if (_7516)
                    {
                        float _7548 = _6844 * _7538;
                        _7534 = as_type<int>(_7548);
                    }
                    int _7550 = _7534;
                    _402 = _7550;
                    _7460 = true;
                }
                else
                {
                    float _7552 = rsqrt(_7432);
                    float _7554 = _7552 * 9.9999999747524270787835121154785e-07;
                    float _7556 = _7150 * _7554;
                    float _7558 = _7152 * _7554;
                    float _7560 = _7154 * _7554;
                    _398 = as_type<int>(_7556);
                    _400 = as_type<int>(_7558);
                    _402 = as_type<int>(_7560);
                    _7460 = true;
                }
            }
        }
    }
    else
    {
        float _7562 = _7436 * _7420;
        bool _7564 = _7562 >= 0.001000000047497451305389404296875;
        bool _7566 = isnan(_7562);
        bool _7568 = _7564 || _7566;
        bool _7570 = isnan(0.001000000047497451305389404296875);
        bool _7572 = _7568 || _7570;
        bool _7574 = _7562 > 0.0;
        bool _7576 = !_7572;
        bool _7578 = _7574 && _7576;
        bool _7580 = _7434 < 0.001000000047497451305389404296875;
        bool _7582 = _7580 && _7578;
        if (!_7582)
        {
            _392 = as_type<int>(_7382);
        }
        int _7584 = _392;
        int _7586 = _7584;
        if (_7582)
        {
            float _7588 = _7420 * _7150;
            _7586 = as_type<int>(_7588);
        }
        int _7590 = _7586;
        _398 = _7590;
        if (!_7582)
        {
            _394 = as_type<int>(_7402);
        }
        int _7592 = _394;
        int _7594 = _7592;
        if (_7582)
        {
            float _7596 = _7420 * _7152;
            _7594 = as_type<int>(_7596);
        }
        int _7598 = _7594;
        _400 = _7598;
        if (!_7582)
        {
            _396 = as_type<int>(_7388);
        }
        int _7600 = _396;
        _402 = _7600;
        if (_7582)
        {
            float _7602 = _7420 * _7154;
            _402 = as_type<int>(_7602);
        }
    }
    _7460 = false;
    int _7604 = _398;
    int _7606 = _400;
    int _7608 = _402;
    uint _7610 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_7610)] = uint(_7604);
    uint _7612 = uint(int(uint(_7398) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_7612)] = uint(_7606);
    uint _7614 = uint(int(uint(_7390) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_7614)] = uint(_7608);
}

