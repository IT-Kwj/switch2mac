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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float _59 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _61 = _55 + _59;
    float _63 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _65 = _57 + _63;
    float2 _895 = float2(_55, _57);
    float3 _69 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_895, float2(0.0), isnan(_895)), int2(0), component::x).xzw;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float2 _912 = float2(_61, _65);
    float2 _79 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_912, float2(0.0), isnan(_912)), int2(0), component::x).xz;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = -_75;
    float _87 = _73 + _85;
    float _89 = -_75;
    float _91 = _71 + _89;
    float _93 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].y);
    float _95 = -_75;
    float _97 = _95 + _81;
    float _99 = -_75;
    float _101 = _99 + _83;
    float _103 = _93 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _105 = _87 * _97;
    float _107 = abs(_87);
    float _109 = abs(_97);
    float _111 = precise::min(_107, _109);
    float _113 = _103 * 0.0199999995529651641845703125;
    float _115 = abs(_91);
    float _117 = abs(_101);
    float _119 = precise::min(_115, _117);
    float _121 = _91 * _101;
    bool _125 = _105 > 0.0;
    float _127 = _111 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _129 = _119 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    bool _131 = _121 > 0.0;
    bool _133 = _127 > _113;
    bool _135 = _129 > _113;
    bool _137 = _105 > 0.0;
    bool _139 = _137 && _133;
    float _141 = fma(_55, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    bool _143 = _121 > 0.0;
    bool _145 = _143 && _135;
    float _147 = -_57;
    float _149 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _151 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[6].w, _149);
    float _153 = _141 + (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _155 = _151 + (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _157 = _93 * _153;
    float _159 = _93 * _155;
    float _161 = 0.0;
    float _163 = _93;
    float _165 = _81;
    float _167 = _73;
    float _169 = _87;
    if (_139)
    {
        _161 = 1.0;
    }
    float _171 = _161;
    float _173 = 0.0;
    float _175 = _171;
    if (_139)
    {
        _173 = 0.0;
    }
    float _177 = _173;
    float _179 = 0.0;
    float _181 = _177;
    if (_139)
    {
        _179 = 0.0;
    }
    float _183 = _179;
    float _185 = _183;
    if (_145)
    {
        _163 = 0.0;
    }
    float _187 = _163;
    float _189 = 0.0;
    float _191 = _187;
    if (_139)
    {
        _189 = 1.0;
    }
    float _193 = _189;
    bool _195 = _133 && _125;
    float _197 = _193;
    if (!_195)
    {
        float _199 = abs(_87);
        float _201 = abs(_97);
        bool _203 = _199 >= _201;
        float _205 = _203 ? (-1.0) : 1.0;
        float _207 = _203 ? _81 : _73;
        float _209 = fma(_205, (*spvDescriptorSet0.fp_c3)._m0[0].z, _55);
        float _211 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        float _213 = fma(_209, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
        float _215 = -_159;
        float _217 = fma(_155, _211, _215);
        float _219 = -_211;
        float _221 = fma(_219, (*spvDescriptorSet0.fp_c3)._m0[7].w, _103);
        float _223 = _213 + (*spvDescriptorSet0.fp_c3)._m0[7].x;
        float _225 = -_157;
        float _227 = fma(_211, _223, _225);
        _197 = _205;
        _175 = _227;
        _165 = _211;
        _185 = _221;
        _181 = _217;
        _167 = _207;
        _169 = _223;
    }
    float _229 = _197;
    float _231 = _175;
    float _233 = _165;
    float _235 = _185;
    float _237 = _181;
    float _239 = _167;
    float _241 = _169;
    float _243 = _241;
    float _245 = _239;
    float _247 = _233;
    if (_145)
    {
        _243 = 0.0;
    }
    float _249 = _243;
    float _251 = _249;
    if (_145)
    {
        _245 = 1.0;
    }
    float _253 = _245;
    float _255 = _253;
    if (_145)
    {
        _247 = _229;
    }
    float _257 = _247;
    bool _259 = _135 && _131;
    float _261 = _257;
    if (!_259)
    {
        float _263 = abs(_91);
        float _265 = abs(_101);
        bool _267 = _263 >= _265;
        float _269 = _267 ? (-1.0) : 1.0;
        float _271 = _267 ? _83 : _71;
        float _273 = fma(_269, (*spvDescriptorSet0.fp_c3)._m0[0].w, _57);
        float _275 = _269 * _229;
        float _277 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        float _279 = -_273;
        float _281 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _283 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[6].w, _281);
        float _285 = -_157;
        float _287 = fma(_153, _277, _285);
        float _289 = -_277;
        float _291 = fma(_289, (*spvDescriptorSet0.fp_c3)._m0[7].w, _103);
        float _293 = _283 + (*spvDescriptorSet0.fp_c3)._m0[7].y;
        float _295 = -_159;
        float _297 = fma(_277, _293, _295);
        _261 = _275;
        _255 = _291;
        _251 = _297;
        _191 = _287;
    }
    float _299 = _261;
    float _301 = _255;
    float _303 = _251;
    float _305 = _191;
    float _307 = _231 * _299;
    float _309 = _235 * _299;
    float _311 = 1.0 / _103;
    float _313 = _237 * _299;
    float _315 = _307 * _301;
    float _317 = _309 * _303;
    float _319 = -_315;
    float _321 = fma(_309, _305, _319);
    float _323 = _313 * _305;
    float _325 = -_317;
    float _327 = fma(_313, _301, _325);
    float _329 = (*spvDescriptorSet0.fp_c3)._m0[9].z * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _331 = _321 * _321;
    float _333 = -_323;
    float _335 = fma(_307, _303, _333);
    float _337 = fma(_327, _327, _331);
    float _339 = fma(_335, _335, _337);
    float _341 = _329 * _311;
    float _343 = precise::min(_341, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _345 = rsqrt(_339);
    bool _347 = _343 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _349 = isnan(_343);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].z);
    bool _355 = _351 || _353;
    float _357 = _335 * _345;
    float _359 = _327 * _345;
    float _361 = _321 * _345;
    float _363 = _335;
    if (!_355)
    {
        _363 = 0.0;
    }
    float _365 = _363;
    bool _367 = !_355;
    float _369 = _365;
    if (!_367)
    {
        float _371 = gl_FragCoord.x;
        float _373 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _375 = _371 / _373;
        float _377 = gl_FragCoord.y;
        float _379 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _381 = _377 / _379;
        float _383 = _361 * _361;
        float _385 = _159 * _159;
        bool _387 = 0 < as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x);
        float _389 = fma(_359, _359, _383);
        float _391 = fma(_157, _157, _385);
        bool _393 = _389 >= 0.00999999977648258209228515625;
        bool _395 = isnan(_389);
        bool _397 = _393 || _395;
        bool _399 = isnan(0.00999999977648258209228515625);
        bool _401 = _397 || _399;
        float _403 = fma(_103, _103, _391);
        float _405 = -_361;
        float _407 = _159 * _405;
        float _409 = -_359;
        float _411 = fma(_157, _409, _407);
        float _413 = 1.0 / _403;
        float _415 = fma(_103, _357, _411);
        float _417 = _415 * _415;
        float _419 = _389;
        if (_401)
        {
            float _421 = rsqrt(_389);
            _419 = _421;
        }
        float _423 = _419;
        float _425 = trunc(_375);
        int _428 = int(_425);
        float _430 = _417 * _413;
        float _432 = _413;
        if (!_387)
        {
            _432 = 0.0;
        }
        float _434 = _432;
        float _436 = trunc(_381);
        int _438 = int(_436);
        int _440 = _428 * 10;
        int _442 = _428 ^ _438;
        int _444 = _438 * _440;
        float _446 = as_type<float>(_428);
        float _448 = as_type<float>(_438);
        float _450 = _434;
        if (!_401)
        {
            _446 = 1.0;
        }
        float _452 = _446;
        float _454 = _452;
        if (_401)
        {
            float _456 = -_423;
            float _458 = _359 * _456;
            _454 = _458;
        }
        float _460 = _454;
        if (!_401)
        {
            _448 = 0.0;
        }
        float _462 = _448;
        int _464 = _442 * 30;
        int _466 = _464 + _444;
        float _468 = _462;
        if (_401)
        {
            float _470 = _361 * _423;
            _468 = _470;
        }
        float _472 = _468;
        bool _474 = !_387;
        if (!_474)
        {
            float _476 = _343 * 1.77777779102325439453125;
            float _478 = float(_466);
            float _480 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[1].w;
            int _482 = 0;
            float _484 = 0.0;
            bool _486;
            float _776;
            do
            {
                int _488 = _482;
                float _490 = _484;
                float _492 = float(_488);
                float _494 = _492 + 0.5;
                float _496 = _494 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
                float _498 = _496 * 2.0;
                float _500 = fma(_498, (*spvDescriptorSet0.fp_c3)._m0[10].y, _478);
                float _502 = _498 * _498;
                float _504 = _500 * 0.15915493667125701904296875;
                float _506 = _504 * 6.283185482025146484375;
                float _508 = sin(_506);
                float _510 = _504 * 6.283185482025146484375;
                float _512 = cos(_510);
                bool _514 = _508 > 0.0;
                float _516 = -_508;
                float _518 = _514 ? _516 : _508;
                float _520 = -_512;
                float _522 = _514 ? _520 : _512;
                float _524 = _518 * _472;
                float _526 = -_460;
                float _528 = _518 * _526;
                float _530 = -_460;
                float _532 = -_524;
                float _534 = fma(_522, _530, _532);
                float _536 = fma(_522, _472, _528);
                float _538 = _534 * _502;
                float _540 = _536 * _502;
                float _542 = _538 * _460;
                float _544 = -_472;
                float _546 = _538 * _544;
                float _548 = fma(_343, _540, _55);
                float _550 = -_540;
                float _552 = fma(_550, _472, _542);
                float _554 = -_540;
                float _556 = fma(_554, _460, _546);
                float _558 = _552 * _552;
                float _560 = _556 * _556;
                float _562 = fma(_430, _558, _560);
                bool _564 = _562 > _430;
                float _566 = _542;
                float _568 = _556;
                float _570 = _560;
                float _572 = _562;
                if (_564)
                {
                    float _574 = _556 * _460;
                    _566 = _574;
                }
                float _576 = _566;
                if (_564)
                {
                    float _578 = _556 * _472;
                    _568 = _578;
                }
                float _580 = _568;
                if (!_564)
                {
                    float _582 = -_540;
                    float _584 = (-0.0) + _582;
                    _570 = _584;
                }
                float _586 = _570;
                float _588 = _586;
                if (!_564)
                {
                    float _590 = -_538;
                    float _592 = (-0.0) + _590;
                    _572 = _592;
                }
                float _594 = _572;
                float _596 = _594;
                if (_564)
                {
                    float _598 = -_576;
                    float _600 = fma(_552, _472, _598);
                    _588 = _600;
                }
                float _602 = _588;
                if (_564)
                {
                    float _604 = -_460;
                    float _606 = -_580;
                    float _608 = fma(_552, _604, _606);
                    _596 = _608;
                }
                float _610 = _596;
                float _612 = fma(_538, _476, _57);
                float _614 = fma(_343, _602, _55);
                float _616 = fma(_476, _610, _57);
                float2 _1688 = float2(_548, _612);
                float _618 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1688, float2(0.0), isnan(_1688))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1688, float2(0.0), isnan(_1688))).x;
                float2 _1696 = float2(_614, _616);
                float _620 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1696, float2(0.0), isnan(_1696))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1696, float2(0.0), isnan(_1696))).x;
                float _622 = -_612;
                float _624 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _626 = fma(_622, (*spvDescriptorSet0.fp_c3)._m0[6].w, _624);
                float _628 = -_616;
                float _630 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _632 = fma(_628, (*spvDescriptorSet0.fp_c3)._m0[6].w, _630);
                float _634 = fma(_548, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                int _636 = _488 + 1;
                float _638 = _626 + (*spvDescriptorSet0.fp_c3)._m0[7].y;
                float _640 = _632 + (*spvDescriptorSet0.fp_c3)._m0[7].y;
                float _642 = _634 + (*spvDescriptorSet0.fp_c3)._m0[7].x;
                bool _644 = _636 >= as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x);
                float _646 = fma(_618, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].y);
                float _648 = fma(_614, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _650 = fma(_620, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].y);
                float _652 = -_159;
                float _654 = fma(_646, _638, _652);
                float _656 = _648 + (*spvDescriptorSet0.fp_c3)._m0[7].x;
                float _658 = -_157;
                float _660 = fma(_646, _642, _658);
                float _662 = -_159;
                float _664 = fma(_650, _640, _662);
                float _666 = _654 * _654;
                float _668 = -_157;
                float _670 = fma(_650, _656, _668);
                float _672 = -_646;
                float _674 = fma(_672, (*spvDescriptorSet0.fp_c3)._m0[7].w, _103);
                float _676 = _664 * _664;
                float _678 = fma(_660, _660, _666);
                float _680 = -_650;
                float _682 = fma(_680, (*spvDescriptorSet0.fp_c3)._m0[7].w, _103);
                float _684 = -_654;
                float _686 = _361 * _684;
                float _688 = fma(_670, _670, _676);
                float _690 = fma(_674, _674, _678);
                float _692 = -_664;
                float _694 = _361 * _692;
                float _696 = -_359;
                float _698 = fma(_696, _660, _686);
                float _700 = fma(_682, _682, _688);
                float _702 = -_690;
                float _704 = fma(_702, _480, 1.0);
                float _706 = -_359;
                float _708 = fma(_706, _670, _694);
                float _710 = _690 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
                float _712 = -_700;
                float _714 = fma(_712, _480, 1.0);
                float _716 = -_357;
                float _718 = fma(_716, _674, _698);
                float _720 = precise::max(0.0, _704);
                float _722 = _700 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
                float _724 = -_357;
                float _726 = fma(_724, _682, _708);
                float _728 = precise::max(0.0, _714);
                float _730 = 1.0 / _710;
                float _732 = _720 * _720;
                float _734 = -(*spvDescriptorSet0.fp_c3)._m0[10].z;
                float _736 = _718 + _734;
                float _738 = -(*spvDescriptorSet0.fp_c3)._m0[10].z;
                float _740 = _726 + _738;
                float _742 = _728 * _728;
                float _744 = _720 * _732;
                float _746 = precise::max(_736, (*spvDescriptorSet0.fp_c3)._m0[11].w);
                float _748 = 1.0 / _722;
                float _750 = _728 * _742;
                float _752 = precise::max(_740, (*spvDescriptorSet0.fp_c3)._m0[11].w);
                float _754 = _744 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
                float _756 = _750 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
                float _758 = _754 * _746;
                float _760 = _756 * _752;
                float _762 = _758 * _730;
                float _764 = _760 * _748;
                float _766 = precise::max(_762, (*spvDescriptorSet0.fp_c3)._m0[11].z);
                float _768 = precise::max(_764, (*spvDescriptorSet0.fp_c3)._m0[11].z);
                float _770 = precise::min(_766, 1.0);
                float _772 = precise::min(_768, 1.0);
                float _774 = _770 + _772;
                _776 = fma(_774, (*spvDescriptorSet0.fp_c3)._m0[9].y, _490);
                _486 = !_644;
                _482 = _636;
                _484 = _776;
            } while (_486);
            _450 = _776;
        }
        float _778 = _450;
        float _780 = fma(_55, 2.0, -1.0);
        float _782 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[17].z;
        float _784 = fma(_57, 2.0, -1.0);
        float _786 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[17].x;
        float _788 = fma(_343, (*spvDescriptorSet0.fp_c3)._m0[0].x, -1.0);
        float _790 = _778 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
        float _792 = abs(_780);
        float _794 = _792 + _782;
        float _796 = precise::clamp(_794, 0.0, 1.0);
        float _798 = abs(_784);
        float _800 = _798 + _786;
        float _802 = precise::clamp(_800, 0.0, 1.0);
        float _804 = precise::min(_788, 1.0);
        float _806 = _796 * (*spvDescriptorSet0.fp_c3)._m0[17].w;
        float _808 = _802 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
        float _810 = _804 * _790;
        float _812 = precise::clamp(_810, 0.0, 1.0);
        float _814 = -_806;
        float _816 = fma(_814, _806, 1.0);
        float _818 = -_812;
        float _820 = _818 + 1.0;
        float _822 = -_808;
        float _824 = fma(_822, _808, _816);
        float _826 = abs(_820);
        float _828 = log2(_826);
        float _830 = _828 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
        float _832 = exp2(_830);
        float _834 = -_832;
        float _836 = _834 + 1.0;
        float _838 = _836 * _824;
        float _840 = precise::clamp(_838, 0.0, 1.0);
        float _842 = _840 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
        _369 = _842;
    }
    float _844 = _369;
    float _846 = -_844;
    float _848 = _846 + 1.0;
    out.m_32.x = _848;
    out.m_32.y = _75;
    return out;
}

