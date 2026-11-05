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

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _101 = false;
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _739 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_739, float2(0.0), isnan(_739))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_739, float2(0.0), isnan(_739))).y;
    float2 _750 = float2(_57, _59);
    float4 _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_750, float2(0.0), isnan(_750)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_750, float2(0.0), isnan(_750)), level(0.0)).xyzw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float _72 = _64.w;
    float _74 = fma(_57, 2.0, -1.0);
    float _76 = fma(_59, 2.0, -1.0);
    bool _80 = _61 >= 0.0;
    int _83 = as_type<int>(_66);
    int _85 = as_type<int>(_68);
    int _87 = as_type<int>(_70);
    int _89 = as_type<int>(_72);
    float _91;
    float _93;
    float _95;
    float _97;
    float _99;
    if (!_80)
    {
        _91 = 0.0;
        _93 = 0.0;
        _95 = 0.0;
        _97 = 0.0;
        _99 = 0.0;
        _101 = true;
    }
    else
    {
        bool _103 = 0 < as_type<int>((*spvDescriptorSet0.fp_c3)._m0[101].x);
        bool _105 = !_103;
        float _107 = 0.0;
        float _109 = 0.0;
        float _111 = 0.0;
        float _113 = 0.0;
        float _115 = 0.0;
        float _117 = 0.0;
        float _119 = 0.0;
        float _121 = 0.0;
        float _123 = 0.0;
        float _125 = 0.0;
        float _127 = 0.0;
        float _129 = 0.0;
        float _131 = 0.0;
        float _133 = 0.0;
        float _135 = 0.0;
        if (!_105)
        {
            float _137 = _76 * (*spvDescriptorSet0.fp_c3)._m0[100].z;
            float _139 = _74 * (*spvDescriptorSet0.fp_c3)._m0[100].z;
            int _141 = (-1) + as_type<int>((*spvDescriptorSet0.fp_c3)._m0[101].x);
            int _143 = _141 + 1;
            bool _145 = _143 > 3;
            bool _147 = !_145;
            int _149 = 0;
            int _151 = 0;
            int _153 = -1;
            if (!_147)
            {
                float _155 = _72 * (*spvDescriptorSet0.fp_c3)._m0[100].x;
                float _157 = _72 * (*spvDescriptorSet0.fp_c3)._m0[100].y;
                int _159 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[101].x) + (-3);
                _153 = 0;
                bool _161;
                do
                {
                    int _163 = _149;
                    float _165 = _107;
                    float _167 = _109;
                    float _169 = _111;
                    float _171 = _113;
                    float _173 = _115;
                    int _175 = _163 << 4;
                    uint _178 = uint(int(uint(_175) >> uint(2)));
                    uint _180 = uint(int(uint(int(_178)) >> uint(2)));
                    int _182 = int(_178) & 3;
                    float _184 = (*spvDescriptorSet0.fp_c3)._m0[int(_180)][_182];
                    int _186 = int(_178) + 1;
                    uint _188 = uint(int(uint(_186) >> uint(2)));
                    int _190 = _186 & 3;
                    float _192 = (*spvDescriptorSet0.fp_c3)._m0[int(_188)][_190];
                    int _194 = _175 + 16;
                    uint _196 = uint(int(uint(_194) >> uint(2)));
                    uint _198 = uint(int(uint(int(_196)) >> uint(2)));
                    int _200 = int(_196) & 3;
                    float _202 = (*spvDescriptorSet0.fp_c3)._m0[int(_198)][_200];
                    int _204 = int(_196) + 1;
                    uint _206 = uint(int(uint(_204) >> uint(2)));
                    int _208 = _204 & 3;
                    float _210 = (*spvDescriptorSet0.fp_c3)._m0[int(_206)][_208];
                    int _212 = _175 + 32;
                    uint _214 = uint(int(uint(_212) >> uint(2)));
                    uint _216 = uint(int(uint(int(_214)) >> uint(2)));
                    int _218 = int(_214) & 3;
                    float _220 = (*spvDescriptorSet0.fp_c3)._m0[int(_216)][_218];
                    int _222 = int(_214) + 1;
                    uint _224 = uint(int(uint(_222) >> uint(2)));
                    int _226 = _222 & 3;
                    float _228 = (*spvDescriptorSet0.fp_c3)._m0[int(_224)][_226];
                    int _230 = _175 + 48;
                    uint _232 = uint(int(uint(_230) >> uint(2)));
                    uint _234 = uint(int(uint(int(_232)) >> uint(2)));
                    int _236 = int(_232) & 3;
                    float _238 = (*spvDescriptorSet0.fp_c3)._m0[int(_234)][_236];
                    int _240 = int(_232) + 1;
                    uint _242 = uint(int(uint(_240) >> uint(2)));
                    int _244 = _240 & 3;
                    float _246 = (*spvDescriptorSet0.fp_c3)._m0[int(_242)][_244];
                    float _248 = _137 * _192;
                    float _250 = fma(_139, _184, _248);
                    float _252 = _137 * _210;
                    float _254 = abs(_250);
                    float _256 = -_254;
                    float _258 = _256 + 1.0;
                    float _260 = fma(_139, _202, _252);
                    float _262 = _258 * _155;
                    float _264 = _258 * _157;
                    float _266 = abs(_260);
                    float _268 = -_266;
                    float _270 = _268 + 1.0;
                    float _272 = fma(_262, _184, _57);
                    float _274 = _137 * _228;
                    float _276 = fma(_264, _192, _59);
                    float _278 = _270 * _157;
                    float _280 = fma(_139, _220, _274);
                    float _282 = _270 * _155;
                    float _284 = _137 * _246;
                    float _286 = fma(_278, _210, _59);
                    float _288 = abs(_280);
                    float _290 = -_288;
                    float _292 = _290 + 1.0;
                    float _294 = fma(_282, _202, _57);
                    float _296 = fma(_139, _238, _284);
                    float _298 = _292 * _155;
                    float _300 = _292 * _157;
                    float _302 = abs(_296);
                    float _304 = -_302;
                    float _306 = _304 + 1.0;
                    float _308 = fma(_298, _220, _57);
                    float _310 = fma(_300, _228, _59);
                    float _312 = _306 * _155;
                    float _314 = _306 * _157;
                    float _316 = fma(_312, _238, _57);
                    float _318 = fma(_314, _246, _59);
                    float2 _1076 = float2(_272, _276);
                    float4 _320 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1076, float2(0.0), isnan(_1076)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1076, float2(0.0), isnan(_1076)), level(0.0)).xyzw;
                    float _322 = _320.x;
                    float _324 = _320.y;
                    float _326 = _320.z;
                    float _328 = _320.w;
                    float2 _1092 = float2(_294, _286);
                    float4 _330 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1092, float2(0.0), isnan(_1092)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1092, float2(0.0), isnan(_1092)), level(0.0)).xyzw;
                    float _332 = _330.x;
                    float _334 = _330.y;
                    float _336 = _330.z;
                    float _338 = _330.w;
                    float2 _1108 = float2(_308, _310);
                    float4 _340 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1108, float2(0.0), isnan(_1108)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1108, float2(0.0), isnan(_1108)), level(0.0)).xyzw;
                    float _342 = _340.x;
                    float _344 = _340.y;
                    float _346 = _340.z;
                    float _348 = _340.w;
                    float2 _1124 = float2(_316, _318);
                    float4 _350 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1124, float2(0.0), isnan(_1124)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1124, float2(0.0), isnan(_1124)), level(0.0)).xyzw;
                    float _352 = _350.x;
                    float _354 = _350.y;
                    float _356 = _350.z;
                    float _358 = _350.w;
                    int _360 = _163 + 4;
                    bool _362 = _360 >= _159;
                    float _364 = 0.0 + _328;
                    float _366 = precise::clamp(_364, 0.0, 1.0);
                    float _368 = fma(_322, _366, _165);
                    float _370 = fma(_324, _366, _167);
                    float _372 = 0.0 + _338;
                    float _374 = precise::clamp(_372, 0.0, 1.0);
                    float _376 = fma(_326, _366, _169);
                    float _378 = fma(_328, _366, _171);
                    float _380 = _366 + _173;
                    float _382 = fma(_332, _374, _368);
                    float _384 = fma(_334, _374, _370);
                    float _386 = 0.0 + _348;
                    float _388 = precise::clamp(_386, 0.0, 1.0);
                    float _390 = fma(_336, _374, _376);
                    float _392 = fma(_338, _374, _378);
                    float _394 = _380 + _374;
                    float _396 = fma(_342, _388, _382);
                    float _398 = fma(_344, _388, _384);
                    float _400 = fma(_346, _388, _390);
                    float _402 = 0.0 + _358;
                    float _404 = precise::clamp(_402, 0.0, 1.0);
                    float _406 = fma(_348, _388, _392);
                    float _408 = _394 + _388;
                    float _410 = fma(_352, _404, _396);
                    float _412 = fma(_354, _404, _398);
                    float _414 = fma(_356, _404, _400);
                    float _416 = fma(_358, _404, _406);
                    float _418 = _408 + _404;
                    _161 = !_362;
                    _149 = _360;
                    _107 = _410;
                    _109 = _412;
                    _111 = _414;
                    _113 = _416;
                    _115 = _418;
                    _151 = _360;
                    _117 = _412;
                    _119 = _410;
                    _121 = _414;
                    _123 = _416;
                    _125 = _418;
                } while (_161);
            }
            int _420 = _151;
            float _422 = _117;
            float _424 = _119;
            float _426 = _121;
            float _428 = _123;
            float _430 = _125;
            int _432 = _153;
            int _434 = ~_420;
            int _436 = _434 + as_type<int>((*spvDescriptorSet0.fp_c3)._m0[101].x);
            int _438 = _436 + 1;
            bool _440 = _438 > 1;
            bool _442 = !_440;
            int _444 = _420;
            int _446 = _432;
            float _448 = _424;
            float _450 = _422;
            float _452 = _426;
            float _454 = _428;
            float _456 = _430;
            if (!_442)
            {
                int _458 = _420 << 4;
                uint _460 = uint(int(uint(_458) >> uint(2)));
                uint _462 = uint(int(uint(int(_460)) >> uint(2)));
                int _464 = int(_460) & 3;
                float _466 = (*spvDescriptorSet0.fp_c3)._m0[int(_462)][_464];
                int _468 = int(_460) + 1;
                uint _470 = uint(int(uint(_468) >> uint(2)));
                int _472 = _468 & 3;
                float _474 = (*spvDescriptorSet0.fp_c3)._m0[int(_470)][_472];
                int _476 = _458 + 16;
                uint _478 = uint(int(uint(_476) >> uint(2)));
                uint _480 = uint(int(uint(int(_478)) >> uint(2)));
                int _482 = int(_478) & 3;
                float _484 = (*spvDescriptorSet0.fp_c3)._m0[int(_480)][_482];
                int _486 = int(_478) + 1;
                uint _488 = uint(int(uint(_486) >> uint(2)));
                int _490 = _486 & 3;
                float _492 = (*spvDescriptorSet0.fp_c3)._m0[int(_488)][_490];
                float _494 = _137 * _474;
                float _496 = fma(_139, _466, _494);
                float _498 = _137 * _492;
                float _500 = abs(_496);
                float _502 = -_500;
                float _504 = _502 + 1.0;
                float _506 = fma(_139, _484, _498);
                float _508 = _72 * _504;
                float _510 = abs(_506);
                float _512 = -_510;
                float _514 = _512 + 1.0;
                float _516 = _508 * (*spvDescriptorSet0.fp_c3)._m0[100].y;
                float _518 = _72 * _514;
                float _520 = _508 * (*spvDescriptorSet0.fp_c3)._m0[100].x;
                float _522 = fma(_516, _474, _59);
                float _524 = _518 * (*spvDescriptorSet0.fp_c3)._m0[100].x;
                float _526 = fma(_520, _466, _57);
                float _528 = _518 * (*spvDescriptorSet0.fp_c3)._m0[100].y;
                float _530 = fma(_524, _484, _57);
                float _532 = fma(_528, _492, _59);
                float2 _1409 = float2(_526, _522);
                float4 _534 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1409, float2(0.0), isnan(_1409)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1409, float2(0.0), isnan(_1409)), level(0.0)).xyzw;
                float _536 = _534.x;
                float _538 = _534.y;
                float _540 = _534.z;
                float _542 = _534.w;
                float2 _1425 = float2(_530, _532);
                float4 _544 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1425, float2(0.0), isnan(_1425)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1425, float2(0.0), isnan(_1425)), level(0.0)).xyzw;
                float _546 = _544.x;
                float _548 = _544.y;
                float _550 = _544.z;
                float _552 = _544.w;
                int _554 = _420 + 2;
                float _556 = 0.0 + _542;
                float _558 = precise::clamp(_556, 0.0, 1.0);
                float _560 = fma(_538, _558, _422);
                float _562 = fma(_536, _558, _424);
                float _564 = fma(_540, _558, _426);
                float _566 = 0.0 + _552;
                float _568 = precise::clamp(_566, 0.0, 1.0);
                float _570 = fma(_542, _558, _428);
                float _572 = _430 + _558;
                float _574 = fma(_546, _568, _562);
                float _576 = fma(_548, _568, _560);
                float _578 = fma(_550, _568, _564);
                float _580 = fma(_552, _568, _570);
                float _582 = _572 + _568;
                _444 = _554;
                _446 = 0;
                _448 = _574;
                _450 = _576;
                _452 = _578;
                _454 = _580;
                _456 = _582;
            }
            int _584 = _444;
            int _586 = _446;
            float _588 = _448;
            float _590 = _450;
            float _592 = _452;
            float _594 = _454;
            float _596 = _456;
            bool _598 = _584 < as_type<int>((*spvDescriptorSet0.fp_c3)._m0[101].x);
            int _600 = (_598 ? (-1) : 0) | _586;
            int _602 = ~_600;
            _127 = _596;
            _129 = _588;
            _131 = _590;
            _133 = _592;
            _135 = _594;
            if (!(_602 != 0))
            {
                int _604 = _584 << 4;
                uint _606 = uint(int(uint(_604) >> uint(2)));
                uint _608 = uint(int(uint(int(_606)) >> uint(2)));
                int _610 = int(_606) & 3;
                float _612 = (*spvDescriptorSet0.fp_c3)._m0[int(_608)][_610];
                int _614 = int(_606) + 1;
                uint _616 = uint(int(uint(_614) >> uint(2)));
                int _618 = _614 & 3;
                float _620 = (*spvDescriptorSet0.fp_c3)._m0[int(_616)][_618];
                float _622 = _137 * _620;
                float _624 = fma(_139, _612, _622);
                float _626 = abs(_624);
                float _628 = -_626;
                float _630 = _628 + 1.0;
                float _632 = _72 * _630;
                float _634 = _632 * (*spvDescriptorSet0.fp_c3)._m0[100].x;
                float _636 = _632 * (*spvDescriptorSet0.fp_c3)._m0[100].y;
                float _638 = fma(_634, _612, _57);
                float _640 = fma(_636, _620, _59);
                float2 _1585 = float2(_638, _640);
                float4 _642 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1585, float2(0.0), isnan(_1585)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1585, float2(0.0), isnan(_1585)), level(0.0)).xyzw;
                float _644 = _642.x;
                float _646 = _642.y;
                float _648 = _642.z;
                float _650 = _642.w;
                float _652 = 0.0 + _650;
                float _654 = precise::clamp(_652, 0.0, 1.0);
                float _656 = fma(_644, _654, _588);
                float _658 = fma(_646, _654, _590);
                float _660 = fma(_648, _654, _592);
                float _662 = fma(_650, _654, _594);
                float _664 = _596 + _654;
                _127 = _664;
                _129 = _656;
                _131 = _658;
                _133 = _660;
                _135 = _662;
            }
        }
        float _666 = _127;
        float _668 = _129;
        float _670 = _131;
        float _672 = _133;
        float _674 = _135;
        _91 = _666;
        _93 = _668;
        _95 = _670;
        _97 = _672;
        _99 = _674;
    }
    _101 = false;
    float _676 = _91;
    float _678 = _93;
    float _680 = _95;
    float _682 = _97;
    float _684 = _99;
    float _686 = 1.0 / _676;
    bool _688 = _676 > 0.0;
    if (_688)
    {
        float _690 = _686 * _678;
        _83 = as_type<int>(_690);
    }
    int _692 = _83;
    if (_688)
    {
        float _694 = _686 * _680;
        _85 = as_type<int>(_694);
    }
    int _696 = _85;
    if (_688)
    {
        float _698 = _686 * _682;
        _87 = as_type<int>(_698);
    }
    int _700 = _87;
    if (_688)
    {
        float _702 = _686 * _684;
        _89 = as_type<int>(_702);
    }
    int _704 = _89;
    out.m_34.x = as_type<float>(_692);
    out.m_34.y = as_type<float>(_696);
    out.m_34.z = as_type<float>(_700);
    out.m_34.w = as_type<float>(_704);
    return out;
}


struct main0_out_u
{
    uint4 m_34 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _101 = false;
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _739 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_739, float2(0.0), isnan(_739))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_739, float2(0.0), isnan(_739))).y;
    float2 _750 = float2(_57, _59);
    float4 _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_750, float2(0.0), isnan(_750)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_750, float2(0.0), isnan(_750)), level(0.0)).xyzw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float _72 = _64.w;
    float _74 = fma(_57, 2.0, -1.0);
    float _76 = fma(_59, 2.0, -1.0);
    bool _80 = _61 >= 0.0;
    int _83 = as_type<int>(_66);
    int _85 = as_type<int>(_68);
    int _87 = as_type<int>(_70);
    int _89 = as_type<int>(_72);
    float _91;
    float _93;
    float _95;
    float _97;
    float _99;
    if (!_80)
    {
        _91 = 0.0;
        _93 = 0.0;
        _95 = 0.0;
        _97 = 0.0;
        _99 = 0.0;
        _101 = true;
    }
    else
    {
        bool _103 = 0 < as_type<int>((*spvDescriptorSet0.fp_c3)._m0[101].x);
        bool _105 = !_103;
        float _107 = 0.0;
        float _109 = 0.0;
        float _111 = 0.0;
        float _113 = 0.0;
        float _115 = 0.0;
        float _117 = 0.0;
        float _119 = 0.0;
        float _121 = 0.0;
        float _123 = 0.0;
        float _125 = 0.0;
        float _127 = 0.0;
        float _129 = 0.0;
        float _131 = 0.0;
        float _133 = 0.0;
        float _135 = 0.0;
        if (!_105)
        {
            float _137 = _76 * (*spvDescriptorSet0.fp_c3)._m0[100].z;
            float _139 = _74 * (*spvDescriptorSet0.fp_c3)._m0[100].z;
            int _141 = (-1) + as_type<int>((*spvDescriptorSet0.fp_c3)._m0[101].x);
            int _143 = _141 + 1;
            bool _145 = _143 > 3;
            bool _147 = !_145;
            int _149 = 0;
            int _151 = 0;
            int _153 = -1;
            if (!_147)
            {
                float _155 = _72 * (*spvDescriptorSet0.fp_c3)._m0[100].x;
                float _157 = _72 * (*spvDescriptorSet0.fp_c3)._m0[100].y;
                int _159 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[101].x) + (-3);
                _153 = 0;
                bool _161;
                do
                {
                    int _163 = _149;
                    float _165 = _107;
                    float _167 = _109;
                    float _169 = _111;
                    float _171 = _113;
                    float _173 = _115;
                    int _175 = _163 << 4;
                    uint _178 = uint(int(uint(_175) >> uint(2)));
                    uint _180 = uint(int(uint(int(_178)) >> uint(2)));
                    int _182 = int(_178) & 3;
                    float _184 = (*spvDescriptorSet0.fp_c3)._m0[int(_180)][_182];
                    int _186 = int(_178) + 1;
                    uint _188 = uint(int(uint(_186) >> uint(2)));
                    int _190 = _186 & 3;
                    float _192 = (*spvDescriptorSet0.fp_c3)._m0[int(_188)][_190];
                    int _194 = _175 + 16;
                    uint _196 = uint(int(uint(_194) >> uint(2)));
                    uint _198 = uint(int(uint(int(_196)) >> uint(2)));
                    int _200 = int(_196) & 3;
                    float _202 = (*spvDescriptorSet0.fp_c3)._m0[int(_198)][_200];
                    int _204 = int(_196) + 1;
                    uint _206 = uint(int(uint(_204) >> uint(2)));
                    int _208 = _204 & 3;
                    float _210 = (*spvDescriptorSet0.fp_c3)._m0[int(_206)][_208];
                    int _212 = _175 + 32;
                    uint _214 = uint(int(uint(_212) >> uint(2)));
                    uint _216 = uint(int(uint(int(_214)) >> uint(2)));
                    int _218 = int(_214) & 3;
                    float _220 = (*spvDescriptorSet0.fp_c3)._m0[int(_216)][_218];
                    int _222 = int(_214) + 1;
                    uint _224 = uint(int(uint(_222) >> uint(2)));
                    int _226 = _222 & 3;
                    float _228 = (*spvDescriptorSet0.fp_c3)._m0[int(_224)][_226];
                    int _230 = _175 + 48;
                    uint _232 = uint(int(uint(_230) >> uint(2)));
                    uint _234 = uint(int(uint(int(_232)) >> uint(2)));
                    int _236 = int(_232) & 3;
                    float _238 = (*spvDescriptorSet0.fp_c3)._m0[int(_234)][_236];
                    int _240 = int(_232) + 1;
                    uint _242 = uint(int(uint(_240) >> uint(2)));
                    int _244 = _240 & 3;
                    float _246 = (*spvDescriptorSet0.fp_c3)._m0[int(_242)][_244];
                    float _248 = _137 * _192;
                    float _250 = fma(_139, _184, _248);
                    float _252 = _137 * _210;
                    float _254 = abs(_250);
                    float _256 = -_254;
                    float _258 = _256 + 1.0;
                    float _260 = fma(_139, _202, _252);
                    float _262 = _258 * _155;
                    float _264 = _258 * _157;
                    float _266 = abs(_260);
                    float _268 = -_266;
                    float _270 = _268 + 1.0;
                    float _272 = fma(_262, _184, _57);
                    float _274 = _137 * _228;
                    float _276 = fma(_264, _192, _59);
                    float _278 = _270 * _157;
                    float _280 = fma(_139, _220, _274);
                    float _282 = _270 * _155;
                    float _284 = _137 * _246;
                    float _286 = fma(_278, _210, _59);
                    float _288 = abs(_280);
                    float _290 = -_288;
                    float _292 = _290 + 1.0;
                    float _294 = fma(_282, _202, _57);
                    float _296 = fma(_139, _238, _284);
                    float _298 = _292 * _155;
                    float _300 = _292 * _157;
                    float _302 = abs(_296);
                    float _304 = -_302;
                    float _306 = _304 + 1.0;
                    float _308 = fma(_298, _220, _57);
                    float _310 = fma(_300, _228, _59);
                    float _312 = _306 * _155;
                    float _314 = _306 * _157;
                    float _316 = fma(_312, _238, _57);
                    float _318 = fma(_314, _246, _59);
                    float2 _1076 = float2(_272, _276);
                    float4 _320 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1076, float2(0.0), isnan(_1076)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1076, float2(0.0), isnan(_1076)), level(0.0)).xyzw;
                    float _322 = _320.x;
                    float _324 = _320.y;
                    float _326 = _320.z;
                    float _328 = _320.w;
                    float2 _1092 = float2(_294, _286);
                    float4 _330 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1092, float2(0.0), isnan(_1092)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1092, float2(0.0), isnan(_1092)), level(0.0)).xyzw;
                    float _332 = _330.x;
                    float _334 = _330.y;
                    float _336 = _330.z;
                    float _338 = _330.w;
                    float2 _1108 = float2(_308, _310);
                    float4 _340 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1108, float2(0.0), isnan(_1108)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1108, float2(0.0), isnan(_1108)), level(0.0)).xyzw;
                    float _342 = _340.x;
                    float _344 = _340.y;
                    float _346 = _340.z;
                    float _348 = _340.w;
                    float2 _1124 = float2(_316, _318);
                    float4 _350 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1124, float2(0.0), isnan(_1124)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1124, float2(0.0), isnan(_1124)), level(0.0)).xyzw;
                    float _352 = _350.x;
                    float _354 = _350.y;
                    float _356 = _350.z;
                    float _358 = _350.w;
                    int _360 = _163 + 4;
                    bool _362 = _360 >= _159;
                    float _364 = 0.0 + _328;
                    float _366 = precise::clamp(_364, 0.0, 1.0);
                    float _368 = fma(_322, _366, _165);
                    float _370 = fma(_324, _366, _167);
                    float _372 = 0.0 + _338;
                    float _374 = precise::clamp(_372, 0.0, 1.0);
                    float _376 = fma(_326, _366, _169);
                    float _378 = fma(_328, _366, _171);
                    float _380 = _366 + _173;
                    float _382 = fma(_332, _374, _368);
                    float _384 = fma(_334, _374, _370);
                    float _386 = 0.0 + _348;
                    float _388 = precise::clamp(_386, 0.0, 1.0);
                    float _390 = fma(_336, _374, _376);
                    float _392 = fma(_338, _374, _378);
                    float _394 = _380 + _374;
                    float _396 = fma(_342, _388, _382);
                    float _398 = fma(_344, _388, _384);
                    float _400 = fma(_346, _388, _390);
                    float _402 = 0.0 + _358;
                    float _404 = precise::clamp(_402, 0.0, 1.0);
                    float _406 = fma(_348, _388, _392);
                    float _408 = _394 + _388;
                    float _410 = fma(_352, _404, _396);
                    float _412 = fma(_354, _404, _398);
                    float _414 = fma(_356, _404, _400);
                    float _416 = fma(_358, _404, _406);
                    float _418 = _408 + _404;
                    _161 = !_362;
                    _149 = _360;
                    _107 = _410;
                    _109 = _412;
                    _111 = _414;
                    _113 = _416;
                    _115 = _418;
                    _151 = _360;
                    _117 = _412;
                    _119 = _410;
                    _121 = _414;
                    _123 = _416;
                    _125 = _418;
                } while (_161);
            }
            int _420 = _151;
            float _422 = _117;
            float _424 = _119;
            float _426 = _121;
            float _428 = _123;
            float _430 = _125;
            int _432 = _153;
            int _434 = ~_420;
            int _436 = _434 + as_type<int>((*spvDescriptorSet0.fp_c3)._m0[101].x);
            int _438 = _436 + 1;
            bool _440 = _438 > 1;
            bool _442 = !_440;
            int _444 = _420;
            int _446 = _432;
            float _448 = _424;
            float _450 = _422;
            float _452 = _426;
            float _454 = _428;
            float _456 = _430;
            if (!_442)
            {
                int _458 = _420 << 4;
                uint _460 = uint(int(uint(_458) >> uint(2)));
                uint _462 = uint(int(uint(int(_460)) >> uint(2)));
                int _464 = int(_460) & 3;
                float _466 = (*spvDescriptorSet0.fp_c3)._m0[int(_462)][_464];
                int _468 = int(_460) + 1;
                uint _470 = uint(int(uint(_468) >> uint(2)));
                int _472 = _468 & 3;
                float _474 = (*spvDescriptorSet0.fp_c3)._m0[int(_470)][_472];
                int _476 = _458 + 16;
                uint _478 = uint(int(uint(_476) >> uint(2)));
                uint _480 = uint(int(uint(int(_478)) >> uint(2)));
                int _482 = int(_478) & 3;
                float _484 = (*spvDescriptorSet0.fp_c3)._m0[int(_480)][_482];
                int _486 = int(_478) + 1;
                uint _488 = uint(int(uint(_486) >> uint(2)));
                int _490 = _486 & 3;
                float _492 = (*spvDescriptorSet0.fp_c3)._m0[int(_488)][_490];
                float _494 = _137 * _474;
                float _496 = fma(_139, _466, _494);
                float _498 = _137 * _492;
                float _500 = abs(_496);
                float _502 = -_500;
                float _504 = _502 + 1.0;
                float _506 = fma(_139, _484, _498);
                float _508 = _72 * _504;
                float _510 = abs(_506);
                float _512 = -_510;
                float _514 = _512 + 1.0;
                float _516 = _508 * (*spvDescriptorSet0.fp_c3)._m0[100].y;
                float _518 = _72 * _514;
                float _520 = _508 * (*spvDescriptorSet0.fp_c3)._m0[100].x;
                float _522 = fma(_516, _474, _59);
                float _524 = _518 * (*spvDescriptorSet0.fp_c3)._m0[100].x;
                float _526 = fma(_520, _466, _57);
                float _528 = _518 * (*spvDescriptorSet0.fp_c3)._m0[100].y;
                float _530 = fma(_524, _484, _57);
                float _532 = fma(_528, _492, _59);
                float2 _1409 = float2(_526, _522);
                float4 _534 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1409, float2(0.0), isnan(_1409)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1409, float2(0.0), isnan(_1409)), level(0.0)).xyzw;
                float _536 = _534.x;
                float _538 = _534.y;
                float _540 = _534.z;
                float _542 = _534.w;
                float2 _1425 = float2(_530, _532);
                float4 _544 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1425, float2(0.0), isnan(_1425)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1425, float2(0.0), isnan(_1425)), level(0.0)).xyzw;
                float _546 = _544.x;
                float _548 = _544.y;
                float _550 = _544.z;
                float _552 = _544.w;
                int _554 = _420 + 2;
                float _556 = 0.0 + _542;
                float _558 = precise::clamp(_556, 0.0, 1.0);
                float _560 = fma(_538, _558, _422);
                float _562 = fma(_536, _558, _424);
                float _564 = fma(_540, _558, _426);
                float _566 = 0.0 + _552;
                float _568 = precise::clamp(_566, 0.0, 1.0);
                float _570 = fma(_542, _558, _428);
                float _572 = _430 + _558;
                float _574 = fma(_546, _568, _562);
                float _576 = fma(_548, _568, _560);
                float _578 = fma(_550, _568, _564);
                float _580 = fma(_552, _568, _570);
                float _582 = _572 + _568;
                _444 = _554;
                _446 = 0;
                _448 = _574;
                _450 = _576;
                _452 = _578;
                _454 = _580;
                _456 = _582;
            }
            int _584 = _444;
            int _586 = _446;
            float _588 = _448;
            float _590 = _450;
            float _592 = _452;
            float _594 = _454;
            float _596 = _456;
            bool _598 = _584 < as_type<int>((*spvDescriptorSet0.fp_c3)._m0[101].x);
            int _600 = (_598 ? (-1) : 0) | _586;
            int _602 = ~_600;
            _127 = _596;
            _129 = _588;
            _131 = _590;
            _133 = _592;
            _135 = _594;
            if (!(_602 != 0))
            {
                int _604 = _584 << 4;
                uint _606 = uint(int(uint(_604) >> uint(2)));
                uint _608 = uint(int(uint(int(_606)) >> uint(2)));
                int _610 = int(_606) & 3;
                float _612 = (*spvDescriptorSet0.fp_c3)._m0[int(_608)][_610];
                int _614 = int(_606) + 1;
                uint _616 = uint(int(uint(_614) >> uint(2)));
                int _618 = _614 & 3;
                float _620 = (*spvDescriptorSet0.fp_c3)._m0[int(_616)][_618];
                float _622 = _137 * _620;
                float _624 = fma(_139, _612, _622);
                float _626 = abs(_624);
                float _628 = -_626;
                float _630 = _628 + 1.0;
                float _632 = _72 * _630;
                float _634 = _632 * (*spvDescriptorSet0.fp_c3)._m0[100].x;
                float _636 = _632 * (*spvDescriptorSet0.fp_c3)._m0[100].y;
                float _638 = fma(_634, _612, _57);
                float _640 = fma(_636, _620, _59);
                float2 _1585 = float2(_638, _640);
                float4 _642 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1585, float2(0.0), isnan(_1585)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1585, float2(0.0), isnan(_1585)), level(0.0)).xyzw;
                float _644 = _642.x;
                float _646 = _642.y;
                float _648 = _642.z;
                float _650 = _642.w;
                float _652 = 0.0 + _650;
                float _654 = precise::clamp(_652, 0.0, 1.0);
                float _656 = fma(_644, _654, _588);
                float _658 = fma(_646, _654, _590);
                float _660 = fma(_648, _654, _592);
                float _662 = fma(_650, _654, _594);
                float _664 = _596 + _654;
                _127 = _664;
                _129 = _656;
                _131 = _658;
                _133 = _660;
                _135 = _662;
            }
        }
        float _666 = _127;
        float _668 = _129;
        float _670 = _131;
        float _672 = _133;
        float _674 = _135;
        _91 = _666;
        _93 = _668;
        _95 = _670;
        _97 = _672;
        _99 = _674;
    }
    _101 = false;
    float _676 = _91;
    float _678 = _93;
    float _680 = _95;
    float _682 = _97;
    float _684 = _99;
    float _686 = 1.0 / _676;
    bool _688 = _676 > 0.0;
    if (_688)
    {
        float _690 = _686 * _678;
        _83 = as_type<int>(_690);
    }
    int _692 = _83;
    if (_688)
    {
        float _694 = _686 * _680;
        _85 = as_type<int>(_694);
    }
    int _696 = _85;
    if (_688)
    {
        float _698 = _686 * _682;
        _87 = as_type<int>(_698);
    }
    int _700 = _87;
    if (_688)
    {
        float _702 = _686 * _684;
        _89 = as_type<int>(_702);
    }
    int _704 = _89;
    out.m_34.x = as_type<float>(_692);
    out.m_34.y = as_type<float>(_696);
    out.m_34.z = as_type<float>(_700);
    out.m_34.w = as_type<float>(_704);
    return main0_out_u{as_type<uint4>(out.m_34)};
}

